library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(reshape2)
server <- function(input, output) {
  
  # Return the requested dataset ----
  # Note that we use eventReactive() here, which depends on
  # input$update (the action button), so that the output is only
  # updated when the user clicks the button
  csvInput <- eventReactive(input$update, {
    switch(input$dataset,
           "csv" = csv
    )
  }, ignoreNULL = FALSE)
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    csv <- csvInput()
    summary(csv)
  })
  output$view <- renderTable({
    head(csvInput(), n = isolate(input$obs))
  })
  
  output$plot <- renderPlot({
    csv <- csvInput()
    plot(csv,col="purple")})
  
  output$dim <- renderPrint({
    csv <- csvInput()
    dim(csv)})
  
  output$str <- renderPrint({
    csv <- csvInput()
    str(csv)})
  
  output$bar <- renderPlot({
    bar2 <-tapply(csv[,input$ylim],list(csv[,input$xlim]),mean)
    barplot(bar2,col="lightblue",beside = input$sidebar)
  })
  
  
  
  output$scatterPlot <- renderPlot({
    ggplot(csv,aes(x=IPTS,y=Bekerja,col="red"))+geom_point()})
  
  output$scatterPlot2 <- renderPlot({
    ggplot(csv,aes(x=IPTS,y=BelumBekerja ,col="blue"))+geom_point()})
  
  output$scatterPlot3 <- renderPlot({
    ggplot(csv,aes(x=IPTS,y=Melanjutkan.Pengajian
                   ,col="red"))+geom_point()})
  
  output$scatterPlot4 <- renderPlot({
    ggplot(csv,aes(x=IPTS,y=Meningkatkan.Kemahiran
                   ,col="blue"))+geom_point()})
  
  output$scatterPlot5 <- renderPlot({
    ggplot(csv,aes(x=IPTS,y=Menunggu.Penempatan.Pekerjaan
                   ,col="blue"))+geom_point()})
  
  
  
}