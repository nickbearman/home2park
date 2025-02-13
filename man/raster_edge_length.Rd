% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parks_calc_attributes_helpers.R
\name{raster_edge_length}
\alias{raster_edge_length}
\title{Calculate the total edge length of a raster associated with each park polygon}
\usage{
raster_edge_length(
  polygons,
  raster,
  raster_min_patch_size = units::set_units(0, "m^2"),
  raster_edge_buffer = units::set_units(0, "m^2"),
  relative = TRUE
)
}
\arguments{
\item{polygons}{\code{sf} (with projected coordinate reference system).}

\item{raster}{\code{SpatRaster} object from \code{terra::rast()}. Should have a (projected) coordinate reference system similar to \code{polygons}.}

\item{raster_min_patch_size}{Minimum patch size to be included in results.
Provided either as a units object (see \code{units::set_units()}),
or a number in the units of the coordinate reference system. Defaults to \code{0} m^2.}

\item{raster_edge_buffer}{numeric. Specify buffer distance to add to polygonised raster; the total edge length of \code{polygons} that
\href{https://postgis.net/docs/ST_Intersection.html}{intersect} the buffered \code{raster}
will be summed up together with the total edge length contained \href{https://postgis.net/docs/ST_Within.html}{within} the \code{polygons}.
Defaults to \code{0} (only patches fully contained \href{https://postgis.net/docs/ST_Within.html}{within} polygons will be considered).
Provided either as a units object (see \code{units::set_units()}), or a number in the units of the coordinate reference system.}

\item{relative}{logical. Whether or not to calculate relative amounts
(i.e. ratio of edge-to-perimeter length). Defaults to \code{TRUE}.}
}
\value{
\code{polygons} with added column(s) \verb{< class value >_length}, and \verb{< class value >_length_perim_ratio} if \code{relative} is set to \code{TRUE}.
Note that the value \code{0} will be summarised; convert pixels to \code{NA} if you wish to exclude them.
}
\description{
Helper function within \code{parks_calc_attributes()}.
The total edge length of (classified) raster patches contained \href{https://postgis.net/docs/ST_Within.html}{within}
the \code{polygons} will be calculated. Additionally, the argument \code{raster_edge_buffer} provides a way include patches
in close proximity to the \code{polygons}. The total edge lengths are summed together and appended to the \code{polygons}
data as additional columns (or one column, if there is only one raster class).
Note that this operation may take a while to complete, as it involves the conversion of rasters to polygons (and vice versa).
}
