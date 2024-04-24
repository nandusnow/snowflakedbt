{{
  config(
    materialized = "table",
    schema="TEAMB",
    cluster_by=['customerid']
  )
}}
select * from {{ source("my_project", 'customer') }}