-- =============================================
-- CATEGORÍAS (20) — ON CONFLICT (name) DO NOTHING
-- =============================================
INSERT INTO categories (name, description, active) VALUES
  ('Electrónica',        'Dispositivos y equipos electrónicos para el estudio',    true),
  ('Papelería',          'Útiles de escritura y organización académica',           true),
  ('Ropa Universitaria', 'Prendas con identidad universitaria',                   true),
  ('Libros',             'Textos y referencias académicas',                        true),
  ('Accesorios',         'Complementos esenciales para el universitario',         true),
  ('Informática',        'Componentes y periféricos de computador',               true),
  ('Deportes',           'Artículos para actividades físicas y recreativas',      true),
  ('Cafetería',          'Snacks, bebidas y artículos para la pausa del café',    true),
  ('Arte y Diseño',      'Materiales para dibujo técnico y artístico',            true),
  ('Música',             'Accesorios e insumos para músicos universitarios',      true),
  ('Ciencias',           'Instrumentos y materiales para laboratorio',            true),
  ('Ingeniería',         'Herramientas y kits para programas de ingeniería',      true),
  ('Medicina y Salud',   'Insumos para estudiantes de ciencias de la salud',      true),
  ('Derecho',            'Códigos y material jurídico actualizado',               true),
  ('Economía',           'Textos y herramientas para estudiantes de economía',    true),
  ('Idiomas',            'Material de apoyo para aprendizaje de idiomas',         true),
  ('Fotografía',         'Equipos y accesorios fotográficos',                     true),
  ('Gaming',             'Periféricos y accesorios para gaming y entretenimiento',true),
  ('Oficina',            'Implementos de oficina y escritorio',                   true),
  ('Hogar Universitario','Artículos para la vida fuera del hogar familiar',       true)
ON CONFLICT (name) DO NOTHING;

-- =============================================
-- PRODUCTOS (80 — 4 por categoría)
-- ON CONFLICT (sku) DO NOTHING
-- =============================================

-- Electrónica
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Laptop Lenovo IdeaPad 15',   'ELEC-001', 1800000.00, true FROM categories WHERE name = 'Electrónica' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Mouse Inalámbrico Logitech', 'ELEC-002',   45000.00, true FROM categories WHERE name = 'Electrónica' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Teclado Mecánico TKL',       'ELEC-003',  180000.00, true FROM categories WHERE name = 'Electrónica' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Monitor Samsung 24 Full HD', 'ELEC-004',  650000.00, true FROM categories WHERE name = 'Electrónica' ON CONFLICT (sku) DO NOTHING;

-- Papelería
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cuaderno Universitario 100h','PAP-001',    8500.00, true FROM categories WHERE name = 'Papelería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Set Lapiceros x12',          'PAP-002',   12000.00, true FROM categories WHERE name = 'Papelería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Carpeta AZ Oficio',          'PAP-003',   18000.00, true FROM categories WHERE name = 'Papelería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Marcadores Punta Fina x10',  'PAP-004',   15000.00, true FROM categories WHERE name = 'Papelería' ON CONFLICT (sku) DO NOTHING;

-- Ropa Universitaria
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Camiseta Unimagdalena M',    'ROP-001',   45000.00, true FROM categories WHERE name = 'Ropa Universitaria' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Sudadera Universitaria',     'ROP-002',   85000.00, true FROM categories WHERE name = 'Ropa Universitaria' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Gorra Universitaria',        'ROP-003',   35000.00, true FROM categories WHERE name = 'Ropa Universitaria' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Tote Bag Unimagdalena',      'ROP-004',   28000.00, true FROM categories WHERE name = 'Ropa Universitaria' ON CONFLICT (sku) DO NOTHING;

-- Libros
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Calculo I Stewart 8va Ed',   'LIB-001',   72000.00, true FROM categories WHERE name = 'Libros' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Fisica Universitaria Sears', 'LIB-002',   85000.00, true FROM categories WHERE name = 'Libros' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Pensando en Java Eckel',     'LIB-003',   65000.00, true FROM categories WHERE name = 'Libros' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Algebra Lineal Lay 5ta',     'LIB-004',   68000.00, true FROM categories WHERE name = 'Libros' ON CONFLICT (sku) DO NOTHING;

-- Accesorios
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Mochila Antirrobo 30L',      'ACC-001',  125000.00, true FROM categories WHERE name = 'Accesorios' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'USB Flash 64GB',             'ACC-002',   38000.00, true FROM categories WHERE name = 'Accesorios' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Audifonos Bluetooth On-Ear', 'ACC-003',   95000.00, true FROM categories WHERE name = 'Accesorios' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Termo Acero Inox 500ml',     'ACC-004',   42000.00, true FROM categories WHERE name = 'Accesorios' ON CONFLICT (sku) DO NOTHING;

-- Informática
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Disco Duro Externo 1TB',     'INFO-001', 220000.00, true FROM categories WHERE name = 'Informática' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Memoria RAM DDR4 8GB',       'INFO-002', 185000.00, true FROM categories WHERE name = 'Informática' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cable HDMI 2m 4K',           'INFO-003',  22000.00, true FROM categories WHERE name = 'Informática' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Hub USB-C 7 en 1',           'INFO-004',  95000.00, true FROM categories WHERE name = 'Informática' ON CONFLICT (sku) DO NOTHING;

-- Deportes
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Balon de Microfutbol No4',   'DEP-001',   65000.00, true FROM categories WHERE name = 'Deportes' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Camiseta Deportiva Dry-Fit', 'DEP-002',   42000.00, true FROM categories WHERE name = 'Deportes' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Botella Deportiva 750ml',    'DEP-003',   28000.00, true FROM categories WHERE name = 'Deportes' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cuerda para Saltar Pro',     'DEP-004',   18000.00, true FROM categories WHERE name = 'Deportes' ON CONFLICT (sku) DO NOTHING;

-- Cafetería
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cafe en Grano 500g',         'CAF-001',   32000.00, true FROM categories WHERE name = 'Cafetería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Taza Ceramica Universitaria','CAF-002',   18000.00, true FROM categories WHERE name = 'Cafetería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Snack Energetico x6',        'CAF-003',   15000.00, true FROM categories WHERE name = 'Cafetería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Agua Mineral 1.5L',          'CAF-004',    3500.00, true FROM categories WHERE name = 'Cafetería' ON CONFLICT (sku) DO NOTHING;

-- Arte y Diseño
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Set Lapices Dibujo 12pcs',   'ART-001',   28000.00, true FROM categories WHERE name = 'Arte y Diseño' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Block Dibujo A3 40h',        'ART-002',   22000.00, true FROM categories WHERE name = 'Arte y Diseño' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Acuarelas 24 Colores',       'ART-003',   48000.00, true FROM categories WHERE name = 'Arte y Diseño' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Regla T Tecnica 60cm',       'ART-004',   35000.00, true FROM categories WHERE name = 'Arte y Diseño' ON CONFLICT (sku) DO NOTHING;

