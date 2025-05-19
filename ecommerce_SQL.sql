use ecommerce;

-- 1 Weekday vs Weekend Payment Statistics
select order_id,order_purchase_timestamp,
case
when dayofweek(order_purchase_timestamp)in(1,7)then'weekend'
else'weekday'
end as day_type from orders;

-- 2 count of orders with review score 5 and payment type credit card
select count(*) as num_orders from order_reviews
inner join order_payments on order_reviews.order_id = order_payments.order_id
where order_reviews.review_score = 5 and order_payments.payment_type = "credit_card";

-- 3 Average number of days taken for customer delivery date for pet shop
select Avg(datediff(o.order_delivered_customer_date,o.order_approved_at)) as avg_delivered_days
from orders o join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id where product_category_name = "pet shop"
and o.order_delivered_customer_date is not null and o.order_approved_at is not null;

-- 4 Average price and payment values of sao paulo city customers
select concat('$', format(avg(order_items.price), 2)) as avg_price, concat('$', format(avg(order_payments.payment_value), 2)) as avg_payment_value
from order_payments join order_items on order_payments.order_id = order_items.order_id
join orders on order_payments.order_id = orders.order_id
join customers on orders.customer_id = customers.customer_id
where customers.customer_city = 'sao paulo';

-- 5 Relationship between shipping days & review scores
select r.review_score,round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) as avg_shipping_days
from orders o join order_reviews r on o.order_id = r.order_id
where o.order_delivered_customer_date is not null and o.order_purchase_timestamp is not null
group by r.review_score order by r.review_score;




