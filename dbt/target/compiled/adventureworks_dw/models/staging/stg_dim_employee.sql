

SELECT
    EmployeeId,
    TRIM(FullName) AS FullName,
    TRIM(JobTitle) AS JobTitle,
    BirthDate,
    TRIM(MaritalStatus) AS MaritalStatus,
    TRIM(Gender) AS Gender,
    HireDate,
    TRIM(EmployeeType) AS EmployeeType,
    StoreID  -- Keep NULL here, will be cleaned in intermediate
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Employee"
WHERE EmployeeId IS NOT NULL