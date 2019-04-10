########################
##                    ##
##  Pulling Data EC2  ##
##                    ##
########################

# Because there is no easy way to currenlty grab school-level CCD enrollment data 
# via educationdata, you need to do it via lapply - which is pretty slow - especially locally
# so i spun up a xlarge ec2 instance of RStudio to run the code in parallel.
# still slow (1hr per year of data) but faster than on the local machine and it means i don't
# need to have my local machine on when running it.

# Below is the code and some resources used to figure this out.
# http://www.louisaslett.com/RStudio_AMI/
# https://blog.sicara.com/speedup-r-rstudio-parallel-cloud-performance-aws-96d25c1b13e2
# https://stackoverflow.com/questions/33135060/read-csv-file-hosted-on-google-drive