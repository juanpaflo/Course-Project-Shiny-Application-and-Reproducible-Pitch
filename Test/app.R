#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Author: Juan Flores
# Creation date: September 15th, 2017
# Description: This application contains three drop-down lists where the user can select the specie, and the attribute
# from the iris data frame, and also the bars color of the histogram.
#
# Below the histogram some information is displayed regarding the data corresponding to the selection made
# in the drop-downs, information like mean, and standard deviation among other data.
#
# The drop-down lists, have a default value, so since the moment the user opens the application, a histogram
# and the information related to the data of the specie and attrbiute are displayed. Every time the user changes
# a value on a drop-down list, the histogram and the information displayed below, will change accordingly.

# The code contains two main sections, the first one where the layouts and the input methods are defined, along
# with the main panel where the output variables are presented.
# The second section could be described as the server functionality (or where the calculations / updates occur)
# and contains the calls of the variables defined in the first section.

library(shiny)

# Define UI for application that draws a plot using the Iris data frame that comes with RStudio.
ui <- fluidPage(
  
   # Application title
   titlePanel("Visual representation of the iris data frame by specie"),
   
  # Sidebar  
  sidebarLayout(
      sidebarPanel(
    # Sidebar list to select the specie to be analyzed.
      selectInput("Specie", "Specie to be analyzed: ",
                c(as.vector(unique(iris$Species)))
                ),
    # Sidebar list to select the attribute be analyzed.
      selectInput("Attribute", "Attribute to be analyzed: ",
                c(names(iris))
                ),
    # Sidebar list to select the color of the bars in the histogram.
      selectInput("BarColor", "Bar color: ",
                c("Blue","Red","Green")
                )
      ),
    # Main panel where the plot and text are displayed.
    mainPanel(
      # Output section of the plot.
      plotOutput("irisPlot"),
      # Output section of the text.
      htmlOutput("result")
    )
  ),
  
# Show a plot for the species selected
mainPanel(
)
)


# Server logic required to draw a histogram and display some text.
server <- function(input, output) {
   
   output$irisPlot <- renderPlot({
      # Subset of data based on selections from ui.R
      y  <- input$Specie
      x <- subset(iris, iris$Species == y)
      l <- x[,as.character(input$Attribute)]
      output$result <- renderText({paste("Selection: ",input$Specie)})
      # Histogram according to the data selection
      hist(l, xlab =  input$Attribute , col = input$BarColor, border = 'white', main = paste("Sepal Length of",y))
      
      # Output text with some information like mean, according to the data selected.
      output$result <- renderUI({
        HTML(
        paste0("The mean of the data is: ",mean(l),
                "<br>",
               "The standard deviation of the data is: ",round(sd(l),6),
               "<br>",
               "With a maximum value of: ",max(l),
               "<br>",
               "With a minimum value of: ",min(l),
               "<br>",
               "Difference from minimum to maximum value: ",(max(l)-min(l))
               )
        )
        })
      
   })

}

# Run the application 
shinyApp(ui = ui, server = server)
