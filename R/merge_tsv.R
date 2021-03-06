#' merge tsv files
#' 
#' Given a vector of file paths to tab delimited files, import each in turn, and
#' grow the result. Each subsequent file can add new columns or rows not previously
#' imported, or overwrite data from previously imported data. To do this, row.names
#' and col.names must be present in each of the imported files.
#' 
#' @section use cases:
#' In a typical use case, you import a bunch of chronologically ordered files, where
#' newer files may have added new columns of data, thrown away no longer needed columns,
#' may update the characteristics of data represented in older files, and may add new
#' records. For example, importing clinical data from TCGA BRCA, where an initial data
#' file of 863x101, with 2 follow up files containing 113x63 and 286x44 data, respectively.
#' The resulting merged file contains 863 rows and 118 columns, so clearly no new records
#' were added, but new columns specific to patient follow-up were added. 
#'
#' @param files a character vector of file paths
#' @param \dots arguments passed to \code{\link{read.delim}}
#' @return a \code{data.frame} of merged data
#' @author Mark Cowley, 2012-09-04
#' @export
#' @importFrom utils read.delim
#' @examples
#' \dontrun{
#' # import 3 files from TCGA Breast cancer data
#' 	files <- c(
#'   "clinical_patient_public_brca.txt",
#'   "clinical_follow_up_v1.5_public_brca_mod.txt",
#'   "clinical_follow_up_v2.1_public_brca_mod.txt"
#'  )
#' 
#' lapply(files, function(f) dim(read.delim(f, check=F, row.names=1)))
#' # [[1]]
#' # [1] 863 101
#' # [[2]]
#' # [1] 113  63
#' # [[3]]
#' # [1] 286  44
#' 
#' a <- merge_tsv(files, row.names=1, check.names=F, stringsAsFactors=F)
#' # dim(a)
#' # [1] 863 118
#' ## so subsequent follow up files didn't add any new rows, but did add 17 columns
#' ## of follow up data, and updated upto 113+286 rows of data.
#' }
#' 
merge_tsv <- function(files, ...) {
	res <- read.delim(files[1], ...)
	for(file in files[2:length(files)]) {
		tmp <- read.delim(file, ...)
		# grow wide to match the column names (if necessary)
		columns <- c(colnames(res), setdiff(colnames(tmp), colnames(res)))
		res <- add_columns(res, columns)
		tmp <- add_columns(tmp, columns)
		# grow the num rows, either overwriting existing data, or adding new rows.
		if( any(row.names(tmp) %in% row.names(res)) ) {
			replacements <- tmp[intersect(rownames(tmp), rownames(res)), ]
			for(i in 1:ncol(replacements)) {
				res <- replace.cells(
					res, 
					rownames(replacements), 
					rep(colnames(replacements)[i], nrow(replacements)), 
					replacements[,i]
				)
			}
		}
		if( ! any(row.names(tmp) %in% row.names(res)) ) {
			additions <- tmp[setdiff(rownames(tmp), rownames(res)), ]
			res <- rbind(res, additions)
		}
	}
	
	res
}
