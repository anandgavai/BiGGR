\name{sampleFluxEnsemble}
\alias{sampleFluxEnsemble}

\title{
Sample a posterior ensemble of feasible flux configurations within
the precision limits of given fluxes. 
}
\description{
This function uses a Markov chain Monte Carlo algorithm to sample
an ensemble of flux vectors that satisfy the constrained posed by
the model. To account for inaccuracy in certain fluxes, the user can
specify uncertain fluxes and provide standard deviations. The function
uses the \code{xsample} function from the package \code{limSolve}.
}
\usage{
sampleFluxEnsemble(model, uncertain.vars=NULL, iter=3000, ...)
}

\arguments{

\item{model}{Either an object of class LIM as generated by
\code{createLIMFromBiGG} or \code{createLIMFromSBML}, a
\code{character} with the full path to a LIM model file
or an object of class \code{Model} from the package \code{rsbml}} 

\item{uncertain.vars}{An object of class \code{data.frame} containing
three columns: 1. The identifier for the flux(es) to be constrained within
its uncertainty limits (linear combinations of fluxes e.g. F1 + F2 -
F3 are also allowed), 2. the value of the constrained flux and
3. its standard deviation. If uncertain.vars is NULL, the ensemble is
sampled without approximate equality constraints  }
\item{iter}{Number of iterations in the Monte Carlo procedure}
\item{...}{Additional arguments to \code{xsample}}    
}

\value{
A \code{matrix} with the posterior flux ensemble. The number of columns
is equal to the number of fluxes in the provided model, the number of
rows is equal to \code{iter}.
}
\references{
K. V. den Meersche, K. Soetaert, and D. V. Oevelen: xsample(): An R
function for sampling linear inverse problems,Journal of Statistical Software, 
Code Snippets, vol. 30, pp. 1-15, 4 2009.  
}
\author{
Hannes Hettling
}
\note{
This function is a wrapper for the function \code{xsample}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{xsample}
}
\examples{
##get example model file of glycolysis and TCA cycle 
limfile.path <- system.file("extdata", "Glycolysis_TCA.LIM",
package="BiGGR")

##Specify uncertainty of fluxes "R_GLCt1r", "R_O2t"
uncertain.vars <- data.frame(var=c("R_GLCt1r", "R_O2t"), value=c(0.4, 2.4), sd=c(0.08, 0.48))
##sample ensemble
ensemble <- sampleFluxEnsemble(limfile.path, uncertain.vars)

##Example in which linear combination of fluxes is constrained
atp.reacs <- "R_ATPS4m - R_NDPK1m - R_HEX1 - R_PFK - R_PGK + R_PYK"
uncertain.vars <- data.frame(var=atp.reacs, value=10, sd=1)
ensemble <- sampleFluxEnsemble(limfile.path, uncertain.vars)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ pathways }

