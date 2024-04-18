{{
  config(
    materialized = "table",
    schema="TEAMA"
  )
}}
select 
count(*) as order_count,
Customerid,
FirstName,	
LastName, 
Company 
from 
{{source("my_project",'customer')}}
group by Customerid,
FirstName,	
LastName, 
Company  having count(*)>1