#  Provide a report with all the unique product counts for each  segment  and 
#sort them in descending order of product counts. The final output contains 
SELECT 
      segment ,
      count(distinct product_code) as product_count
FROM gdb023.dim_product
group by segment
order by product_count desc
