create database ecommerce;
use ecommerce;
select * from orders;
Create table `customers`( 
`customer_id` varchar(50),
`customer_unique_id` varchar(50) unique not null,
`customer_zip_code_prefix` int,
`customer_city` text,
`customer_state` text);
Create table `geolocation`( 
`geolocation_zip_code_prefix` int,
`geolocation_lat` int,
`geolocation_lng` int,
`geolocation_city` text,
`geolocation_state` text);
Create table `order_items`( 
`order_id` varchar(50),
`order_item_id` int,
`product_id` varchar(50),
`seller_id` varchar(50),
`shipping_limit_date` datetime,
`price` double,
`freight_value` double);
Create table `order_payments`( 
`order_id` varchar(50),
`payment_sequential` int,
`payment_type` text,
`payment_installments` int,
`payment_value` double);
Create table `order_reviews`( 
`review_id` varchar(50),
`order_id` varchar(50),
`review_score` int,
`review_comment_title` text,
`review_comment_message` text,
`review_creation_date` datetime,
`review_answer_timestamp` datetime);
Create table `orders`( 
`order_id` varchar(50),
`customer_id` varchar(50),
`order_status` text,
`order_purchase_timestamp` datetime,
`order_approved_at` datetime,
`order_delivered_carrier_date` datetime,
`order_delivered_customer_date` datetime,
`order_estimated_delivery_date` datetime);
Create table `products`( 
`product_id` varchar(50),
`product_category_name` text,
`product_name_length` int,
`product_description_length` int,
`product_photos_qty` int,
`product_weight_g` int,
`product_length_cm` int,
`product_height_cm` int,
`product_width_cm` int);
Create table `sellers`( 
`seller_id` varchar(50),
`seller_zip_code_prefix` int,
`seller_city` text,
`seller_state` text);