-- Música
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Libro de Partituras Bach',   'MUS-001',   45000.00, true FROM categories WHERE name = 'Música' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Metronomo Digital DM-90',    'MUS-002',   58000.00, true FROM categories WHERE name = 'Música' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cuerdas Guitarra Clasica',   'MUS-003',   32000.00, true FROM categories WHERE name = 'Música' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Resina para Arco Violin',    'MUS-004',   25000.00, true FROM categories WHERE name = 'Música' ON CONFLICT (sku) DO NOTHING;

-- Ciencias
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Calculadora Cientifica FX',  'CIE-001',   85000.00, true FROM categories WHERE name = 'Ciencias' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Kit Reactivos Quimica Basica','CIE-002',  120000.00, true FROM categories WHERE name = 'Ciencias' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Lampara LED para Microscopio','CIE-003',   45000.00, true FROM categories WHERE name = 'Ciencias' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cuaderno Laboratorio 80h',   'CIE-004',   12000.00, true FROM categories WHERE name = 'Ciencias' ON CONFLICT (sku) DO NOTHING;

-- Ingeniería
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Juego de Escuadras Tecnicas','ING-001',   18000.00, true FROM categories WHERE name = 'Ingeniería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Kit Arduino UNO Starter',    'ING-002',   95000.00, true FROM categories WHERE name = 'Ingeniería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Multimetro Digital UT61',    'ING-003',   68000.00, true FROM categories WHERE name = 'Ingeniería' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cinta de Medir 5m Pro',      'ING-004',   15000.00, true FROM categories WHERE name = 'Ingeniería' ON CONFLICT (sku) DO NOTHING;

-- Medicina y Salud
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Estetoscopio Basico Dual',   'MED-001',  145000.00, true FROM categories WHERE name = 'Medicina y Salud' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Tensiómetro Manual Aneroide','MED-002',  185000.00, true FROM categories WHERE name = 'Medicina y Salud' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Bata Medica Blanca Talla M', 'MED-003',   75000.00, true FROM categories WHERE name = 'Medicina y Salud' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Kit Primeros Auxilios 30pcs','MED-004',   55000.00, true FROM categories WHERE name = 'Medicina y Salud' ON CONFLICT (sku) DO NOTHING;

-- Derecho
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Codigo Civil Colombiano 2025','DER-001',  48000.00, true FROM categories WHERE name = 'Derecho' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Codigo Penal Colombiano 2025','DER-002',  45000.00, true FROM categories WHERE name = 'Derecho' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Codigo de Comercio 2025',    'DER-003',   42000.00, true FROM categories WHERE name = 'Derecho' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Agenda Juridica 2026',       'DER-004',   35000.00, true FROM categories WHERE name = 'Derecho' ON CONFLICT (sku) DO NOTHING;

-- Economía
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Calculadora Financiera HP12C','ECO-001', 125000.00, true FROM categories WHERE name = 'Economía' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Microeconomia Pindyck 8va',  'ECO-002',   78000.00, true FROM categories WHERE name = 'Economía' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Macroeconomia Mankiw 8va',   'ECO-003',   72000.00, true FROM categories WHERE name = 'Economía' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cuaderno Contable 100h',     'ECO-004',   15000.00, true FROM categories WHERE name = 'Economía' ON CONFLICT (sku) DO NOTHING;

-- Idiomas
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Diccionario Ingles-Espanol', 'IDI-001',   42000.00, true FROM categories WHERE name = 'Idiomas' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Diccionario Frances-Espanol','IDI-002',   38000.00, true FROM categories WHERE name = 'Idiomas' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Flashcards Ingles 200 tarj', 'IDI-003',   28000.00, true FROM categories WHERE name = 'Idiomas' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cuaderno Practica Idiomas',  'IDI-004',   12000.00, true FROM categories WHERE name = 'Idiomas' ON CONFLICT (sku) DO NOTHING;

-- Fotografía
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Lente 50mm f1.8 Canon EF',  'FOT-001',  385000.00, true FROM categories WHERE name = 'Fotografía' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Tripode Portatil Aluminio',  'FOT-002',   95000.00, true FROM categories WHERE name = 'Fotografía' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Tarjeta SD 64GB Class 10',   'FOT-003',   48000.00, true FROM categories WHERE name = 'Fotografía' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Bolsa Camara Acolchada',     'FOT-004',   65000.00, true FROM categories WHERE name = 'Fotografía' ON CONFLICT (sku) DO NOTHING;

-- Gaming
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Mousepad Gaming XL 90x40',   'GAM-001',   32000.00, true FROM categories WHERE name = 'Gaming' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Headset Gaming 7.1 Surround','GAM-002',  125000.00, true FROM categories WHERE name = 'Gaming' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Control USB para PC',        'GAM-003',   85000.00, true FROM categories WHERE name = 'Gaming' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Webcam HD 1080p 30fps',      'GAM-004',  145000.00, true FROM categories WHERE name = 'Gaming' ON CONFLICT (sku) DO NOTHING;

-- Oficina
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Grapadora Metalica 26-6',    'OFI-001',   22000.00, true FROM categories WHERE name = 'Oficina' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Perforador 3 Huecos Metal',  'OFI-002',   18000.00, true FROM categories WHERE name = 'Oficina' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Cinta Adhesiva x3',          'OFI-003',   12000.00, true FROM categories WHERE name = 'Oficina' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Corrector Liquido x2',       'OFI-004',    8000.00, true FROM categories WHERE name = 'Oficina' ON CONFLICT (sku) DO NOTHING;

-- Hogar Universitario
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Almohada de Viaje Cervical', 'HOG-001',   35000.00, true FROM categories WHERE name = 'Hogar Universitario' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Toalla Microfibra 80x150cm', 'HOG-002',   28000.00, true FROM categories WHERE name = 'Hogar Universitario' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Caja Organizadora con Tapa', 'HOG-003',   45000.00, true FROM categories WHERE name = 'Hogar Universitario' ON CONFLICT (sku) DO NOTHING;
INSERT INTO products (category_id, name, sku, price, active) SELECT id, 'Candado Combinacion 4 Dig',  'HOG-004',   22000.00, true FROM categories WHERE name = 'Hogar Universitario' ON CONFLICT (sku) DO NOTHING;

