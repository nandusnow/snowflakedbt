{{
  config(
    materialized = "table",
    schema="target_db"
  )
}}
 select  count(*) as order_count,
 c_custkey,
 c_name,
 c_address,
 c_phone 
  from 
  {{source("my_project",'customer')}}
 group by
c_custkey,
 c_name,
 c_address,
 c_phone having count(*)>1