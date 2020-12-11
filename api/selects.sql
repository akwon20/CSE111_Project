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