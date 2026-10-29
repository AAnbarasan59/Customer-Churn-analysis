Create database churn_analysis;
Use churn_analysis;
select * from `telco-churn-cleaned` limit 10;
rename table `telco-churn-cleaned` to customers;
select count(*) from customers;
select count(churn) from customers;

select count(*) from customers where trim(totalcharges)='';

select customerid,count(*) as count 
from customers 
group by customerid 
having count(*)>1;

select contract, count(*) as churn_count
from customers
where churn='yes'
group by contract
order by churn_count desc;


select contract, count(*) as churn_count
from customers
where churn='yes'
group by contract
order by churn_count asc;

select contract, count(*) as churn_count
from customers
where churn='no'
group by contract
order by churn_count desc;

select
     (select count(*) from customers where churn='yes' and contract='Month-to-month')
     /
     (select count(*) from customers where churn='yes')
     *100 as precent_Month_To_Month;
     
select 
     (select count(*) from customers where internetservice='fiber optic' and churn='yes')
	 /
     (select count(*) from customers where churn='yes')
     *100 as percent;
   
	
select avg(monthlycharges) as AVg_monthly_charges
from customers
where churn='yes';	

select internetservice,count(*) as customers_left
from customers
where churn='yes'
group by internetservice
order by customers_left desc;

select internetservice,count(*) as customers_left
from customers
where churn='no'
group by internetservice;

select count(internetservice) as NO_netservice
from customers
where internetservice ='no';

select internetservice,count(*) as customers_left,
count(*) *100
/(select count(*) from customers where churn='yes' )AS percent_of_churn 
from customers
where churn='yes' 
group by internetservice;	

	select customerid,tenure,totalcharges
	from customers
	order by tenure desc limit 10;

select* from customers;