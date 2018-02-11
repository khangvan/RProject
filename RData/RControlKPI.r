#import 
#install.package("RODBC")
library(dplyr)

library(RODBC)
cnacs <- odbcDriverConnect('driver={SQL Server};server=vnmacsdb;database=ACS EE;trusted_connection=true')
res <- sqlQuery(cnacs, 'select * from information_schema.tables')
View(res)
Sys.sleep(2)
#CHECK BY PING
#install.package("pingr")
library(pingr)
ping_port("vnmacsdb",count=1)
ping_port("vnmacsrpt2",count=1)
ping_port("vnmsrv859",count=1)
ping_port("10.84.10.67",count=1)
ping_port("q",count=1)

#WHO IS ACTIVE ACS
library(dplyr)
cnacs <- odbcDriverConnect('driver={SQL Server};server=vnmacsdb;database=ACS EE;trusted_connection=true')
qr_checkblock ="sp_whoisactive"
rs_check=sqlQuery(cnacs, qr_checkblock)
head(rs_check)
#View(rs_check)
rs_blocking <-filter(rs_check,rs_check$blocking_session_id!=0)
glimpse(rs_blocking)
View(rs_blocking)


#WHO IS ACTIVE VNMSRV601
cn601 <- odbcDriverConnect('driver={SQL Server};server=10.84.10.67\\SIPLACE_2008R2EX;database=FFCPACKING;trusted_connection=true')
qr_checkblock ="sp_whoisactive"
rs_check=sqlQuery(cn601, qr_checkblock)
head(rs_check)
#View(rs_check)
rs_blocking <-filter(rs_check,rs_check$blocking_session_id!=0)
rs_blocking


#check testlog
tl = sqlQuery(cnacs
               , "select top 1000 * from testlog"
               )
View(tl)