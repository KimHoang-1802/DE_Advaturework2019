{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_Employee',
        tags=['marts', 'dimension']
    )
}}

SELECT
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
FROM {{ ref('int_employee_cleaned') }}
