library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(reshape2)
# Define UI for dataset viewer app ----
ui <- dashboardPage(
  dashboardHeader(title="STATUS GRADUAN"),
  # App title ----
  
  
  dashboardSidebar(
    
    selectInput("xlim","Select the value for X Axis", colnames(csv),selected = "IPTS"),
    selectInput("ylim","Select the value for Y Axis", colnames(csv),selected = "Bekerja"),
    
    # Input: Select a dataset ----
    selectInput("dataset", "Choose a dataset:",
                choices = c("csv")),
    
    # Input: Specify the number of observations to view ----
    sliderInput("obs","Number of observations:",
                value = 2,
                min = 1,
                max = 10)
    
    ,
    
    # Include clarifying text ----
    
    
    # Input: actionButton() to defer the rendering of output ----
    # until the user explicitly clicks the button (rather than
    # doing it immediately when inputs change). This is useful if
    # the computations required to render output are inordinately
    # time-consuming.
    actionButton("update", "Update View")
    
    
    
    
    
  ),
  dashboardBody(
    
    
    tabsetPanel(type="tab",
                tabPanel("Overwiew", plotOutput("bar")),
                tabPanel("Summary",verbatimTextOutput("summary")),
                tabPanel("Structure",  verbatimTextOutput("str")),
                tabPanel("Dim",verbatimTextOutput("dim")),
                tabPanel("View", tableOutput("view")),
                tabPanel("Plot",plotOutput("scatterPlot"),plotOutput("scatterPlot2"),plotOutput("scatterPlot3"),plotOutput("scatterPlot4"),plotOutput("scatterPlot5"),plotOutput("plot") ),
                tabPanel(("Documentation"), 
                         helpText ("This Shiny application, called Dataset Explorer helps user to understand the dataset or data frame before any detailed analysis can be performed by providing useful functions for exploring data."), 
                         helpText ("A dataset is a collection of several pieces of information called variables, usually arranged by columns."),
                         helpText ("Data in R are often stored in data frames, because they can store multiple types of data."),
                         helpText ("The dim( ) function returns the dimensions of the data frame that is number of rows and number of columns.  The output is a vector."),
                         helpText ("The str( ) function returns many useful pieces of information, including the above useful outputs and the types of data for each column."),
                         helpText ("The summary ( ) function provides basic descriptive statistics and frequencies."),
                         helpText ("The View( ) function opens a data frame in a new window in a spreadsheet style format that can be scrolled for viewing the data. The head ( ) and tail ( ) functions also allow us to view the first few and last few rows of the data."),
                         helpText ("The pairs( ) enables us to visually check possible correlated variables."),
                         helpText ("The names( ) function returns the column headers."),
                         helpText ("The levels( ) function returns the categories or levels of a categorical variable.")))
  )
  
  
)