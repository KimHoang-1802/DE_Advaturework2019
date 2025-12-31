
    
    

select
    CategoryProductID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Category_Product"
where CategoryProductID is not null
group by CategoryProductID
having count(*) > 1


