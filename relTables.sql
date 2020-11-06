--tables
CREATE TABLE Contains(
    p_Name CHAR NOT NULL,
    c_ID INTEGER NOT NULL,
    s_storeNam CHAR NOT NULL,
    s_storeNum INTEGER NOT NULL
    );

CREATE TABLE saleFreq(
    p_Name CHAR NOT NULL,
    s_storeName CHAR NOT NULL,
    p_lastShipment DATE NOT NULL
    );

CREATE TABLE Store(
    s_cityID INTEGER NOT NULL,
    s_storeName CHAR NOT NULL, 
    s_storeNum INTEGER NOT NULL,
    p_Name CHAR NOT NULL
    );

CREATE TABLE products(
    s_Name CHAR NOT NULL,
    p_name CHAR NOT NULL,
    p_price DECIMAL NOT NULL,
    p_release DATE NOT NULL,
    p_lastShipment DATE NOT NULL
    );

CREATE TABLE inStock(
    p_Name CHAR NOT NULL,
    i_storeNum INTEGER NOT NULL,
    i_prodAmount INTEGER NOT NULL
    );

CREATE TABLE shipmentETA(
    p_Name CHAR NOT NULL,
    i_storeNum INTEGER NOT NULL,
    i_lastShipment DATE NOT NULL
    );

CREATE TABLE storeInventory(
    p_Name CHAR NOT NULL,
    i_storeName CHAR NOT NULL,
    i_StoreNum INTEGER NOT NULL,
    i_prodName CHAR NOT NULL,
    i_prodAmount INTEGER NOT NULL
    );

CREATE TABLE locations(
    storeName CHAR NOT NULL,
    storeNum INTEGER NOT NULL,
    c_ID INTEGER NOT NULL,
    c_name CHAR NOT NULL
    );

CREATE TABLE supplyDemand(p_name CHAR NOT NULL,
    p_price DECIMAL NOT NULL,
    p_lastShipment DATE NOT NULL,
    r_nintendoRating DECIMAL NOT NULL,
    r_storeRating DECIMAL NOT NULL
    );

CREATE TABLE priceChngFreq(
    p_name CHAR NOT NULL,
    p_price DECIMAL NOT NULL,
    p_lastShipment DATE NOT NULL,
    b_name CHAR NOT NULL, b_basePrice DECIMAL NOT NULL
    );


DROP TABLE IF EXISTS Contains;
DROP TABLE IF EXISTS saleFreq;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS inStock;
DROP TABLE IF EXISTS shipmentETA;
DROP TABLE IF EXISTS storeInventory;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS supplyDemand;
DROP TABLE IF EXISTS priceChngFreq;