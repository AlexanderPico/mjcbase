% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zipdir.R
\name{zipdir}
\alias{zipdir}
\title{zip the contents of a directory.}
\usage{
zipdir(dir, zip.file, exclude.patterns = NULL, verbose = FALSE)
}
\arguments{
\item{dir}{the parent directory, whose files are to be zipped.}

\item{zip.file}{the zip file to be created}

\item{exclude.patterns}{an optional vector of patterns to be excluded. eg
"\*.zip" NB: use \* to allow zip to do the pattern exclusion rather than
shell}

\item{verbose}{logical: print the zip command. Default=FALSE}
}
\value{
a zip file is created, containing all files within \code{dir}
}
\description{
Note that the directory name itself will not be included in the directory.
The path to all files will be relative to the specified directory.
}
\note{
This uses system commands, and needs to be able to find the gnu zip
  program. You can specify the zip program using \code{options("zip") <-
  "/path/to/zip"}. If this is not specified, then we assume that the shell
  can find a program called \code{zip} on the path. On ubuntu and OSX this
  is \sQuote{/usr/bin/zip}.
}
\examples{

dir <- tempdir()
writeLines(letters, file.path(dir, "a.txt"))
writeLines(LETTERS, file.path(dir, "b.txt"))
zipdir(dir, file.path(dir, "tmp.zip"), verbose=TRUE)
cmd <- paste("unzip -l", file.path(dir, "tmp.zip"), collapse=" ")
system(cmd)
f <- c(file.path(dir, "a.txt"), file.path(dir, "b.txt"), file.path(dir, "tmp.zip"))
unlink(f)

}
\author{
Mark Cowley, 2010-04-14
}
\seealso{
\code{\link[utils]{unzip}}
}
\keyword{utils}

