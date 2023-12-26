# Base R image
FROM rocker/r-ver:4.3
RUN apt-get update
# Make a directory in the container
RUN mkdir /home/r-environment
# Install RPostgreSQL
RUN apt-get -y install libpq-dev
# Install DBI
RUN R -e "install.packages(c('DBI','RPostgreSQL'), dependencies=TRUE)"
RUN R -e "install.packages('yaml', dependencies=TRUE)"
# Copy our R script to the container
COPY app.r /home/r-environment/app.r
COPY config.yml /home/r-environment/config.yml
# Run the R script
CMD ["Rscript", "/home/r-environment/app.r"]