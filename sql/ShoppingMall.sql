CREATE TABLE TBL_PRODUCT ( 
    product_id NUMBER(10) NOT NULL,
    name VARCHAR2(40),
    price NUMBER(10),
    category_id NUMBER(10) NOT NULL,
    constraint PK_PRODUCT primary key (product_id)
);

CREATE TABLE TBL_CATEGORY(
    category_id NUMBER(10) NOT NULL,
    name VARCHAR2(20),
    constraint PK_CATEGORY primary key (category_id)
);

CREATE TABLE TBL_SALE(
    sale_id NUMBER(10) NOT NULL,
    product_id NUMBER(10) NOT NULL,
    purchase_date DATE,
    sale_price NUMBER(10) NOT NULL,
    amount NUMBER(5) NOT NULL,
    constraint PK_SALE primary key (sale_id)
);

INSERT INTO TBL_PRODUCT VALUES( 1, '컴퓨터', 1000000, 1);
INSERT INTO TBL_PRODUCT VALUES( 2, '태블릿 PC', 800000, 1);
INSERT INTO TBL_PRODUCT VALUES( 3, '핸드폰', 1200000, 1);
INSERT INTO TBL_PRODUCT VALUES( 4, '헤드셋', 80000, 1);
INSERT INTO TBL_PRODUCT VALUES( 5, '무선 이어폰', 210000, 1);
INSERT INTO TBL_PRODUCT VALUES( 6, '책상', 160000, 2);
INSERT INTO TBL_PRODUCT VALUES( 7, '의자', 90000, 2);
INSERT INTO TBL_PRODUCT VALUES( 8, '소고기', 12000, 3);
INSERT INTO TBL_PRODUCT VALUES( 9, '티셔츠', 58000, 4);

INSERT INTO TBL_CATEGORY VALUES( 1, '전자제품');
INSERT INTO TBL_CATEGORY VALUES( 2, '가구');
INSERT INTO TBL_CATEGORY VALUES( 3, '식품');
INSERT INTO TBL_CATEGORY VALUES( 4, '의류');


INSERT INTO TBL_SALE VALUES( 1, 1, '20200101', 1000000, 1 );
INSERT INTO TBL_SALE VALUES( 2, 2, '20200101', 1600000, 2 );
INSERT INTO TBL_SALE VALUES( 3, 1, '20200101', 2000000, 2 );
INSERT INTO TBL_SALE VALUES( 4, 4, '20200102', 240000, 3 );
INSERT INTO TBL_SALE VALUES( 5, 5, '20200104', 210000, 1 );
INSERT INTO TBL_SALE VALUES( 6, 6, '20200106', 320000, 2 );
INSERT INTO TBL_SALE VALUES( 7, 7, '20200111', 360000, 4 );
INSERT INTO TBL_SALE VALUES( 8, 8, '20200115', 60000, 5 );
INSERT INTO TBL_SALE VALUES( 9, 9, '20200117', 58000, 1 );
INSERT INTO TBL_SALE VALUES( 10, 9, '20200120', 580000, 10 );
INSERT INTO TBL_SALE VALUES( 11, 2, '20200121', 1600000, 2 );
INSERT INTO TBL_SALE VALUES( 12, 1, '20200122', 1000000, 1 );
INSERT INTO TBL_SALE VALUES( 13, 4, '20200124', 80000, 1 );
INSERT INTO TBL_SALE VALUES( 14, 5, '20200126', 210000, 1 );
INSERT INTO TBL_SALE VALUES( 15, 6, '20200129', 160000, 1 );

COMMIT;

SELECT
    TBL_SALE.sale_id,
    TBL_PRODUCT.name,
    TBL_SALE.purchase_date,
    TBL_SALE.sale_price,
    TBL_SALE.amount
FROM 
    TBL_SALE, TBL_PRODUCT
WHERE
    TBL_SALE.product_id = TBL_PRODUCT.product_id;


SELECT
    TBL_PRODUCT.NAME,
    SUM(TBL_PRODUCT.PRICE * TBL_SALE.AMOUNT),
    SUM(TBL_SALE.AMOUNT)
FROM
    TBL_PRODUCT, TBL_SALE
WHERE
    TBL_PRODUCT.product_id = TBL_SALE.product_id
GROUP BY
    TBL_PRODUCT.NAME;