-- =============================================
-- INVENTARIOS (80) — ON CONFLICT (product_id) DO NOTHING
-- =============================================
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   8, 10, NOW() FROM products WHERE sku = 'ELEC-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  50,  5, NOW() FROM products WHERE sku = 'ELEC-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  30,  5, NOW() FROM products WHERE sku = 'ELEC-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   4, 10, NOW() FROM products WHERE sku = 'ELEC-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id, 120, 20, NOW() FROM products WHERE sku = 'PAP-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  85, 15, NOW() FROM products WHERE sku = 'PAP-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  60, 10, NOW() FROM products WHERE sku = 'PAP-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  75, 15, NOW() FROM products WHERE sku = 'PAP-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  40, 10, NOW() FROM products WHERE sku = 'ROP-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  25, 10, NOW() FROM products WHERE sku = 'ROP-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  55, 10, NOW() FROM products WHERE sku = 'ROP-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  35, 10, NOW() FROM products WHERE sku = 'ROP-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  20,  5, NOW() FROM products WHERE sku = 'LIB-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  18,  5, NOW() FROM products WHERE sku = 'LIB-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  22,  5, NOW() FROM products WHERE sku = 'LIB-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  15,  5, NOW() FROM products WHERE sku = 'LIB-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  30,  8, NOW() FROM products WHERE sku = 'ACC-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  65, 10, NOW() FROM products WHERE sku = 'ACC-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  28,  8, NOW() FROM products WHERE sku = 'ACC-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  45, 10, NOW() FROM products WHERE sku = 'ACC-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  15,  5, NOW() FROM products WHERE sku = 'INFO-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   3, 10, NOW() FROM products WHERE sku = 'INFO-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  80, 15, NOW() FROM products WHERE sku = 'INFO-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  22,  8, NOW() FROM products WHERE sku = 'INFO-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  12,  5, NOW() FROM products WHERE sku = 'DEP-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  38, 10, NOW() FROM products WHERE sku = 'DEP-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  50, 10, NOW() FROM products WHERE sku = 'DEP-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  42, 10, NOW() FROM products WHERE sku = 'DEP-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  60, 15, NOW() FROM products WHERE sku = 'CAF-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  90, 20, NOW() FROM products WHERE sku = 'CAF-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id, 150, 30, NOW() FROM products WHERE sku = 'CAF-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id, 200, 50, NOW() FROM products WHERE sku = 'CAF-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  45, 10, NOW() FROM products WHERE sku = 'ART-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  35, 10, NOW() FROM products WHERE sku = 'ART-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  28,  8, NOW() FROM products WHERE sku = 'ART-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  20,  5, NOW() FROM products WHERE sku = 'ART-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  10,  5, NOW() FROM products WHERE sku = 'MUS-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  15,  5, NOW() FROM products WHERE sku = 'MUS-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  30, 10, NOW() FROM products WHERE sku = 'MUS-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  25, 10, NOW() FROM products WHERE sku = 'MUS-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  35, 10, NOW() FROM products WHERE sku = 'CIE-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   7, 10, NOW() FROM products WHERE sku = 'CIE-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  12,  5, NOW() FROM products WHERE sku = 'CIE-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  95, 20, NOW() FROM products WHERE sku = 'CIE-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  40, 10, NOW() FROM products WHERE sku = 'ING-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  20,  5, NOW() FROM products WHERE sku = 'ING-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  18,  5, NOW() FROM products WHERE sku = 'ING-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  55, 15, NOW() FROM products WHERE sku = 'ING-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  10,  5, NOW() FROM products WHERE sku = 'MED-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   6, 10, NOW() FROM products WHERE sku = 'MED-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  22,  8, NOW() FROM products WHERE sku = 'MED-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  30, 10, NOW() FROM products WHERE sku = 'MED-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  25,  8, NOW() FROM products WHERE sku = 'DER-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  30,  8, NOW() FROM products WHERE sku = 'DER-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  22,  8, NOW() FROM products WHERE sku = 'DER-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  50, 10, NOW() FROM products WHERE sku = 'DER-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  12,  5, NOW() FROM products WHERE sku = 'ECO-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  16,  5, NOW() FROM products WHERE sku = 'ECO-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  14,  5, NOW() FROM products WHERE sku = 'ECO-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id, 100, 20, NOW() FROM products WHERE sku = 'ECO-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  35, 10, NOW() FROM products WHERE sku = 'IDI-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  28, 10, NOW() FROM products WHERE sku = 'IDI-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  45, 10, NOW() FROM products WHERE sku = 'IDI-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  80, 20, NOW() FROM products WHERE sku = 'IDI-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   5,  5, NOW() FROM products WHERE sku = 'FOT-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  18,  5, NOW() FROM products WHERE sku = 'FOT-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  40, 10, NOW() FROM products WHERE sku = 'FOT-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  22,  8, NOW() FROM products WHERE sku = 'FOT-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  55, 10, NOW() FROM products WHERE sku = 'GAM-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  20,  8, NOW() FROM products WHERE sku = 'GAM-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  25,  8, NOW() FROM products WHERE sku = 'GAM-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,   9, 10, NOW() FROM products WHERE sku = 'GAM-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  75, 15, NOW() FROM products WHERE sku = 'OFI-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  60, 15, NOW() FROM products WHERE sku = 'OFI-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id, 110, 20, NOW() FROM products WHERE sku = 'OFI-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id, 130, 25, NOW() FROM products WHERE sku = 'OFI-004' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  30, 10, NOW() FROM products WHERE sku = 'HOG-001' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  42, 10, NOW() FROM products WHERE sku = 'HOG-002' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  25,  8, NOW() FROM products WHERE sku = 'HOG-003' ON CONFLICT (product_id) DO NOTHING;
INSERT INTO inventories (product_id, available_stock, minimum_stock, updated_at) SELECT id,  50, 15, NOW() FROM products WHERE sku = 'HOG-004' ON CONFLICT (product_id) DO NOTHING;

