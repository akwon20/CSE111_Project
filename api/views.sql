CREATE VIEW prodUpdates(store, storeNum, product, price,  prod_amount, restock_time) AS
    SELECT Store.s_storeName, Store.s_storeNum,  p_prodName, p_price, is_prodAmount, time_added
    FROM shipmentETA, Store, products, inStock
    WHERE sE_prodName = p_prodName AND
        is_storeName = sE_storeName AND
        is_storeNum = sE_storeNum;

-- Do you think you can create a view or table that
-- keeps track of the cheapest price for each store? You can
-- structure similar to the view i created but only display
-- the store and cheapest price and run it with sample inserts

-- View that keeps track of cheapest prices from every store available in the products page
CREATE VIEW cheapPrices(store, storeNum, product, price) AS
    SELECT Store.s_storeName, Store.s_storeNum, products.p_prodName, MIN(p_price)
    FROM Store, products
    WHERE
        s_storeName = p_storeName
    GROUP BY s_storeName;

CREATE VIEW stockedup(product, store, cityID, prodAmount) AS
    SELECT p_prodName, s_storeName, s_cityID, COUNT(DISTINCT p_prodName)
    FROM products, Store
    WHERE
        s_storeName = p_storeName
    GROUP BY p_prodName;







