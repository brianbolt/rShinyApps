library(shiny)
library(shinyIncubator)


spreadsheetInput <- function(inputId){
  tagList(
    singleton(tags$head(tags$script(src = "http://handsontable.com/jquery.handsontable.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "http://handsontable.com/lib/bootstrap-typeahead.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "http://handsontable.com/lib/jQuery-contextMenu/jquery.contextMenu.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "http://handsontable.com/lib/jQuery-contextMenu/jquery.ui.position.js", type='text/javascript'))),
    
    singleton(tags$head(tags$script(src = "shiny-handsontable.js", type='text/javascript'))),
    
    singleton(tags$head(tags$link(rel="stylesheet", type="text/css", href="http://handsontable.com/lib/jQuery-contextMenu/jquery.contextMenu.css"))),
    singleton(tags$head(tags$link(rel="stylesheet", type="text/css", href="http://handsontable.com/jquery.handsontable.css"))),
    
    tags$body(
      tags$div(id=inputId, class="handsonTable-output"),
      br()
    )
  )
}


shinyUI(pageWithSidebar(  
  headerPanel("Title"),
  sidebarPanel(
    spreadsheetInput("example")
    ),
  
  mainPanel(
    tableOutput(outputId="result")
  )
))