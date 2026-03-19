
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_2571f82f05f0b69d9b4cae3a934b11ee_7603]
   as 
    
    
    

select
    SubCategoryProductID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_SubCategory_Product"
where SubCategoryProductID is not null
group by SubCategoryProductID
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
    [stagging].[testview_2571f82f05f0b69d9b4cae3a934b11ee_7603]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_2571f82f05f0b69d9b4cae3a934b11ee_7603]
  ;')