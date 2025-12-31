
    
    

select
    ProductID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Product"
where ProductID is not null
group by ProductID
having count(*) > 1


