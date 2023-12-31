-- Insertar datos en la tabla Tipo
INSERT INTO Tipo (nombre) VALUES
  ('Monitores'),
  ('Escritorio'),
  ('Gamer'),
  ('Auriculares'),
  ('Partes de PC'),
  ('Teclado'),
  ('PC Armada'),
  ('Celular');

-- Insertar datos en la tabla Seccion
INSERT INTO Seccion (nombre) VALUES
  ('masVisto'),
  ('ninguna'),
  ('ofertas');
  
-- Insertar datos en la tabla Marca
INSERT INTO Marca (nombre) VALUES
  ('ViewSonic'),
  ('The Game House'),
  ('MSI'),
  ('Newvision'),
  ('Gigabyte'),
  ('Sony'),
  ('Megaport'),
  ('Xbox 360'),
  ('Apple'),
  ('Samsung'),
  ('Razer');

-- Insertar datos en la tabla Producto
INSERT INTO Producto (nombre, precio, img, descripcion, tipoId, marcaId, descuento, seccionId)
VALUES
  ('Monitor gamer ViewSonic XG3220 LCD', 7700, '/images/images_products/monitor.png', 'Tamaño de Pantalla Generoso: Con su pantalla LCD TFT de 32 pulgadas, el ViewSonic XG3220 brinda un campo visual expansivo que sumerge al usuario en una experiencia visual envolvente.
Resolución de Alta Definición: Disfruta de imágenes nítidas y detalladas gracias a la alta resolución compatible con HD. Esto significa una reproducción clara y vívida de tus juegos, videos y contenido multimedia favoritos.
Rendimiento Optimizado para Juegos: Diseñado pensando en los gamers, este monitor ofrece características específicas para optimizar la experiencia de juego, como una alta tasa de actualización y tiempos de respuesta rápidos, reduciendo el desenfoque de movimiento y proporcionando una jugabilidad suave.
Amplio Rango de Tensión: Compatible con voltajes de 100V a 240V, este monitor es versátil y puede utilizarse en diferentes regiones del mundo, facilitando su uso en diversos entornos.', (SELECT id FROM Tipo WHERE nombre = 'Monitores'), (SELECT id FROM Marca WHERE nombre = 'ViewSonic'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('Silla Sillon Gamer Pc Escritorio', 1200, '/images/images_products/silla-gamer.png', 'Silla gamer para PC: Diseñada ergonómicamente con soporte lumbar integrado, esta silla ofrece comodidad excepcional durante largas sesiones de juego o trabajo en la computadora. Su estructura resistente y acolchado de calidad brindan el equilibrio perfecto entre estilo y funcionalidad, asegurando una experiencia de uso placentera mientras previene posibles molestias o lesiones. Ideal para optimizar tu espacio de trabajo o zona de juego.', (SELECT id FROM Tipo WHERE nombre = 'Escritorio'), (SELECT id FROM Marca WHERE nombre = 'The Game House'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('Msi Cyborg 15.6 Intel I7 Geforce Rtx4060 Ram 8gb Ssd 512gb', 5200, '/images/images_products/notebook-gamer.png', 'La notebook Msi Cyborg 15.6 Intel I7 es una solución tanto para trabajar y estudiar como para entretenerte...', (SELECT id FROM Tipo WHERE nombre = 'Escritorio'), (SELECT id FROM Marca WHERE nombre = 'MSI'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('Mouse Gamer Usb Newvision 3200 Dpi Rgb Juegos Pc', 20000, '/images/images_products/mouse-gamer.png', 'Para trabajar desde casa con la computadora o aprovechar los momentos de ocio...', (SELECT id FROM Tipo WHERE nombre = 'Escritorio'), (SELECT id FROM Marca WHERE nombre = 'Newvision'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('PLACA DE VIDEO RTX 2080 Super 8Gb Gigabyte', 320000, '/images/images_products/placa-video.png', 'Mejora tu experiencia de juego con la PLACA DE VIDEO RTX 2080 Super 8Gb Gigabyte...', (SELECT id FROM Tipo WHERE nombre = 'Partes de PC'), (SELECT id FROM Marca WHERE nombre = 'Gigabyte'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('Joystick Inalámbrico Sony DualSense PS5 Blanco', 59999, '/images/images_products/jostick.png', 'Control preciso, este mando combina funciones revolucionarias mientras conserva precisión...', (SELECT id FROM Tipo WHERE nombre = 'Gamer'), (SELECT id FROM Marca WHERE nombre = 'Sony'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('Megaport Pc Gamer Amd fx-6100 Gaming', 267452, '/images/images_products/pcgamer.png', 'Hemos armado esta configuración de Megaport Pc Gamer Amd fx-6100 Gaming...', (SELECT id FROM Tipo WHERE nombre = 'PC Armada'), (SELECT id FROM Marca WHERE nombre = 'Megaport'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('Auriculares Gamer Xbox 360 Inalámbricos', 69975, '/images/images_products/auricularesrojos.png', 'Auricular liviano y duradero con un diseño vincha, sobre las orejas para mayor comodidad...', (SELECT id FROM Tipo WHERE nombre = 'Auriculares'), (SELECT id FROM Marca WHERE nombre = 'Xbox 360'), null, (SELECT id FROM Seccion WHERE nombre = 'masVisto')),
  ('APPLE IPHONE 8', 10000, '/images/images_products/iphone.png', 'Doble cámara y más detalles sus 2 cámaras traseras de 12 Mpx/12 Mpx te permitirán tomar imágenes con más detalles...', (SELECT id FROM Tipo WHERE nombre = 'Celular'), (SELECT id FROM Marca WHERE nombre = 'Apple'), 11, (SELECT id FROM Seccion WHERE nombre = 'ofertas')),
  ('Samsung Galaxy S9 Plus Review', 60000, '/images/images_products/galaxy-s9.png', 'El Samsung Galaxy S9 es el nuevo flagship de la serie Galaxy S para el 2018...', (SELECT id FROM Tipo WHERE nombre = 'Celular'), (SELECT id FROM Marca WHERE nombre = 'Samsung'), 15, (SELECT id FROM Seccion WHERE nombre = 'ofertas')),
  ('Teclado Gamer Razer Huntsman Mini Sw Analog', 5000, '/images/images_products/teclado.png', 'Hablar de Razer dentro del mundo gamer es palabra mayor...', (SELECT id FROM Tipo WHERE nombre = 'Teclado'), (SELECT id FROM Marca WHERE nombre = 'Razer'), 3, (SELECT id FROM Seccion WHERE nombre = 'ofertas')),
  ('Apple iPhone 7 32 GB - Oro Rosa (AT&T)', 100011, '/images/images_products/iphoneRosa.png', 'Diseño. Hace un chapoteo. Toma un chapuzón: IPhone 7 alcanza un nuevo nivel de innovación y precisión...', (SELECT id FROM Tipo WHERE nombre = 'Celular'), (SELECT id FROM Marca WHERE nombre = 'Apple'), 12, (SELECT id FROM Seccion WHERE nombre = 'ofertas'));

-- Insertar datos en la tabla Especificaciones
INSERT INTO Especificaciones (productoId, nombre, valor)
VALUES
  (1, 'Tamaño de la Pantalla', '32"'),
  (1, 'Tipo de resolución', ' HD'),
  (1, 'Es curvo', 'Si'),
  (1, 'Es reclinable', 'No'),
  (1, 'Con altavoces incorporados', 'Si'),
  (2, 'Tipo', 'Ergonomica'),
  (2, 'Altura', '1,30 m'),
  (2, 'Color', 'Verde,Negro'),
  (2, 'Es giratoria', 'Si'),
  (2, 'Con altura ajustable', 'SI'),
  (3, 'Marca', 'MSI'),
  (3, 'Memoria', '8 GB'),
  (3, 'Tipo de Disco', 'SSD'),
  (3, 'Sistema Operativo', 'Windows 11'),
  (3, 'Procesador', 'Intel Core i7'),
  (4, 'Tipo de mouse', 'De juego'),
  (4, 'Es inalámbrico', 'No'),
  (4, 'Resolución del sensor', ' 3200 dpi'),
  (4, 'Tipo de sensor', 'Óptico'),
  (4, 'Color', 'Rojo,Negro'),
  (5, 'Tamaño de la memoria', '8GB'),
  (5, 'Contectividad', 'DL-DVI-D, HDMI 2.0b, DisplayPort 1.4a'),
  (5, 'Tipo de memoria gráfica', 'GDDR6'),
  (5, 'Interfaz con la placa madre', 'PCI-Express 3.0'),
  (5, 'Fabricante', 'RTX'),
  (6, 'Con vibración', 'Si'),
  (6, 'Con detección de movimiento', 'Si'),
  (6, 'Es inalámbrico', 'Si'),
  (6, 'Con Bluetooth', 'Si'),
  (6, 'Con touchpad', 'Si'),
  (7, 'Es Gamer', 'Si'),
  (7, 'RAM', '16GB'),
  (7, 'Sistema Operativo', 'FREE'),
  (7, 'Disco Duro', '960 GB'),
  (7, 'Procesador', 'AMD Ryzen'),
  (8, 'Es inalámbrico', 'Si'),
  (8, 'Con cancelación de ruido', 'No'),
  (8, 'Con luz LED:', 'No'),
  (8, 'Duración de la batería', '6h'),
  (8, 'Con micrófono', 'Si'),
  (9, 'Memoria Interna', '256GB'),
  (9, 'Con NFC', 'Si'),
  (9, 'Desbloqueo', 'Huella Dactilar'),
  (9, 'Camara trasera principal', '12 Mpx'),
  (9, 'Camara frontal principal', '7 Mpx'),
  (10, 'Bateria', 'Standard, Li-Ion 3000 mAh'),
  (10, 'Memoria Interna', '64GB'),
  (10, 'RAM', '4GB'),
  (10, 'Camara trasera', '12 MP'),
  (10, 'Camara frontal', '8 MP'),
  (11, 'Es Gamer', 'Si'),
  (11, 'Color de la retroiluminación', 'RGB'),
  (11, 'Con Bluetooth', 'No'),
  (11, 'Tipo de switch', 'Razer Purple'),
  (11, 'Idioma', 'Inglés US'),
  (12, 'Color', 'Rosa'),
  (12, 'Memoria', '16GB'),
  (12, 'Sim', 'Nano'),
  (12, 'Red', '4G'),
  (12, 'Camara', '4mp');



-- !!Primercrear un usuario antes de poblar la tabla de carrito
-- !!USUARIO ADMINISTRADOR


INSERT INTO Usuario (email, password) 
VALUES("admin@tecnojuy.com","1234")


