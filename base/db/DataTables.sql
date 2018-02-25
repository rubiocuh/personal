create table bd.vendor(
	vendor_seq INT AUTO_INCREMENT,
	vendor_id VARCHAR(32),
	first_name VARCHAR(32),
	last_name VARCHAR(32),
	address_1 VARCHAR(128),
	address_2 VARCHAR(64),
	city VARCHAR(32),
	state VARCHAR(4),
	us VARCHAR(1),
	zip INT,
	phone Int,
	email VARCHAR(32),
	PRIMARY KEY (vendor_seq)
	);

CREATE TABLE bd.users(
user_seq INT AUTO_INCREMENT,
login_id VARCHAR(64),
pwd VARCHAR(256),
PRIMARY KEY (user_seq));	
	
CREATE TABLE bd.customer(
	cust_seq INT AUTO_INCREMENT,
	first_name VARCHAR(32),
	last_name VARCHAR(32),
	address_1 VARCHAR(128),
	address_2 VARCHAR(64),
	city VARCHAR(32),
	state VARCHAR(4),
	us VARCHAR(1),
	zip INT,
	phone Int,
	email VARCHAR(32),
	PRIMARY KEY (cust_seq)
	);


create table bd.address(
    address_seq INT AUTO_INCREMENT,
    address_type VARCHAR(16),
    user_seq INT,
    address_1 VARCHAR(128),
    address_2 VARCHAR(64),
    city VARCHAR(32),
    state VARCHAR(4),
    us VARCHAR(1),
    zip INT,
    PRIMARY KEY (address_seq)
    );
	
CREATE TABLE bd.tracking(
	track_seq INT AUTO_INCREMENT,
	order_id VARCHAR(16),
	weight INT,
	ship_method VARCHAR(16),
	ship_time VARCHAR(16),
	status VARCHAR(8),
	vendor_seq INT,
	cust_seq INT,
	PRIMARY KEY (track_seq)
	);

CREATE TABLE bd.order_hdr(
	order_seq INT AUTO_INCREMENT,
	vendor_seq INT,
	cust_seq INT,
	order_ts TIMESTAMP,
	qty INT,
	total_price FLOAT,
	PRIMARY KEY (order_seq)
	;

CREATE TABLE bd.order_detail(
	order_detail_seq INT AUTO_INCREMENT,
	order_seq INT,
	vendor_seq INT,
	product_seq INT,
	line_item INT,
	line_qty INT,
	line_price FLOAT,
	PRIMARY KEY (order_detail_seq)
	);

CREATE TABLE bd.product_hdr(
	product_seq INT AUTO_INCREMENT,
	vendor_seq INT,
	prod_name VARCHAR(32),
	prod_desc VARCHAR(256),
	prod_location VARCHAR(32),
	prod_type VARCHAR(16),
	prod_strain VARCHAR(16),
	PRIMARY KEY (product_seq)
	);

CREATE TABLE bd.product_detail(
	product_detail_seq INT AUTO_INCREMENT,
	product_seq INT,
	type_of_method VARCHAR(64),
	time_of_life VARCHAR(64),
	expiration_range VARCHAR(16),
	hybrid VARCHAR(1),
	hybrid_strains VARCHAR(64),
	PRIMARY KEY (product_detail_seq)
	);

CREATE TABLE bd.invoice(
	invoice_seq INT AUTO_INCREMENT,
	vendor_seq INT,
	order_qty INT,
	invoice_date_start DATE,
	invoice_date_end DATE,
	commision_percent INT,
	total_price_revenue FLOAT,
	invoice_total FLOAT,
	PRIMARY KEY (invoice_seq)
	);

CREATE TABLE bd.inventory(
	inventory_seq INT AUTO_INCREMENT,
	vendor_seq INT,
	product_seq INT,
	qty INT,
	inv_status VARCHAR(32),
	PRIMARY KEY (inventory_seq)
	);


