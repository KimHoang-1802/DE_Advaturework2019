
    
    



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


