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