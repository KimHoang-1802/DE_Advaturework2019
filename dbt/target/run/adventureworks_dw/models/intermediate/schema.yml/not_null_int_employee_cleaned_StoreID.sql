
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_f8b610f653b0d89360017926cfd3175d_3459]
   as 
    
    
    



with __dbt__cte__int_employee_cleaned as (
-- XỬ LÝ: StoreID NULL → 0, Thêm cột Age (tuổi)
-- ============================================================================


SELECT
    EmployeeId,
    FullName,
    JobTitle,
    BirthDate,
    MaritalStatus,
    Gender,
    HireDate,
    EmployeeType,
    COALESCE(StoreID, 0) AS StoreID  -- NULL → 0
FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_employee"
) select StoreID
from __dbt__cte__int_employee_cleaned
where StoreID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_f8b610f653b0d89360017926cfd3175d_3459]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_f8b610f653b0d89360017926cfd3175d_3459]
  ;')