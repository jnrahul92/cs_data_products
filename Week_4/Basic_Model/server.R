#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data("swiss")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    fit <- lm(Fertility~Education,data = swiss)
    modelPred <- reactive({
        eduInput <- input$sliderEducation
        predict(fit,newdata = data.frame(Education = eduInput))
        })
    
    output$plot1 <- renderPlot({
        eduInput <- input$sliderEducation
        plot(swiss$Examination,swiss$Fertility, xlab = "Education Level",
             ylab = "Fertility", main = "Education Level vs Fertility")
        if(input$showModel){
            abline(fit,col="red",lwd=2)
            abline(h=modelPred(),col="blue")
            abline(v=eduInput,col = "blue")
        }
        points(eduInput,modelPred(),col = "blue", pch = 16, cex = 2)
    })
    
    output$pred <- renderText({
        modelPred()
    })

})
