#' 检测记录生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' TestRecordUI()
TestRecordUI <- function(tabTitle ='检测记录',
                       colTitles =c('操作区域','操作区域','显示区域'),
                       widthRates =c(6,6,12),
                       func_left = TestRecordUI_left,
                       func_right =TestRecordUI_right,
                       func_bottom = TestRecordUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' TestRecordUI_left()
TestRecordUI_left <- function() {


  res <- tagList(
    tsui::uiTemplate(templateName = '检测记录模板'),

    tsui::mdl_file(id ='text_flie_TestRecord' ,label ='上传检测记录' ),
    shiny::actionButton(inputId = 'btn_TestRecord_Up',label = '上传检测记录'),

    shiny::actionButton(inputId = 'btn_TestRecord_select',label = '查询'),

    tsui::mdl_download_button(id = 'dl_TestRecord',label = '下载检测记录至EXCEL')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' TestRecordUI_bottom()
TestRecordUI_right <- function() {
  res <- tagList(


    shinyWidgets::actionBttn(inputId = 'btn_coa_gen',label = '生成COA报告'),
    shinyWidgets::actionBttn(inputId = 'btn_RPAtask_select',label = '查询RPA任务')




  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' TestRecordUI_bottom()
TestRecordUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'TestRecord_resultView',label ='结果显示' ))

  )
  return(res)

}
