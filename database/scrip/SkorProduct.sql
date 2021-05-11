CREATE database `skorproduct`;
USE `skorproduct`;

DROP TABLE IF EXISTS `Brands`;
CREATE TABLE `Brands` (
    `BrandId` INT(10) NOT NULL,
    `BrandName` VARCHAR(40) NOT NULL
);
ALTER TABLE `Brands` ADD CONSTRAINT `brands_pk` PRIMARY KEY ( `BrandId` );

DROP TABLE IF EXISTS `SkorProduct`;
CREATE TABLE `SkorProduct` (
    `ProductId` INT(10) NOT NULL,
    `ColorId` INT(10) NOT NULL
);
ALTER TABLE `SkorProduct` ADD CONSTRAINT `skorproduct_pk` PRIMARY KEY ( `ProductId`, `ColorId` );

DROP TABLE IF EXISTS `Colors`;
CREATE TABLE `Colors` (
    `ColorId` INT(10) NOT NULL,
    `ColorName` VARCHAR(15) NOT NULL
);
ALTER TABLE `Colors` ADD CONSTRAINT `colors_pk` PRIMARY KEY ( `ColorId` );

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products` (
    `ProductId` INT(10) NOT NULL AUTO_INCREMENT,
    `ProductName` VARCHAR(40) NOT NULL,
    `ProductDescription` VARCHAR(1000) NOT NULL,
    `ProductType` VARCHAR(20) NOT NULL,
    `ProductSize` VARCHAR(10) NOT NULL,
    `ProductPrice` DECIMAL(10,2) NOT NULL,
    `ProductDate` DATE NOT NULL,
    `ProductImg` VARCHAR(255),
    `BrandId` INT(10) NOT NULL,
     PRIMARY KEY (ProductId)
);

ALTER TABLE `Products` ADD CONSTRAINT `products_uk` UNIQUE ( `ProductName` );
ALTER TABLE `Products`
    ADD CONSTRAINT `brandid` FOREIGN KEY ( `BrandId` )
        REFERENCES `Brands` ( `BrandId` );
ALTER TABLE `SkorProduct`
    ADD CONSTRAINT `skorproduct_colors_fk` FOREIGN KEY ( `ColorId` )
        REFERENCES `Colors` ( `ColorId` );
ALTER TABLE `SkorProduct`
    ADD CONSTRAINT `skorproduct_products_fk` FOREIGN KEY ( `ProductId` )
        REFERENCES `Products` ( `ProductId` );

/*Insert Data Collection*/

/*Data for the table Brands*/
insert into `Brands` values
(1, 'Adidas');
insert into `Brands` values
(2, 'Nike');
insert into `Brands` values
(3, 'New Balance');
insert into `Brands` values
(4, 'Converse');
insert into `Brands` values
(5, 'Vans');
insert into `Brands` values
(6, 'Fila');

/*Data for the table Colors*/
insert into `Colors` values
(1, '#000000');
insert into `Colors` values
(2, '#FFFFFF');
insert into `Colors` values
(3, '#B7B7A4');
insert into `Colors` values
(4, '#70E000');
insert into `Colors` values
(5, '#56CFE1');
insert into `Colors` values
(6, '#013A63');
insert into `Colors` values
(7, '#BE0AFF');
insert into `Colors` values
(8, '#FF7AA2');
insert into `Colors` values
(9, '#EF233C');
insert into `Colors` values
(10, '#FFE100');


/*Data for the table Products*/
insert  into `Products`  values 
(1, 'STAN SMITH', 'Trying to decide between sporty casual and dressed-up glam? Why not do both? These adidas Stan Smith shoes have the same buttery-soft leather upper as the 1971 original, dressed up with sparkling crystals from Swarovski.', 'Men/Women', '35.5-44', '3200.00', '2020-08-13', 'Stansmith.png', 1 );
insert  into `Products`  values 
(2, 'NMD R1', 'the NMD legacy in these adidas NMD_R1 Shoes. Plush Boost cushioning keeps your city adventure feeling like you are walking on clouds. And since your head is sometimes up there, it is not a bad place for your feet to be too. Great for those sunup to sundown days, the soft knit textile upper doubles down on the comfort.', 'Men/Women', '35.5-44', '4600.00', '2020-06-04', 'Nmdr.png', 1 );
insert  into `Products`  values 
(3, 'ULTRABOOST DNA', 'Run to move your body. Run to clear your head. The adidas Ultraboost DNA Shoes give you endless energy over the miles. The sleek silhouette makes them a favourite beyond the world of running. An adidas Primeknit upper brings comfort to your everyday wandering too.', 'Men/Women', '35.5-44', '6000.00', '2020-07-07', 'Ultraboostdna.png', 1 );
insert  into `Products`  values 
(4, 'ULTRABOOST 21', 'Prototype after prototype. Innovation after innovation. Testing after testing. Meet us in the hot pursuit of the pinnacle harmonization of weight, cushioning, and responsiveness. Ultraboost 21. Say hello to incredible energy return.', 'Men/Women', '35.5-44', '6500.00', '2020-08-21', 'Ultraboost21.png', 1 );
insert  into `Products`  values 
(5, 'Superstar', 'Designed for basketball in the 70s, glorified by hip-hop fans of the 80s, the adidas Superstar has become a must-have item for today street-dwellers. The world-famous seashell design retains the original style and protection of the basketball court, eliminating the worry of being hit by your feet at festivals or on the street. Maintain the original look with jagged 3-Stripes and the adidas Superstar logo in a square frame.', 'Men/Women', '35.5-44', '3200.00', '2020-08-15', 'Superstar.png', 1 );
insert  into `Products`  values 
(6, 'SLIP-ON SUPERSTAR', 'Why waste time tying your shoes? When you are ready to travel and teleport to meet your friends immediately. The adidas Superstar was originally an icon of the basketball court. But now it has become a shoe that stands out on the road, runway, or anywhere else, reinforcing its original design with a smooth upper and comfortable cups. Turn the top design from classic laces into straps for a sleek and easy slip-on style.', 'Men/Women', '35.5-44', '3200.00', '2020-12-06', 'Slipon.png', 1 );
insert  into `Products`  values 
(7, 'OZWEEGO ZIP', 'Yesterday from the 90s, cutting edge technology And perspectives of the future These adidas OZWEEGO shoes are ready to transform your look with bold style from the past and soft cushioning that will keep you moving forward. Into the future that belongs to you Zippered upper lets you put your shoes on and go quickly.', 'Men/Women', '35.5-44', '4700.00', '2020-10-05', 'Ozweego.png', 1 );
insert  into `Products`  values 
(8, 'Jordan delta2', 'The Jordan Delta 2 delivers fearless, fresh style that builds on the elements. You want durability, comfort and a Jordan-like attitude to the core - we have revamped the design lines and replaced some of the components.', 'Women', '35.5-40', '5000.00', '2020-02-01', 'Jordan Delta.png', 2 );
insert  into `Products`  values 
(9, 'Nike Air Force 1 Shadow', 'The Nike Air Force 1 Shadow brings a playful twist to a classic basketball shoe. Stand out by layering layers. It features a double-stacked brand and an enlarged midsole to emphasize a style approach and double the fun.', 'Women', '35.5-40', '4200.00', '2020-05-13', 'Air force 1.png', 2 );
insert  into `Products`  values 
(10, 'Nike Air Force 1 LV8', 'Nike Air Force 1 has a new twist. Classic basketball shoes from 1982 reimagined for the game. (In a better way) with a pixelated Swoosh and an iridescent pearlescent. With all the details you know and love Who wants to play?', 'Men', '39-44', '2900.00', '2020-04-29', 'Air F LV8.png', 2 );
insert  into `Products`  values 
(11, 'Nike Air Force 1 07', 'Joy lives in the Nike Air Force 1 07, an iconic basketball shoe that brings a fresh twist to what you know best. Be it the sharp leather, the eye-catching colors and the perfect sparkle that makes you shine.', 'Women', '35.5-40', '3500.00', '2020-07-02', 'Air F 07.png', 2 );
insert  into `Products`  values 
(12, 'Nike OverBreak SP', 'The Nike OverBreak SP fuses iconic BRS track-shoe aesthetics with this sleek Nike OverReact accent, giving everyone an eye-popping style and superior comfort. There is an overlay from synthetic suede that is characterized by gradation dyeing for an added elegance While colorful laces and translucent toe caps are ready to show off.', 'Men', '39-44', '5200.00', '2020-11-11', 'Overbreak.png', 2 );
insert  into `Products`  values 
(13, 'Nike Blazer Mid 77 Vintage', 'In the 70s, Nike is shoes were the new shoes that just launched. Our brand at the time was still trying to pioneer the basketball scene. And still have to let the basketball team in the city try the shoes to test the prototype. Of course, the design is constantly evolving Over the years But the model name remains the same, the Nike Blazer Mid 77 Vintage has always been a classic. From the first day until today.', 'Men', '41-47', '3600.00', '2021-02-28', 'Blazer.png', 2 );
insert  into `Products`  values 
(14, 'Nike Dunk Low WMNS “Easter”', 'This Nike Dunk Low features a White leather base with pastel hues covering the overlays, Swooshes, tongue labels, heels, and inner lining. A White midsole atop a Yellow speckled rubber sole completes the design.', 'Women', '35.5-40', '3500.00', '2021-11-13', 'Dunk easter.png', 2 );
insert  into `Products`  values 
(15, 'Nike Air Max 90', 'The Nike Air Max 90 follows the original OG running shoe with a signature waffle outsole. Stitched outer overlay And TPU details highlight the classic style color New shades add power to the look The Max Air cushioning system adds comfort to the journey.', 'Women', '35.5-40', '4600.00', '2020-05-12', 'Airmax 90.png', 2 );
insert  into `Products`  values 
(16, 'Nike Air Flight 89', 'Keep the fun alive with the Nike Air Flight 89, the iconic basketball shoe that takes you back to OG basketball style with retro colors. The top cover from the leather is sharp. And the straps over the longer feet The pair pays homage to Nike is all-star all-star Roswell Rayguns, featuring retro Raygun colors and embroidered accents. And details according to other trends That will bring you back to the year 1975.', 'Men', '41-47', '4600.00', '2020-04-19', 'Air Flight.png', 2 );
insert  into `Products`  values 
(17, 'Mens Made in US 993', 'Superior comfort meets classic style in our men Made in US 993 running shoe. A favorite from the legendary 990 series, the 993 features responsive cushioning and premium materials ready for a run or all-day wear.', 'Men', '40-46', '5800.00', '2020-09-12', 'Mens.png', 3 );
insert  into `Products`  values 
(18, 'Fresh Foam Roav', 'The Fresh Foam Roav keeps you comfortable on the go. Fresh Foam cushioning creates a soft underfoot feel, while the Ultra Heel provides a snug, locked-in fit.', 'Men', '40-47', '2600.00', '2020-09-17', 'Fresh.png', 3 );
insert  into `Products`  values 
(19, '574', 'The 574 women’s sneaker is a collectible icon. With clean lines, a classic profile, and fun color schemes inspired by classic windbreakers, this shoe makes a standout, everyday statement that remains true to its 80s heritage. Modern comfort upgrades such as supportive ENCAP midsole cushioning and lightweight textile uppers help ensure these kicks feel as good as they look.', 'Women', '35.5-40', '2900.00', '2021-02-14', '574.png', 3 );
insert  into `Products`  values 
(20, 'Numeric 440 High', 'Our New Balance Numeric NM440 is now available in a supportive high top with the NM440 High, blending premier technology with soft cushioning to create a go-to shoe for both everyday skate and wear. Featuring a 70s-inspired suede and mesh upper, this modern-retro shoe boasts both breathability and durability. A C-CAP heel wedge in the midsole helps protect against impact, while NDurance rubber outsole technology provides protection in high-wear areas to help get more out of these trusted shoes.', 'Women', '35.5-40', '3200.00', '2021-02-02', 'Numeric440.png', 3 );
insert  into `Products`  values 
(21, 'Sola Sleek', 'Subtle and stylish, the women is Sola Sleek shoe highlights your femininity by accentuating your stance. The almond-shaped toe is unique in its design, while the open collar provides exceptional support without sacrificing style points. With a lightweight EVA foam cushioning and an NB Comfort Insert for added support, these women is shoes are comfortable enough for all-day wear.', 'Women', '35.5-40', '2300.00', '2021-01-03', 'Solasleek.png', 3 );
insert  into `Products`  values 
(22, 'FuelCell Trainer', 'Subtle and stylish, the women Sola Sleek shoe highlights your femininity by accentuating your stance. The almond-shaped toe is unique in its design, while the open collar provides exceptional support without sacrificing style points. With a lightweight EVA foam cushioning and an NB Comfort Insert for added support, these women shoes are comfortable enough for all-day wear.', 'Women', '35.5-40', '4200.00', '2021-04-18', 'Fuelcell.png', 3 );
insert  into `Products`  values 
(23, 'TWO WXY', 'For the players unbound by position, no longer defined by 1 through 5, the TWO WXY is built for your style of play. Hyper-engineered for speed and agility at both ends of the court, it’s a performance shoe packed with tech for that explosive moment when you switch from offense to defense to offense again. The TWO WXY specializes in versatility—the playmaker of today’s positionless game.', 'Men', '40-46', '5800.00', '2021-04-13', 'Twowxy.png', 3 );


/*Data for the table SkorProduct*/
insert into `SkorProduct` values
(1, 2);
insert into `SkorProduct` values
(1, 4);
insert into `SkorProduct` values
(2, 1);
insert into `SkorProduct` values
(2, 2);
insert into `SkorProduct` values
(3, 1);
insert into `SkorProduct` values
(3, 6);
insert into `SkorProduct` values
(3, 9);
insert into `SkorProduct` values
(4, 8);
insert into `SkorProduct` values
(4, 1);
insert into `SkorProduct` values
(4, 2);
insert into `SkorProduct` values
(5, 1);
insert into `SkorProduct` values
(5, 2);
insert into `SkorProduct` values
(6, 1);
insert into `SkorProduct` values
(6, 2);
insert into `SkorProduct` values
(7, 1);
insert into `SkorProduct` values
(7, 3);
insert into `SkorProduct` values
(8, 2);
insert into `SkorProduct` values
(9, 2);
insert into `SkorProduct` values
(9, 9);
insert into `SkorProduct` values
(10, 2);
insert into `SkorProduct` values
(10, 1);
insert into `SkorProduct` values
(11, 2);
insert into `SkorProduct` values
(11, 1);
insert into `SkorProduct` values
(12, 3);
insert into `SkorProduct` values
(13, 1);
insert into `SkorProduct` values
(13, 4);
insert into `SkorProduct` values
(14, 2);
insert into `SkorProduct` values
(15, 1);
insert into `SkorProduct` values
(15, 2);
insert into `SkorProduct` values
(15, 3);
insert into `SkorProduct` values
(16, 1);
insert into `SkorProduct` values
(17, 1);
insert into `SkorProduct` values
(17, 4);
insert into `SkorProduct` values
(17, 5);
insert into `SkorProduct` values
(17, 3);
insert into `SkorProduct` values
(18, 1);
insert into `SkorProduct` values
(18, 2);
insert into `SkorProduct` values
(18, 5);
insert into `SkorProduct` values
(18, 6);
insert into `SkorProduct` values
(19, 1);
insert into `SkorProduct` values
(19, 5);
insert into `SkorProduct` values
(19, 7);
insert into `SkorProduct` values
(19, 8);
insert into `SkorProduct` values
(20, 1);
insert into `SkorProduct` values
(20, 2);
insert into `SkorProduct` values
(21, 1);
insert into `SkorProduct` values
(21, 2);
insert into `SkorProduct` values
(21, 8);
insert into `SkorProduct` values
(22, 1);
insert into `SkorProduct` values
(22, 2);
insert into `SkorProduct` values
(22, 7);
insert into `SkorProduct` values
(23, 5);
insert into `SkorProduct` values
(23, 8);

COMMIT;

/* create user and grant privileges */

create user 'backend'@'%' identified by 'backendproject';

grant create, select, update, insert, delete on skorproduct.* to 'backend'@'%';
flush privileges;
