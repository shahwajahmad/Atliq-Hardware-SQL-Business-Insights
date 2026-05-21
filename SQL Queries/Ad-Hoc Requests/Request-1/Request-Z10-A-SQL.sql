#Get the Top 3 products in each division that have a high
#total_sold_quantity in the fiscal_year 2021? The final output contains these fields,

with cte as (select 
				   p.division as division,
				   s.product_code as product_code,
				   p.product as product,
				   sum(sold_quantity) as qty,
				   dense_rank() over(partition by p.division order by sum(s.sold_quantity) desc) as rnk_order
			from fact_sales_monthly s
			join dim_product p
			using (product_code)
            where s.fiscal_year = 2021
			group by p.division ,  p.product
            )
            select 
                   *
			from cte 
            where rnk_order <= 3
                   
