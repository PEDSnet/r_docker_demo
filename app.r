
library(RPostgreSQL)
library(DBI)
library(yaml)

config <- yaml.load_file("/home/r-environment/config.yml")

con<- dbConnect(RPostgreSQL::PostgreSQL(),
                dbname ='pcornet_dcc_v51',
                host = config$db$user,
                port = 5432,
                user = config$db$user,
                password = config$db$password)
dbGetQuery(con, 'SELECT * FROM information_schema.tables LIMIT 2')
dbDisconnect(con)