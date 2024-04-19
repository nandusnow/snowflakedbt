{{
  config(
    materialized = "table",
    schema="TEAMA"
  )
}}
WITH customertotal AS (
    SELECT 
        C.CUSTOMERID,
        C.FIRSTNAME,
        C.LASTNAME,
        C.COMPANY,
        C.CITY,
        C.COUNTRY,
        C.EMAIL,
        S.ORDERID,
        S.CREATEDATE,
        S.STOREID,
        S.STATUS
    FROM  
        {{ source("my_project", 'customer') }} C 
    INNER JOIN 
        {{ source("my_project", 'orders') }} S 
    ON 
        C.CUSTOMERID = S.CUSTOMERID
)

SELECT 
 count(*) as customercount,CUSTOMERID from customertotal group by all