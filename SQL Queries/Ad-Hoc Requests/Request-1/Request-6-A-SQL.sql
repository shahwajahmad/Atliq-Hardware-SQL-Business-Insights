#Generate a report which contains the top 5 customers who received an
# average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.

with cte  as (select 
					   c.customer_code,
					   c.customer,
					   avg (p.pre_invoice_discount_pct) as avg_discount_percentage
 				from fact_pre_invoice_deductions p
				join dim_customer c
				using (customer_code)
				where p.fiscal_year = 2021 
				and c.market = "INDIA"
				group by c.customer_code , c.customer
                )
               select
                      customer_code,
                      customer,
                      round(avg_discount_percentage,2) as average_discount_percentage
				from cte
				order by avg_discount_percentage desc
                limit 5
			   
