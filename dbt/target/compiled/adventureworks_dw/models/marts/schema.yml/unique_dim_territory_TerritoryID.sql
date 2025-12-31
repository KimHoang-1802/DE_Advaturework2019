
    
    

select
    TerritoryID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Territory"
where TerritoryID is not null
group by TerritoryID
having count(*) > 1


