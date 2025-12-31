
    
    

select
    SalesOrderID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."FACT_Sales"
where SalesOrderID is not null
group by SalesOrderID
having count(*) > 1


