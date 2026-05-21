#What is the percentage of unique product increase in 2021 vs. 2020? The 

		with cte_2020 as  
		(SELECT 
			   count(distinct product_code) as unique_product_2020 
		FROM gdb023.fact_sales_monthly
		where fiscal_year = 2020) ,
		cte_2021 as 
		(select 
				count(distinct product_code) as unique_product_2021
		from fact_sales_monthly
		where fiscal_year = 2021)
	select 
           c20.unique_product_2020,
           c21.unique_product_2021,
           round((c21.unique_product_2021 - c20.unique_product_2020) * 100 / c20.unique_product_2020,2) as percentage_chg
	from cte_2020 c20
    cross join cte_2021 c21
