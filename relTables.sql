--tables
CREATE TABLE Contains(
    c_prodName CHAR NOT NULL,
    c_cityID INTEGER NOT NULL,
    c_storeName CHAR NOT NULL,
    c_storeNum INTEGER NOT NULL,
    c_status BOOLEAN NOT NULL -- shows if store contains product
    );

CREATE TABLE saleFreq(
    sf_prodName CHAR NOT NULL,
    sf_storeName CHAR NOT NULL,
    sf_lastShipment DATE NOT NULL
    );

CREATE TABLE Store(
    s_cityID INTEGER NOT NULL,
    s_storeName CHAR NOT NULL, 
    s_storeNum INTEGER NOT NULL,
    );

CREATE TABLE products(
    p_storeName CHAR NOT NULL,
    p_prodName CHAR NOT NULL,
    p_price DECIMAL NOT NULL,
    p_releasedate DATE NOT NULL,
    );


CREATE TABLE inStock(
    is_prodName CHAR NOT NULL,
    is_storeName CHAR NOT NULL,
    is_storeNum INTEGER NOT NULL,
    is_cityID INTEGER NOT NULL,
    is_prodAmount INTEGER NOT NULL
    );



CREATE TABLE shipmentETA(
    sE_prodName CHAR NOT NULL,
    sE_cityID INTEGER NOT NULL,
    sE_storeName CHAR NOT NULL,
    sE_storeNum INTEGER NOT NULL,
    sE_lastShipment DATE NOT NULL,
    sE_estimatedArrival DATE NOT NULL
    );

--redundant, same as inStock
CREATE TABLE storeInventory(
    sI_prodName CHAR NOT NULL,
    sI_storeName CHAR NOT NULL,
    sI_StoreNum INTEGER NOT NULL,
    sI_prodName CHAR NOT NULL,
    sI_prodAmount INTEGER NOT NULL
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

INSERT INTO 
    Contains(
    c_prodName CHAR NOT NULL,
    c_cityID INTEGER NOT NULL,
    c_storeName CHAR NOT NULL,
    c_storeNum INTEGER NOT NULL,
    c_status BOOLEAN NOT NULL
    )
VALUES
    ('The Legend of Zelda: Beadth of the Wild', 1, 'Target', 1, FALSE),
    ('Super Mario Odessey', 1, 'Walmart', 2, TRUE)
    ('Animal Crossing: New Horizons', 2, 'Target', 2, TRUE);

INSERT INTO
    saleFreq(
    sf_prodName CHAR NOT NULL,
    sf_storeName CHAR NOT NULL,
    sf_lastShipment DATE NOT NULL
    )
VALUES
    ('The Legend of Zelda: Beadth of the Wild', 'Target', '2020-09-02')
    ('Super Mario Odessey', 'Walmart', '2020-08-10'),
    ('Animal Crossing: New Horizons', 'Target', '2020-09-28');

INSERT INTO
    Store(
    s_cityID INTEGER NOT NULL,
    s_storeName CHAR NOT NULL, 
    s_storeNum INTEGER NOT NULL,
    )
VALUES
    (1, 'Target', 1)
    (1, 'Walmart', 1)
    (1, 'Walmart', 2)
    (1, 'Gamestop', 1)
    (2, 'Target', 1)
    (2, 'Target', 2)
    (3, 'BestBuy', 1)
    (3, 'Target', 1)
    (3, 'Walmart', 1)
    (3, 'Gamestop', 1);

INSERT INTO 
    products(
    p_storeName CHAR NOT NULL,
    p_prodName CHAR NOT NULL,
    p_price DECIMAL NOT NULL,
    p_releasedate DATE NOT NULL,
    )
VALUES
    ('Target','The Legend of Zelda: Breadth of the Wild', 39.99, '2018-05-09'),
    ('Walmart', 'Super Mario Odessey', 49.9, '2018-10-20'),
    ('Target', 'Animal Crossing: New Horizons', 59.9, '2020-05-21');

INSERT INTO
    inStock(
    is_prodName CHAR NOT NULL,
    is_storeName CHAR NOT NULL,
    is_storeNum INTEGER NOT NULL,
    is_cityID INTEGER NOT NULL,
    is_prodAmount INTEGER NOT NULL
    )
VALUES
    ('The Legend of Zelda: Breadth of the Wild', 'Target', 1, 1, 0)
    ('Super Mario Odessey', 'Walmart', 2, 1, 5)
    ('Animal Crossing: New Horizons', 'Target', 2, 2, 10);

INSERT INTO
    shipmentETA(
    sE_prodName CHAR NOT NULL,
    sE_cityID INTEGER NOT NULL,
    sE_storeName CHAR NOT NULL,
    sE_storeNum INTEGER NOT NULL,
    sE_lastShipment DATE NOT NULL,
    sE_estimatedArrival DATE NOT NULL
    )
VALUES
    ('The Legend of Zelda: Breadth of the Wild', 1, 'Target', 1, '2020-09-02', '2020-09-16')
    ('Super Mario Odessey', 1, 'Walmart', 2, '2020-08-10', '2020-08-24')
    ('Animal Crossing: New Horizons', 2, 'Target', 2, '2020-09-28', '2020-10-12');

INSERT INTO
    locations(
    l_cityID INTEGER NOT NULL,
    l_cityName CHAR NOT NULL
    )
VALUES
    (1, 'Merced')
    (2, 'Fresno')
    (3, 'Modesto')
    (4, 'Turlock')
    (5, 'Madera');

INSERT INTO
    supplyDemand(
    sD_prodName CHAR NOT NULL,
    sD_nintendoRating DECIMAL NOT NULL,
    sD_storeRatingAvg DECIMAL NOT NULL
    )
VALUES  
    ('The Legend of Zelda: Breadth of the Wild', 10, 9.4)
    ('Super Mario Odessey', 9.1, 9.0)
    ('Animal Crossing: New Horizons', 9.3, 8.8);

INSERT INTO
    priceChngFreq(
    pCF_prodName CHAR NOT NULL,
    pCF_storeName CHAR NOT NULL,
    pCF_prodStorePrice DECIMAL NOT NULL,
    pCF_basePrice DECIMAL NOT NULL,
    pCF_percentChng DECIMAL NOT NULL
    )
VALUES
    ('The Legend of Zelda: Breadth of the Wild', 'Target', 39.99, 49.99, -20.01)
    ('Super Mario Odessey', 'Walmart', 49.99, 30.00, 40.01)
    ('Animal Crossing: New Horizons', 'Target', 49.99, 60.00, -17.02);







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
