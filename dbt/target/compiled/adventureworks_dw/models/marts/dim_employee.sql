

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
FROM __dbt__cte__int_employee_cleaned