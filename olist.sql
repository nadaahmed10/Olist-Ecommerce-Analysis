create table Customers (
	customer_id VARCHAR(255) primary key,
	customer_unique_id VARCHAR(255),
	customer_zip_code_prefix INT,
	customer_city VARCHAR(100),
	customer_state VARCHAR(50),
) ;
create table Orders (
	order_id Varchar(255) primary key,
	customer_id Varchar(255) foreign key references Customers(customer_id),
	order_status Varchar(255),
	order_purchase_timestamp datetime,
	order_approved_at datetime,
	order_delivered_carrier_date datetime,
	order_delivered_customer_date datetime,
	order_estimated_delivery_date datetime
) ;

create table Order_Payments (
	order_id VARCHAR(255) foreign key references Orders(order_id),
	payment_sequential INT,
	payment_type VARCHAR(255),
	payment_installments INT,
	payment_value DECIMAL(15,3),
	primary key (order_id,payment_sequential)
) ;

create table Order_Reviews (
	review_id VARCHAR(255) primary key,
	order_id VARCHAR(255) foreign key references Orders(order_id),
	review_score INT,
	review_comment_title VARCHAR(255),
	review_comment_message VARCHAR(255),
	review_creation_date DATETIME,
	review_answer_timestamp DATETIME
);
create table Sellers (
	seller_id VARCHAR(255) primary key,
	seller_zip_code_prefix INT,
	seller_city VARCHAR(255),
	seller_state VARCHAR(255),
);

create table Category_Name_Translation (
	product_category_name VARCHAR(255) primary key,
	product_category_name_english VARCHAR(255)
) ;

create table Products (
	product_id VARCHAR(255) primary key ,
	product_category_name VARCHAR(255) foreign key references Category_Name_Translation(product_category_name),
	product_name_lenght INT,
	product_description_lenght int,
	product_photos_qty INT,
	product_weight_g DECIMAL(15,3),
	product_length_cm DECIMAL(15,3),
	product_height_cm DECIMAL(15,3),
	product_width_cm DECIMAL(15,3)
	
);

create table Order_Items (
	order_id VARCHAR(255) foreign key references Orders(order_id),
	order_item_id INT,
	product_id VARCHAR(255) foreign key references Products(product_id),
	seller_id VARCHAR(255) foreign key references Sellers(seller_id),
	shipping_limit_date DATETIME,
	price DECIMAl(15,3),
	freight_value DECIMAl(15,3),
	primary key (order_id, order_item_id)
);