hive -e "
create database if not exists mytest;
use mytest;

create table if not exists user (
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
;
load data inpath '/user/cloudera/mytest/users.csv' overwrite into TABLE user;
"
