% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fig_grid.R
\name{grid_plot}
\alias{grid_plot}
\title{Create a Bokeh grid plot from a list of Bokeh figures}
\usage{
grid_plot(figs, nrow = 1, ncol = 1, byrow = TRUE, same_axes = FALSE,
  link_data = FALSE)
}
\arguments{
\item{figs}{list of Bokeh figures - see details for what is acceptable}

\item{nrow}{number of rows in the grid}

\item{ncol}{number of columns in the grid}

\item{byrow}{populate the grid by row according to the order of figure elements supplied in \code{params}}

\item{same_axes}{logical or vector of two logicals specifying whether the x and/or y axis limits should be the same for each plot in the grid}

\item{link_data}{logical - should an attempt be made to join the data sources of each plot for linked brushing? (see details)}
}
\description{
Create a Bokeh grid plot from a list of Bokeh figures
}
\details{
The \code{figs} parameter can either be a list of figures or a list of lists of figures.  If the latter, the list structure will determine the layout, with each super-list of figures defining a single row of the grid.  If the former, the parameters \code{nrow} and \code{ncol} and \code{byrow} are used to determine the layout.  The grid is from top to bottom left to right.

If \code{link_data} is \code{TRUE}, then an effort will be made to link all data sources that are common among the different figures in the plot.  Note that at this point, only data sources that are specified in the \code{data} argument to the different layer functions are checked.
}
\examples{
\donttest{
tools <- c("pan", "wheel_zoom", "box_zoom", "box_select", "resize", "reset")

p1 <- figure(tools = tools) \%>\%
  ly_points(Sepal.Length, Sepal.Width, data = iris,
    color = Species, hover = list(Sepal.Length, Sepal.Width))

p2 <- figure(tools = tools) \%>\%
  ly_points(Petal.Length, Petal.Width, data = iris,
    color = Species, hover = list(Sepal.Length, Sepal.Width))

# 1 row, 2 columns
grid_plot(list(p1, p2))
# x and y axis with same (and linked) limits
grid_plot(list(p1, p2), same_axes = TRUE)
# x axis has same (and linked) limits
grid_plot(list(p1, p2), same_axes = c(TRUE, FALSE))
# same axes and data is linked (try box_select tool)
grid_plot(list(p1, p2), same_axes = TRUE, link_data = TRUE)
# 1 column, 2 rows
grid_plot(list(p1, p2), ncol = 1)
# send lists instead of specifying nrow and ncol
grid_plot(list(c(list(p1), list(p2))))
grid_plot(list(list(p1), list(p2)))
}
}

