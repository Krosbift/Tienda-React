-- creacion de la base de atos
CREATE DATABASE db_reactprueba;

-- usar la base de atos
USE db_reactprueba;

-- creacion de la tabla de usuario
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) UNIQUE NOT NULL,
  phone INT UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  isAdmin BOOLEAN NOT NULL,
  address TEXT NOT NULL
);

-- creacion de el registro para el usuario admin con password => admin12345
INSERT INTO users (username, password, phone, email, isAdmin, address) VALUES
("admin", "IDxDV01zlMDKBD6GbG3IZA==", 987, "santiago.torifa@utp.edu.co", true, "admin");

-- creacion de la tabla de productos
CREATE TABLE productos (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  detail VARCHAR(255) NOT NULL,
  price INT NOT NULL,
  stockMin INT NOT NULL,
  stockMax INT NOT NULL,
  stockCurrent INT NOT NULL
);

-- creacion de los registros con la informacion de los productos
INSERT INTO productos (name, detail, price, stockMin, stockMax, stockCurrent) VALUES 
("iPhone", "IPS LCD 6,1 1792 x 828 px, 19.5:9 True-tone", 3200000.00, 10, 50, 45),
("Samsung", "Dynamic AMOLED 6,2 pulgadas QHD+ 563 ppp 120 Hz HDR10+", 2800000.00, 10, 50, 45),
("Huawei", "OLED de 6,1 pulgadas Resolución FullHD+ (2.340 x 1.080 píxeles) Formato 19,5:9", 2900000.00, 10, 50, 45),
("Xiaomi", "IPS/LCD de 6,5 pulgadas Resolución FUllHD+ (2.400 x 1.080 píxeles) 405 ppp Tasa de refresco de 90 HZ", 2500000.00, 10, 50, 45),
("LapTop", "Ancho: 358 mm (14.09 pulgadas) Profundidad: 245 mm (9,65 pulgadas)", 3000000.00, 10, 50, 45),
("Ipaad", "Pantalla Retina Resolución de 2160 x 1620 a 264 pixeles por pulgada (ppi) Brillo de 500 nits", 2100000.00, 10, 50, 45),
("Apple Watch", "45 mm 396 x 484 pixeles Área de visualización de 1,143 mm² 41 mm 352 x 430 pixeles Área de visualización de 904 mm", 1200000.00, 10, 50, 45),
("Xbox", "Procesador de 8 núcleos a 3,8 GHz personalizado con microarquitectura AMD Zen 2 y fotolitografía de 7 nm", 3000000.00, 10, 50, 45),
("Play Station 5", "Procesador de 8 núcleos a hasta 3,5 GHz (frecuencia variable)", 3000000.00, 10, 50, 45),
("nintendo switch", "Pantalla. Multitáctil capacitiva de 6.2 pulgadas (15.75 cm) con una resolución de 1280 x 720 ; CPU/GPU", 2100000.00, 10, 50, 45);

-- creacion de la tabla de imagenes
CREATE TABLE images (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idProduct INT NOT NULL,
  image1 TEXT NOT NULL
);

