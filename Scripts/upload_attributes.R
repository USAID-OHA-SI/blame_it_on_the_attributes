# PROJECT:  blame_it_on_the_attributes
# PURPOSE:  upload local attributes data to PEPFAR s3 working folder
# AUTHOR:   A.Chafetz | USAID
# REF ID:   9f3927be 
# LICENSE:  MIT
# DATE:     2024-09-27
# UPDATED: 
# NOTE:     data received via DATIM Help Desk (due to Okta API issues)

# DEPENDENCIES ------------------------------------------------------------
  
  #general
  library(tidyverse)
  #oha
  library(gagglr) ##install.packages('gagglr', repos = c('https://usaid-oha-si.r-universe.dev', 'https://cloud.r-project.org'))
  library(grabr)
  

# GLOBAL VARIABLES --------------------------------------------------------
  
  path_attr <-  si_path("path_downloads") %>% return_latest("all_facilities_coordinates_and_attributes")
  
  load_secrets()
  
  
# UPLOAD ------------------------------------------------------------------

  s3_upload(path_attr,
            bucket = pdap_bucket("write"),
            prefix = "usaid/",
            access_key = pdap_access(),
            secret_key = pdap_secret())
  