
-- Search query

-- Get full product info
SELECT s_Name, p_name, p_price, p_release, p_lastShipment
FROM products

SELECT s_storeName
FROM Store

SELECT
FROM Contains

-- Insert query



-- Delete query ------------------------------------

--used for deleting outdated products or unavlaible items from a store's inventory 
DELETE *
FROM Store 
WHERE 
    p_Name = '' AND
    s_storeName = '' AND
    s_cityID = 1 AND
    s_storeNum = 1 


