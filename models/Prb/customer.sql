{{
  config(
    materialized = "table",
    schema="TEAMA"
  )
}}
select * from {{ source("my_project", 'customer') }}