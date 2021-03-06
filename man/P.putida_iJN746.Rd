\name{P.putida_iJN746}
\docType{data}
\alias{P.putida_iJN746}
\title{Metabolic reconstruction of P.putida from the BiGG database}
\description{
A metabolic reconstruction for P. putida.
The dataset was generated by downloading the SBML file of the
reconstruction (http://bigg.ucsd.edu/bigg/exportSelect.pl) which was subsequently converted
into an object of class \code{SBML} using the \code{rsbml_read} function
from the \code{rsbml} package.
}
\usage{data(P.putida_iJN746)}
\format{An sbml object of class rsbml}

\details{Note that the files in the BiGG database fail the unit
consistancy check of the \code{rsbml_read} function. To avoid
unit checking when creating \code{SBML} objects, the substance units in the reaction tags
were parsed out from the database SBML files (see example below).}

\source{http://bigg.ucsd.edu/bigg/exportSelect.pl}
\references{
Feist, A.M., Henry, C.S., Reed, J.L., Krummenacker, M., Joyce, A.R., Karp, P.D., Broadbelt, L.J., Hatzimanikatis, V., Palsson, B.O., 
\emph{A genome-scale metabolic reconstruction for Escherichia coli K-12 MG1655 that accounts for 1260 ORFs and thermodynamic information}, olecular Systems Biology, 3:121 (2007)
}


\examples{

\dontrun{
##The dataset was generated as follows:
##SBML_export.xml was downloaded from http://bigg.ucsd.edu/bigg/exportSelect.pl
##and a newline was added at the end of the file
file <- "SBML_export.xml"
string <- paste(readLines(file), collapse="\n")
##Parse out units to avoid validation error
string <- gsub("units=\".+?\"", "", string)
P.putida_iJN746 <- rsbml_read(text=string) 
}

##load data and get all reaction IDs
data(P.putida_iJN746)
model <- P.putida_iJN746@model
##get all reaction identifiers
sapply(model@reactions, id)


}

\keyword{putida}
