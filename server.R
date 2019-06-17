#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw histogram and the regression model
shinyServer(function(input, output) {
   
  output$distPlot1 <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- mtcars$wt
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    xlab <- ifelse(input$show_xlab,"Weight","")
    main <- ifelse(input$show_title,"Weight Histogram","")
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',xlab=xlab,main=main)
    
  })
  output$distPlot2 <- renderPlot({
    # generate bins based on input$bins from ui.R
    y    <- mtcars$mpg
    bins <- seq(min(y), max(y), length.out = input$bins + 1)
    xlab <- ifelse(input$show_xlab,"MPG","")
    main <- ifelse(input$show_title,"MPG Histogram","")
    # draw the histogram with the specified number of bins
    hist(y, breaks = bins, col = 'darkgray', border = 'white',xlab=xlab,main=main)   
  })
  
  output$distPlot3 <- renderPlot({
      # generate regression model
      mydata <- mtcars[1:input$points,]
      mymodel <- lm(mpg ~ wt, data=mydata)
      x    <- mydata$wt
      y    <- mydata$mpg
      xlab <- ifelse(input$show_xlab,"Weight","")
      ylab <- ifelse(input$show_ylab,"MPG","")
      main <- ifelse(input$show_title,"mtcars Weight vs MPG","")
      plot(x=x, y=y,
           main=main,
           xlab = xlab,
           ylab = ylab)
      if(input$showModel){abline(mymodel,col="blue",lwd=2)}
  })
  output$rsquared <-renderText({
      # generate R square for the model
      mydata <- mtcars[1:input$points,]
      mymodel <- lm(mpg ~ wt, data=mydata)
      summary(mymodel)$r.squared
  })
})
