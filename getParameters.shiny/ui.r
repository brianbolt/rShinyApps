getBins <- function(inputId, selected = 20) {
  tagList(
    singleton(tags$head(tags$script(src = "js/getBins.js"))),
    tags$input(id = inputId,
                class = "n_breaks",
                value = selected),
	tags$style(type='text/css', "#n_breaks { display:none; }")
  )
}

shinyUI(bootstrapPage(
  getBins(inputId="n_breaks"),
  checkboxInput(inputId = "individual_obs",
      label = strong("Show individual observations"),
      value = FALSE),

  checkboxInput(inputId = "density",
      label = strong("Show density estimate"),
      value = FALSE),

  plotOutput(outputId = "main_plot", height = "300px"),

  # Display this only if the density is shown
  conditionalPanel(condition = "input.density == true",
    sliderInput(inputId = "bw_adjust",
        label = "Bandwidth adjustment:",
        min = 0.2, max = 2, value = 1, step = 0.2)
  )

))