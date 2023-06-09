
CREATE TABLE account (
   account_id INT IDENTITY(1,1) PRIMARY KEY,
   username VARCHAR(50) NOT NULL,
   password VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   full_name VARCHAR(100),
   phone_number VARCHAR(20),
   address VARCHAR(100),
   date_of_birth DATE,
   role INT DEFAULT -1
);

CREATE TABLE category (
   category_id INT IDENTITY(1,1) PRIMARY KEY,
   category_name VARCHAR(50) NOT NULL,
   parent_category_id INT,
   FOREIGN KEY (parent_category_id) REFERENCES category(category_id)
);

CREATE TABLE product (
   product_id INT IDENTITY(1,1) PRIMARY KEY,
   product_name VARCHAR(100) NOT NULL,
   price float NOT NULL,
   description VARCHAR(500),
   category_id INT NOT NULL,
   image_url VARCHAR(200) NOT NULL,
   FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE cart (
   cart_id INT IDENTITY(1,1) PRIMARY KEY,
   account_id INT NOT NULL,
   total_price float NOT NULL,
   FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE cart_item (
   cart_item_id INT IDENTITY(1,1) PRIMARY KEY,
   cart_id INT NOT NULL,
   product_id INT NOT NULL,
   quantity INT NOT NULL,
   FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
   FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE order_status (
   status_id INT IDENTITY(1,1) PRIMARY KEY,
   status_name VARCHAR(50) NOT NULL
);

CREATE TABLE [order] (
   order_id INT IDENTITY(1,1) PRIMARY KEY,
   account_id INT NOT NULL,
   order_date DATE NOT NULL,
   total_price DECIMAL(10, 2) NOT NULL,
   status_id INT NOT NULL,
   FOREIGN KEY (account_id) REFERENCES account(account_id),
   FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

CREATE TABLE order_detail (
   order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
   order_id INT NOT NULL,
   product_id INT NOT NULL,
   quantity INT NOT NULL,
   FOREIGN KEY (order_id) REFERENCES [order](order_id),
   FOREIGN KEY (product_id) REFERENCES product(product_id)
);
