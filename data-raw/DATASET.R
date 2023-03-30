## code to prepare `DATASET` dataset goes here

my_data <- read.csv("data-raw/nyc_squirrels_act_sample.csv", header=TRUE)
data_df <- head(my_data, 15)

usethis::use_data(data_df, overwrite = TRUE)

