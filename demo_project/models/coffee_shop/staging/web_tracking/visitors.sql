with visitors as (
    select *
    except(visitor_id), 
    max(customer_id) over (partition by visitor_id order by timestamp) as  first_customer_id

    from {{ source('web_tracking', 'pageviews')}}
)

select * from visitors