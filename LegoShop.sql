
-- Tạo database LegoShop (nếu chưa tồn tại)
CREATE DATABASE IF NOT EXISTS LegoShop;

-- Sử dụng database LegoShop
USE LegoShop;


-- DROP TABLE [user]
DROP TABLE [user]
GO

-- Tạo bảng [user]
CREATE TABLE [user](
   user_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   user_name nvarchar(255) null,
   user_password varchar(255) null,
   user_email varchar(255) null,
   user_phone varchar(255) null,
   user_image NVARCHAR(255) null
);


-- INSERT into [user]
INSERT into [user] ( user_name, user_password, user_email, user_phone, user_image) 
VALUES ( N'HoangBDHE176159', N'BDHoang1908', N'bdhoang03@gmail.com', N'0763310655','Avatar.jpg')
INSERT into [user] ( user_name, user_password, user_email, user_phone, user_image) 
VALUES ( N'Rick', N'Rick', N'Rick@gmail.com', N'01234567879','Rick.jpg')
INSERT into [user] ( user_name, user_password, user_email, user_phone, user_image) 
VALUES ( N'Snowball', N'Snowball', N'Snowball@gmail.com', N'03567263835','Snowball.jpg')
INSERT into [user] ( user_name, user_password, user_email, user_phone, user_image) 
VALUES ( N'Morty', N'Morty', N'Morty@gmail.com', N'06784635634','Morty.jpg')
INSERT into [user] ( user_name, user_password, user_email, user_phone, user_image) 
VALUES ( N'Meeseeks', N'Meeseeks', N'Meeseeks@gmail.com', N'035624753','Meeseeks.jpg')



-- DROP TABLE [order]
DROP TABLE [order]
GO

-- Tạo bảng [order]
CREATE TABLE [order](
   order_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   user_id int null,
   price float null,
   date date null,
   FOREIGN KEY(user_id) REFERENCES [user](user_id)
);

-- INSERT into [order]
INSERT into [order] ( user_id, price, date) 
VALUES ( 2,234.45,'2022-03-13' )
INSERT into [order] ( user_id, price, date) 
VALUES ( 3,10063.88,'2022-03-15' )
INSERT into [order] ( user_id, price, date) 
VALUES ( 5,8694.29,'2022-03-11' )
INSERT into [order] ( user_id, price, date) 
VALUES ( 2,36963.16,'2022-03-16' )


-- DROP TABLE [order_detail]
DROP TABLE [order_detail]
GO

-- Tạo bảng [order_detail]
CREATE TABLE [order_detail](
   od_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   order_id int null,
   product_name varchar(255) NULL,
   product_image varchar(255) NULL,
   product_price float NULL,
   quantity int NULL,
   FOREIGN KEY(order_id) REFERENCES [order](order_id)
);

-- INSERT into [order_detail]
INSERT [order_detail] ( order_id, product_name, product_image, product_price, quantity) 
VALUES ( 1, 'Table Football', 'Table Football.jpg', 6021.7800, 1)
INSERT [order_detail] ( order_id, product_name, product_image, product_price, quantity) 
VALUES ( 2, 'Magical Unicorn', 'Magical Unicorn.jpg', 1218.2900, 2)
INSERT [order_detail] ( order_id, product_name, product_image, product_price, quantity) 
VALUES ( 4, 'Jazz Club', 'Jazz Club.jpg', 8035.0100, 1)

-- DROP TABLE [category]
DROP TABLE [category]
GO


-- Tạo bảng [category]
CREATE TABLE [category](
   category_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   category_name nvarchar(255) null
);


-- INSERT into [category]
INSERT into [category] (category_name ) 
VALUES ( N'Sports' )
INSERT into [category] (category_name ) 
VALUES ( N'Animals' )
INSERT into [category] (category_name ) 
VALUES ( N'Buildings' )
INSERT into [category] (category_name ) 
VALUES ( N'Cars' )
INSERT into [category] (category_name ) 
VALUES ( N'Fantasy' )
INSERT into [category] (category_name ) 
VALUES ( N'Movies' )


