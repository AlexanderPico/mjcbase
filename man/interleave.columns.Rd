% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interleave.R
\name{interleave.columns}
\alias{interleave.columns}
\title{interleave the columns from multiple tables}
\usage{
interleave.columns(...)
}
\arguments{
\item{\dots}{at least two matrix-like objects, all with the same dimensions}
}
\value{
a \code{data.frame} with all the columns interleaved
}
\description{
interleave the columns from multiple tables. The tables
must be the same dimensions.
For tables A, B, C, the result will be
a1,b1,c1,a2,b2,c2,...,aN,bN,cN, where table means a 2D matrix-like
object
}
\author{
Mark Cowley, 2005-02-22
}

