
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_60b4c89ca2fdf04b1580235224ec4191_4373]
   as 
    
    
    

with  __dbt__cte__int_sales_cleaned as (


SELECT
    SaleOrderID,
    ProductID,
    OrderQuantity,
    UnitPrice,
    LineTotal,
    OrderDate,
    ShipDate,
    CASE Status
        WHEN 1 THEN ''In Process''
        WHEN 2 THEN ''Approved''
        WHEN 3 THEN ''Backordered''
        WHEN 4 THEN ''Rejected''
        WHEN 5 THEN ''Shipped''
        WHEN 6 THEN ''Cancelled''
        ELSE ''In Process''
    END AS Status,  -- Converted to text
    CustomerID,
    SalePersonID,
    TerritoryID,
    StoreID,
    TotalDue
FROM "AdventureWorks2019"."stagging_stagging"."stg_fact_sales"
), all_values as (

    select
        Status as value_field,
        count(*) as n_records

    from __dbt__cte__int_sales_cleaned
    group by Status

)

select *
from all_values
where value_field not in (
    ''In Process'',''Approved'',''Backordered'',''Rejected'',''Shipped'',''Cancelled''
)



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_60b4c89ca2fdf04b1580235224ec4191_4373]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_60b4c89ca2fdf04b1580235224ec4191_4373]
  ;')