-- XỬ LÝ: StoreID NULL → 0, Thêm cột Age (tuổi)
-- ============================================================================
{{ config(materialized='ephemeral', tags=['intermediate']) }}

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
FROM {{ ref('stg_dim_employee') }}