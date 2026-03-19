
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_dcde68baf1c5d88ec4012ca13cb79c8f_13351]
   as 
    
    
    

select
    EmployeeID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Employee"
where EmployeeID is not null
group by EmployeeID
having count(*) > 1



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_dcde68baf1c5d88ec4012ca13cb79c8f_13351]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_dcde68baf1c5d88ec4012ca13cb79c8f_13351]
  ;')