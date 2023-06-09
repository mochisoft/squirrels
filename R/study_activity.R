# WARNING - Generated by {fusen} from /dev/flat_study_squirrels.Rmd: do not edit by hand

#' Study the activities of the squirrels given a primary fur color
#'
#' @param df_squirrels_act Data frame. A dataset with the activities of the squirrels. This dataset mush have at leat these 4 columns: "age", "primary_fur_color", "activity", "counts".
#' @param col_primary_fur_color Character. The color of the primary fur color of interest. Only the squirrels with this primary fur color will be considered in the analysis.
#' 
#' @importFrom dplyr filter
#' @importFrom ggplot2 ggplot aes geom_col scale_fill_manual labs
#' @importFrom magrittr %>% 
#'
#' @return A list of two named elements. The first one is the filtered table. The second one is the ggplot.
#' @export
#'
#' @examples
#' data_path <- system.file("nyc_squirrels_act_sample.csv", package="squirrels")
#' data_act_squirrels <- readr::read_csv(data_path)
#' study_activity(
#'   df_squirrels_act = data_act_squirrels,
#'   col_primary_fur_color = "Gray"
#' )
study_activity <- function(df_squirrels_act, col_primary_fur_color) {
  
  if(isFALSE(check_squirrel_data_integrity(df_squirrels_act))){
    stop("df_squirrels_act fails integrity test")
    
  }
  
  if(isFALSE(is.data.frame(df_squirrels_act))) {
    stop("df_squirrels_act is not a data frame")
  }
  
  if(isFALSE(is.character(col_primary_fur_color))) {
    stop("col_primary_fur_color is not a character vector")
  }
  
  
  table <- df_squirrels_act %>% 
    filter( col_primary_fur_color == primary_fur_color)
  
  graph <- table %>% 
    ggplot() +
    aes(x = activity, y = counts, fill = age) +
    geom_col() +
    labs(x = "Type of activity",
         y = "Number of observations",
         title = glue("Type of activity by age for {tolower(col_primary_fur_color)} squirrels")) +
    scale_fill_manual(name = "Age",
                      values = c("#00688B", "#00BFFF"))
  
  return(list(table = table, graph = graph))
}
