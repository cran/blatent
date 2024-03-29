#' @title blatent estimation specifications
#'
#' @description Creates control specifics for estimation options for estimating Bayesian latent variable models.
#'
#' @param calculateDIC Calculates DIC following Markov chain. DIC will be marginalized for models with latent variables. Defaults to TRUE.
#'
#' @param calculateWAIC Calculates WAIC following Markov chain. WAIC will be marginalized for models with latent variables. Defaults to TRUE.
#'
#' @param defaultPriors Sets priors for all parameters that are not specified in priorsList of
#'                      \code{\link{blatentEstimate}}. Defaults to list set by
#'                      \code{\link{setDefaultPriors}} function. Values in list currently allowed are
#'                      \itemize{
#'                         \item \code{normalMean} for the mean of a normal distribution (defaults to \code{0}).
#'                         \item \code{normalVariance} for the variance of a normal distribution (defaults to \code{1000}).
#'                         \item \code{normalCovariance} for the covariance of a multivariate normal distribution
#'                               (defaults to \code{0}).
#'                      }
#'
#' @param defaultInitializeParameters List of values that sets distributions used to initialize
#'                      parameters. Defaults to list set by \code{\link{setDefaultInitializeParameters}}
#'                      function. Values in list currently allowed are:
#'                      \itemize{
#'                         \item \code{normalMean} for the mean of a normal distribution (defaults to \code{0}).
#'                         \item \code{normalVariance} for the variance of a normal distribution (defaults to \code{1}).
#'                         \item \code{normalCovariance} for the covariance of a multivariate normal distribution
#'                               (defaults to \code{0}).
#'                      }
#'
#' @param estimateLatents Estimate latent variables summaries for each observation following MCMC estimation. Defaults to \code{TRUE}.
#'
#' @param estimator Sets the estimation algorithm to be used. Currently, one option is available that works. The eventual values will be:
#'                     \itemize{
#'                        \item \code{"blatentEstimator"} Sets the estimation algorithm to be used to the R package \code{blatentEstimator}, which must be installed (default).
#'                        \item \code{"GPDCM"} Gibbs Probit Diagnostic Classification Model is allowed but not functional.
#'                        }
#'
#' @param estimatorLocation Sets the path to the location of estimator executable, if \code{estimatorType} is
#'                          \code{"external"}. Currently set to \code{""}.
#'
#' @param estimatorType Sets location of estimator. Currently, only one option (the default) works.
#'                     \itemize{
#'                        \item \code{"R"} Sets estimation via R packages (default).
#'                        \item \code{"external"} for estimation routines external to R. Currently external syntax does not work.
#'                      }
#'
#' @param executableName Sets the name for the executable file for the estimator. Defaults to
#'                       \code{""}
#'
#' @param fileSaveLocation Sets the path for output files used for external estimation routines.
#'                         Only used when \code{estimatorType = "external"}.
#'
#' @param HDPIntervalValue Sets the value for all highest density posterior interval parameter summaries. Defaults to \code{0.95}.
#'
#' @param maxTuneChains Sets the maximum number of tuning chains for MCMC sampling algorithm, if needed. Currently,
#'                      no Metropolis steps exist in algorithm, so is unused. Defaults to \code{0}.
#'
#' @param minTuneChains Sets the minimum number of tuning chains for MCMC sampling algorithm, if needed.
#'                      Currently, no Metropolis steps exist in algorithm, so is unused. Defaults to \code{0}.
#'
#' @param missingMethod Sets the way missing observed variables are treated within algorithm. Defaults to \code{"skip"}.
#'                      Current options are:
#'                      \itemize{
#'                         \item \code{"skip"} Skips all missing variables in model likelihoods. For dependent variables
#'                         predicted variables with missing values, omits any case with missing values.
#'                         \item \code{"imputeBayes"} Model-based imputation using Bayes theorem.
#'                      }
#'
#' @param nBurnin Sets the number of burnin iterations. Defaults to \code{1000}.
#'
#' @param nChains Sets the number of independent Markov chains run by the program. Defaults to \code{4}.
#'
#' @param nCores Sets the number of cores used in parallel processing if option \code{parallel} is
#'               \code{TRUE}. Defaults to \code{-1}. Values are semi-indicative of how many
#'               processors will be used:
#'               \itemize{
#'                  \item \code{-1} indicates that all but one available processor will be used.
#'                  \item \code{0} indicates that all available processors will be used.
#'                  \item \code{>0} indicates that specific number of processors will be used, if available.
#'               }
#'               Note: currently, parallel processing is unavailable, so this is unused.
#'
#' @param nSampled Sets the number of posterior draws to sample, per chain. Defaults to \code{1000}.
#'
#' @param nThin Sets the thinning interval, saving only the posterior draws that comes at this value.
#'              Defaults to \code{5}.
#'
#' @param nTuneIterations Sets the number of iterations per tuning chain, if needed. Currently,
#'                        no Metropolis steps exist in algorithm, so is unused. Defaults to \code{0}.
#'
#' @param parallel If \code{TRUE}, enables parallel processing of estimation and PPCM analyses.
#'                 Currently, parallel processing is unavailable, so this is unused. Defaults to \code{FALSE}.
#'
#' @param posteriorPredictiveChecks List of values that sets options for posterior predictive model checks.
#'                      Defaults to list set by \code{\link{setPosteriorPredictiveCheckOptions}}
#'                      function. Values in list currently allowed are:
#'
#' @param seed Sets the random number seed for the analysis. Defaults to \code{NULL}, which does not
#'             set the seed and uses current session value per each analysis.
#'
#' @return A list of values containing named entries for all arguments shown above.
#'
#' @export
blatentControl <-
  function(calculateDIC = TRUE,
           calculateWAIC = TRUE,
           defaultPriors = setDefaultPriors(),
           defaultInitializeParameters = setDefaultInitializeParameters(),
           estimateLatents = TRUE,
           estimator = "blatent",
           estimatorType = "R",
           estimatorLocation = "",
           executableName = "",
           fileSaveLocation = paste0(getwd(), "/"),
           HDPIntervalValue = .95,
           maxTuneChains = 0,
           minTuneChains = 0,
           missingMethod = "omit",
           nBurnin = 1000,
           nChains = 4,
           nCores = -1,
           nSampled = 1000,
           nThin = 5,
           nTuneIterations = 0,
           parallel = FALSE,
           posteriorPredictiveChecks = setPosteriorPredictiveCheckOptions(),
           seed = NULL) {


    return(
      list(
        calculateDIC = calculateDIC,
        calculateWAIC = calculateWAIC,
        defaultInitializeParameters = defaultInitializeParameters,
        estimateLatents = estimateLatents,
        defaultPriors = defaultPriors,
        estimator = estimator,
        estimatorType = estimatorType,
        estimatorLocation = estimatorLocation,
        executableName = executableName,
        fileSaveLocation = fileSaveLocation,
        HDPIntervalValue = HDPIntervalValue,
        maxTuneChains = maxTuneChains,
        minTuneChains = minTuneChains,
        missingMethod = missingMethod,
        nBurnin = nBurnin,
        nChains = nChains,
        nCores = nCores,
        nSampled = nSampled,
        nThin = nThin,
        nTuneIterations = nTuneIterations,
        parallel = parallel,
        posteriorPredictiveChecks = posteriorPredictiveChecks,
        seed = seed
      )
    )
  }
