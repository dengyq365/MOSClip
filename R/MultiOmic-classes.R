setClassUnion("characterOrNULL", c("character", "NULL"))

#' Multi Omics Modules that extends \code{"list"} class.
#'
#' This class organize the results of the Multi Omics Module Survival Test analysis.
#'
#' @slot alphas numeric vector of the pvalues of all the modules.
#' @slot zlists a list of all the zs of the covariates.
#' @slot coxObjs a list with all the data.frame used for coxph of each module.
#' @slot modulesView a list of module information: for each omic the module data, the method used and the covariate analyzed.
#' @slot modules a list woth the genes that belong to the module.
#' @slot modulesData a list, for each module the data splitted in omics. Redundant.
#' @slot formulas a list, for each module the character of the formula used in the coxph.
#' @slot graphNEL the graphNEL version of the pathway used in the analysis.
#' @slot title the name of the pathway.
#'
setClass("MultiOmicsModules", package = "MOSClip",
         slots = c(alphas  = "numeric",
                   zlists  = "list",
                   coxObjs = "list",
                   modulesView  = "list",
                   modules     = "list",
                   modulesData = "list",
                   formulas = "list",
                   graphNEL = "graphNEL",
                   title = "characterOrNULL"),
         contains = "list")

# setMethod("initialize", "MultiOmicsModules", function(.Object,
#                                                       alphas  = "numeric",
#                                                       zlists  = "list",
#                                                       coxObjs = "list",
#                                                       modulesView  = "list",
#                                                       modules     = "list",
#                                                       modulesData = "list",
#                                                       formulas = "list",
#                                                       graphNEL = "graphNEL",
#                                                       title = "characterOrNULL",...) {
#   .Object <- callNextMethod()
#   return(.Object)
# })

# MultiOmicsModules <- function(...) new("MultiOmicsModules", ...)

# setMethod("show",
#           signature = "MultiOmicsModules",
#           definition = function(object) {
#             sthis <- seq_len(min(length(object@alphas), 3))
#             sthis <- order(object@alphas)[sthis]
# 
#             sigCliquesIdx = which(object@alphas <= 0.05)
# 
#             if (!is.null(object@title)) {
#               cat("\"",object@title, "\"\n", sep = "")
#             }
# 
#             for (i in sthis) {
#               cat(paste0("Module ",i, ": pvalue ", object@alphas[i], "\n"))
#               covs <- names(which(object@zlists[[i]] <=0.05))
#               if (length(covs)!=0)
#                 cat("The following covariates are implicated:\n",paste(covs, collapse=", "),"\n")
#               cat("Module is composed by the followings:\n")
#               cat(paste(object@modules[[i]], collapse=", "))
#               cat("\n-+-\n")
#             }
# 
#             if (length(sthis) < length(sigCliquesIdx)) {
#               cat(paste0("There are other ", length(sigCliquesIdx)-length(sthis), " cliques with pvalue <= 0.05"))
#             }
# 
#             invisible(NULL)
#           })

#' Multi Omics Pathway that extends \code{"list"} class.
#'
#' This class organize the results of the Multi Omics Module Survival Test analysis.
#'
#' @slot pvalue numeric, the pvalues of the whole module.
#' @slot zlist a vector of all the zs of the covariates.
#' @slot coxObj a data.frame used for the coxph model.
#' @slot pathView a list, for each omic the pathway data, the method used and the covariate analyzed.
#' @slot formulas a list, for each module the character of the formula used in the coxph.
#' @slot pathData a list, for each omics the data analyzed. Redundant.
#' @slot graphNEL the graphNEL version of the pathway used in the analysis.
#' @slot title the name of the pathway.
#'
#' @name MultiOmicsPathway-class
#' @rdname MultiOmicsPathway-class
#' 
setClass("MultiOmicsPathway", package = "MOSClip",
         slots = c(pvalue = "numeric",
                   zlist = "numeric",
                   coxObj = "data.frame",
                   pathView = "list",
                   formula = "character",
                   pathData = "list",
                   graphNEL = "graphNEL",
                   title = "characterOrNULL"),
         contains = "list")

# setMethod("initialize", "MultiOmicsModules", function(.Object,
#                                                       pvalue  = "numeric",
#                                                       zlist  = "numeric",
#                                                       coxObj = "data.frame",
#                                                       pathView = "list",
#                                                       formula = "character",
#                                                       pathData = "list",
#                                                       graphNEL = "graphNEL",
#                                                       title = "characterOrNULL",...) {
#   .Object <- callNextMethod()
#   return(.Object)
# })

# MultiOmicsPathway <- function(...) new("MultiOmicsPathway", ...)

# setMethod("show",
#           signature = "MultiOmicsPathway",
#           definition = function(object) {
#             if (!is.null(object@title)) {
#               cat("\"",object@title, "\"\n", sep = "")
#             }
#             cat(paste0("Pathway overall pvalue: ", object@pvalue, "\n"))
#             invisible(NULL)
#           })