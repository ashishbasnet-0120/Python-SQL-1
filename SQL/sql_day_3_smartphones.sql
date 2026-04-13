SELECT * FROM studentdb.smartphones;


# selecting the required columns  order does not matter 
select model,price,rating
 from smartphones;



 select brand_name,internal_memory,battery_capacity from studentdb.smartphones;
 
 
 
 # renaming the colon or alias
 
 select brand_name as 'battery',
 battery_capacity as 'MAH' 
 from smartphones;
 
 
 
 
 
 
 
 
 
 #calculating PPI mathematical expression can be done 
 select model, 
 SQRT(resolution_width*resolution_width+ resolution_height*resolution_height)/screen_size as "PPI"
 from smartphones;
 
 
 
 select model,
 price/150 as "$"
 from studentdb.smartphones;
 
 
 
 # creating a new column with constant value 
 select model,
 "future_feature" as "new data"
 from smartphones;
 
 
 
 # use of distinct  
 # helps to extract unique value 
 
 select distinct brand_name as "All brands"
 from smartphones;
 
 select  distinct processor_brand as "ALL PROCESSOR"
 from studentdb.smartphones;
 
 
 # unique combination
 select distinct brand_name,processor_brand
 from smartphones;
 
 
 # filering rows with where clause 
 
 # find smartphones of samsung
 
 select *
 from studentdb.smartphones
 where brand_name = "samsung";
 
 # find smartphones with price greater than 50000
 select *
 from smartphones
 where price > 50000;
 
 
 -- comments in  mysql
 /*  distinct(processor_brand) as "ALL PROCESSOR" */
 
 -- smartphones between the range of 10000 and 50000
 
 select * 
 from smartphones
 where price >= 10000 and price <=50000;
 
 
 #using betweeen
 select *
 from smartphones 
 where price between 10000 and 20000;
 
 
 
 # find phones with rating 80 and price <25000
 
 select *
 from studentdb.smartphones
 where rating >80 and price <25000;


# samsung phone with ram 8gb
select *
from smartphones
where brand_name="samsung" and ram_capacity=8;


# samsung phone with snapdragon processor 

select *
from studentdb.smartphones
where brand_name="samsung" and processor_brand="snapdragon";


# find brands who sell phones with price greater than 50000
select distinct brand_name 
from smartphones
where price >50000;


# use of in function
-- use insted of or operator
--  basically at extracts the values/ colmn present in the table 


select * 
from smartphones
where brand_name in ("oneplus","samsung","apple");


# similarly not in function 

select *
from smartphones
where brand_name  not in ("apple","samsung","oneplus");


#update query 
update studentdb.smartphones
set os="apple_os"
where os="ios";


update smartphones
set price=15000, processor_brand="low"
where price<20000;

-- delete the phone whose price is greater than 200000
delete 
from studentdb.smartphones
where price >200000;

select *
from smartphones
where price >200000;

# deleting phone whose battery capacity is greater than 70000
select * 
from smartphones
where battery_capacity >70000;

select *
from studentdb.smartphones
where primary_camera_rear >130;


delete from studentdb.smartphones
where primary_camera_rear> 100 and processor_brand="snapdragon";



# aggregrate functions 
-- max /min

select max(price) as "hihest price"
from smartphones;


select min(price) as "lowest price"
from smartphones;

#find the costiest samsung phone 

select max(price)
from smartphones
where brand_name="samsung";

# average rating of apple phones 

select avg(rating)
from smartphones
where brand_name='apple';

# sum
select sum(price)
from smartphones;


# count()
-- find the no of oneplus phones 
select count(*)
from smartphones
where brand_name="oneplus";


# find the no of unique brands 

select count(distinct brand_name)
from smartphones;

# std   standard deviation 
select std(internal_memory)
from smartphones;


# variance ()

select variance(price)
from smartphones
where brand_name= "apple";


select abs(price-100000)
from smartphones; 



#round()
select model, 
 round(SQRT(resolution_width*resolution_width+ resolution_height*resolution_height)/screen_size) as "PPI"
 from smartphones;
 
 select floor(processor_speed )
 from smartphones;
 
  select ceil(processor_speed )
 from smartphones;


select avg(battery_capacity),
avg(primary_camera_rear)
from smartphones
where price>=100000;



select avg(internal_memory)
from smartphones
where refresh_rate>=120 and primary_camera_front>=20;


select count(*)
from smartphones
where has_5g="True";