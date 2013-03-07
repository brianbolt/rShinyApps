library(shiny)
library(RJSONIO)
library(plyr)

jsonToList <- function(json) {
  jsonAsList <- fromJSON(json, simplify = StrictCharacter, nullValue = "")
	return(jsonAsList)
}
jsonToDataFrame <- function(json) {
	jsonAsList <- jsonToList(json)
	jsonAsDataFrame <- ldply(jsonAsList,function(x) as.data.frame(t(unlist(as.numeric(x)))))
	return(jsonAsDataFrame)
}


# Minimal Custom
shinyServer(function(input, output) {
  
  data <- reactive({
    if(input$example == "[]") {
      return(cars)
    } else {
      return(jsonToDataFrame(input$example))
    }
  })
  
  dataframe <- reactive({
    dataSet <- data()
    dataSet <- suppressWarnings(as.data.frame(sapply(dataSet, as.numeric)))
    return(dataSet)
  })
  
  output$result <- renderTable({
    dataframe()
  })
  
  output$example <- renderUI({
    toJSON(as.data.frame(t(dataframe())), .withNames=FALSE)
  })
  
})
