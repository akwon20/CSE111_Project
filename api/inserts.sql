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
    (3, 'Gamestop', 1),
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
    ('Target', 'Animal Crossing: New Horizons', 59.9, '2020-05-21', 'Software'),
    ('Target', 'Nintendo Switch with Neon Blue and Neon Red Joy-Con', 299.99, '2017-03-03', 'Hardware'),
    ('Target', 'Nintendo Switch with Gray Joy-Con', 299.99, '2017-03-03', 'Hardware'),
    ('Target', 'Nintendo Switch Lite - Turquoise', 199.99, '2019-09-20', 'Hardware'),
    ('Target','Nintendo Switch Lite - Gray', 199.99, '2019-09-20', 'Hardware'),
    ('Target', 'Nintendo Switch Lite - Yellow', 199.99, '2019-09-20', 'Hardware'),
    ('Target', 'Nintendo Switch Lite - Coral', 199.99, '2019-09-20', 'Hardware');

INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate,
    p_type
    )
VALUES
    ('Target','Astral Chain', 39.99, '2019-08-30', 'Software');

INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate,
    p_type
    )
VALUES
    ('Amazon', 'Daemon X Machina', 59.99, '2019-09-13', 'Software');

INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate,
    p_type
    )
VALUES
    ('Walmart', 'Mario Kart 8 Deluxe', 59.99, '2017-04-27', 'Software');

INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate,
    p_type
    )
VALUES
    ('Amazon', 'Nintendo Switch Pro Controller', 59.99, '2017-03-03', 'Hardware');



INSERT INTO 
    products(
    p_storeName,
    p_prodName,
    p_price,
    p_releasedate,
    p_type
    )
VALUES
    ('Walmart', 'Nintendo Switch Joy-Con Wheel Accessory Pair', 33.50, '2017-04-28', 'Hardware');


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
        is_storeNum = sE_storeNum;