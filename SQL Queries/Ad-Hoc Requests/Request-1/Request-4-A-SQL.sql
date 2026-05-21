#Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?

with cte_20 as (SELECT 
                      p.segment as segment ,
                      count(distinct f.product_code) as product_count_2020 
                FROM fact_sales_monthly f
                join dim_product p
                on f.product_code = p.product_code
				where fiscal_year = 2020
                group by p.segment),
cte_21 as (Select 
                p.segment as segment,
                count(distinct f.product_code) as product_count_2021
		 from fact_sales_monthly f
		 join dim_product p
         on p.product_code = f.product_code
         where fiscal_year = 2021
         group by p.segment)
         
		Select 
			    c20.segment as segment,
                c20.product_count_2020,
                c21.product_count_2021,
                (c21.product_count_2021 - c20.product_count_2020) as difference
		from cte_20 c20
        join cte_21 c21
        on c20.segment = c21.segment
        order by difference desc