-- =============================================
-- CLIENTES (16) — ON CONFLICT (email) DO NOTHING
-- =============================================
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Juan Garcia Perez',       'juan.garcia@unimagdalena.edu.co',      'ACTIVE',   NOW()-INTERVAL '90 days', NOW()-INTERVAL '90 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Maria Lopez Gomez',       'maria.lopez@unimagdalena.edu.co',      'ACTIVE',   NOW()-INTERVAL '85 days', NOW()-INTERVAL '85 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Carlos Rodriguez Silva',  'carlos.rodriguez@unimagdalena.edu.co', 'ACTIVE',   NOW()-INTERVAL '80 days', NOW()-INTERVAL '80 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Ana Martinez Torres',     'ana.martinez@unimagdalena.edu.co',     'ACTIVE',   NOW()-INTERVAL '75 days', NOW()-INTERVAL '75 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Pedro Hernandez Castro',  'pedro.hernandez@unimagdalena.edu.co',  'ACTIVE',   NOW()-INTERVAL '70 days', NOW()-INTERVAL '70 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Laura Sanchez Mejia',     'laura.sanchez@unimagdalena.edu.co',    'ACTIVE',   NOW()-INTERVAL '65 days', NOW()-INTERVAL '65 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Diego Torres Vargas',     'diego.torres@unimagdalena.edu.co',     'ACTIVE',   NOW()-INTERVAL '60 days', NOW()-INTERVAL '60 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Sofia Ramirez Diaz',      'sofia.ramirez@unimagdalena.edu.co',    'ACTIVE',   NOW()-INTERVAL '55 days', NOW()-INTERVAL '55 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Andres Morales Rios',     'andres.morales@unimagdalena.edu.co',   'ACTIVE',   NOW()-INTERVAL '50 days', NOW()-INTERVAL '50 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Valentina Cruz Nunez',    'valentina.cruz@unimagdalena.edu.co',   'ACTIVE',   NOW()-INTERVAL '45 days', NOW()-INTERVAL '45 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Miguel Vargas Ortega',    'miguel.vargas@unimagdalena.edu.co',    'ACTIVE',   NOW()-INTERVAL '40 days', NOW()-INTERVAL '40 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Isabella Diaz Fuentes',   'isabella.diaz@unimagdalena.edu.co',    'ACTIVE',   NOW()-INTERVAL '35 days', NOW()-INTERVAL '35 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Felipe Castro Gutierrez', 'felipe.castro@unimagdalena.edu.co',    'ACTIVE',   NOW()-INTERVAL '30 days', NOW()-INTERVAL '30 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Camila Jimenez Herrera',  'camila.jimenez@unimagdalena.edu.co',   'ACTIVE',   NOW()-INTERVAL '25 days', NOW()-INTERVAL '25 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Santiago Reyes Blanco',   'santiago.reyes@unimagdalena.edu.co',   'ACTIVE',   NOW()-INTERVAL '20 days', NOW()-INTERVAL '20 days') ON CONFLICT (email) DO NOTHING;
INSERT INTO customers (full_name, email, status, created_at, updated_at) VALUES ('Daniela Flores Mendoza',  'daniela.flores@unimagdalena.edu.co',   'INACTIVE', NOW()-INTERVAL '15 days', NOW()-INTERVAL '15 days') ON CONFLICT (email) DO NOTHING;

-- =============================================
-- DIRECCIONES (16) — WHERE NOT EXISTS por cliente
-- =============================================
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 22 14-15 Apto 301',     'Santa Marta',         'Magdalena',          '470001', true FROM customers c WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Carrera 5 18-40 Casa 2',      'Santa Marta',         'Magdalena',          '470002', true FROM customers c WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 30 8-22',               'Barranquilla',        'Atlantico',          '080001', true FROM customers c WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Avenida El Libertador 5-12',  'Cartagena',           'Bolivar',            '130001', true FROM customers c WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 50 20-35 Apto 5B',      'Medellin',            'Antioquia',          '050001', true FROM customers c WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Carrera 15 88-64 Piso 3',     'Bogota',              'Cundinamarca',       '110111', true FROM customers c WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Transversal 9 34-78',         'Cali',                'Valle del Cauca',    '760001', true FROM customers c WHERE c.email = 'diego.torres@unimagdalena.edu.co'     AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 12 7-45 Apto 202',      'Bucaramanga',         'Santander',          '680001', true FROM customers c WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Carrera 22 15-30',            'Pereira',             'Risaralda',          '660001', true FROM customers c WHERE c.email = 'andres.morales@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 35 10-20 Casa 3',       'Manizales',           'Caldas',             '170001', true FROM customers c WHERE c.email = 'valentina.cruz@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Carrera 8 16-45 Apto 4A',     'Ibague',              'Tolima',             '730001', true FROM customers c WHERE c.email = 'miguel.vargas@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 20 5-18',               'Neiva',               'Huila',              '410001', true FROM customers c WHERE c.email = 'isabella.diaz@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Avenida 6N 24-15',            'Cucuta',              'Norte de Santander', '540001', true FROM customers c WHERE c.email = 'felipe.castro@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 14 12-55 Piso 2',       'Armenia',             'Quindio',            '630001', true FROM customers c WHERE c.email = 'camila.jimenez@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Carrera 25 38-90 Apto 101',   'Villavicencio',       'Meta',               '500001', true FROM customers c WHERE c.email = 'santiago.reyes@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);
INSERT INTO addresses (customer_id, line1, city, department, postal_code, default_address) SELECT c.id, 'Calle 18 3-45',               'Santa Marta',         'Magdalena',          '470003', true FROM customers c WHERE c.email = 'daniela.flores@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.id);

-- =============================================
-- ÓRDENES (24) — WHERE NOT EXISTS (SELECT 1 FROM orders LIMIT 1)
-- =============================================

-- DELIVERED (6)
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'DELIVERED', 1845000.00, NOW()-INTERVAL '60 days', NOW()-INTERVAL '55 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'DELIVERED',   35000.00, NOW()-INTERVAL '55 days', NOW()-INTERVAL '50 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'DELIVERED',  130000.00, NOW()-INTERVAL '50 days', NOW()-INTERVAL '45 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'DELIVERED',  157000.00, NOW()-INTERVAL '45 days', NOW()-INTERVAL '40 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'DELIVERED',  220000.00, NOW()-INTERVAL '40 days', NOW()-INTERVAL '35 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'DELIVERED',  163000.00, NOW()-INTERVAL '35 days', NOW()-INTERVAL '30 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);

-- SHIPPED (4)
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'SHIPPED', 315000.00, NOW()-INTERVAL '20 days', NOW()-INTERVAL '15 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'diego.torres@unimagdalena.edu.co'     AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'SHIPPED', 220000.00, NOW()-INTERVAL '18 days', NOW()-INTERVAL '13 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'SHIPPED', 203000.00, NOW()-INTERVAL '16 days', NOW()-INTERVAL '11 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'andres.morales@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'SHIPPED', 157000.00, NOW()-INTERVAL '14 days', NOW()-INTERVAL  '9 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'valentina.cruz@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);

-- PAID (4)
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'PAID', 830000.00, NOW()-INTERVAL '10 days', NOW()-INTERVAL '9 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'miguel.vargas@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'PAID', 480000.00, NOW()-INTERVAL  '8 days', NOW()-INTERVAL '7 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'isabella.diaz@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'PAID', 185000.00, NOW()-INTERVAL  '6 days', NOW()-INTERVAL '5 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'felipe.castro@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'PAID', 205000.00, NOW()-INTERVAL  '5 days', NOW()-INTERVAL '4 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'camila.jimenez@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);

