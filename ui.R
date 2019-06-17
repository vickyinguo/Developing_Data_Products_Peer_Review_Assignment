# This application shows the relationship between car weight and mpg using mtcars dataset in R.

# It has 2 histograms which you can change number of bins to see how car weight and mpg correlates, 
# and a regression model which you can change number of points in the model. You can also see the R squre value of 
# the regression model - a measure of fitness of the model - when you change the number of points in the model.

library(shiny)

# Define UI for application that draws histograms and a regression model regarding car weight and MPG
shinyUI(fluidPage(
  
  # Application title
  titlePanel("mtcars Weight vs MPG"),
  
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
       checkboxInput("show_title","Show/Hide Title"),
       
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
       h3("This application shows the relationship between car weight and mpg using mtcars dataset in R."),
       h4("This section has 2 histograms which you can change number of bins to see how car weight and mpg correlates 
          when changing bins"),
       h4("Weight Histogram"),
       plotOutput("distPlot1"),
       h4("MPG Histogram"),
       plotOutput("distPlot2"),
       h4("This section has a regression model which you can change number of points in the model to see how the model fits"),
       h4("Regression"),
       plotOutput("distPlot3")
       
    )
  )
))
