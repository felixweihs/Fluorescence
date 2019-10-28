library(shiny)
#Create html file
ui <- fluidPage( 
# *Inpute() functions
# *Output() functions
)
#Input examples: sliderInput(), textInput(), actionButton(), passwordInput(), selectInput()
#sliderInput(inputId = "num', label = "Choose a number", other input specific arguments)

#Output examples: dataTableOutput(), htmlOutput(), imageOutput(), plotOutput(), 
#plotOUtput(outputId = "hist")

#Practice example with slider
ui <-  fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  plotOutput("hist")
)


# Server definition - 3 rules
# 1 - Save objects to display to output$
# 2 - Build objects to display with render*(); render examples: renderDataTable(), renderImage(), renderPlot()
# 3 - USe input values with input$
server <-  function(input, output) { #Define server
  output$hist <- renderPlot({
    title <-  "100 random normal values"
    hist(rnorm(input$num), main = title)
  })
}
shinyApp(ui = ui, server = server) #Puts it together