-- CREATED (6)
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CREATED', 80000.00, NOW()-INTERVAL '3 days',    NOW()-INTERVAL '3 days'    FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'santiago.reyes@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CREATED', 80000.00, NOW()-INTERVAL '2 days',    NOW()-INTERVAL '2 days'    FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CREATED', 82000.00, NOW()-INTERVAL '2 days',    NOW()-INTERVAL '2 days'    FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CREATED', 83000.00, NOW()-INTERVAL '1 day',     NOW()-INTERVAL '1 day'     FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CREATED', 70000.00, NOW()-INTERVAL '1 day',     NOW()-INTERVAL '1 day'     FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CREATED', 70000.00, NOW()-INTERVAL '12 hours',  NOW()-INTERVAL '12 hours'  FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);

-- CANCELLED (4)
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CANCELLED', 1800000.00, NOW()-INTERVAL '30 days', NOW()-INTERVAL '29 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CANCELLED',   85000.00, NOW()-INTERVAL '25 days', NOW()-INTERVAL '24 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'diego.torres@unimagdalena.edu.co'     AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CANCELLED',  185000.00, NOW()-INTERVAL '20 days', NOW()-INTERVAL '19 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'    AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at) SELECT c.id, a.id, 'CANCELLED',  145000.00, NOW()-INTERVAL '15 days', NOW()-INTERVAL '14 days' FROM customers c JOIN addresses a ON a.customer_id = c.id WHERE c.email = 'andres.morales@unimagdalena.edu.co'   AND NOT EXISTS (SELECT 1 FROM orders LIMIT 1);

-- =============================================
-- ITEMS DE ORDEN — WHERE NOT EXISTS (SELECT 1 FROM order_items LIMIT 1)
-- =============================================
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 1800000.00, 1800000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-001' WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND o.status = 'DELIVERED' AND o.total = 1845000.00 AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   45000.00,   45000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-002' WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND o.status = 'DELIVERED' AND o.total = 1845000.00 AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 2,    8500.00,   17000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'PAP-001'  WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   18000.00,   18000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'PAP-003'  WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   45000.00,   45000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-001'  WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   85000.00,   85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-002'  WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   72000.00,   72000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-001'  WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   85000.00,   85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-002'  WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  125000.00,  125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-001'  WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   95000.00,   95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-003'  WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   95000.00,   95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ING-002'  WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'    AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   68000.00,   68000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ING-003'  WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'    AND o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  220000.00,  220000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-001' WHERE c.email = 'diego.torres@unimagdalena.edu.co'     AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   95000.00,   95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-004' WHERE c.email = 'diego.torres@unimagdalena.edu.co'     AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  145000.00,  145000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'MED-001'  WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'    AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   75000.00,   75000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'MED-003'  WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'    AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  125000.00,  125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ECO-001'  WHERE c.email = 'andres.morales@unimagdalena.edu.co'   AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   78000.00,   78000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ECO-002'  WHERE c.email = 'andres.morales@unimagdalena.edu.co'   AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  125000.00,  125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-002'  WHERE c.email = 'valentina.cruz@unimagdalena.edu.co'   AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   32000.00,   32000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-001'  WHERE c.email = 'valentina.cruz@unimagdalena.edu.co'   AND o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  650000.00,  650000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-004' WHERE c.email = 'miguel.vargas@unimagdalena.edu.co'    AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  180000.00,  180000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-003' WHERE c.email = 'miguel.vargas@unimagdalena.edu.co'    AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  385000.00,  385000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'FOT-001'  WHERE c.email = 'isabella.diaz@unimagdalena.edu.co'    AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   95000.00,   95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'FOT-002'  WHERE c.email = 'isabella.diaz@unimagdalena.edu.co'    AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  185000.00,  185000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'MED-002'  WHERE c.email = 'felipe.castro@unimagdalena.edu.co'    AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   85000.00,   85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'CIE-001'  WHERE c.email = 'camila.jimenez@unimagdalena.edu.co'   AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  120000.00,  120000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'CIE-002'  WHERE c.email = 'camila.jimenez@unimagdalena.edu.co'   AND o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   45000.00,   45000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-001'  WHERE c.email = 'santiago.reyes@unimagdalena.edu.co'   AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   35000.00,   35000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-003'  WHERE c.email = 'santiago.reyes@unimagdalena.edu.co'   AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   38000.00,   38000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-002'  WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   42000.00,   42000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-004'  WHERE c.email = 'juan.garcia@unimagdalena.edu.co'      AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 2,   32000.00,   64000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'CAF-001'  WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   18000.00,   18000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'CAF-002'  WHERE c.email = 'maria.lopez@unimagdalena.edu.co'      AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   48000.00,   48000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'DER-001'  WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   35000.00,   35000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'DER-004'  WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   48000.00,   48000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ART-003'  WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   22000.00,   22000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ART-002'  WHERE c.email = 'ana.martinez@unimagdalena.edu.co'     AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   42000.00,   42000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'IDI-001'  WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   28000.00,   28000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'IDI-003'  WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'  AND o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 1800000.00, 1800000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-001' WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'    AND o.status = 'CANCELLED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,   85000.00,   85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-003'  WHERE c.email = 'diego.torres@unimagdalena.edu.co'     AND o.status = 'CANCELLED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  185000.00,  185000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-002' WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'    AND o.status = 'CANCELLED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  145000.00,  145000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-004'  WHERE c.email = 'andres.morales@unimagdalena.edu.co'   AND o.status = 'CANCELLED' AND NOT EXISTS (SELECT 1 FROM order_items LIMIT 1);

-- =============================================
-- HISTORIAL DE ESTADO — WHERE NOT EXISTS
-- =============================================
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL,       'CREATED',   o.created_at,                          'Orden creada'                    FROM orders o WHERE o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED',  'PAID',      o.created_at + INTERVAL '1 day',       'Pago confirmado'                 FROM orders o WHERE o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'PAID',     'SHIPPED',   o.created_at + INTERVAL '2 days',      'Orden enviada'                   FROM orders o WHERE o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'SHIPPED',  'DELIVERED', o.created_at + INTERVAL '5 days',      'Orden entregada al destinatario' FROM orders o WHERE o.status = 'DELIVERED' AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL,       'CREATED',   o.created_at,                          'Orden creada'                    FROM orders o WHERE o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED',  'PAID',      o.created_at + INTERVAL '1 day',       'Pago confirmado'                 FROM orders o WHERE o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'PAID',     'SHIPPED',   o.created_at + INTERVAL '2 days',      'Orden enviada'                   FROM orders o WHERE o.status = 'SHIPPED'   AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL,       'CREATED',   o.created_at,                          'Orden creada'                    FROM orders o WHERE o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED',  'PAID',      o.created_at + INTERVAL '1 day',       'Pago confirmado'                 FROM orders o WHERE o.status = 'PAID'      AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL,       'CREATED',   o.created_at,                          'Orden creada'                    FROM orders o WHERE o.status = 'CREATED'   AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL,       'CREATED',   o.created_at,                          'Orden creada'                    FROM orders o WHERE o.status = 'CANCELLED' AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED',  'CANCELLED', o.created_at + INTERVAL '1 day',       'Orden cancelada por el cliente'  FROM orders o WHERE o.status = 'CANCELLED' AND NOT EXISTS (SELECT 1 FROM order_status_history LIMIT 1);

