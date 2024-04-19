{{
  config(
    materialized = "table",
    schema="TEAMA"
  )
}}
with customertotal as(
SELECT C.CUSTOMERID
,C.FIRSTNAME,
C.LASTNAME,
C.COMPANY,
C.CITY,
C.COUNTRY,
C.EMAIL,
S.ORDERID,
S.CREATEDATE,
S.STOREID,
S.STATUS
FROM  {{source("my_project",'customer')}} C 
inner join JOIN {{source("my_project",'orders')}} S 
ON C.CUSTOMERID=S.CUSTOMERID
)
select CUSTOMERID,COUNT(*) FROM customertotal GROUP BY ALL;