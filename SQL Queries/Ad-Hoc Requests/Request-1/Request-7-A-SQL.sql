#Get the complete report of the Gross sales amount for the customer “Atliq
#Exclusive” for each month. This analysis helps to get an idea of low and
#high-performing months and take strategic decisions.

select 
       month(s.date) as month,
       s.fiscal_year,
       round(sum(sold_quantity * gross_price),2) as gross_price_amount
from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code and
s.fiscal_year = g.fiscal_year
join dim_customer c
on s.customer_code = c.customer_code
where customer = "Atliq Exclusive"
group by month(s.date) , s.fiscal_year
order by gross_price_amount desc
