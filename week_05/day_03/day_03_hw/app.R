library(bslib)
library(shiny)
library(tidyverse)

hair_eye_colour <- as_tibble(HairEyeColor)

ui <- fluidPage(
  titlePanel(tags$h1("Hair and Eye Colour")),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = 'sex_input',
                   label = em("Sex"),
                   choices = c("Male", "Female")),
      
      radioButtons(inputId = 'eye_input',
                   label = em("Eye Colour"),
                   choices = c("Brown", "Blue", "Hazel", "Green"))
      
    ),
    mainPanel(
      plotOutput('hair_eye_plot')
      
    )
  )
)


server <- function(input, output) {
  output$hair_eye_plot <- renderPlot({
    hair_eye_colour %>%
      filter(Hair %in% c("Black",
                         "Brown",
                         "Blond",
                         "Red")) %>%
      filter(Sex == input$sex_input) %>%
      filter(Eye == input$eye_input) %>%
      ggplot() +
      aes(x = Hair, y = n) +
      geom_col()
  })
}


shinyApp(ui = ui, server = server)