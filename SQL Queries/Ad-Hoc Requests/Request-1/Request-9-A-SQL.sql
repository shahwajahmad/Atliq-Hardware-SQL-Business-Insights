#Which channel helped to bring more gross sales in the fiscal year 2021
#and the percentage of contribution? The final output contains these fields,
#channel
#gross_sales_mln
#percentage

with cte as (Select 
				   c.channel as channel,
				   round(sum(sold_quantity * gross_price) / 1000000,2) as gross_sales_mln
			from fact_sales_monthly s
			join fact_gross_price g
			using (product_code)
			join dim_customer c
			using (customer_code)
			where s.fiscal_year = 2021
			group by c.channel)
            
            select
                   channel,
                   gross_sales_mln,
                   round(gross_sales_mln *100 / sum(gross_sales_mln) over(),2) as percentage
			from  cte
            group by channel
            order by percentage desc
