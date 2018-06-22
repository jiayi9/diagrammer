library(shiny)
library(plotly)

shinyServer(function(input, output, session) {

  
  
  library(DiagrammeR)
  library(DiagrammeRsvg)
  library(rsvg)
  # Create a node data frame (ndf)
  ndf <- create_node_df(n = 5,
                        label = c("ST10", "ST20", "ST30", "ST40", "ST50"),
                        shape = c("rectangle"))
  
  # Create an edge data frame (edf)
  edf <- create_edge_df(from = c(1, 2, 3, 4, 2, 5),
                        to = c(2, 3, 4, 5, 2, 2),
                        #rel = c("a", "b", "c", "d"),
                        label = c(100,200,300,400, 50, 50),
                        arrowsize   = 1:6,
                        fontsize = (1:6)*10
  )
  
  
  # Create a graph with the ndf and edf
  graph <- create_graph(nodes_df = ndf,
                        edges_df = edf
  ) 
  
  # graph$global_attrs$value[1] = 'dot'
  # graph$global_attrs$value[1] = 'twopi'
  # graph$global_attrs$value[1] = 'circo'

  
  output$CHART = renderGrViz({
    #DiagrammeR::render_graph(graph)
    
    DiagrammeR::render_graph(graph)
  })
})
