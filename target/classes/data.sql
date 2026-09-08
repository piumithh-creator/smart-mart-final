-- ============================================================
-- SmartMart Seed Data
-- Run after schema is created by Hibernate (ddl-auto=update)
-- ============================================================

-- Roles
INSERT INTO roles (name) VALUES ('ROLE_ADMIN') ON DUPLICATE KEY UPDATE name = name;
INSERT INTO roles (name) VALUES ('ROLE_USER')  ON DUPLICATE KEY UPDATE name = name;

-- Admin user  (password: Admin@1234)
-- BCrypt hash generated for: Admin@1234
INSERT INTO users (email, password, first_name, last_name, phone, enabled, created_at, updated_at)
VALUES (
  'admin@smartmart.com',
  '$2a$12$tFWoacY8LbSbpzFcv0dAROvHDiGUTgFUH/Pxf5Y4wQ5cZNbJPPpYW',
  'Admin', 'SmartMart', '+94771000001', 1,
  NOW(), NOW()
) ON DUPLICATE KEY UPDATE email = email;

-- Regular user  (password: User@1234)
INSERT INTO users (email, password, first_name, last_name, phone, enabled, created_at, updated_at)
VALUES (
  'user@smartmart.com',
  '$2a$12$9mGKkiCMVJK0HmGnOyR9N.YxYJzOy.gX4gGvuDRDdv2CYxDJbOSFG',
  'John', 'Doe', '+94772000002', 1,
  NOW(), NOW()
) ON DUPLICATE KEY UPDATE email = email;

-- Assign ROLE_ADMIN to admin user
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM users u, roles r
WHERE u.email = 'admin@smartmart.com' AND r.name = 'ROLE_ADMIN'
ON DUPLICATE KEY UPDATE user_id = user_id;

-- Assign ROLE_USER to regular user
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM users u, roles r
WHERE u.email = 'user@smartmart.com' AND r.name = 'ROLE_USER'
ON DUPLICATE KEY UPDATE user_id = user_id;

-- Customer profile for regular user
INSERT INTO customers (user_id, phone, created_at, updated_at)
SELECT u.id, u.phone, NOW(), NOW()
FROM users u WHERE u.email = 'user@smartmart.com'
ON DUPLICATE KEY UPDATE user_id = user_id;

-- Customer profile for admin user
INSERT INTO customers (user_id, phone, created_at, updated_at)
SELECT u.id, u.phone, NOW(), NOW()
FROM users u WHERE u.email = 'admin@smartmart.com'
ON DUPLICATE KEY UPDATE user_id = user_id;

-- Categories
INSERT INTO categories (name, description, active, created_at, updated_at) VALUES
  ('Beverages',     'Soft drinks, juices, water and more',       1, NOW(), NOW()),
  ('Dairy',         'Milk, cheese, yogurt and dairy products',   1, NOW(), NOW()),
  ('Bakery',        'Bread, cakes, pastries and baked goods',    1, NOW(), NOW()),
  ('Fruits',        'Fresh seasonal fruits',                     1, NOW(), NOW()),
  ('Vegetables',    'Fresh seasonal vegetables',                 1, NOW(), NOW()),
  ('Snacks',        'Chips, biscuits, and snack foods',          1, NOW(), NOW()),
  ('Household',     'Cleaning and household supplies',           1, NOW(), NOW()),
  ('Personal Care', 'Hygiene and personal care products',        1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;

-- Suppliers
INSERT INTO suppliers (name, email, phone, address, contact_person, active, created_at, updated_at) VALUES
  ('FreshFarm Supplies',   'contact@freshfarm.com',    '+94771100001', '12 Farm Road, Colombo', 'Nimal Perera', 1, NOW(), NOW()),
  ('Ceylon Beverages Ltd', 'info@ceylonbev.com',       '+94771100002', '45 Industrial Zone, Kandy', 'Sunil Silva', 1, NOW(), NOW()),
  ('National Dairy Co.',   'supply@nationaldairy.com', '+94771100003', '8 Dairy Lane, Gampaha',  'Priya Fernando', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE email = email;

-- Products
INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Mineral Water 1L', 'BEV-001', 'Pure mineral drinking water 1 litre bottle', 75.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Beverages' AND s.name = 'Ceylon Beverages Ltd'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Orange Juice 500ml', 'BEV-002', 'Freshly squeezed orange juice 500ml', 180.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Beverages' AND s.name = 'Ceylon Beverages Ltd'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Full Cream Milk 1L', 'DAI-001', 'Fresh full cream pasteurised milk 1 litre', 220.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Dairy' AND s.name = 'National Dairy Co.'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Cheddar Cheese 200g', 'DAI-002', 'Mature cheddar cheese 200g block', 490.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Dairy' AND s.name = 'National Dairy Co.'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'White Bread Loaf', 'BAK-001', 'Soft white sandwich bread loaf 400g', 120.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Bakery' AND s.name = 'FreshFarm Supplies'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Banana (1kg)', 'FRT-001', 'Fresh ripe bananas per kilogram', 150.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Fruits' AND s.name = 'FreshFarm Supplies'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Tomatoes (500g)', 'VEG-001', 'Fresh tomatoes 500g pack', 90.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Vegetables' AND s.name = 'FreshFarm Supplies'
ON DUPLICATE KEY UPDATE sku = sku;

INSERT INTO products (name, sku, description, price, active, category_id, supplier_id, created_at, updated_at)
SELECT 'Potato Chips 100g', 'SNK-001', 'Salted potato crisps 100g bag', 135.00, 1,
       c.id, s.id, NOW(), NOW()
FROM categories c, suppliers s
WHERE c.name = 'Snacks' AND s.name = 'Ceylon Beverages Ltd'
ON DUPLICATE KEY UPDATE sku = sku;

-- Inventory for each product
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id, 200, 20, NOW(), NOW() FROM products p WHERE p.sku = 'BEV-001' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id, 150, 20, NOW(), NOW() FROM products p WHERE p.sku = 'BEV-002' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id, 100, 15, NOW(), NOW() FROM products p WHERE p.sku = 'DAI-001' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id,  50, 10, NOW(), NOW() FROM products p WHERE p.sku = 'DAI-002' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id,  80, 10, NOW(), NOW() FROM products p WHERE p.sku = 'BAK-001' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id, 300, 30, NOW(), NOW() FROM products p WHERE p.sku = 'FRT-001' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id, 200, 25, NOW(), NOW() FROM products p WHERE p.sku = 'VEG-001' ON DUPLICATE KEY UPDATE product_id = product_id;
INSERT INTO inventory (product_id, quantity_in_stock, low_stock_threshold, created_at, updated_at)
SELECT p.id, 120, 15, NOW(), NOW() FROM products p WHERE p.sku = 'SNK-001' ON DUPLICATE KEY UPDATE product_id = product_id;

-- Sample discount
INSERT INTO discounts (code, description, percentage, start_date, end_date, active, created_at, updated_at)
VALUES ('WELCOME10', '10% welcome discount for new customers', 10.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE code = code;
