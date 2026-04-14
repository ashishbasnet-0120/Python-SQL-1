
-- sorting data 

-- find  top 5 samsung phones with biggest screen size

select *
from studentdb.smartphones
where brand_name="samsung"
order by screen_size desc
limit 5;

-- sort all phones in descending order of total no of cameras

select brand_name, (num_rear_cameras+num_front_cameras) as total_camera
from smartphones
order by total_camera desc;



# sort data based on ppi descending order 
select model, 
 SQRT(resolution_width*resolution_width+ resolution_height*resolution_height)/screen_size as "PPI"
 from smartphones
 order by PPI desc;
 
 
 -- find the phone with 2nd largest battery 
 select model, battery_capacity
 from smartphones
 order by battery_capacity
 limit 1,1;
 
 -- second lowest battery_capacity
 select model,battery_capacity
 from smartphones
 order by battery_capacity asc
 limit 1,1;
 
 -- name and  rating of worst rated apple phone 
 
 select brand_name,model,rating
 from smartphones
 where brand_name="apple"
 order by rating asc
 limit 0,1;
 
 
 -- sort phones alphabetically and on the basis of rating desc
 
 select brand_name,rating
 from smartphones
 order by brand_name asc, rating desc;
 
 
 -- sort phones alphabetically and then on the basis of price asc order
 select brand_name, model, price
 from smartphones
 order by brand_name asc, price  asc;
 
 
 -- grouping
 -- group smartphones by brand and get the count ,avg price, max rating,avg screen size and  battery capacity
 select brand_name,count(*) as "amount",
 avg(price),max(rating),avg(battery_capacity),round(avg(screen_size))
 from smartphones
 group by brand_name
 order by  amount desc;


-- group smartphones whther they have NFC and get the avg price and rating
select has_nfc,count(*), avg(price),avg(rating)
from smartphones
group by has_nfc;


-- group smartphones by extended mempry available and get the avg price 
select extended_memory_available, avg(price)
from smartphones
group by extended_memory_available;


-- group phones by brand and processor_brand and count the models and avg primary resolution camera rear
select brand_name,processor_brand,count(*),avg(primary_camera_rear)
from smartphones
group by brand_name,processor_brand
order by brand_name asc;


-- top most 5 costliest phone brand
select brand_name, avg(price) as "cost"
from smartphones 
group by brand_name
order by cost desc
limit 0,5;
/*Rule you must remember

After GROUP BY, every column in SELECT must be:

Grouped column
✔️ brand_name
OR aggregated column
✔️ MAX(price), MIN(price), AVG(price)*/


-- which brand makes smallest screeen size smartphones 
select brand_name, avg(screen_size) as "average_screen"
from smartphones
group by brand_name
order by average_screen asc
limit 1;

-- avg price of 5g phones and non 5g phones 
select has_5g,avg(price)
from smartphones
group by has_5g;


-- group smartphones by brand and find highest no of models that have both nfc and if booster 

select brand_name ,count(*) as "numbers"
from smartphones
where has_ir_blaster="True" and has_ir_blaster="True"
group by brand_name 
order by numbers desc
limit 1;


-- find all samsung 5g enable smartphones and avg price of nfc and non nfc
select has_nfc,avg(price)
from smartphones
where brand_name ="samsung"
group by has_nfc;


-- brand_name with costliest price

select brand_name,max(price)
from smartphones
group by brand_name
order by brand_name asc ;

-- having clause 
-- avg rating of smartphones brands which have more than 20 phones 

select brand_name,count(*) as "count",avg(rating)
from smartphones
group by brand_name	
having count>20
order by count desc;

-- find top 3 brands with highest avg ram that have refresh rate at least 90 hz and fast charging available dont consider brands with less than 10 phones 
select brand_name,count(*) as "count", avg(ram_capacity) as "capacity"
from smartphones
where refresh_rate >=90 and fast_charging_available=1
group by brand_name
having count>=10
order by capacity desc
limit 0,3;


-- find avg price of all phone brands with avg rating >70 and  no of phones more than 10 among all 5g enabled phones 
select brand_name,count(*) as "count" ,avg(price), avg(rating) as "avg_rating"
from smartphones
where has_5g="True"
group by brand_name
having count>10 and avg_rating>70;

