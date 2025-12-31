
    
    

select
    StoreID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Store"
where StoreID is not null
group by StoreID
having count(*) > 1


