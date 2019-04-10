##  Pulling Education Data Locally  ##
##                                  ##
######################################

# pulling the directory data in order to get the list of school ids to process later. 

# devtools::install_github('UrbanInstitute/education-data-package-r')

# trying to visualize change over time of King county School Demographics
library(educationdata)
library(tidyverse)
library(tictoc)


# Directory Data ----------------------------------------------------------
# Pulling all school directory data and then will wittle down
tic()
directory_all <- get_education_data(level = 'schools', 
                                    source = 'ccd', 
                                    topic = 'directory', 
                                    filters = list(year = 2008:2014),
                                    add_labels = TRUE)
toc_directory_14 <- toc()
# took 34 minutes on conference wifi

## OOPS - meant to do 2004 to 2014. 
directory_all2 <- get_education_data(level = 'schools', 
                                     source = 'ccd', 
                                     topic = 'directory', 
                                     filters = list(year = 2004:2007),
                                     add_labels = TRUE)


directory_wa <- directory_all %>% 
  bind_rows(directory_all2) %>% 
  filter(fips == "Washington") 


directory_kc <- directory_wa %>% 
  filter(county_code == "53033")




# Saving Files ------------------------------------------------------------

write_csv(directory_wa, "./output/directory_wa.csv") 
write_csv(directory_kc, "./output/directory_kc.csv") 
