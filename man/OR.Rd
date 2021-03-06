% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OR.R
\name{OR}
\alias{OR}
\title{Relational-operator-function to construct a custom search statement}
\usage{
OR(..., negate = FALSE)
}
\arguments{
\item{...}{a combination of criteria constructor functions with its arguments.}

\item{negate}{If \code{TRUE}, negates the search and seeks for
"NOT search_criterion". Default is \code{FALSE}.}
}
\value{
A search string to be used as a \code{request} parameter in
 \code{ImapCon$search()} function.
}
\description{
Relational-operator-function to construct a custom search statement
}
\examples{
\dontrun{
# select folder & search
con$select_folder(name = "INBOX")
# search for messages SINCE "30-Ago-2019" OR SMALLER than 512KB.
res <- con$search(request = OR(sent_since(date_char = "30-Ago-2019"),
                                smaller_than(size = 512000)))
}
}
\seealso{
Other custom search: 
\code{\link{AND}()},
\code{\link{ImapCon}},
\code{\link{before}()},
\code{\link{flag}()},
\code{\link{larger_than}()},
\code{\link{older_than}()},
\code{\link{on}()},
\code{\link{sent_before}()},
\code{\link{sent_on}()},
\code{\link{sent_since}()},
\code{\link{since}()},
\code{\link{smaller_than}()},
\code{\link{string}()},
\code{\link{younger_than}()}
}
\concept{custom search}
