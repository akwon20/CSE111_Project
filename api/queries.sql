-- Insert query ------------------------------------
INSERT INTO 
    Contains(
    c_prodName,
    c_cityID,
    c_storeName,
    c_storeNum,
    c_status
    )
VALUES
    ('The Legend of Zelda: Breath of the Wild', 1, 'Target', 1, FALSE),
    ('Super Mario Odyssey', 1, 'Walmart', 2, TRUE),
    ('Animal Crossing: New Horizons', 2, 'Target', 2, TRUE);

INSERT INTO
    saleFreq(
    sf_prodName,
    sf_storeName,
    sf_lastShipment
    )
VALUES
    ('The Legend of Zelda: Breath of the Wild', 'Target', '2020-09-02'),
    ('Super Mario Odyssey', 'Walmart', '2020-08-10'),
    ('Animal Crossing: New Horizons', 'Target', '2020-09-28');

INSERT INTO
    Store(
    s_cityID,
    s_storeName, 
    s_storeNum
    )
VALUES
    (1, 'Target', 1),
    (1, 'Walmart', 1),
    (1, 'Walmart', 2),
    (1, 'Gamestop', 1),
    (2, 'Target', 1),
    (2, 'Target', 2),
    (3, 'BestBuy', 1),
    (3, 'Target', 1),
    (3, 'Walmart', 1),
    (3, 'Gamestop', 1)
    (6, 'Amazon', 1);

INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate,
    p_type
    )
VALUES
    ('Target','The Legend of Zelda: Breath of the Wild', 39.99, '2018-05-09', 'Software'),
    ('Walmart', 'Super Mario Odyssey', 49.9, '2018-10-20', 'Software'),
    ('Target', 'Animal Crossing: New Horizons', 59.9, '2020-05-21', 'Software')
    ('Target', 'Nintendo Switch with Neon Blue and Neon Red Joy-Con', 299.99, '2017-03-03', 'Hardware'),
    ('Target', 'Nintendo Switch with Gray Joy-Con', 299.99, '2017-03-03', 'Hardware'),
    ('Target', 'Nintendo Switch Lite - Turquoise', 199.99, '2019-09-20', 'Hardware'),
    ('Target','Nintendo Switch Lite - Gray', 199.99, '2019-09-20', 'Hardware'),
    ('Target', 'Nintendo Switch Lite - Yellow', 199.99, '2019-09-20', 'Hardware'),
    ('Target', 'Nintendo Switch Lite - Coral', 199.99, '2019-09-20', 'Hardware');


-- Hardware/software should be added dynamically when new items are added to the products table
INSERT INTO 
    hardware(
    h_name,
    h_price,
    h_releaseDate
    )
VALUES
    ('Nintendo Switch with Neon Blue and Neon Red Joy-Con', 299.99, '2017-03-03'),
    ('Nintendo Switch with Gray Joy-Con', 299.99, '2017-03-03'),
    ('Nintendo Switch Lite - Turquoise', 199.99, '2019-09-20'),
    ('Nintendo Switch Lite - Gray', 199.99, '2019-09-20'),
    ('Nintendo Switch Lite - Yellow', 199.99, '2019-09-20'),
    ('Nintendo Switch Lite - Coral', 199.99, '2019-09-20');

INSERT INTO
    software(
    s_prodName,
    s_price,
    s_releasedate
    )
VALUES
    ('Animal Crossing: New Horizons', 59.9, '2020-09-28'),
    ('Super Mario Odyssey', 49.9, '2018-10-20'),
    ('The Legend of Zelda: Breath of the Wild', 39.99, '2018-05-09');


INSERT INTO
    inStock(
    is_prodName,
    is_storeName,
    is_storeNum,
    is_cityID,
    is_prodAmount
    )
VALUES
    ('The Legend of Zelda: Breath of the Wild', 'Target', 1, 1, 0),
    ('Super Mario Odyssey', 'Walmart', 2, 1, 5),
    ('Animal Crossing: New Horizons', 'Target', 2, 2, 10);

INSERT INTO
    shipmentETA(
    sE_prodName,
    sE_cityID,
    sE_storeName,
    sE_storeNum,
    sE_lastShipment,
    sE_estimatedArrival
    )
VALUES
    ('The Legend of Zelda: Breath of the Wild', 1, 'Target', 1, '2020-09-02', '2020-09-16'),
    ('Super Mario Odyssey', 1, 'Walmart', 2, '2020-08-10', '2020-08-24'),
    ('Animal Crossing: New Horizons', 2, 'Target', 2, '2020-09-28', '2020-10-12');

INSERT INTO
    locations(
    l_cityID,
    l_cityName
    )
VALUES
    (1, 'Merced'),
    (2, 'Fresno'),
    (3, 'Modesto'),
    (4, 'Turlock'),
    (5, 'Madera'),
    (6, 'Internet');

INSERT INTO
    supplyDemand(
    sD_prodName,
    sD_nintendoRating,
    sD_storeRatingAvg
    )
VALUES  
    ('The Legend of Zelda: Breath of the Wild', 10, 9.4),
    ('Super Mario Odyssey', 9.1, 9.0),
    ('Animal Crossing: New Horizons', 9.3, 8.8);

INSERT INTO
    priceChngFreq(
    pCF_prodName,
    pCF_storeName,
    pCF_prodStorePrice,
    pCF_basePrice,
    pCF_percentChng
    )
