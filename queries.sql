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
    (3, 'Gamestop', 1);

INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate
    )
VALUES
    ('Target','The Legend of Zelda: Breadth of the Wild', 39.99, '2018-05-09'),
    ('Walmart', 'Super Mario Odyssey', 49.9, '2018-10-20'),
    ('Target', 'Animal Crossing: New Horizons', 59.9, '2020-05-21');

INSERT INTO
    inStock(
    is_prodName,
    is_storeName,
    is_storeNum,
    is_cityID,
    is_prodAmount
    )
VALUES
    ('The Legend of Zelda: Breadth of the Wild', 'Target', 1, 1, 0),
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
    ('The Legend of Zelda: Breadth of the Wild', 1, 'Target', 1, '2020-09-02', '2020-09-16'),
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
    (5, 'Madera');

INSERT INTO
    supplyDemand(
    sD_prodName,
    sD_nintendoRating,
    sD_storeRatingAvg
    )
VALUES  
    ('The Legend of Zelda: Breadth of the Wild', 10, 9.4),
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
    ('The Legend of Zelda: Breadth of the Wild', 'Target', 39.99, 49.99, -20.01),
    ('Super Mario Odyssey', 'Walmart', 49.99, 30.00, 40.01),
    ('Animal Crossing: New Horizons', 'Target', 49.99, 60.00, -17.02);




-- Search query ------------------------------------
-- Austin

-- Get full product info
SELECT *
FROM products;

-- Display stores in California
SELECT *
FROM Store;


-- Check if a specific store contains a specific product
SELECT c_prodName, c_storeName
FROM Contains
WHERE c_storeNum = 'Target' AND
        c_prodName = 'The Legend of Zelda: Breath of the Wild';

SELECT p_Name
FROM inStock;

-- Check the price change frequency for a specific product
SELECT pCF_percentChng
FROM priceChngFreq;

-- Display only the cheapest prices from every store
SELECT s_storeName, p_price
FROM products, Store
WHERE
    s_storeName = 'Target' AND
    s_storeNum = ''
GROUP BY s_storeNum
ORDER BY p_price    -- Must order by ascending price (Cheapest at the top)
;


-- Calculate price percentage change
SELECT pCF_percentChng
FROM priceChngFreq
WHERE
    (pCF_prodStorePrice / pCF_basePrice) = pCF_percentChng;


-- Delete query ------------------------------------
-- Austin

--used for deleting outdated products or unavailable items from a store's inventory 
DELETE *
FROM storeInventory 
WHERE 
    is_prodName = '' AND
    is_storeName = '' AND
    is_cityID = 1 -- AND
    -- is_storeNum = 1 ;    -- We may only need the product, store, and city


-- Update Query -------------------------------------
-- Rodolfo

-- product info

UPDATE
    Contains
SET
    c_status = FALSE                    --store does not contain product (soldout)
WHERE
    c_storeName = '' AND
    c_prodName = '';

UPDATE
    Contains
SET
    c_status = TRUE                     --store now contains product (restock)
WHERE
    c_storeName = '' AND
    c_prodName = '';

UPDATE 
    products
SET 
    p_price = 1.1
WHERE
    p_storeName = '' AND
    p_prodName = '';


UPDATE 
    products
SET 
    p_lastShipmenet = '2020-11-25'
WHERE
    p_storeName = '' AND
    p_prodName = '';


UPDATE 
    SupplyDemand
SET 
    sD_storeRatingAvg = ''
WHERE
    sd_prodName = '';

-- ratings

UPDATE 
    SupplyDemand
SET 
    sD_nintendoRating = 8.5     -- Nintendo doesn't have official ratings; we only have store ratings to go off of
WHERE
    sd_prodName = '';

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
    pCF_basePrice = 59.9      --when base price of product changes
WHERE
    pCF_prodName = '';


