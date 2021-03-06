% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fig_tool.R
\name{tool_tap}
\alias{tool_tap}
\title{Add "tap" tool to a Bokeh figure}
\usage{
tool_tap(fig)
}
\arguments{
\item{fig}{figure to modify}
}
\description{
Add "tap" tool to a Bokeh figure
}
\note{
Tools can be easily specified as a vector of tool names in the \code{tools} argument when instantiating a \code{\link{figure}}.  In this case, they are added with defaults.  Explicitly calling these \code{tool_} functions will manually add the tool to a figure and allow additional specification of parameters.
}
\examples{
\donttest{
figure() \%>\% ly_points(1:10) \%>\%
 tool_tap()
}
}
\seealso{
Other tools: \code{\link{tool_box_select}};
  \code{\link{tool_box_zoom}};
  \code{\link{tool_crosshair}};
  \code{\link{tool_lasso_select}}; \code{\link{tool_pan}};
  \code{\link{tool_reset}}; \code{\link{tool_resize}};
  \code{\link{tool_save}}; \code{\link{tool_wheel_zoom}}
}

