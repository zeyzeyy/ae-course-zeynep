select 
    date_month, 
    sum(is_active::integer) as customers, 
    sum(mrr) as mrr, 
from analytics.fct_mrr
group by 1