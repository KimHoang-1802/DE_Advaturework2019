
      

    
        
            delete from "AdventureWorks2019"."stagging_dw"."FACT_Sales"
            where (
                SalesOrderID) in (
                select (SalesOrderID)
                from "AdventureWorks2019"."stagging_dw"."FACT_Sales__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "AdventureWorks2019"."stagging_dw"."FACT_Sales" ("SalesOrderID", "ProductID", "OrderQuantity", "UnitPrice", "LineTotal", "OrderDate", "ShipDate", "Status", "CustomerID", "SalesPersonID", "TerritoryID", "StoreID", "TotalDue", "LoadDate", "UpdateDate")
    (
        select "SalesOrderID", "ProductID", "OrderQuantity", "UnitPrice", "LineTotal", "OrderDate", "ShipDate", "Status", "CustomerID", "SalesPersonID", "TerritoryID", "StoreID", "TotalDue", "LoadDate", "UpdateDate"
        from "AdventureWorks2019"."stagging_dw"."FACT_Sales__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  