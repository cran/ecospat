# Function for calculating all measures listed in Schweiger et al 2008. Written by Nicolas Salamin

root2tip <- function(tree, species) {
  if (!is.numeric(species)) {
    sp.id <- which(tree$tip.label == species)
  } else {
    sp.id <- species
  }
  root.id <- length(tree$tip.label) + 1

  # get the ancestor of the species wanted to start the loop
  row <- which(tree$edge[, 2] == sp.id)
  id <- tree$edge[row, 1]

  road <- id

  while (id != root.id) {
    sp.id <- id
    row <- which(tree$edge[, 2] == sp.id)
    id <- tree$edge[row, 1]
    road <- c(road, id)
  }

  return(road)
}

topology.pd <- function(t, taxa, type = "Q") {
  
  if (!type %in% c("I","Q","P","W")) {
    warning(paste0("WARNING: Type of measure '", type, "' unknown, using 'Q' as default"))
    type = "Q"
    }
  
  Ii <- numeric(length(taxa))

  for (i in 1:length(taxa)) {
    Ii[i] <- length(root2tip(t, taxa[i]))
    }

  if (type == "I"){
    I <- sum(Ii)
    return(I)
    }
    

  if (type == "Q"){
    Qi <- I/Ii
    Q <- sum(Qi)
    return(Q)
    }
    

  if (type == "P") return((Qi/Q) * 100)

  if (type == "W"){
    Qmin <- min(Qi)
    Wi <- Qi/Qmin
    W <- sum(Wi)
    return(W)
    }
}

spanning.pd <- function(t, taxa, type = "clade", root = FALSE, average = FALSE) {
  all.taxa <- t$tip.label
  single.sp <- FALSE
  nb.taxa <- length(taxa)
  if (nb.taxa == 1)
    single.sp <- TRUE

  present <- which(is.element(t$tip.label, taxa) == TRUE)

  if (type == "species") {
    tips <- t$edge.length[which(is.element(t$edge[, 2], present) == TRUE)]
    total <- sum(tips)

    if (average)
      total <- total/nb.taxa
    return(total)
  }

  if (type == "clade" & root == FALSE) {
    if (single.sp) {
      return(t$edge.length[which(t$edge[, 2] == present)])
    } else {
      missing.taxa <- setdiff(all.taxa, taxa)
      if (length(missing.taxa) > 0)
        t <- ape::drop.tip(t, missing.taxa)
      total <- sum(t$edge.length)
    }

    if (average)
      total <- total/nb.taxa
    return(total)
  }

  if (type == "clade" & root == TRUE) {
    path <- NULL
    for (i in 1:nb.taxa) path <- c(path, root2tip(t, present[i]))
    path <- unique(path)
    total <- sum(t$edge.length[which(is.element(t$edge[, 2], c(present, path)) == TRUE)])

    if (average)
      total <- total/nb.taxa
    return(total)
  }

  stop("\nType of measure '", type, "' unknow, stopping here\n\n", call. = FALSE)
}

pairwise.pd <- function(t, taxa, type = "J") {
  
  if (!type %in% c("J","F","AvTD","TTD","Dd")) {
    warning(paste0("WARNING: Type of measure '", type, "' unknown, using 'J' as default"))
    type = "J"
  }
  
  all.taxa <- t$tip.label

  if (length(taxa) == 1) {
    return(0)
  }

  if (length(taxa) < length(all.taxa)) {
    missing.taxa <- setdiff(all.taxa, taxa)
    t <- ape::drop.tip(t, missing.taxa)
  }

  nsp <- length(t$tip.label)
  dist <- ape::cophenetic.phylo(t)

  if (type == "J")
    return((sum(dist)/nsp^2))

  if (type == "F")
    return(sum(dist))

  if (type == "AvTD") {
    d <- dim(dist)[1]
    avtd <- 0
    for (i in 1:(d - 1)) {
      for (j in (i + 1):d) {
        avtd <- avtd + dist[i, j]
      }
    }
    return(avtd/(nsp * (nsp - 1)/2))
  }

  if (type == "TTD")
    return(sum(apply(dist, 1, sum)/(nsp - 1)))

  # add to the diagonal otherwise the smaller distance is 0
  if (type == "Dd")
    return(sum(apply(dist + diag(max(dist), nrow = nsp), 1, min)))
}

data2tree <- function(t, d) {
  taxa <- t$tip.label
  common <- intersect(names(d), taxa)
  if (length(common) < 2) {
    stop("ERROR: There is no species in common between the tree and the data set.")
  }

  # keep the outgroup in the tree, as it is needed for some pd calculation, even if it's not present
  # in the GIS
  tree.rm <- setdiff(t$tip.label, common)
  # but if it's present in the GIS, remove it otherwise it will bias the calculations
  data.rm <- setdiff(names(d), common)

  if (length(tree.rm) > 0) {
    t <- ape::drop.tip(t, tree.rm)
  }

  if (length(data.rm) > 0) {
    to.rm <- which(is.element(names(d), data.rm) == TRUE)
    d <- d[, -to.rm]
  }

  return(list(tree = t, data = d))
}

ecospat.calculate.pd <- function(tree, data, method = "spanning", type = "clade", root = FALSE, average = FALSE,
  verbose = FALSE) {
  x <- data2tree(tree, data)
  t <- x$tree
  d <- x$data
  rm(x)

  nr <- dim(d)[1]
  nc <- dim(d)[2]

  pd.value <- numeric(nr)

  if (verbose)
    cat("Progress (. = 100 pixels calculated):\n")
  for (i in 1:nr) {
    if (verbose & (i%%100) == 0)
      cat(".")
    if (verbose & i%%5000 == 0)
      cat(" [", i, "]\n", sep = "")
    there <- which(d[i, ] == 1)
    if (length(there) > 0) {
      taxa <- names(d)[there]
      if (method == "pairwise") {
        pd.value[i] <- pairwise.pd(t, taxa, type = type)
      } else {
        if (method == "topology") {
          pd.value[i] <- topology.pd(t, taxa, type = type)
        } else {
          pd.value[i] <- spanning.pd(t, taxa, type = type, root = root, average = average)
        }
      }
    }
  }

  if (verbose)
    cat(" [", i, "]\nAll ", i, " pixels done.\n\n", sep = "")

  return(pd.value)
}