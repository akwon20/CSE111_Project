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

DELETE
FROM products
WHERE p_prodName = 'Daemon X Machina';