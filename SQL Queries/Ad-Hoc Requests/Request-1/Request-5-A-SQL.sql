# Get the products that have the highest and lowest manufacturing costs
with cte as (select 
				   m.product_code,
				   p.product,
				   m.manufacturing_cost,
				   rank() over (order by m.manufacturing_cost desc) as high_rank,
				   rank() over (order by m.manufacturing_cost asc) as low_rank
			from fact_manufacturing_cost m
			join dim_product p
			using (product_code)
			)

            select
                   product_code,
                   product,
                   manufacturing_cost
             from cte      
where high_rank = 1 or low_rank = 1
