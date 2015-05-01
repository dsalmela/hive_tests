TABLES="user
"

for t in $TABLES
do

   columns=$(hive -S -e "use testdb;show columns in $t"| tr -d ' '|paste -sd,|sed -r 's/(latitude|longitude)/0.0 AS &/g')  
    echo --------------------------------$t---------------------------------
    echo "use testdb;INSERT OVERWRITE TABLE $t"
    echo "SELECT $columns"
    echo "FROM $t ;"
done
