% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load.dir.R
\name{load.dir}
\alias{load.dir}
\title{load.dir}
\usage{
load.dir(dir, pattern = "[Rr][dD][aA]$", envir = .GlobalEnv)
}
\arguments{
\item{dir}{a directory}

\item{pattern}{the suffix to identify RDa files. Default matches
any combination of upper and lower case from \dQuote{rda} to \dQuote{RDA}}

\item{envir}{The environment to load the objects to. Default = users workspace.}
}
\value{
invisibly returns a vector of loaded objects, named
 by the file that they were loaded from
}
\description{
Load all the RDa objects within a directory
}
\examples{
\dontrun{
load.dir("./Rmisc")
}
}
\author{
Mark Cowley, 2011-11-07
}

