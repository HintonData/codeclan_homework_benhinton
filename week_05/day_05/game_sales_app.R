library(tidyverse)
library(shiny)
library(ggthemes)
library(bslib)
game_sales <- CodeClanData::game_sales


ui <- fluidPage(
  h1('Video Game Sales by Genre'),
  theme = bs_theme(bootswatch = "quartz"),
  sidebarLayout(
    sidebarPanel(width = 4,
      selectInput(inputId = "publisher_input",
                  label = "Publisher",
                  choices = c("All Publishers", unique(game_sales$publisher))
      )
    ),
    mainPanel(
      plotOutput("sales_graph")
    )
  )
  
)

server <- function(input, output, session) {
  
  sales_filtered <- eventReactive(
    eventExpr = input$publisher_input,
    valueExpr = { 
      game_sales %>% 
        filter(publisher == input$publisher_input)}
  )
  output$sales_graph <- renderPlot({
    sales_filtered() %>% 
      ggplot() +
      aes(x = genre, y = sales) +
      geom_bar(stat = "identity", fill = "blue") +
      labs(title = "Video Game Sales by Genre",
           x = "Genre",
           y = "Sales (in Millions)") +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 20, vjust = 0.8, family = "mono"),
            axis.title.y = element_text(vjust = 3.2),
            title = element_text(family = "mono", face = "bold"),
            plot.title = element_text(hjust = 0.4))
})
}

shinyApp(ui, server)