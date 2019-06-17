#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws histograms and a regression model regarding car weight and MPG
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict mtcars MPG"),
  
  # Sidebar with a slider input for number of bins and number of points in the regression
  sidebarLayout(
    sidebarPanel(
       h3("Select number of bins"),
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       checkboxInput("show_xlab","Show/Hide X Axis Label",value=TRUE),
       checkboxInput("show_ylab","Show/Hide Y Axis Label",value=TRUE),
       checkboxInput("show_title","Show/Hide Title",value=TRUE),
       h3("Select number of points in the regression"),
       sliderInput("points",
                   "Number of points:",
                   min = 1,
                   max = 32,
                   value = 32),
       checkboxInput("showModel","Show/Hide Model",value=TRUE),
       h3("R Square"),
       textOutput("rsquared"),
       submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution and the regression model
    mainPanel(
       h3("Weight Histogram"),
       plotOutput("distPlot1"),
       h3("MPG Histogram"),
       plotOutput("distPlot2"),
       h3("Regression"),
       plotOutput("distPlot3")
       
    )
  )
))
