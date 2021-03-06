### Application name : CA1 B9DA101 - Statistics for Data Analytics
### Course : MSc (Data Analytics) - Sep 2019 - Group C
### Developed by : Mayur Vaishnav(10529721) / Hemlata  Mhapsekar(10532113) / Manmeet Kaur(10532765) / Chirag Wath (10532863)
### College : Dublin Business School
### URL : https://mayurvaishnav.shinyapps.io/probability_models/


# Use the shiny library
library(shiny)
# Use the markdown library
library(markdown)

# Created the Tabs for each section like Random Variable, Prediction, Hypothesis test, GLM linear regression and About us
  navbarPage("Home",

    ###########################################################################################################################
    ###                                                                                                                     ###
    ### >>> Begin >>> Mayur Vaishnav (10529721)                                                                             ###
    ###                                                                                                                     ###
    ###########################################################################################################################


    # First Tab Random Variable
    tabPanel("Random  Variable",
      # Header of this tab
      headerPanel("Distribution of Random Variables"),
      # Side bar for Random Variable panel
      sidebarLayout(
        sidebarPanel(
          # Radio Button to select the type of probability models
          # Default discrete is selected
          radioButtons("modelType", "Type:",
                       choices = c(
                         "Discrete" = "discrete",
                         "Continuous" = "continuous"
                       ),
                       selected = 'discrete',
                       inline = 'true'
          ),

          # Conditional panel for input for discrete probability models
          conditionalPanel(
            # Checked the condition equal for input_moel type and discrete
            condition = "input.modelType == 'discrete'",

            # List of all the Discrete models
            # Default bernoulli is selected
            selectInput("model", "Select Model",
                        choices = c(
                          "Bernoulli" = "bernoulli",
                          "Binomial" = "binomial",
                          "Poisson" = "poisson",
                          "Geometric" = "geometric",
                          "Hypergeometric" = "hypergeometric"
                        ),
                        selected = "bernoulli"
            ),

            # Slider input for simulated data
            sliderInput("s", "Number of simulated data(s)", min=1, max=1000, value = 10),

            # Conditional panel for inputs of bernoulli
            conditionalPanel(
              condition = "input.model == 'bernoulli'",
              # Slider input for the probability of successful trail
              sliderInput("p", "Probability of successful trail(p)", min=0, max=1, step = 0.01, value = 0.5)
            ),

            # Conditional panel for inputs of binomial
            conditionalPanel(
              condition = "input.model == 'binomial'",
              # Numeric input for the number trail
              numericInput("n", "Number of trails(n)", value = 10),
              # Slider input for the probability of successful trail
              sliderInput("p", "Probability of successful trail(p)", min=0, max=1, step = 0.01, value = 0.5)
            ),

            # Conditional panel for inputs of poission
            conditionalPanel(
              condition = "input.model == 'poisson'",
              # Numeric input for the upper limit
              numericInput("max", "Upper limit for x" , value = 5),
              # Numeric input for the lambda parameter
              numericInput("lam", "Parameter lambda in Poisson", value = 10)
            ),

            # Conditional panel for inputs of geometric
            conditionalPanel(
              condition = "input.model == 'geometric'",
              # Numeric input for the upper limit
              numericInput("max", "Upper limit for x" , value = 5),
              # Slider input for the probability of successful trail
              sliderInput("p", "Probability of successful trail(p)", min=0, max=1, step = 0.01, value = 0.5)
            ),

            # Conditional panel for inputs of hypergeometric
            conditionalPanel(
              condition = "input.model == 'hypergeometric'",
              # Numeric input for the M
              numericInput("m", "M" , value = 10),
              # Numeric input for the N
              numericInput("n", "N" , value = 20),
              # Numeric input for the K
              numericInput("k", "K" , value = 5)
            )

          ),

          # Conditional panel for inputs of continuous probabilities models
          conditionalPanel(
            condition = "input.modelType == 'continuous'",

            # Select input for all the Continuous models
            selectInput("modelCont", "Select Model",
                        choices = c(
                          "Uniform" = "uniform",
                          "Normal" = "normal",
                          "Exponential" = "exponential",
                          "Gamma" = "gamma",
                          "Chi-squared" = "chisquared"
                        ),
                        selected = "uniform"
            ),

            # Slider input for Number of simulated data
            sliderInput("s", "Number of simulated data" ,min=1, max=1000, value = 10),
            # Numeric input for the support
            numericInput("i", "Support" , value = 2),

            # Conditional panel for inputs of uniform
            conditionalPanel(
              condition = "input.modelCont == 'uniform'",
              # Numeric input for the Parameter a
              numericInput("a", "Parameter a in Uniform" , value = -2),
              # Numeric input for the Parameter b
              numericInput("b", "Parameter b in Uniform" , value = 0.8)
            ),

            # Conditional panel for inputs of normal
            conditionalPanel(
              condition = "input.modelCont == 'normal'",
              # Numeric input for the Parameter mu
              numericInput("mu", "Parameter mu in Normal" , value = 0),
              # Numeric input for the Parameter sigma
              numericInput("sigma", "Parameter sigma in Normal" , value = 1)
            ),

            # Conditional panel for inputs of exponential
            conditionalPanel(
              condition = "input.modelCont == 'exponential'",
              # Numeric input for the Parameter lambda
              numericInput("lam", "Parameter lambda in exponential" , value = 1)
            ),

            # Conditional panel for inputs of gamma
            conditionalPanel(
              condition = "input.modelCont == 'gamma'",
              # Numeric input for the Parameter sigma
              numericInput("sigma", "Parameter sigma in Gamma" , value = 1),
              # Numeric input for the Parameter lambda
              numericInput("lam", "Parameter lambda in Gamma" , value = 1)
            ),

            # Conditional panel for inputs of chisquared
            conditionalPanel(
              condition = "input.modelCont == 'chisquared'",
              # Numeric input for the Parameter K
              numericInput("k", "Parameter K in chisquared" , value = 1)
            )
          )
        ),
        # Main panel for Random Variable which shows the output
        mainPanel(
          # Tabs in the main panel
          tabsetPanel(type = "tabs",
                      # Plot tab which displays the graph
                      tabPanel("Plot", plotOutput("plot")),
                      # Tab which displays the summary
                      tabPanel("Summary", verbatimTextOutput("summary")),
                      # Tab which displays the table of simulated data
                      tabPanel("Table", tableOutput("table"))
          )
        )
      )
    ),

    ### >>> End >>> Mayur Vaishnav (10529721)

    ###########################################################################################################################
    ###                                                                                                                     ###
    ### >>> Begin >>> Hemlata Mhapsekar (10532113)                                                                          ###
    ###                                                                                                                     ###
    ###########################################################################################################################


    # Tab for Prediction
    tabPanel("Prediction",
      # Header for this tab
      headerPanel("Prediction next value"),
      # Sider bar which take the input
      sidebarLayout(
        sidebarPanel(
          # Select for the probabilities models
          # Default bernoulli  is selected
          selectInput("predmodel", "Select Model",
                      choices = c(
                                  "Bernoulli" = "bernoulli",
                                  "Poisson" = "poisson",
                                  "Uniform" = "uniform",
                                  "Normal" = "normal",
                                  "Exponential" = "exponential"
                                ),
                      selected = "bernoulli"
          ),

          # Dropdown to select the input type.
          # Default is File input
          selectInput("predInputType", "Select Input",
                      choices = c(
                                  "File Input" = "preFile",
                                  "Inbuild Datasets" = "preInbuild",
                                  "URL" = "preUrl",
                                  "Yahoo Finance" = "preYahoo"
                                ),
                      selected = "preFile"
          ),

          # Conditional Panel to take parameter for file input
          conditionalPanel(
            condition = "input.predInputType == 'preFile'",
            # Input: Select a file ----
            fileInput("datafile", "Choose CSV File",
                    multiple = FALSE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv"))
          ),

          # Conditional Panel to take parameter for in build dataset input
          conditionalPanel(
            condition = "input.predInputType == 'preInbuild'",
            # Drop down of all the input dataset present in R
            selectInput("preInbuildFile", "Select a Dataset",
                        choices = ls("package:datasets")
            )
          ),

          # Conditional Panel to take parameter for in URL input
          conditionalPanel(
            condition = "input.predInputType == 'preUrl'",
            # Text input to take data url from User
            textInput('preUrl', 'Input URL', value="http://users.stat.ufl.edu/~winner/data/marij1.csv")
          ),

          # Conditional Panel to take parameter for in Yahoo Finance input
          conditionalPanel(
            condition = "input.predInputType == 'preYahoo'",
            # Text input to take Ticket Number from User
            textInput('preYahoo', 'Enter Ticket No', value="CTSH")
          ),

          # Drop down to select column of selected dataset
          selectInput(inputId = "pred_columns", label = "Select a Column", choices = ""),

          # Slider to select the use of Number of simulated data for prediction
          sliderInput("s", "Number of simulated data" ,min=1, max=1000, value = 100)
        ),

        # Mail panel for this tab
        mainPanel(
          # More tabs to display more information
          tabsetPanel(type = "tabs",
                      # Tab that will shoW the data set in Data Table
                      tabPanel("Data", DT::dataTableOutput('extdata')),
                      # Tab that will show the prediction
                      tabPanel("Prediction", verbatimTextOutput("prediction"))
          )
        )
      )
    ),

    ### >>> End >>> Hemlata Mhapsekar (10532113)

    ###########################################################################################################################
    ###                                                                                                                     ###
    ### >>> Begin >>> Manmeet Kaur (10532765)                                                                               ###
    ###                                                                                                                     ###
    ###########################################################################################################################


    # Tab for Hypothesis Test
    tabPanel("Hypothesis Test",
      # Header for the tab
      headerPanel("Hypothesis testing"),
      # Sidebar for the tab
      sidebarLayout(
        sidebarPanel(
          # Dropdown for type of test
          # Default is mean test
          selectInput("hpType", "Select Type",
                      choices = c(
                                  "Test of mean of population(s)" = "meanTest",
                                  "Test of proportion of population(s)" = "proportionTest"
                                ),
                      selected = "meanTest"
          ),

          # Dropdown to select the input type.
          # Default is File input
          selectInput("hpInputType", "Select Input",
                      choices = c(
                                  "File Input" = "hpFile",
                                  "Inbuild Datasets" = "hpInbuild",
                                  "URL" = "hpUrl",
                                  "Yahoo Finance" = "hpYahoo"
                                ),
                      selected = "hpFile"
          ),

          # Conditional Panel to take parameter for file input
          conditionalPanel(
            condition = "input.hpInputType == 'hpFile'",
            # Input: Select a file ----
            fileInput("hpDatafile", "Choose CSV File",
                    multiple = FALSE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv"))
          ),

          # Conditional Panel to take parameter for in build input
          conditionalPanel(
            condition = "input.hpInputType == 'hpInbuild'",
            # Dropdown to select the listed inbuild datasets
            selectInput("hpInbuildFile", "Select a Dataset",
                        choices = ls("package:datasets")
            )
          ),

          # Conditional Panel to take parameter for in build input
          conditionalPanel(
            condition = "input.hpInputType == 'hpUrl'",
            # Text input to take url from user
            textInput('hpUrl', 'Input URL', value="http://users.stat.ufl.edu/~winner/data/marij1.csv")
          ),

          # Conditional Panel to take parameter for in Yahoo Finance input
          conditionalPanel(
            condition = "input.hpInputType == 'hpYahoo'",
            # Text input to take ticket no from user
            textInput('hpYahoo', 'Enter Ticket No', value="CTSH")
          ),

          # Dropdown to select the column from listed columns
          selectInput(inputId = "hp_columns", label = "Select a Column", choices = ""),

          # Slider to select Significance Level
          sliderInput("hpAlpha", "Significance Level" ,min=0, max=1, value = 0.05, step=0.01),

          # Dropdown to select from Alternatives
          selectInput("hpalternative", "Select Alternative",
                      choices = c(
                                  "Lower Tail" = "less",
                                  "Upper Tail" = "greater",
                                  "Two Sided" = "two.sided"
                                ),
                      selected = "less"
          ),

          # Condition for alternative is two sided
          conditionalPanel(
            condition = "input.hpalternative == 'two.sided' && input.hpType == 'meanTest'",
            # Numeric input to take mu parameter
            numericInput("hpMu", "Parameter mu in for Two sided" , value = 0),
          )
        ),

        # Main panel of the tab
        mainPanel(
          # More tabs for more info
          tabsetPanel(type = "tabs",
                      # Tab to display datatable
                      tabPanel("Data", DT::dataTableOutput('hpextdata')),
                      # Tab to display test result
                      tabPanel("Result", verbatimTextOutput("testResult"))
          )
        )
      )
    ),

    ### >>> End >>> Manmeet Kaur (10532765)

    ###########################################################################################################################
    ###                                                                                                                     ###
    ### >>> Begin >>> Chirag Wath (10532863)                                                                                ###
    ###                                                                                                                     ###
    ###########################################################################################################################


    # Tab for GLM
    tabPanel("GLM",
      # Header for the tab
      headerPanel("GLM - Linear Regression"),
      # Sidebar for the tab
      sidebarLayout(
        sidebarPanel(
          # Dropdown to select the input type.
          # Default is File input
          selectInput("glmInputType", "Select Input",
                      choices = c(
                                  "File Input" = "glmFile",
                                  "Inbuild Datasets" = "glmInbuild",
                                  "URL" = "glmUrl",
                                  "Yahoo Finance" = "glmYahoo"
                                ),
                      selected = "glmFile"
          ),

          # Conditional Panel to take parameter for file input
          conditionalPanel(
            condition = "input.glmInputType == 'glmFile'",
            # Input: Select a file ----
            fileInput("glmDatafile", "Choose CSV File",
                    multiple = FALSE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv"))
          ),

          # Conditional Panel to take parameter for in build input
          conditionalPanel(
            condition = "input.glmInputType == 'glmInbuild'",
            # Dropdown to select the listed inbuild datasets
            selectInput("glmInbuildFile", "Select a Dataset",
                        choices = ls("package:datasets")
            )
          ),

          # Conditional Panel to take parameter for in build input
          conditionalPanel(
            condition = "input.glmInputType == 'glmUrl'",
            # Text input to take url from user
            textInput('glmUrl', 'Input URL', value="http://users.stat.ufl.edu/~winner/data/marij1.csv")
          ),

          # Conditional Panel to take parameter for in Yahoo Finance input
          conditionalPanel(
            condition = "input.glmInputType == 'glmYahoo'",
            # Text input to take ticket no from user
            textInput('glmYahoo', 'Enter Ticket No', value="CTSH")
          ),

          # Dropdown to select the column from listed columns
          selectInput(inputId = "glm_target", label = "Select a Target Variable", choices = ""),

          # Dropdown to select the column for independent variable
          selectInput(inputId = "glm_independent", multiple = TRUE, label = "Select the independent variables", choices = ""),

          # Slider input to take the ratio of train set
          sliderInput('glmRatio', "Ratio for trainset", min=1, max=100, value=70),
        ),

        # Main panel of the tab
        mainPanel(
          # More tabs for more info
          tabsetPanel(type = "tabs",
                      # Tab to display datatable
                      tabPanel("Data", DT::dataTableOutput('glmextdata')),
                      # Tab to display selected colums in datatable
                      tabPanel("Selected Data", DT::dataTableOutput('glmSelectedData')),
                      # Tab to display graph of actual and predicted data
                      tabPanel("Test/Prediction", plotOutput('glmPlot')),
                      # Tab to display graph of full and reduced
                      tabPanel("RMSE", DT::dataTableOutput("glmRMSE")),
                      # Tab to display the prediction,
                      tabPanel("Prediction", DT::dataTableOutput('glmPrediction'))
          )
        )
      )
    ),

    ### >>> End >>> Chirag Wath (10532863)

    ###########################################################################################################################
    ###                                                                                                                     ###
    ### >>> Begin >>> Mayur Vaishnav (10529721)                                                                             ###
    ###                                                                                                                     ###
    ###########################################################################################################################


    # Tab for About us
    tabPanel("About Us",
      # Header for this tab
      headerPanel("About Us"),

      # Fulid row to set 4 cards in display
      fluidRow(
        # First column for Mayur Vaishnav
        column(3,
          wellPanel(
            h3("Mayur Vaishnav"),
            img(src='mayur_photo.jpg', align = "middle", height = 150, width = 150, style="display: block; margin-left: auto; margin-right: auto; margin-top:50px; margin-bottom:50px;"),
            HTML('<p>Hi, I am a techie. I have wide range of knowledge in software development, and analytics. I have worked on Python Java, PHP, JS, R, SQL, and so on. I also like to design and develop web application on different platform. I have worked on some frameworks such as Laravel, ExpressJs, Django, and shiny. I like exploring new things.</p>
              '),
            hr(),
            a("GitHub", class = "btn btn-primary btn-md", href = "https://github.com/mayurvaishnav"),
            a("Linked In", class = "btn btn-warning btn-md", href = "https://www.linkedin.com/in/mayur-vaishnav/")
          )),

        # Column for Hemlata
        column(3,
          wellPanel(
            h3("Hemlata Mhapsekar"),
            img(src='hemlata_photo.jpg', align = "middle", height = 150, width = 150, style="display: block; margin-left: auto; margin-right: auto; margin-top:50px; margin-bottom:50px;"),
            HTML('<p>I am a versatile and self motivated person with excellent programming skills.I have extensive knowledge in various programming languages such as C, C++, Core Java, SQL/PLSQL programming. During my leisure time I love watching movies,hanging out with friends.</p>
              '),
            hr(),
            a("Linked In", class = "btn btn-warning btn-md", href = "https://www.linkedin.com/in/hemlata-mhapsekar-034298184/")
          )),
        
        # Column for Manmeet
        column(3,
          wellPanel(
            h3("Manmeet Kaur Sahota"),
            img(src='manmeet_photo.jpeg', align = "middle", height = 150, width = 150, style="display: block; margin-left: auto; margin-right: auto; margin-top:50px; margin-bottom:50px;"),
            HTML('<p>A highly motivated and hardworking individual, currently pursuing my Master degree from Dublin Business School in Data Analytics. My professional experience has helped me grow as an inquisitive learner and an organized as well as happy-to-go person. I have experience in implementing end-to-end CRM solutions as well as working on BI Reports.</p>'),
            hr(),
            a("Linked In", class = "btn btn-warning btn-md", href = "https://www.linkedin.com/in/manmeet-kaur-sahota-0a54487a/")
          )),
        
        # Column for Chirag
        column(3,
          wellPanel(
            h3("Chirag Wath"),
            img(src='chirag_photo.jpg', align = "middle", height = 150, width = 150, style="display: block; margin-left: auto; margin-right: auto; margin-top:50px; margin-bottom:50px;"),
            HTML('<p>I am young techie who loves learning new technology. I have worked as a Dba in Tcs for 2.5 years and well verse with technologies like Sql, Plsql, Java. I am learning R and this Shiny app is the start of the R journey. I love watching movies, playing games, explore new places and spend good family time in my personal life.</p>'),
            hr(),
            a("Linked In", class = "btn btn-warning btn-md", href = "https://www.linkedin.com/in/chirag-wath-895a96a4/")
          )
        )
      )
    )
  )

    ### >>> End >>> Mayur Vaishnav (10529721)                                                                             ###

# ))
