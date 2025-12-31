
    
    

select
    EmployeeID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Employee"
where EmployeeID is not null
group by EmployeeID
having count(*) > 1


