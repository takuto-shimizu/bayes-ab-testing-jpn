# bayes-conversion-test

library(shiny)
library(plotly)
library(shinythemes)

shinyUI(
  #tagList(shinythemes::themeSelector(), ##こちらを追加
  #theme = shinytheme("cerulean"), ##ここを追加
  
  navbarPage(
    #titlePanel('ベイジアン A/B テスト (CV版)'),
    'ベイジアン A/B テスト (CV版)',
    theme = shinytheme("sandstone"), ##ここを追加
    sidebarLayout(
      sidebarPanel(
        numericInput(
          'success_A',
          'Aの成功回数:',
          min = 0,
          max = 1e10,
          value = 200
        ),
        numericInput(
          'total_A',
          'Aの試行回数:',
          min = 0,
          max = 1e10,
          value = 1000
        ),
        numericInput(
          'success_B',
          'Bの成功回数:',
          min = 0,
          max = 1e10,
          value = 230
        ),
        numericInput(
          'total_B',
          'Bの試行回数:',
          min = 0,
          max = 1e10,
          value = 1000
        ),
        textInput(
          'name_A',
          'Aの名前:',
          value = '旧パターン'
        ),
        textInput(
          'name_B',
          'Bの名前:',
          value = '新パターン'
        ),
        actionButton(
          'button',
          '計算'
        ),
        hr(),
        tags$div(
          class='header', checked = NA,
          # tags$a(
          #   href = 'http://confluence.pixelfederation.com/pages/viewpage.action?pageId=4607020',
          #   'Click here to read how to use this calculator'
          # ),
          tags$br(),
          tags$a(
            href = 'https://github.com/takuto-shimizu/bayes-ab-testing-jpn',
            'Get the code here'
          ),
          #tags$p('support: vidogreg@gmail.com')
        )
      ),
      mainPanel(
        tableOutput('table'),
        htmlOutput('prob'),
        htmlOutput('exp_loss_A'),
        htmlOutput('exp_loss_B'),
        hr(),
        plotlyOutput('posterior_plot_B_minus_A', width = '590', height = '300px'),
        hr(),
        plotlyOutput('posterior_plot', width = '590px', height = '300px')
      )
    )
  )
)
