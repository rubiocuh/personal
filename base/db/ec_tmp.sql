## product header -- product may be needed to be optimized for same item different options. single demontional for now
CREATE TABLE ec.prod_hdr(
product_seq INT,
product_name VARCHAR(128),
product_img VARCHAR(3000),
product_desc VARCHAR(255),
upc VARCHAR(32),
PRIMARY KEY (product_seq));



## product details
CREATE TABLE ec.prod_details(
product_seq INT,
product_detail_seq INT,
product_stock INT,
item_sku VARCHAR(32),
price DECIMAL,
weight INT,
PRIMARY KEY (product_seq, product_detail_seq));

## user table
CREATE TABLE ec.user(
user_seq INT, 
login_id VARCHAR(128),
login_key VARCHAR(255),
user_pw VARCHAR(255),
user_name VARCHAR(64),
first_name VARCHAR(64),
last_name VARCHAR(64),
PRIMARY KEY (user_seq)
);

## user attributes table -- attr_type -> phone,dob, st, bt etc.
CREATE TABLE ec.user_attr(
user_seq INT,
user_det_seq INT,
attr_type VARCHAR(10),
attr_1 VARCHAR(128),
attr_2 VARCHAR(128),
attr_3 VARCHAR(128),
attr_4 VARCHAR(128),
attr_5 VARCHAR(128),
attr_6 VARCHAR(128),
PRIMARY key (user_seq, user_det_seq));

## temporary transaction table -- possibly not needed
## CREATE TABLE ec.transactions();

## finalized orders -- used to track receipts and print for ecommerce email reports
CREATE TABLE ec.receipts(
order_seq INT,
ref_number VARCHAR(128),
track_number VARCHAR(128),
total_qty INT,
total_price DECIMAL,
PRIMARY KEY (order_seq, ref_number));

## order header
CREATE TABLE ec.order_hdr(
order_seq INT,
order_dt VARCHAR(10),
order_status VARCHAR(1),
total_qty INT,
total_price DECIMAL,
buyer_seq INT,
ship_to_seq INT,
bill_to_seq INT,
PRIMARY KEY (order_seq)
);

## order details -- 
CREATE TABLE ec.order_details(
order_seq INT,
order_detail_seq INT,
product_seq INT,
line_num INT,
line_qty INT,
line_price DECIMAL,
PRIMARY KEY (order_seq, order_detail_seq)
);

## shipping info -- contains buyer_seq, order_seq, ship_seq, dates, total quantity, total price, status, tracking, est arrival
CREATE TABLE ec.shipping_hdr(
ship_seq INT,
order_seq INT, 
order_dt VARCHAR(10),
total_qty INT,
total_price DECIMAL,
buyer_seq INT,
ship_to_seq INT,
bill_to_seq INT,
tracking_id VARCHAR(128),
arrival_dt VARCHAR(10),
PRIMARY KEY (ship_seq));

## shipping details -- ship_seq, ship_detail_seq, line order, line quantity, line price, product_seq
CREATE TABLE ec.shipping_details(
ship_seq INT,
ship_detail_seq INT,
product_seq INT,
line_num INT,
line_qty INT,
line_price DECIMAL,
PRIMARY KEY (ship_seq, ship_detail_seq));

CREATE TABLE ec.inventory(
product_seq INT,
product_detail_seq INT, 
product_status INT, -- daily count. leveled warnings
curr_stock INT,
PRIMARY KEY (product_seq, product_detail_seq) 
);

## Incoming Restock information
CREATE TABLE ec.inv_stock(
inv_seq INT,
product_seq INT, 
product_detail_seq INT,
product_qty INT,
order_dt VARCHAR(10),
ship_dt VARCHAR(10),
PRIMARY KEY (inv_seq)
);

## get seq -- contains order_seq, order_detail_seq, product_seq, product_detail seq, receipt seq, shipping_seq, shipping_detail_seq, transaction_seq, user_seq, use_attr_seq
CREATE TABLE ec.next_value(
seq_type VARCHAR(32),
curr_seq INT,
seq_ts TIMESTAMP,
PRIMARY KEY (seq_type)
);

## code reference -- Contain category, sub category,
CREATE TABLE ec.code_ref(
code_type VARCHAR(64),
code_id VARCHAR(64),
code_msg VARCHAR(255),
code_subtype VARCHAR(64),
code_link VARCHAR(128),
PRIMARY KEY (code_type, code_id)
);

