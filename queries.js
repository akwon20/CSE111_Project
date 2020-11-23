displayProducts();
displayStores();
displayHardware();
displaySoftware();

selectProduct();
selectStore();

findProductName();


function displayProducts() {
    let sql = `SELECT * FROM products`;

    db.all(sql, [], (err, rows) => {
        if (err) {
            throw err;
        }
        
        rows.forEach((row) => {
            console.log(`${row.p_storeName} ${row.p_prodName} ${row.p_price} ${p_releasedate} ${p_type}`);
        });
    });
}

function displayStores() {
    let sql = `SELECT * FROM Store`;

    db.all(sql, [], (err, rows) => {
        if (err) {
            throw err;
        }

        rows.forEach((row) => {
            console.log(`${row.s_cityID} ${row.s_storeName} ${row.s_storeNum}`);
        });
    });
}

function displayHardware() {
    let sql = `SELECT * FROM hardware`;
    
    db.all(sql, [], (err, rows) => {
        if (err) {
            throw err;
        }

        row.forEach((row) => {
            console.log(`${row.h_name} ${row.h_price} ${row.h_releaseDate}`);
        })
    });
}

function displaySoftware() {
    let sql = `SELECT * FROM software`;

    db.all(sql, [], (err, rows) => {
        if (err) {
            throw err;
        }

        row.forEach((row) => {
            console.log(`${row.s_prodName} ${row.s_price} ${row.s_releasedate}`);
        });
    });
}

function selectProduct() {
    let sql = `SELECT *
                FROM products
                WHERE
                    p_prodName = ?`;
    let prodName;

    db.get(sql, [prodName], (err, row) => {
        if (err) {
            return console.error(err.message);
        }
        return row
            ? console.log(row.p_prodName, row.p_storeName, row.p_price, row.p_releasedate, row.p_type)
            : console.log(`No product found with name ${prodName}`);
    });
}

// function selectStore() {
//     let sql = `SELECT s_storeName
//                 FROM `;
// }

function findProductName() {
    let sql = `SELECT *
                FROM Contains
                WHERE
                    c_prodName = ?`;
    let prodName;

    db.get(sql, [prodName], (err, row) => {
        if (err) {
            return console.error(err.message);
        }
        return row
            ? console.log(row.c_prodName, row.c_storeName, row.p_price, row.c_storeNum, row.c_status)
            : console.log(`No product found with name ${prodName}`);
    });
}