-- creación de los registros con la información de los productos
INSERT INTO images (idProduct, image1) VALUES
(1, "https://www.tehnomedia.rs/products/82115_huge_0_cached.jpg"),
(1, "https://adminapi.applegadgetsbd.com/storage/media/large/1533-41338.jpg"),
(1, "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-iphone-12-pro-max-silver-2020?wid=2000&hei=1897&fmt=jpeg&qlt=95&.v=1635202946000"),
(2, "https://http2.mlstatic.com/D_NQ_NP_693338-MLA52383237205_112022-O.jpg"),
(2, "https://m.media-amazon.com/images/I/51Fiz9bexHL._AC_.jpg"),
(2, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuuBg_CVDztUe9iLM41Ii6W53-GPocaCs3QLO30sH4E_n-NpzwMTGmGk6omObLGewnoA4&usqp=CAU"),
(3, "https://www.alkomprar.com/medias/6901443397341-001-1400Wx1400H?context=bWFzdGVyfGltYWdlc3wyMDIwNjV8aW1hZ2UvanBlZ3xpbWFnZXMvaDU5L2gyNS85NzE1OTU5MjM0NTkwLmpwZ3w2OGQ3NjI5MDA3MTliMzA0ZDU0NTFiMzQ5Njc5MTYyMDVjYTM4ZTU5YjVjNzQyYTZjMjljOGM3ZWEzODE3Mzcx"),
(3, "https://c.dns-shop.ru/thumb/st1/fit/300/300/3a9f8afac34eba892a189ec77b884542/e83b3c791ccc1c5a1d53a53f1c7bcf7966e9a9ebbdda1d0449f740162289286e.jpg"),
(3, "https://www.ktronix.com/medias/6901443397358-004-1400Wx1400H?context=bWFzdGVyfGltYWdlc3wxNDk0MDh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2hiMC85NzE1OTY2MDE3NTY2LmpwZ3w4MTU2NWQxOGQyYTczZjcwOGUwMmZlODJhMGVkNTY4ZTlhOTYyYjEwMDNhZmJmNTQ4YmEwNDg5M2JjMDAyMjE3"),
(4, "https://http2.mlstatic.com/D_NQ_NP_844796-MLA46168332989_052021-O.jpg"),
(4, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOHUHSh-WMQ5ROfFG2hfrflv5cdzpwAwK9heKzqNxV-iiAF9iuKiSmn9yyxkiE6xhji_U&usqp=CAU"),
(4, "https://d1r6yjixh9u0er.cloudfront.net/Custom/Content/Products/25/95/2595_smartphone-xiaomi-redmi-note-10-tela-643-4gb128gb-c00310_m13_637522799666199446.png"),
(5, "https://img.corotos.com.do/variants/z3pt3vr156jwgf6p5d5q8ddkf74l/ce679ccb626c0538ddf96ae31cb4fe352a5677a9ff9b875ffd4f22fc9348637b"),
(5, "https://m.media-amazon.com/images/I/41ZZWcGrNEL.jpg"),
(5, "https://m.media-amazon.com/images/I/41wdrxT3Z6L.jpg"),
(6, "https://falabella.scene7.com/is/image/FalabellaCO/9387133_1?wid=800&hei=800&qlt=70"),
(6, "https://m.media-amazon.com/images/I/51U0IB23thL.jpg"),
(6, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt-PcU3ME74bpQmrk9QJ_3Atdcedz2oD43qs-FtC4qZbcU3YUns_ebQ3D1IsrSToWcvLo&usqp=CAU"),
(7, "https://http2.mlstatic.com/D_NQ_NP_710273-MLA52127704169_102022-O.jpg"),
(7, "https://falabella.scene7.com/is/image/FalabellaCO/46054343_1?wid=800&hei=800&qlt=70"),
(7, "https://cdn.shopify.com/s/files/1/0604/8373/1606/products/IMG-7324720_1445x.jpg?v=1663057351"),
(8, "https://exitocol.vtexassets.com/arquivos/ids/7234186/consola-xbox-series-x-1tb-microsoft.jpg?v=637532554326130000"),
(8, "https://jumbocolombiaio.vtexassets.com/arquivos/ids/340003-800-600?v=637845210483670000&width=800&height=600&aspect=true"),
(8, "https://http2.mlstatic.com/D_NQ_NP_962057-MCO44773036949_022021-V.jpg"),
(9, "https://http2.mlstatic.com/D_NQ_NP_841787-MLA44484414455_012021-O.jpg"),
(9, "https://exitocol.vtexassets.com/arquivos/ids/9154827-800-auto?v=637631028231230000&width=800&height=auto&aspect=true"),
(9, "https://exitocol.vtexassets.com/arquivos/ids/9154830-800-auto?v=637631028235770000&width=800&height=auto&aspect=true"),
(10, "https://exitocol.vtexassets.com/arquivos/ids/2458637/consola-nintendo-switch-neon-joycon-nueva-version-2019.jpg?v=637298193778300000"),
(10, "https://stylewatch.vtexassets.com/arquivos/ids/195015/Nintendo-Switch-Consolea-NIN230-02.jpg?v=637600713111630000"),
(10, "https://falabella.scene7.com/is/image/FalabellaPE/882047687_1?wid=800&hei=800&qlt=70");