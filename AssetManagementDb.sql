create database AssetManagementDb;

use AssetManagementDb;

-- drop database AssetManagementDb;

CREATE TABLE User (
  user_id Int PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(50),
  name VARCHAR(50),
  gender ENUM ('male', 'female', 'other'),
  phone_number VARCHAR(50),
  address VARCHAR(50),
  role ENUM ('user', 'admin'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Category (
  category_id Int PRIMARY KEY,
  slug VARCHAR(255),
  name VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Asset (
  asset_id Int PRIMARY KEY,
  category_id INTEGER REFERENCES Category(id),
  name VARCHAR(255),
  model VARCHAR(255),
  manufacturing_date DATE,
  expiry_date DATE,
  price NUMERIC(10,2),
  image VARCHAR(255),
  description varchar(255),
  quantity INTEGER,
  asset_availability_status ENUM ('yes', 'no') DEFAULT 'yes',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Asset_Request (
  id Int PRIMARY KEY,
  user_id INTEGER,
  asset_id INTEGER REFERENCES Asset(id),
  asset_description varchar(255),
  asset_request_type ENUM ('borrow', 'return'),
  asset_request_status ENUM ('pending', 'verified', 'rejected'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (asset_id) REFERENCES Asset(asset_id)
);

CREATE TABLE Asset_Service_Request (
  id Int PRIMARY KEY,
  user_id INTEGER ,
  asset_id INTEGER REFERENCES Asset(id),
  issue_type ENUM ('malfunction', 'repair'),
  issue_resolve_status ENUM ('solved', 'unsolved', 'rejected'),
  description varchar(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (asset_id) REFERENCES Asset(asset_id)
);