-- =============================================
-- ÓRDENES EXTRA (22) — guard por email+total
-- Distribuidas en Feb-May 2026 para los reportes
-- =============================================

-- ── DELIVERED: Febrero 2026 ──────────────────
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 270000.00, NOW()-INTERVAL '115 days', NOW()-INTERVAL '108 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'juan.garcia@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'juan.garcia@unimagdalena.edu.co' AND o2.total = 270000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 222000.00, NOW()-INTERVAL '110 days', NOW()-INTERVAL '103 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'maria.lopez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 222000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 163000.00, NOW()-INTERVAL '105 days', NOW()-INTERVAL '98 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o2.total = 163000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 330000.00, NOW()-INTERVAL '100 days', NOW()-INTERVAL '93 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'ana.martinez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'ana.martinez@unimagdalena.edu.co' AND o2.total = 330000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 433000.00, NOW()-INTERVAL '95 days', NOW()-INTERVAL '88 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'pedro.hernandez@unimagdalena.edu.co' AND o2.total = 433000.00);

-- ── DELIVERED: Marzo 2026 ────────────────────
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 210000.00, NOW()-INTERVAL '75 days', NOW()-INTERVAL '68 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'laura.sanchez@unimagdalena.edu.co' AND o2.total = 210000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 275000.00, NOW()-INTERVAL '70 days', NOW()-INTERVAL '63 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'diego.torres@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 275000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 250000.00, NOW()-INTERVAL '65 days', NOW()-INTERVAL '58 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'sofia.ramirez@unimagdalena.edu.co' AND o2.total = 250000.00);

-- ── DELIVERED: Abril 2026 ────────────────────
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 165000.00, NOW()-INTERVAL '60 days', NOW()-INTERVAL '53 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'andres.morales@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'andres.morales@unimagdalena.edu.co' AND o2.total = 165000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 258000.00, NOW()-INTERVAL '55 days', NOW()-INTERVAL '48 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'valentina.cruz@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'valentina.cruz@unimagdalena.edu.co' AND o2.total = 258000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 360000.00, NOW()-INTERVAL '48 days', NOW()-INTERVAL '41 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'miguel.vargas@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'miguel.vargas@unimagdalena.edu.co' AND o2.total = 360000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 174000.00, NOW()-INTERVAL '42 days', NOW()-INTERVAL '35 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'isabella.diaz@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'isabella.diaz@unimagdalena.edu.co' AND o2.total = 174000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 135000.00, NOW()-INTERVAL '35 days', NOW()-INTERVAL '28 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'felipe.castro@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'felipe.castro@unimagdalena.edu.co' AND o2.total = 135000.00);

-- ── DELIVERED: Mayo 2026 ─────────────────────
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 111000.00, NOW()-INTERVAL '28 days', NOW()-INTERVAL '21 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'camila.jimenez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'camila.jimenez@unimagdalena.edu.co' AND o2.total = 111000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'DELIVERED', 108000.00, NOW()-INTERVAL '21 days', NOW()-INTERVAL '14 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'santiago.reyes@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'santiago.reyes@unimagdalena.edu.co' AND o2.total = 108000.00);

-- ── PAID (recientes — último mes) ───────────
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'PAID', 650000.00, NOW()-INTERVAL '13 days', NOW()-INTERVAL '12 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'juan.garcia@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'juan.garcia@unimagdalena.edu.co' AND o2.total = 650000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'PAID', 270000.00, NOW()-INTERVAL '11 days', NOW()-INTERVAL '10 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o2.total = 270000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'PAID', 400000.00, NOW()-INTERVAL '9 days', NOW()-INTERVAL '8 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'ana.martinez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'ana.martinez@unimagdalena.edu.co' AND o2.total = 400000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'PAID', 405000.00, NOW()-INTERVAL '7 days', NOW()-INTERVAL '6 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'pedro.hernandez@unimagdalena.edu.co' AND o2.total = 405000.00);

-- ── SHIPPED (última semana) ──────────────────
INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'SHIPPED', 480000.00, NOW()-INTERVAL '6 days', NOW()-INTERVAL '5 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'maria.lopez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 480000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'SHIPPED', 225000.00, NOW()-INTERVAL '5 days', NOW()-INTERVAL '4 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'laura.sanchez@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'laura.sanchez@unimagdalena.edu.co' AND o2.total = 225000.00);

INSERT INTO orders (customer_id, address_id, status, total, created_at, updated_at)
  SELECT c.id, a.id, 'SHIPPED', 220000.00, NOW()-INTERVAL '4 days', NOW()-INTERVAL '3 days'
  FROM customers c JOIN addresses a ON a.customer_id = c.id
  WHERE c.email = 'diego.torres@unimagdalena.edu.co'
    AND NOT EXISTS (SELECT 1 FROM orders o2 JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 220000.00);

-- =============================================
-- ITEMS DE LAS ÓRDENES EXTRA
-- =============================================

-- juan.garcia 270000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 180000.00, 180000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-003' WHERE c.email = 'juan.garcia@unimagdalena.edu.co' AND o.total = 270000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'juan.garcia@unimagdalena.edu.co' AND o2.total = 270000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 2,  45000.00,  90000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-002' WHERE c.email = 'juan.garcia@unimagdalena.edu.co' AND o.total = 270000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'juan.garcia@unimagdalena.edu.co' AND o2.total = 270000.00 AND p2.sku = 'ELEC-002');

-- maria.lopez 222000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  72000.00,  72000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-001' WHERE c.email = 'maria.lopez@unimagdalena.edu.co' AND o.total = 222000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 222000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  85000.00,  85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-002' WHERE c.email = 'maria.lopez@unimagdalena.edu.co' AND o.total = 222000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 222000.00 AND p2.sku = 'LIB-002');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  65000.00,  65000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-003' WHERE c.email = 'maria.lopez@unimagdalena.edu.co' AND o.total = 222000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 222000.00 AND p2.sku = 'LIB-003');

-- carlos.rodriguez 163000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  95000.00,  95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ING-002' WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.total = 163000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o2.total = 163000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  68000.00,  68000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ING-003' WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.total = 163000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o2.total = 163000.00 AND p2.sku = 'ING-003');

