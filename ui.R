library(shiny)
shinyUI(fluidPage(
  navbarPage("Analytics",
      tabPanel("Example",
               DiagrammeR::grVizOutput("CHART",height = 700)
               )
             )
))
