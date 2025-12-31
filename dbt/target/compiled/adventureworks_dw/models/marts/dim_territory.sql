

with __dbt__cte__int_territory_cleaned as (


SELECT * FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_territory"
) SELECT
    TerritoryID,
    TerritoryName,
    CountryRegionCode,
    GroupName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_territory_cleaned