-- ana.martinez 330000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 145000.00, 145000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'MED-001' WHERE c.email = 'ana.martinez@unimagdalena.edu.co' AND o.total = 330000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'ana.martinez@unimagdalena.edu.co' AND o2.total = 330000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 185000.00, 185000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'MED-002' WHERE c.email = 'ana.martinez@unimagdalena.edu.co' AND o.total = 330000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'ana.martinez@unimagdalena.edu.co' AND o2.total = 330000.00 AND p2.sku = 'MED-002');

-- pedro.hernandez 433000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 385000.00, 385000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'FOT-001' WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co' AND o.total = 433000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'pedro.hernandez@unimagdalena.edu.co' AND o2.total = 433000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  48000.00,  48000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'FOT-003' WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co' AND o.total = 433000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'pedro.hernandez@unimagdalena.edu.co' AND o2.total = 433000.00 AND p2.sku = 'FOT-003');

-- laura.sanchez 210000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-002' WHERE c.email = 'laura.sanchez@unimagdalena.edu.co' AND o.total = 210000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'laura.sanchez@unimagdalena.edu.co' AND o2.total = 210000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  85000.00,  85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-003' WHERE c.email = 'laura.sanchez@unimagdalena.edu.co' AND o.total = 210000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'laura.sanchez@unimagdalena.edu.co' AND o2.total = 210000.00 AND p2.sku = 'GAM-003');

-- diego.torres 275000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ECO-001' WHERE c.email = 'diego.torres@unimagdalena.edu.co' AND o.total = 275000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 275000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  78000.00,  78000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ECO-002' WHERE c.email = 'diego.torres@unimagdalena.edu.co' AND o.total = 275000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 275000.00 AND p2.sku = 'ECO-002');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  72000.00,  72000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ECO-003' WHERE c.email = 'diego.torres@unimagdalena.edu.co' AND o.total = 275000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 275000.00 AND p2.sku = 'ECO-003');

-- sofia.ramirez 250000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-001' WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co' AND o.total = 250000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'sofia.ramirez@unimagdalena.edu.co' AND o2.total = 250000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-002' WHERE c.email = 'sofia.ramirez@unimagdalena.edu.co' AND o.total = 250000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'sofia.ramirez@unimagdalena.edu.co' AND o2.total = 250000.00 AND p2.sku = 'GAM-002');

-- andres.morales 165000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  45000.00,  45000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-001' WHERE c.email = 'andres.morales@unimagdalena.edu.co' AND o.total = 165000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'andres.morales@unimagdalena.edu.co' AND o2.total = 165000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  85000.00,  85000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-002' WHERE c.email = 'andres.morales@unimagdalena.edu.co' AND o.total = 165000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'andres.morales@unimagdalena.edu.co' AND o2.total = 165000.00 AND p2.sku = 'ROP-002');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  35000.00,  35000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ROP-003' WHERE c.email = 'andres.morales@unimagdalena.edu.co' AND o.total = 165000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'andres.morales@unimagdalena.edu.co' AND o2.total = 165000.00 AND p2.sku = 'ROP-003');

-- valentina.cruz 258000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-001' WHERE c.email = 'valentina.cruz@unimagdalena.edu.co' AND o.total = 258000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'valentina.cruz@unimagdalena.edu.co' AND o2.total = 258000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  38000.00,  38000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-002' WHERE c.email = 'valentina.cruz@unimagdalena.edu.co' AND o.total = 258000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'valentina.cruz@unimagdalena.edu.co' AND o2.total = 258000.00 AND p2.sku = 'ACC-002');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  95000.00,  95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-003' WHERE c.email = 'valentina.cruz@unimagdalena.edu.co' AND o.total = 258000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'valentina.cruz@unimagdalena.edu.co' AND o2.total = 258000.00 AND p2.sku = 'ACC-003');

-- miguel.vargas 360000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 185000.00, 185000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-002' WHERE c.email = 'miguel.vargas@unimagdalena.edu.co' AND o.total = 360000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'miguel.vargas@unimagdalena.edu.co' AND o2.total = 360000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 175000.00, 175000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-003' WHERE c.email = 'miguel.vargas@unimagdalena.edu.co' AND o.total = 360000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'miguel.vargas@unimagdalena.edu.co' AND o2.total = 360000.00 AND p2.sku = 'ELEC-003');

-- isabella.diaz 174000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  72000.00,  72000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-001' WHERE c.email = 'isabella.diaz@unimagdalena.edu.co' AND o.total = 174000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'isabella.diaz@unimagdalena.edu.co' AND o2.total = 174000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  68000.00,  68000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'LIB-004' WHERE c.email = 'isabella.diaz@unimagdalena.edu.co' AND o.total = 174000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'isabella.diaz@unimagdalena.edu.co' AND o2.total = 174000.00 AND p2.sku = 'LIB-004');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 4,   8500.00,  34000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'PAP-001' WHERE c.email = 'isabella.diaz@unimagdalena.edu.co' AND o.total = 174000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'isabella.diaz@unimagdalena.edu.co' AND o2.total = 174000.00 AND p2.sku = 'PAP-001');

-- felipe.castro 135000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  65000.00,  65000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'DEP-001' WHERE c.email = 'felipe.castro@unimagdalena.edu.co' AND o.total = 135000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'felipe.castro@unimagdalena.edu.co' AND o2.total = 135000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  42000.00,  42000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'DEP-002' WHERE c.email = 'felipe.castro@unimagdalena.edu.co' AND o.total = 135000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'felipe.castro@unimagdalena.edu.co' AND o2.total = 135000.00 AND p2.sku = 'DEP-002');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  28000.00,  28000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'DEP-003' WHERE c.email = 'felipe.castro@unimagdalena.edu.co' AND o.total = 135000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'felipe.castro@unimagdalena.edu.co' AND o2.total = 135000.00 AND p2.sku = 'DEP-003');

-- camila.jimenez 111000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  28000.00,  28000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ART-001' WHERE c.email = 'camila.jimenez@unimagdalena.edu.co' AND o.total = 111000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'camila.jimenez@unimagdalena.edu.co' AND o2.total = 111000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  48000.00,  48000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ART-003' WHERE c.email = 'camila.jimenez@unimagdalena.edu.co' AND o.total = 111000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'camila.jimenez@unimagdalena.edu.co' AND o2.total = 111000.00 AND p2.sku = 'ART-003');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  35000.00,  35000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ART-004' WHERE c.email = 'camila.jimenez@unimagdalena.edu.co' AND o.total = 111000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'camila.jimenez@unimagdalena.edu.co' AND o2.total = 111000.00 AND p2.sku = 'ART-004');

