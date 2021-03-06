% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vecmerge.R
\name{vecmerge}
\alias{vecmerge}
\title{Merge a vector and a data.frame}
\usage{
vecmerge(x, y, by.y = "", all.x = TRUE, all.y = FALSE, sort = FALSE,
  unique.x = TRUE)
}
\arguments{
\item{x}{a vector of \sQuote{search keys}}

\item{y}{a \code{data.frame} of values}

\item{by.y}{the column name in y to match the \sQuote{search keys} in \code{x}. To match
against the \code{rownames(y)}, set this to \code{0}, or \dQuote{\code{row.names}}}

\item{all.x}{logical: return all values in \code{x}, even if they're not in \code{y}?}

\item{all.y}{logical: return all rows in \code{y}, even if they're not in \code{x}?}

\item{sort}{logical: Should the results be sorted on the \code{by.y} column?}

\item{unique.x}{logical: if \code{TRUE}, then keep at most one match for each value of \code{x}; 
if \code{FALSE}, then allow aech value in \code{x} to match multiple rows in \code{y}}
}
\value{
a data.frame with same columns as \code{y}, but with rows specified by 
   the search keys in \code{x}, and the value of \code{unique.x}.
}
\description{
Merge a \code{vector} and a \code{data.frame}.
This will essentially subset \code{y}
to the values of \code{y$"by.y"} to the values specified in \code{x}. If values in \code{x}
aren't found in \code{y}, then \code{NA} fields will be filled in.
}
\author{
Mark Cowley, 18 April 2006
}

