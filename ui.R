
shinyUI(navbarPage("Nis-EDA", id = "nav", inverse = TRUE,
                   
                   # New tab with file input and table display -----
                   tabPanel("Nis File ",
                            sidebarLayout(
                              sidebarPanel(
                                NisOutputUI('input'),
                                ChoosedfUI(id = 'bars'),
                                p('By activating this option, if there are inputs and outputs of the same type of interface 
                                for the same processor, the bar graph in thest three tabs will show the balance of these by processor. 
                                If not, the inputs will be seen as positive and the outputs as negative.
                                Note that the other tabs will use the balance (outputs - inputs) of each type of interface by processor')
                              ),
                              mainPanel(
                                tabsetPanel(
                                  tabPanel("Flow graph Solution",DT::dataTableOutput("FGS")),
                                  tabPanel("Issues",DT::dataTableOutput("issues"))
                                )
                              )
                            )
                    )
                   #end of Tab
                   
                

                   ,tabPanel("Level Exploration ",
                             sidebarLayout(
                               sidebarPanel(
                                 barPlotChoicesUI(id = 'Scope'),
                                 br(),
                                 p("In this window, the user must choose System, Period, level and the set of interface
                                 types with the same unit to be compared.
                                 The bar chart shows stacked interfaces types values by scope displaying in transparent
                                 colour the quantity externalized.")
                               ),
                               mainPanel(
                                 barPlotUI(id = 'Scope',stringName = 'barPlot')
                               )
                             )
                   )
                   #New tab  -----
                   ,tabPanel("Processors Exploration",
                             sidebarLayout(
                               sidebarPanel(
                                 barPlotChoicesMultiProcessors(id = 'processor'),
                                 br(),
                                 p("For a more customized study, This tab allows the user to freely
                                   choose which processors to study with a multi select input of interfaces and processors.")
                               ),
                               mainPanel(
                                 barPlotUI(id = 'processor',stringName = 'barPlot')
                               )
                             )
                   )#end of Tab
                   ,tabPanel("System Study",
                             sidebarLayout(
                               sidebarPanel(
                                 barPlotChoicesUI(id = 'System'),
                                 br(),
                                 p("This tab allows to compare between different systems and study
                                   the externalization of the interface type chosen. The user has the
                                   possibility to choose the scenario, period and Interface to Study.")
                               ),
                               mainPanel(
                                 barPlotUI(id = 'System',stringName = 'barPlot')
                               )
                             )
                   )
                   
                   
            
                   
                   # New tab  ----
                   ,tabPanel("Hierarchy Viewer",
                             sidebarLayout(
                               sidebarPanel(
                                 p("This view of the results allows the user to relate quantities to processors
                                   according to hierarchy for a scenario, period and scope. The visualization provides an
                                   interactive display of the results by hovering over the processors"),
                                 
                                 
                                 ChoicesTreeUI(id = 'tree')
                                 
                               ),
                               mainPanel(
                                 treeUI(id = 'tree', StringName = 'TreeInterface' )
                               )
                             )
                   ) #end tab
                   
                   # New tab  ----
                   ,tabPanel("EUM/EPM Matrix",
                             sidebarLayout(
                               sidebarPanel(
                                 p("by choosing The interface types (flow types) to show,the fund interface type   and tying population a End use matrix or Enviroment Pressure Matrix will be show as an excel table"),
                                 numericInput("Population", "Population", 100000),
                                 EUMChoicesUI(id = 'EUM'),
                                 p("by choosing the indicaror and level the user will be able to compare the same indicator in that level. Only indicators shoosen in EUM tab will be able to choose. The use can aswell customize zones in the gauge plot ")

                               ),

                               mainPanel(

                                 excelOutput("eum") #excel format

                               )
                             )
                   ) #end


                   # New tab  -----

         
                   ,tabPanel("Indicator Bar Chart",
                             sidebarLayout(
                               sidebarPanel(
                                 p("After creating the indicators the following screen allows a study of these
                                   by level and period visualizing the scope by means of a stacked bar chart."),
                                 EUMPlotChoicesUI(id = 'EUMplot')
                               ),

                               mainPanel(
                                 barPlotUI(id = 'EUMplot',stringName = 'barPlot')
                               )
                             )
                   ) #end
                   
                
                   # New tab  -----
                   
                   ,tabPanel("Benchmarks Creation",
                             sidebarLayout(
                               sidebarPanel(

                                GaugeInputsUI('gauge'),

                                 downloadButton("dl", "Download Commands"),

                                 # actionButton("addCommands", "Ad Commands to Model"), #it works but have no functionalities
                                  
             


                               ),
                               mainPanel(
                                 barPlotUI(id = 'gauge' , stringName = 'gaugePlot')
                               )
                          )
                   )#end

                                      
  )
)#END