-- DROP TABLE [product]
DROP TABLE [product]
GO


-- Tạo bảng [product]
CREATE TABLE [product](
   product_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   category_id int null,
   product_name nvarchar(255) null,
   product_image nvarchar(255) null,
   product_quantity int null,
   product_price float,
   product_description VARCHAR(MAX) null,
   FOREIGN KEY(category_id) REFERENCES [category](category_id)
);




-- INSERT into [product]
INSERT into [product] ( category_id, product_name, product_image,product_quantity,product_price,product_description) 
VALUES ( 1,'Real Madrid – Santiago Bernabéu Stadium','Real Madrid – Santiago Bernabéu Stadium.jpg',40,399.99,'The ''Real Madrid – Santiago Bernabéu Stadium'' LEGO set is a captivating recreation of the iconic home of the legendary Real Madrid football club. Featuring meticulous attention to detail, this set allows fans to build and display a miniature version of the Santiago Bernabéu Stadium. It''s the perfect addition to any football enthusiast''s collection, celebrating the rich history and grandeur of one of the world''s most prestigious football venues.')
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (1, 'Ski and Climbing Center', 'Ski and Climbing Center.jpg', 23, 119.99, 'The Ski and Climbing Center LEGO set offers an exciting adventure for outdoor enthusiasts. It combines skiing on pristine slopes and conquering challenging climbing routes. This set is a haven for adventure seekers, providing endless opportunities for exhilarating experiences in the great outdoors.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (1, 'Table Football', 'Table Football.jpg', 43, 174.99, 'The Table Football LEGO set is a thrilling recreation of the classic foosball game. It is perfect for soccer fans and offers a detailed, fun challenge. Whether you are a sports enthusiast or a LEGO collector, this set captures the excitement of table football and is an excellent addition to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (1, 'Icons of Play', 'Icons of Play.jpg', 67, 99.99, 'The Icons of Play LEGO set pays homage to beloved games and pastimes. It encompasses classic board games and timeless toys. This set celebrates the joy and nostalgia these activities bring. It is a must-have for LEGO enthusiasts who appreciate the charm and fun of iconic games and toys.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (1, 'Sports Center', 'Sports Center.jpg', 84, 94.99, 'The Sports Center LEGO set is a dynamic creation for sports lovers. It features various sports and activities like basketball, tennis, and more. With meticulous attention to detail, this set is perfect for those who have a passion for the world of sports. It is an exciting addition to your LEGO collection, showcasing the thrill of athleticism.');

INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (2, 'The Insect Collection', 'The Insect Collection.jpg', 36, 79.99, 'The Insect Collection LEGO set is a vibrant world of creepy-crawlies. It allows you to build an array of realistic insects, showcasing their unique features. Whether you have a passion for bugs or simply adore intricate LEGO designs, this set is an ideal choice. Explore the fascinating realm of insects.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (2, 'Jade Rabbit', 'Jade Rabbit.jpg', 345, 65.99, 'The Jade Rabbit LEGO set is a delightful tribute to the famous moon rover. It captures the essence of lunar exploration with intricate details and a charming design. Whether you are a space enthusiast or a LEGO collector, this set is a must-have for celebrating lunar adventures.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (2, 'Exotic Parrot', 'Exotic Parrot.jpg', 678, 19.99, 'The Exotic Parrot LEGO set is a colorful celebration of tropical birds. It allows you to build vibrant parrots with stunning plumage and lifelike features. Whether you are a bird lover or enjoy vibrant LEGO creations, this set is perfect. Bring the beauty of exotic parrots into your LEGO collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (2, 'Magical Unicorn', 'Magical Unicorn.jpg', 32, 94.99, 'The Magical Unicorn LEGO set is a whimsical journey into fantasy. It allows you to create enchanting unicorns with sparkling details and graceful designs. Whether you are a fan of mythical creatures or enjoy imaginative LEGO projects, this set is a magical addition to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (2, 'ATV and Otter Habitat', 'ATV and Otter Habitat.jpg', 67, 9.99, 'The ATV and Otter Habitat LEGO set is an exciting outdoor adventure. It features an all-terrain vehicle and a playful otter habitat. Whether you are a nature lover or an adventure seeker, this set offers fun and exploration in the world of LEGO. Discover the thrill of the great outdoors.');



INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (3, 'Eiffel Tower', 'eiffeltower.jpg', 342, 179.99, 'The Eiffel Tower LEGO set is a magnificent replica of the iconic Parisian landmark. It allows you to build a detailed version of this historic structure, celebrating the City of Light. Whether you are a Francophile or a LEGO enthusiast, this set adds a touch of Parisian elegance to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (3, 'Jazz Club', 'Jazz Club.jpg', 336, 95.99, 'The Jazz Club LEGO set captures the vibrant world of jazz music. It features a lively club scene with musical instruments and a jazzy atmosphere. Whether you are a music lover or a fan of LEGO architecture, this set brings the rhythm of jazz to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (3, 'A-Frame Cabin', 'A-Frame Cabin.jpg', 67, 89.99, 'The A-Frame Cabin LEGO set is a cozy mountain retreat. It allows you to build a charming cabin in a picturesque setting. Whether you love the great outdoors or appreciate rustic LEGO designs, this set offers a peaceful escape in your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (3, 'Himeji Castle', 'Himeji Castle.jpg', 134, 74.99, 'The Himeji Castle LEGO set is a tribute to Japanese architecture. It lets you construct the majestic Himeji Castle, an iconic symbol of Japan. Whether you are a history enthusiast or a LEGO architect, this set is a cultural masterpiece in your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (3, 'The White House', 'The White House.jpg', 154, 39.99, 'The White House LEGO set is a miniature replica of the historic presidential residence. It allows you to recreate this iconic building. Whether you are interested in history or simply enjoy LEGO architecture, this set is a patriotic addition to your collection.');




INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description)
VALUES (4, 'LEGO® DC BatmanTM BatmobileTM Tumbler', 'LEGO® DC BatmanTM BatmobileTM Tumbler.jpg', 835, 19.99, 'Experience the thrill of Gotham City with the LEGO® DC Batman™ Batmobile™ Tumbler. This iconic set captures the essence of Batman''s legendary vehicle with meticulous detail and an impressive 835-piece build. Whether you''re a fan of DC Comics or a LEGO enthusiast, this model is a must-have. It''s a fantastic display piece with its sleek design and comes with a reasonable price of $19.99. Get ready to dive into the world of superheroes and crime-fighting with this amazing LEGO creation.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (4, 'Lamborghini Huracán Tecnica', 'Lamborghini Huracán Tecnica.jpg', 234, 75.99, 'Experience the power and style of the Lamborghini Huracán Tecnica. This meticulously designed model features stunning details and a high-quality build. With 234 pieces, it is a must-have for car enthusiasts. Priced at $75.99, it is a fantastic addition to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (4, 'PEUGEOT 9X8 24H Le Mans Hybrid Hypercar', 'PEUGEOT 9X8 24H Le Mans Hybrid Hypercar.jpg', 124, 66.99, 'Experience the future of racing with the PEUGEOT 9X8 24H Le Mans Hybrid Hypercar. This 124-piece model captures the essence of endurance racing. With meticulous detailing, it is a must-have for motorsport enthusiasts. Priced at $66.99, it is an exciting addition to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (4, 'Land Rover Classic Defender 90', 'Land Rover Classic Defender 90.jpg', 352, 90.99, 'Discover the rugged elegance of the Land Rover Classic Defender 90. This 352-piece model boasts exceptional detail and a high-quality build. It is a must-have for off-road enthusiasts and collectors. With a price of $90.99, it is a valuable addition to your collection.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (4, 'Land Rover Classic Defender', 'Land Rover Classic Defender.jpg', 23, 55.99, 'Experience the timeless appeal of the Land Rover Classic Defender. This 23-piece model offers a compact yet detailed representation of the iconic vehicle. Whether you are a Land Rover enthusiast or a collector, it is a great addition to your collection. Priced at $55.99, it is a budget-friendly choice.');




INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (5, 'Hogwarts™ Castle and Grounds', 'Hogwarts™ Castle and Grounds.jpg', 462, 9.99, 'Explore the enchanting world of Hogwarts™ with this 462-piece LEGO set. Capture the magic of the castle and its grounds. Perfect for fans of wizardry, it''s priced at just $9.99. Unleash your creativity and embark on a magical journey.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (5, 'Executor Super Star Destroyer™', 'Executor Super Star Destroyer™.jpg', 243, 759.99, 'Conquer the galaxy with the Executor Super Star Destroyer™ LEGO set. This 243-piece kit features incredible detail. Ideal for Star Wars fans and collectors, it''s priced at $759.99. Embark on epic space adventures in style.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (5, 'THE LORD OF THE RINGS: RIVENDELL™', 'THE LORD OF THE RINGS.jpg', 124, 606.99, 'Enter the mystical realm of Rivendell with this 124-piece LEGO set. Recreate the magic of Middle-earth. Perfect for Tolkien enthusiasts, it''s priced at $606.99. Embark on epic adventures with your favorite characters.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (5, 'X-Wing Starfighter™', 'X-Wing Starfighter™.jpg', 245, 99.99, 'Join the Rebel Alliance with the X-Wing Starfighter™ LEGO set. This 245-piece kit brings the Star Wars universe to life. Perfect for fans of the franchise, it''s priced at $99.99. Prepare for intergalactic battles.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (5, 'Dagobah™ Jedi™ Training Diorama', 'Dagobah™ Jedi™ Training Diorama.jpg', 231, 50.99, 'Train with the Force on Dagobah™ with this 231-piece LEGO diorama. Relive iconic Star Wars moments. Perfect for Jedi enthusiasts, it''s priced at $50.99. Master your skills on the swampy planet.');


INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (6, 'Batcave™ – Shadow Box', 'Batcave™ – Shadow Box.jpg', 35, 17.99, 'Explore the Batcave™ in a unique Shadow Box format. With 35 pieces, this set allows you to create a miniature Batcave. Priced at $17.99, it''s a must-have for Batman fans and collectors.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (6, 'Ahsoka Tano™', 'Ahsoka Tano™.jpg', 23, 70.99, 'Join the Star Wars universe with the Ahsoka Tano™ LEGO set. With 23 pieces, this model captures the essence of the iconic character. Priced at $70.99, it''s a great addition for fans.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (6, 'Dobby™ the House-Elf', 'Dobby™ the House-Elf.jpg', 24, 60.99, 'Bring Dobby™ the House-Elf to life with this 24-piece LEGO set. Recreate magical moments from the Wizarding World. Priced at $60.99, it''s perfect for Harry Potter fans.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (6, 'I am Groot', 'I am Groot.jpg', 35, 99.99, 'Embrace the world of Guardians of the Galaxy with the "I am Groot" LEGO set. This 35-piece model captures the charm of Groot. Priced at $99.99, it''s a must-have for Marvel enthusiasts.');
INSERT INTO [product] (category_id, product_name, product_image, product_quantity, product_price, product_description) 
VALUES (6, 'Black Panther', 'Black Panther.jpg', 239, 54.99, 'Enter the Marvel Universe with the Black Panther LEGO set. This 239-piece model embodies the iconic character. Priced at $54.99, it''s a thrilling addition for superhero fans.');



-- Sử dụng [] để tránh lý do (vì nó là từ khóa mà không đặt được)

DROP TABLE [feedback]
GO

-- Tạo bảng [feedback]
CREATE TABLE [feedback](
   feedback_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   feedback_name nvarchar(255) null,
   feedback_content nvarchar(255) null
);


-- Điền dữ liệu vào bảng [feedback]
INSERT INTO [feedback] (feedback_name, feedback_content)
VALUES ('hoang', 'adaf');
