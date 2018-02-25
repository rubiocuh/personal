##NEXTVAL
insert into ec.next_value
values
('prod_seq', 1000, NOW());

insert into ec.next_value
values
('prod_detail_seq', 2000, NOW());

insert into ec.next_value
values
('user_seq', 8000, NOW());

INSERT INTO ec.next_value
VALUES
('inv_seq', 3000, now())

insert into ec.next_value
values
('order_detail_seq', 4000, NOW());

insert into ec.next_value
values
('ship_seq', 5000, NOW());

insert into ec.next_value
values
('ship_detail_seq', 6000, NOW());

insert into ec.next_value
values
('user_det_seq', 7000, NOW());

## Insert into Prod | Prod Details
INSERT INTO ec.prod_details
(product_seq, product_detail_seq, product_stock, item_sku, price, weight)
SELECT ec.f_get_next_val('product_seq'),
	   ec.f_get_next_val('product_detail_seq'),
	   10,
	   'PRODTSTSKUCOMP1',
	   100.00,
	   3;

INSERT INTO ec.prod_hdr
(product_seq, product_name, product_img, product_desc, upc)
SELECT product_seq,
	   'HP Specre x360 13in 8GB',
	   NULL,
	   'HP Specre i7, 8GB Ram, 256GB SSD, 4k resolution',
	   'PRODTSTUPCCOMP1'
  FROM ec.prod_details

  ## Insert into USER
INSERT INTO ec.`user`
(user_seq, login_id, login_key, user_pw, user_name, first_name, last_name)
SELECT ec.f_get_next_val('user_seq'),
	   'phrubio@gmail.com',
	   NULL,
	   NULL,
	   'rubiocuh',
	   'Phillip',
	   'Rubio';

# Insert User Attributes
##### Ship TO Address
INSERT INTO ec.user_attr(user_seq, user_det_seq, attr_type, attr_1, attr_2, attr_3, attr_4, attr_5, attr_6)
SELECT user_seq,
       ec.f_get_next_val('user_det_seq'),
       'st_addr',
       '2000 Montgomery Street',
       'RM 6443',
       'Monterey Park',
       'California',
       '91745',
       NULL
  FROM ec.user;

 ### Bill To Address
INSERT INTO ec.user_attr(user_seq, user_det_seq, attr_type, attr_1, attr_2, attr_3, attr_4, attr_5, attr_6)
SELECT user_seq,
       ec.f_get_next_val('user_det_seq'),
       'bt_addr',
       '2001 Indiana Street',
       'RM 332',
       'West Park',
       'California',
       '91763',
       NULL
  FROM ec.user;

  ### Phone

INSERT INTO ec.user_attr(user_seq, user_det_seq, attr_type, attr_1, attr_2, attr_3, attr_4, attr_5, attr_6)
SELECT user_seq,
       ec.f_get_next_val('user_det_seq'),
       'phone',
       '909-378-0095',
       NULL,
       NULL,
       NULL,
       NULL,
       null
  FROM ec.user;

## Inventory Insert
  INSERT INTO ec.inv_stock
(inv_seq, product_seq, product_detail_seq, product_qty, order_dt, ship_dt)
SELECT
	ec.f_get_next_val('inv_seq'),
	product_seq,
	product_detail_seq,
	10,
	NULL,
	NULL
	FROM ec.prod_details;