-- santiago.reyes 108000 DELIVERED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  42000.00,  42000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'IDI-001' WHERE c.email = 'santiago.reyes@unimagdalena.edu.co' AND o.total = 108000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'santiago.reyes@unimagdalena.edu.co' AND o2.total = 108000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  38000.00,  38000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'IDI-002' WHERE c.email = 'santiago.reyes@unimagdalena.edu.co' AND o.total = 108000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'santiago.reyes@unimagdalena.edu.co' AND o2.total = 108000.00 AND p2.sku = 'IDI-002');
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  28000.00,  28000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'IDI-003' WHERE c.email = 'santiago.reyes@unimagdalena.edu.co' AND o.total = 108000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'santiago.reyes@unimagdalena.edu.co' AND o2.total = 108000.00 AND p2.sku = 'IDI-003');

-- juan.garcia 650000 PAID
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 650000.00, 650000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-004' WHERE c.email = 'juan.garcia@unimagdalena.edu.co' AND o.total = 650000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'juan.garcia@unimagdalena.edu.co' AND o2.total = 650000.00);

-- carlos.rodriguez 270000 PAID
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 145000.00, 145000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-004' WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.total = 270000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o2.total = 270000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'GAM-002' WHERE c.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o.total = 270000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'carlos.rodriguez@unimagdalena.edu.co' AND o2.total = 270000.00 AND p2.sku = 'GAM-002');

-- ana.martinez 400000 PAID
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 220000.00, 220000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-001' WHERE c.email = 'ana.martinez@unimagdalena.edu.co' AND o.total = 400000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'ana.martinez@unimagdalena.edu.co' AND o2.total = 400000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 180000.00, 180000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-003' WHERE c.email = 'ana.martinez@unimagdalena.edu.co' AND o.total = 400000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'ana.martinez@unimagdalena.edu.co' AND o2.total = 400000.00 AND p2.sku = 'ELEC-003');

-- pedro.hernandez 405000 PAID
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 220000.00, 220000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-001' WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co' AND o.total = 405000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'pedro.hernandez@unimagdalena.edu.co' AND o2.total = 405000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 185000.00, 185000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'INFO-002' WHERE c.email = 'pedro.hernandez@unimagdalena.edu.co' AND o.total = 405000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'pedro.hernandez@unimagdalena.edu.co' AND o2.total = 405000.00 AND p2.sku = 'INFO-002');

-- maria.lopez 480000 SHIPPED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 385000.00, 385000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'FOT-001' WHERE c.email = 'maria.lopez@unimagdalena.edu.co' AND o.total = 480000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 480000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  95000.00,  95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'FOT-002' WHERE c.email = 'maria.lopez@unimagdalena.edu.co' AND o.total = 480000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'maria.lopez@unimagdalena.edu.co' AND o2.total = 480000.00 AND p2.sku = 'FOT-002');

-- laura.sanchez 225000 SHIPPED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 180000.00, 180000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-003' WHERE c.email = 'laura.sanchez@unimagdalena.edu.co' AND o.total = 225000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'laura.sanchez@unimagdalena.edu.co' AND o2.total = 225000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  45000.00,  45000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ELEC-002' WHERE c.email = 'laura.sanchez@unimagdalena.edu.co' AND o.total = 225000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'laura.sanchez@unimagdalena.edu.co' AND o2.total = 225000.00 AND p2.sku = 'ELEC-002');

-- diego.torres 220000 SHIPPED
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1, 125000.00, 125000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ACC-001' WHERE c.email = 'diego.torres@unimagdalena.edu.co' AND o.total = 220000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 220000.00);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) SELECT o.id, p.id, 1,  95000.00,  95000.00 FROM orders o JOIN customers c ON c.id = o.customer_id JOIN products p ON p.sku = 'ING-002' WHERE c.email = 'diego.torres@unimagdalena.edu.co' AND o.total = 220000.00 AND NOT EXISTS (SELECT 1 FROM order_items oi2 JOIN orders o2 ON o2.id = oi2.order_id JOIN customers c2 ON c2.id = o2.customer_id JOIN products p2 ON p2.id = oi2.product_id WHERE c2.email = 'diego.torres@unimagdalena.edu.co' AND o2.total = 220000.00 AND p2.sku = 'ING-002');

-- =============================================
-- HISTORIAL EXTRA para las órdenes nuevas
-- =============================================
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL, 'CREATED', o.created_at, 'Orden creada' FROM orders o JOIN customers c ON c.id = o.customer_id WHERE o.status = 'DELIVERED' AND o.total IN (270000.00,222000.00,163000.00,330000.00,433000.00,210000.00,275000.00,250000.00,165000.00,258000.00,360000.00,174000.00,135000.00,111000.00,108000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'CREATED');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED', 'PAID', o.created_at + INTERVAL '1 day', 'Pago confirmado' FROM orders o WHERE o.status = 'DELIVERED' AND o.total IN (270000.00,222000.00,163000.00,330000.00,433000.00,210000.00,275000.00,250000.00,165000.00,258000.00,360000.00,174000.00,135000.00,111000.00,108000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'PAID');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'PAID', 'SHIPPED', o.created_at + INTERVAL '2 days', 'Orden enviada' FROM orders o WHERE o.status = 'DELIVERED' AND o.total IN (270000.00,222000.00,163000.00,330000.00,433000.00,210000.00,275000.00,250000.00,165000.00,258000.00,360000.00,174000.00,135000.00,111000.00,108000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'SHIPPED');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'SHIPPED', 'DELIVERED', o.created_at + INTERVAL '5 days', 'Orden entregada al destinatario' FROM orders o WHERE o.status = 'DELIVERED' AND o.total IN (270000.00,222000.00,163000.00,330000.00,433000.00,210000.00,275000.00,250000.00,165000.00,258000.00,360000.00,174000.00,135000.00,111000.00,108000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'DELIVERED');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL, 'CREATED', o.created_at, 'Orden creada' FROM orders o WHERE o.status = 'PAID' AND o.total IN (650000.00,270000.00,400000.00,405000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'CREATED');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED', 'PAID', o.created_at + INTERVAL '1 day', 'Pago confirmado' FROM orders o WHERE o.status = 'PAID' AND o.total IN (650000.00,270000.00,400000.00,405000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'PAID');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, NULL, 'CREATED', o.created_at, 'Orden creada' FROM orders o WHERE o.status = 'SHIPPED' AND o.total IN (480000.00,225000.00,220000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'CREATED');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'CREATED', 'PAID', o.created_at + INTERVAL '1 day', 'Pago confirmado' FROM orders o WHERE o.status = 'SHIPPED' AND o.total IN (480000.00,225000.00,220000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'PAID');
INSERT INTO order_status_history (order_id, from_status, to_status, changed_at, note) SELECT o.id, 'PAID', 'SHIPPED', o.created_at + INTERVAL '2 days', 'Orden enviada' FROM orders o WHERE o.status = 'SHIPPED' AND o.total IN (480000.00,225000.00,220000.00) AND NOT EXISTS (SELECT 1 FROM order_status_history h WHERE h.order_id = o.id AND h.to_status = 'SHIPPED');
