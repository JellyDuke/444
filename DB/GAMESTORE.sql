CREATE TABLE MEMBERS(
    MID NVARCHAR2(50),
    MPW NVARCHAR2(100) NOT NULL,
    MNAME NVARCHAR2(10) NOT NULL,
    MNICKNAME NVARCHAR2(12) NOT NULL,
    MPOINT NUMBER(10,0),
    MPROFILE NVARCHAR2(1000),
    MSTATE NCHAR(2) NOT NULL
);
DROP TABLE MEMBERS;
SELECT * FROM MEMBERS;
ALTER TABLE MEMBERS
ADD CONSTRAINT PK_MEMBERS_MID PRIMARY KEY(MID)
ADD CONSTRAINT UK_MEMBERS_MNICKNAME UNIQUE(MNICKNAME);

CREATE TABLE GAMES(
    GCODE NVARCHAR2(7),
    GNAME NVARCHAR2(50) NOT NULL,
    GCONTENT NVARCHAR2(2000) NOT NULL,
    GSYSTEM NVARCHAR2(500) NOT NULL,
    GPUBLISHER  NVARCHAR2(100),
    GMAKER NVARCHAR2(100) NOT NULL,
    GRELEASE DATE NOT NULL,
    GMAINIMG NVARCHAR2(100) NOT NULL,
    GIMG NVARCHAR2(1000) NOT NULL,
    GVIDEO NVARCHAR2(1000),
    GPRICE NUMBER(6,0) NOT NULL,
    GSALE NUMBER(3,2) NOT NULL,
    GDEADLINE DATE,
    GTAG NVARCHAR2(300) NOT NULL,
    GSTATE NCHAR(1) NOT NULL
);
DROP TABLE GAMES;
SELECT * FROM GAMES;
ALTER TABLE GAMES
ADD CONSTRAINT PK_GAMES_GCODE PRIMARY KEY(GCODE)
ADD CONSTRAINT UK_GAMES_GNAME UNIQUE(GNAME);

CREATE TABLE SHOPBASKET(
    SCODE NVARCHAR2(7),
    SMCODE NVARCHAR2(50) NOT NULL,
    SGCODE NVARCHAR2(7) NOT NULL
);
DROP TABLE SHOPBASKET;
SELECT * FROM SHOPBASKET;
ALTER TABLE SHOPBASKET
ADD CONSTRAINT PK_SHOPBASKET_GCODE PRIMARY KEY(SCODE)
ADD CONSTRAINT FK_SHOPBASKET_SMCODE FOREIGN KEY(SMCODE)
REFERENCES  MEMBERS(MID)
ADD CONSTRAINT FK_SHOPBASKET_SGCODE FOREIGN KEY(SGCODE)
REFERENCES GAMES(GCODE);

CREATE TABLE ORDERS(
    OCODE NVARCHAR2(7),
    ODATE DATE NOT NULL,
    OPRICE NUMBER(7,0) NOT NULL,
    OORIGINPRICE NUMBER(6,0),
    ODISCOUNT NUMBER(3,2) NOT NULL,
    OCCODE NVARCHAR2(12),
    OITEM NVARCHAR2(100) NOT NULL,
    OMCODE NVARCHAR2(20),
    OSTATE NCHAR(1) NOT NULL    
);
DROP TABLE ORDERS;
SELECT * FROM ORDERS;
ALTER TABLE ORDERS
ADD CONSTRAINT PK_ORDERS_OCODE PRIMARY KEY(OCODE)
ADD CONSTRAINT FK_ORDERS_OMCODE FOREIGN KEY(OMCODE)
REFERENCES  MEMBERS(MID)
/*ADD CONSTRAINT FK_ORDERS_CCODE FOREIGN KEY(OCCODE)
REFERENCES COUPONS(CCODE);*/