ALTER TABLE mytek 
RENAME COLUMN  `MyUnknownColumn` to `price`,
RENAME COLUMN  `Écran 15.6" Full HD` to `screen` ,
RENAME COLUMN  `Mémoire RAM: 20 Go DDR4` to `Ram` ,
RENAME COLUMN  `Carte graphique: Intel UHD Graphics avec WiFi,` to `graphics_card` ,
RENAME COLUMN `Poroceseur` to `processor`,
RENAME COLUMN `Disque dur: 256Go SSD` to `Hard_disk`;

ALTER TABLE tunisianet
RENAME COLUMN `productreference` to `Description` ,
RENAME COLUMN `listds` to `screen` ,
RENAME COLUMN `Column1` to `processor` ,
RENAME COLUMN `Column3` to  `Ram`,
RENAME COLUMN `Column4` to `Hard_disk`,
RENAME COLUMN `Column5` to `graphics_card`;
-- Tunisianet
UPDATE tunisianet
SET processor=CONCAT(processor, ' ', column2);

ALTER TABLE tunisianet
DROP COLUMN column2;

-- checking tunisianet data
select * from tunisianet;

SELECT screen 
FROM tunisianet
WHERE screen NOT LIKE '%ecran%';

SELECT processor 
FROM tunisianet
WHERE processor NOT LIKE '%intelcore%';

SELECT ram 
FROM tunisianet
WHERE ram NOT LIKE '%Mémoire%' AND
ram NOT LIKE '%ram%';

SELECT graphics_card
FROM tunisianet
WHERE graphics_card NOT LIKE '%cartegraphique%';

SELECT hard_disk
FROM tunisianet
WHERE hard_disk NOT LIKE '%disque%';

-- fixing processor column data 

SELECT processor , ram
FROM tunisianet
WHERE ram LIKE '%ProcesseurIntelCore%' ;

UPDATE tunisianet
SET 
processor = ram,
ram = NULL  
WHERE ram LIKE '%ProcesseurIntelCore%' ;

SELECT title ,  ram , graphics_card , processor
FROM tunisianet
WHERE ram LIKE '%u%' ;

UPDATE tunisianet
SET processor = CONCAT(processor, ' ', ram),
ram = NULL
WHERE ram LIKE '%u%';

-- changing wrong ram data to null

SELECT ram 
FROM tunisianet
WHERE ram NOT LIKE '%Mémoire%' AND
ram NOT LIKE '%ram%';

UPDATE tunisianet
SET ram = NULL
WHERE ram NOT LIKE '%Mémoire%' 
and ram NOT LIKE '%ram%';

-- getting  ram data from graphics_card and hard_disk

SELECT ram , graphics_card 
FROM tunisianet
WHERE graphics_card LIKE '%Mémoire8%'OR
 graphics_card LIKE '%Mémoire32%' OR
 graphics_card LIKE '%Mémoire16%' ;
 
UPDATE tunisianet
SET ram= graphics_card ,
graphics_card = NULL
WHERE graphics_card LIKE '%Mémoire8%'OR
graphics_card LIKE '%Mémoire32%' OR
graphics_card LIKE '%Mémoire16%';

SELECT ram , Hard_disk 
FROM tunisianet
WHERE Hard_disk LIKE '%Mémoire%';

UPDATE tunisianet
SET ram = hard_disk,
hard_disk =  NULL
WHERE Hard_disk LIKE '%Mémoire%';

-- fixing hard_disk and graphics_card data

SELECT hard_disk , graphics_card
FROM tunisianet 
WHERE graphics_card NOT LIKE '%carte%' AND
graphics_card NOT LIKE '%intel%' ;

UPDATE tunisianet
SET hard_disk = graphics_card ,
graphics_card = hard_disk
WHERE graphics_card NOT LIKE '%carte%' AND
graphics_card NOT LIKE '%intel%' ;

-- checking MYTEK data
select * from mytek ;

SELECT screen 
FROM mytek
WHERE screen NOT LIKE '%Écran%';

SELECT processor 
FROM mytek
WHERE processor NOT LIKE '%Processeur%';

SELECT ram 
FROM mytek
WHERE ram NOT LIKE '%Mémoire%' AND
ram NOT LIKE '%ram%';

SELECT graphics_card
FROM mytek
WHERE graphics_card NOT LIKE '%carte graphique%';

SELECT hard_disk
FROM mytek
WHERE hard_disk NOT LIKE '%disque%';

-- fixing processor column

UPDATE mytek
SET processor = concat(processor ," " ,`Unnamed: 5` ) ;

ALTER TABLE mytek
DROP COLUMN `Unnamed: 5` ;

-- fixing ram column

SELECT systeme , ram , hard_disk , graphics_card
FROM mytek
WHERE systeme NOT LIKE '% Système %'
AND ram NOT LIKE '5600';

UPDATE mytek 
SET 
graphics_card = hard_disk,
hard_disk = ram,
ram = systeme,
systeme = NULL
WHERE systeme NOT LIKE '% Système %'
and ram NOT LIKE '5600';
 
-- fixing hard_disk 

SELECT hard_disk , `Unnamed: 6`
FROM mytek
WHERE hard_disk NOT LIKE '%disque%';

UPDATE mytek
SET hard_disk = `Unnamed: 6` ,
`Unnamed: 6` = NULL
WHERE hard_disk NOT LIKE '%disque%';

ALTER TABLE mytek
DROP COLUMN `Unnamed: 6`;

-- fixing graphics_card

SELECT graphics_card 
FROM mytek WHERE graphics_card = '';

UPDATE mytek
SET graphics_card = TRIM(SUBSTRING_INDEX(graphics_card, 'avec', 1));

-- removing '?' from price

UPDATE mytek
SET price = REPLACE(price, '?', '');

-- adding ID to both tables
ALTER TABLE mytek
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE tunisianet
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- creating customer table

CREATE TABLE Customer (
ID INT AUTO_INCREMENT PRIMARY KEY ,
Customer_needs Varchar (100) ,
`Description` TEXT ,
Min_Processor varchar (50) ,
Min_Ram varchar (50) ,
Min_Graphics varchar (50) ,
Min_DISK varchar (50) 
);

INSERT INTO customer (Customer_needs,`Description` , Min_Processor ,Min_Ram ,Min_Graphics  , Min_DISK )
VALUES ('Basic Computing',  'For everyday tasks', 'Processeur Intel Core i3', 'Mémoire 8 Go', 'Intel UHD Graphics', 'Disque dur: 256Go SSD'),
('Gaming (Entry-Level)',  'For office work and casual gaming','Processeur Intel Core i5', 'Mémoire 16 Go', 'RTX 2050', 'Disque dur: 512Go SSD'),
('Gaming (High-End)',  'For maximum gaming performance and streaming', 'Processeur Intel Core i9', 'Mémoire 32 Go', 'RTX 4090', 'Disque dur: 1To SSD'),  
('Photo Editing', 'For photography workflows', 'Processeur Intel Core i5', 'Mémoire 16 Go ', 'Intel UHD Graphics', 'Disque dur: 512Go SSD'),
('Video Editing', 'FOR video editing capabilities','Processeur Intel Core i7','Mémoire 16 Go', 'RTX 3060', 'Disque dur: 1To SSD'), 
('3D Modeling/Rendering', 'Advanced 3D design and rendering','Processeur Intel Core i9', 'Mémoire 32 Go', 'RTX 4070', 'Disque dur: 1To SSD'),
('College Students' ,'For research, presentations','Processeur Intel Core i5', 'Mémoire 8 Go', 'Intel UHD Graphics' , 'Disque dur: 512Go SSD')
;



