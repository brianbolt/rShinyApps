library(shiny)
library(RJSONIO)
library(plyr)

jsonToList <- function(json) {
  jsonAsList <- fromJSON(json, simplify = StrictCharacter, nullValue = "")
	return(jsonAsList)
}
jsonToDataFrame <- function(json) {
	jsonAsList <- jsonToList(json)
	jsonAsDataFrame <- ldply(jsonAsList,function(x) as.data.frame(t(unlist(x))))
	#f <- function(jsonList) function(nm) unlist(lapply(jsonList, "[[", nm), use.names=FALSE) 
	#jsonAsDataFrame <- as.data.frame(Map(f(jsonAsList), names(jsonAsList[[1]]))) 
	return(jsonAsDataFrame)
}

# Minimal Custom
shinyServer(function(input, output) {
  
  table_data <- reactive({
    input$exampleGrid
  })
  
  output$table_text <- renderTable({
    jsonToDataFrame(table_data())
  })
  
})
