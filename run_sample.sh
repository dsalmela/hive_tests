
hadoop fs -mkdir testdb
hadoop fs -put users.csv testdb/

hive -e "

create database if not exists testdb;
use testdb;

drop table if exists user;

create external table if not exists user (
  user_id int, 
  email string, 
  fname string, 
  latitude double, 
  longitude double, 
  full_name string, 
  gender string, 
  birthdate string, 
  country_of_origin string, 
  billing_postal_code string, 
  phone_number string, 
  datestamp string, 
  hour string  
  )
 row format delimited fields terminated by ',' stored as textfile
;


load data inpath '/user/cloudera/testdb/users.csv' overwrite into TABLE user;
"

