# WARNING - Generated by {fusen} from /dev/flat_study_squirrels.Rmd: do not edit by hand


test_that("check_squirrel_data_integrity works",
          {
            my_data <- readr::read_csv(
              file = system.file("nyc_squirrels_sample.csv",package="squirrels")
            )
            
            expect_message(check_squirrel_data_integrity(my_data),
                           regexp = "All primary colors are correct"
              
            )
            # Error: no primary_fur_color column in the dataset
            
          })



