--tables
CREATE TABLE Contains(
    c_prodName CHAR NOT NULL,
    c_cityID INTEGER NOT NULL,
    c_storeName CHAR NOT NULL,
    c_storeNum INTEGER NOT NULL,
    c_status BOOLEAN DEFAULT TRUE -- shows if store contains product
    );

CREATE TABLE saleFreq(
    sf_prodName CHAR NOT NULL,
    sf_storeName CHAR NOT NULL,
    sf_lastShipment DATE NOT NULL
    );

CREATE TABLE Store(
    s_cityID INTEGER NOT NULL,
    s_storeName CHAR NOT NULL, 
    s_storeNum INTEGER NOT NULL
    );

CREATE TABLE products(
    p_storeName CHAR NOT NULL,
    p_prodName CHAR NOT NULL,
    p_price DECIMAL NOT NULL,
    p_releasedate DATE NOT NULL,
    p_type CHAR NOT NULL
    -- PRIMARY KEY(p_prodName, p_type)
    );

CREATE TABLE hardware(
    h_name DECIMAL NOT NULL,
    h_price CHAR NOT NULL,
    h_releaseDate DATE NOT NULL
    );

-- Will apply to physical games developed and/or published by Nintendo
CREATE TABLE software(
    s_prodName CHAR NOT NULL,
    s_price DECIMAL NOT NULL,
    s_releasedate DATE NOT NULL
    );

CREATE TABLE inStock(
    is_prodName CHAR NOT NULL,
    is_storeName CHAR NOT NULL,
    is_storeNum INTEGER NOT NULL,
    is_cityID INTEGER NOT NULL,
    is_prodAmount INTEGER NOT NULL,
    time_added TEXT DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE shipmentETA(
    sE_prodName CHAR NOT NULL,
    sE_cityID INTEGER NOT NULL,
    sE_storeName CHAR NOT NULL,
    sE_storeNum INTEGER NOT NULL,
    sE_lastShipment DATE NOT NULL,
    sE_estimatedArrival DATE NOT NULL, --use srftime func for to do this automatically
    time_updated TEXT DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE locations(
    l_cityID INTEGER NOT NULL,
    l_cityName CHAR NOT NULL
    );

CREATE TABLE supplyDemand(
    sD_prodName CHAR NOT NULL,
    sD_nintendoRating DECIMAL NOT NULL,
    sD_storeRatingAvg DECIMAL NOT NULL
    );

CREATE TABLE priceChngFreq(
    pCF_prodName CHAR NOT NULL,
    pCF_storeName CHAR NOT NULL,
    pCF_prodStorePrice DECIMAL NOT NULL,
    pCF_basePrice DECIMAL NOT NULL,
    pCF_percentChng DECIMAL NOT NULL
    );

------------------------------------------------------------------------------

DROP TABLE IF EXISTS Contains;
DROP TABLE IF EXISTS saleFreq;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS hardware;
DROP TABLE IF EXISTS software;
DROP TABLE IF EXISTS inStock;
DROP TABLE IF EXISTS shipmentETA;
DROP TABLE IF EXISTS storeInventory;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS supplyDemand;
DROP TABLE IF EXISTS priceChngFreq;
