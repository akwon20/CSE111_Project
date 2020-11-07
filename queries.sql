
-- Search query ------------------------------------


-- Get full product info
SELECT *
FROM products;

-- Display stores in California
SELECT *
FROM Store;

SELECT *
FROM storeInventory;


-- Check if a specific store contains a specific product
SELECT p_name, s_storeNam
FROM Contains
WHERE s_storeNum = ' ' AND
        p_name = ' ';

SELECT p_Name, 
FROM inStock

-- Check the price change frequency for a specific product
SELECT p_name, p_price, b_basePrice, p_lastShipment
FROM price;

-- Display only the cheapest prices from every store
SELECT s_storeName, p_price
FROM products, Store
WHERE
    s_storeName = '' AND
    s_storeNum = ''
GROUP BY s_storeNum
ORDER BY p_price    -- Must order by ascending price (Cheapest at the top)
;


-- Insert query ------------------------------------
INSERT INTO Product(s_Name, p_name, p_price, p_release date, p_lastShipment[DATE] ), Store(s_cityID, s_storeName,  s_storeNum, p_Name)
VALUES();

INSERT INTO locations(storeName, storeNum, c_ID, c_name)
VALUES();

INSERT INTO SupplyDemand(p_name, p_price, p_lastShipment[DATE], r_nintendoRating, r_storeRating)
VALUES();

INSERT INTO priceChngFreq(p_name, p_price, p_lastShipment[DATE], b_name, b_basePrice)
VALUES();


-- Delete query ------------------------------------

--used for deleting outdated products or unavlaible items from a store's inventory 
DELETE *
FROM Store 
WHERE 
    p_Name = '' AND
    s_storeName = '' AND
    s_cityID = 1 AND
    s_storeNum = 1 ;


-- Update Query -------------------------------------

-- product info

UPDATE 
    Product
SET 
    p_price = 1.1
WHERE
    s_Name = '' AND
    p_Name = '';


UPDATE 
    Product
SET 
    p_lastShipmenet = '2020-11-25'
WHERE
    s_Name = '' AND
    p_Name = '';


UPDATE 
    SupplyDemand
SET 
    p_lastShipment = '2020-11-25'
WHERE
    p_Name = '';

-- ratings

UPDATE 
    SupplyDemand
SET 
    r_nintendoRating = 8.5
WHERE
    p_Name = '';

UPDATE 
    SupplyDemand
SET 
    r_storeRating = 8.5
WHERE
    p_Name = ''; --may need to added store name to relation table to carry out this operation

--price anaysis (one of our use cases)

UPDATE 
    priceChngFreq
SET 
    b_basePrice = 59.9      --when base price (nintendo's offical price) of product changes
WHERE
    p_Name = '';


