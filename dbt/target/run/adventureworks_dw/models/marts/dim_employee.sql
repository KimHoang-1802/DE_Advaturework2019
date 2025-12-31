
  
    USE [AdventureWorks2019];
    USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_dw"."DIM_Employee__dbt_tmp__dbt_tmp_vw" as 

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
) SELECT
    EmployeeId AS EmployeeID,
    FullName,
    JobTitle,
    BirthDate,
    MaritalStatus,
    Gender,
    HireDate,
    EmployeeType,
    StoreID,  -- Already cleaned to 0 if NULL
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_employee_cleaned;
    ')

EXEC('
            SELECT * INTO "AdventureWorks2019"."stagging_dw"."DIM_Employee__dbt_tmp" FROM "AdventureWorks2019"."stagging_dw"."DIM_Employee__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stagging_dw.DIM_Employee__dbt_tmp__dbt_tmp_vw')



    
    use [AdventureWorks2019];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stagging_dw_DIM_Employee__dbt_tmp_cci'
        AND object_id=object_id('stagging_dw_DIM_Employee__dbt_tmp')
    )
    DROP index "stagging_dw"."DIM_Employee__dbt_tmp".stagging_dw_DIM_Employee__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stagging_dw_DIM_Employee__dbt_tmp_cci
    ON "stagging_dw"."DIM_Employee__dbt_tmp"

   


  