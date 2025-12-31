
    
    

select
    CustomerID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Customer"
where CustomerID is not null
group by CustomerID
having count(*) > 1


