#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data("swiss")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Model for predicting Fertility based on Education Level (Swiss Dataset)"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput('sliderEducation',"What is the education level of the village?",1,60,value=30),
            checkboxInput("showModel","Show Model",value=TRUE),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Fertility from Linear Model : "),
            textOutput("pred")
        )
    )
))
