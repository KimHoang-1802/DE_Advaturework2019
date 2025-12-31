
    
    

select
    SubCategoryProductID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_SubCategory_Product"
where SubCategoryProductID is not null
group by SubCategoryProductID
having count(*) > 1