VALUES
    ('The Legend of Zelda: Breath of the Wild', 'Target', 39.99, 49.99, -20.01),
    ('Super Mario Odyssey', 'Walmart', 49.99, 30.00, 40.01),
    ('Animal Crossing: New Horizons', 'Target', 49.99, 60.00, -17.02);


CREATE VIEW prodUpdates(store, storeNum, product, price,  prod_amount, restock_time) AS
    SELECT Store.s_storeName, Store.s_storeNum,  p_prodName, p_price, is_prodAmount, time_added
    FROM shipmentETA, Store, products, inStock
    WHERE sE_prodName = p_prodName AND
        is_storeName = sE_storeName AND
        is_storeNum = sE_storeNum


--need a trigger for increasing 'instock' and 'contains' table / other relevant tables




-- Search query ------------------------------------
-- Austin

-- Get full product info
SELECT *
FROM products;

-- Display stores in California
SELECT *
FROM Store;

-- Display all available hardware
SELECT *
FROM hardware;

-- Display all available software
SELECT *
FROM software;


-- Check if a specific store contains a specific product
SELECT c_storeName, c_prodName
FROM Contains
WHERE c_storeNum = 1 AND
        c_prodName = 'The Legend of Zelda: Breath of the Wild' AND
        c_status = 1;

SELECT c_prodName, c_storeName


SELECT p_Name
FROM inStock;

-- Check the price change frequency for a specific product
SELECT *
FROM priceChngFreq
WHERE
    pCF_prodName = 'Super Mario Odyssey'
ORDER BY pCF_percentChng ASC;

-- Display only the cheapest prices from every store within a specific city
SELECT l_cityName, s_storeName, p_prodName, MIN(p_price)
FROM products, Store, locations
WHERE
    s_cityID = 1
GROUP BY s_storeName
ORDER BY p_price DESC   -- Must order by ascending price (Cheapest at the top)
;

-- Display only the cheapest prices from a specific store
SELECT l_cityName, s_storeName, s_storeNum, MIN(p_price)
FROM products, Store, locations
WHERE
    s_cityID = 1 AND
    s_storeName = 'Target'
GROUP BY s_storeNum
ORDER BY p_price DESC;


/*
-- Calculate price percentage change
SELECT pCF_percentChng
FROM priceChngFreq
WHERE
    (pCF_prodStorePrice / pCF_basePrice) = pCF_percentChng;
*/


-- Delete query ------------------------------------
-- Austin

--used for deleting outdated products or unavailable items from a store's inventory 
DELETE *
FROM storeInventory 
WHERE 
    is_prodName = '' AND
    is_storeName = '' AND
    is_cityID = 1; -- AND
    -- is_storeNum = 1 ;    -- We may only need the product, store, and city

DELETE *
FROM Contains
WHERE
    c_prodName = '' AND
    c_storeNum = '';

DELETE *
FROM hardware;

DELETE *
FROM software;


-- Update Query -------------------------------------
-- Rodolfo

-- product info


--store does not contain product (soldout)
UPDATE
    Contains
SET
    c_status = 0                   
WHERE
    c_storeName = 'Walmart' AND
    c_prodName = 'Super Mario Odyssey' AND
    c_cityID = 1 AND
    c_storeNum = 2;

--store now contains product (restock)
UPDATE
    Contains
SET
    c_status = 1                     
WHERE
    c_storeName = 'Walmart' AND
    c_prodName = 'Super Mario Odyssey' AND
    c_cityID = 1 AND
    c_storeNum = 2;

-- product price changed (per store)
UPDATE 
    products
SET 
    p_price = 49.99
WHERE
    p_storeName = 'Target' AND
    p_prodName = 'Animal Crossing: New Horizons';

-- update last shipment
UPDATE 
    shipmentETA
SET 
    sE_lastShipment = '2020-11-25'
WHERE
    sE_storeName = 'Target' AND
    sE_prodName = 'Animal Crossing: New Horizons' AND
    sE_cityID = 2 AND
    sE_storeNum = 2;

-- will be updated when product is release and average of all store ratings are calculated
UPDATE 
    SupplyDemand
SET 
    sD_storeRatingAvg = '8.9'
WHERE
    sD_prodName = 'Super Mario Odyssey';

-- ratings

UPDATE 
    SupplyDemand
SET 
    sD_storeRatingAvg = 8.5
WHERE
    sD_prodName = ''; --may need to added store name to relation table to carry out this operation

--price anaysis (one of our use cases)

UPDATE 
    priceChngFreq
SET 
    pCF_basePrice = 59.9      --when base price of product changes(offical nintendo store price)
WHERE
    pCF_prodName = 'Animal Crossing: New Horizons';

--need to account for opperation to calculate pCF_percentChng with consideration to base price and individual store prices
UPDATE 
    priceChngFreq
SET 
    pCF_percentChng = -16.66      
WHERE
    pCF_prodName = 'Animal Crossing: New Horizons' AND
    pCF_storeName = 'Target';


-- Triggers to update other tables
CREATE TRIGGER hwInsert AFTER INSERT ON products
BEGIN
    INSERT INTO hardware(h_name, h_price, h_releaseDate)
        VALUES(NEW.h_name, NEW.h_price, NEW.h_releaseDate);
END;

CREATE TRIGGER swInsert AFTER INSERT ON products
BEGIN
    INSERT INTO software(s_prodName, s_price, s_releaseDate)
        VALUES(NEW.s_prodName, NEW.s_price, NEW.s_releaseDate);
END;

CREATE TRIGGER hwPriceUpdate AFTER UPDATE ON products
BEGIN
UPDATE
    OLD.h_price = NEW.h_price;

