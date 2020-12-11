
-- Triggers to update other tables

-- Dynamically insert product into hardware table when new hardware is added to the products table
CREATE TRIGGER hwInsert AFTER INSERT ON products
BEGIN
    INSERT INTO hardware(h_name, h_price, h_releaseDate)
        SELECT p_prodName, p_price, p_releaseDate
        FROM products
        WHERE
            p_prodName = NEW.p_prodName
            AND p_type = 'Hardware';
END;

CREATE TRIGGER hwUpdate AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    UPDATE hardware
    SET h_price = (SELECT p_price
                   FROM products
                   WHERE
                        p_price = OLD.p_price
                        AND p_type = 'Hardware')
    WHERE
        h_name = (SELECT p_prodName
                  FROM products
                  WHERE
                      p_price = OLD.p_price
                      AND p_type = 'Hardware');

    UPDATE hardware
    SET h_releaseDate = (SELECT p_releasedate
                         FROM products
                         WHERE
                                p_releasedate = NEW.p_releasedate
                                AND p_type = 'Hardware')
    WHERE
        h_name = (SELECT p_prodName
                  FROM products
                  WHERE
                      p_releasedate = NEW.p_releasedate
                      AND p_type = 'Hardware');
END;

-- Delete from the hardware table when a product is delete from the products table
CREATE TRIGGER hwDelete AFTER DELETE ON products
BEGIN
    DELETE FROM hardware
    WHERE
        h_name = (SELECT p_prodName
                FROM products
                WHERE p_prodName = OLD.p_prodName);
END;




-- Dynamically insert product into software table when a new software is added to the products table
CREATE TRIGGER swInsert AFTER INSERT ON products
BEGIN
    INSERT INTO software(s_prodname, s_price, s_releasedate)
        SELECT p_prodName, p_price, p_releaseDate
        FROM products
        WHERE
            p_prodName = NEW.p_prodName
            AND p_type = 'Software';
END;

CREATE TRIGGER swUpdate AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    UPDATE software
    SET s_price = (SELECT p_price
                   FROM products
                   WHERE
                        p_price = NEW.p_price
                        AND p_type = 'Software')
    WHERE
        s_prodName = (SELECT p_prodName
                        FROM products
                        WHERE
                            p_price = NEW.p_price
                            AND p_type = 'Software');

    UPDATE software
    SET s_releasedate = (SELECT p_releasedate
                         FROM products
                         WHERE
                                p_releasedate = NEW.p_releasedate
                                AND p_type = 'Software')
    WHERE
        s_prodName = (SELECT p_prodName
                        FROM products
                        WHERE
                            p_releasedate = NEW.p_releasedate
                            AND p_type = 'Software');
END;

-- Delete from the software table when a product is delete from the products table
CREATE TRIGGER swDelete AFTER DELETE ON products
BEGIN
    DELETE FROM software
    WHERE
        s_prodName = (SELECT p_prodName
                FROM products
                WHERE p_prodName = OLD.p_prodName);
END;


-- TODO: Update price change
CREATE TRIGGER updatePriceChange AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    UPDATE priceChngFreq
    SET pCF_prodStorePrice = (SELECT p_price
                              FROM products
                              WHERE
                                    p_prodName = (SELECT p_prodName
                                                    FROM products
                                                    WHERE p_price = OLD.p_price))
    WHERE
        pCF_prodName = (SELECT p_prodName
                        FROM products
                        WHERE
                            p_price = NEW.p_price)

        AND pCF_storeName = (SELECT p_storeName
                         FROM products
                         WHERE 
                                p_price = NEW.p_price);
END;

--need a trigger for increasing 'instock' and 'contains' table / other relevant tables

-- TODO
CREATE TRIGGER newStock AFTER INSERT ON products
BEGIN
    INSERT INTO inStock(is_prodName, is_storeName, is_storeNum, is_cityID, is_prodAmount)
        SELECT p_prodName, p_storeName, s_storeNum, l_cityID, COUNT(p_prodName)
        FROM products, Store, locations
        WHERE
            p_prodName = NEW.p_prodName
            AND p_storeName = s_storeName;
END;

-- TODO
CREATE TRIGGER updateStock BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    UPDATE inStock
    SET is_prodAmount = COUNT(p_prodName)
    WHERE
        p_prodName = OLD.p_prodName
        AND p_storeName = s_storeName;
END;




DROP TRIGGER hwInsert;
DROP TRIGGER swInsert;
DROP TRIGGER hwUpdate;
DROP TRIGGER swUpdate;
DROP TRIGGER updatePriceChange;
DROP TRIGGER stockup;
DROP TRIGGER checkContain;