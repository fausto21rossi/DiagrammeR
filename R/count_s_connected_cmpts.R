#' Get the number of strongly-connected components
#'
#' Get the number of strongly-connected components in the graph.
#' @inheritParams render_graph
#' @return a single integer value representing the number of strongly-connected
#'   graph components.
#' @examples
#' # Create a graph and add
#' # several graph islands
#' graph <-
#'   create_graph() %>%
#'   add_islands_graph(
#'     n_islands = 4,
#'     island_size = 10,
#'     p = 1/5,
#'     edges_between = 1,
#'     set_seed = 23)
#'
#' # Get a count of strongly-connected
#' # components in the graph
#' graph %>%
#'   count_s_connected_cmpts()
#' @importFrom igraph components
#' @export
count_s_connected_cmpts <- function(graph) {

  # Get the name of the function
  fcn_name <- get_calling_fcn()

  # Validation: Graph object is valid
  if (graph_object_valid(graph) == FALSE) {

    emit_error(
      fcn_name = fcn_name,
      reasons = "The graph object is not valid")
  }

  # If the graph is empty, then return NA
  if (nrow(graph$nodes_df) == 0) {
    return(as.numeric(NA))
  }

  # Convert the graph to an igraph object
  ig_graph <- to_igraph(graph)

  # Get the number of strongly-connected
  # components in the graph
  igraph::components(ig_graph, mode = "strong")[["no"]]
}
