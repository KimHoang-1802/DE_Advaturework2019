-- XỬ LÝ: NULL → 0 cho các thuộc tính
-- ============================================================================


select
    p.ProductID,
    p.ProductName,
    p.ProductNumber,
    isnull(p.Color, '0') as Color,
    isnull(p.Size, '0') as Size,
    isnull(p.Style, '0') as Style,
    isnull(p.SubCatProductID, 0) as SubCatProductID,
    isnull(p.MakeFlag, 0) as MakeFlag
from "AdventureWorks2019"."stagging_stagging"."stg_dim_product" p
left join "AdventureWorks2019"."stagging_stagging"."stg_dim_sub_category_product" sc 
    on p.SubCatProductID = sc.SubCatProductID
left join "AdventureWorks2019"."stagging_stagging"."stg_dim_cat_product" c
    on sc.CaProductID = c.CaProductID