#' Print a Bokeh Figure
#' 
#' @param x Bokeh figure
#' @param \ldots further arguments - most importantly \code{debug = TRUE} 
#' will print information about the figure in the javascript console in the 
#' web browser
#' 
#' @export
print.BokehFigure <- function(x, ...) {
  print(plot(x, y = NULL, ...))
}

#'@export
plot.BokehFigure <- function(x, y, ...) {
  dots <- list(...)
  debug <- dots$debug
  if(is.null(debug))
    debug <- FALSE

  fig <- x

  if(length(fig$glyphSpecs) == 0) {        
    message("This figure is empty...")
  } else {
    ## put options together
    options <- list()
    for(opt in optionNames) {
      fld <- fig[[opt]]
      if(length(fld) > 0)
        options[[opt]] <- fld
    }
    options$r_debug <- debug

    ## set xlim and ylim if not set
    if(length(fig$xlim) == 0) {
      message("xlim not specified explicitly... calculating...")
      options$xrange <- getAllGlyphRange(fig$glyphXRanges, fig$padding_factor, fig$xAxisType)
    } else {
      options$xrange <- fig$xlim
    }
    if(length(fig$ylim) == 0) {
      message("ylim not specified explicitly... calculating...")
      options$yrange <- getAllGlyphRange(fig$glyphYRanges, fig$padding_factor, fig$yAxisType)
    } else {
      options$yrange <- fig$ylim
    }

    # RJSONIO fix
    if(length(options$yrange) == 1)
      options$yrange <- list(options$yrange)
    if(length(options$xrange) == 1)
      options$xrange <- list(options$xrange)

    ## see if we need to execute any deferred functions
    if(length(fig$glyphDefer) > 0) {
      deferNames <- names(fig$glyphDefer)
      for(dn in deferNames) {
        fig$glyphSpecs[[dn]] <- fig$glyphDefer[[dn]](fig$glyphSpecs[[dn]], options$xrange, options$yrange)      
        fig$glyphData[[dn]] <- fig$glyphDefer[[dn]](fig$glyphData[[dn]], options$xrange, options$yrange)      
      }
    }
    options$dims <- c(options$width, options$height)
    options$width <- NULL
    options$height <- NULL

    ## create widget
    htmlwidgets::createWidget(
       name = 'rbokeh',
       list(
          data = unname(fig$glyphData),
          spec = unname(fig$glyphSpecs),
          options = options
       ),
       width = options$dims[1] + 50,
       height = options$dims[2] + 50,
       package = 'rbokeh'
    )
  }
}