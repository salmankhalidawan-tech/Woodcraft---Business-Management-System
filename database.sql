-- ============================================================
-- Woodcraft Business Management System - Database
-- Import this file in phpMyAdmin or run via MySQL CLI
-- ============================================================

CREATE DATABASE IF NOT EXISTS woodcraft_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE woodcraft_db;

-- ============================================================
-- TABLE: users (Admin only)
-- ============================================================
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE: inventory
-- ============================================================
CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    material_name VARCHAR(150) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    unit VARCHAR(50) DEFAULT 'pcs',
    supplier VARCHAR(150),
    low_stock_threshold INT NOT NULL DEFAULT 20,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE: orders
-- ============================================================
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    order_type VARCHAR(150) NOT NULL,
    cost DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status ENUM('Pending', 'In Progress', 'Completed') NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE: employees
-- ============================================================
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    assigned_work VARCHAR(255),
    working_hours DECIMAL(5,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE: billing
-- ============================================================
CREATE TABLE IF NOT EXISTS billing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    payment_status ENUM('Paid', 'Unpaid', 'Partial') NOT NULL DEFAULT 'Unpaid',
    order_id INT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL
);

-- ============================================================
-- SEED DATA: Inventory
-- ============================================================
INSERT INTO inventory (material_name, quantity, unit, supplier, low_stock_threshold) VALUES
('Oak Wood', 12, 'pcs', 'TimberCo Supplies', 20),
('Pine Wood', 85, 'pcs', 'WoodWorks Ltd.', 20),
('Cherry Wood', 8, 'pcs', 'Fine Wood Inc.', 20),
('Plywood (4x8)', 40, 'sheets', 'BuildBase', 15),
('Wood Glue', 3, 'gallons', 'CraftGlue Co.', 10),
('Varnish', 2, 'cans', 'FinishPro', 10),
('Screws (2-inch)', 1, 'boxes', 'Hardware Hub', 5),
('Sandpaper (120 grit)', 30, 'packs', 'SandIt Co.', 10),
('Hinges (3-inch)', 25, 'pairs', 'MetalFix Ltd.', 10),
('Wood Stain', 15, 'liters', 'ColorCraft', 10);

-- ============================================================
-- SEED DATA: Employees
-- ============================================================
INSERT INTO employees (name, role, assigned_work, working_hours) VALUES
('Carlos Rivera', 'Master Carpenter', 'Custom Dining Table - Order #1003', 40.00),
('Linda Tran', 'Finishing Specialist', 'Varnishing & Staining', 35.00),
('Marcus Webb', 'Apprentice', 'Workshop Assistance', 30.00),
('Sarah Kim', 'Project Manager', 'Order Coordination', 45.00);

-- ============================================================
-- SEED DATA: Orders
-- ============================================================
INSERT INTO orders (customer_name, order_type, cost, status) VALUES
('John Doe', 'Dining Table', 1200.00, 'Completed'),
('Jane Smith', 'Custom Bookshelf', 850.00, 'In Progress'),
('Acme Corp', 'Office Furniture Set', 3400.00, 'Pending'),
('Michael Brown', 'Wooden Chairs (x4)', 450.00, 'Completed'),
('Sarah Connor', 'Wardrobe Cabinet', 2100.00, 'In Progress'),
('Tom Hanks', 'Side Table', 150.00, 'Pending');

-- ============================================================
-- SEED DATA: Billing
-- ============================================================
INSERT INTO billing (customer_name, amount, payment_status, order_id) VALUES
('John Doe', 1200.00, 'Paid', 1),
('Jane Smith', 850.00, 'Unpaid', 2),
('Acme Corp', 3400.00, 'Partial', 3),
('Michael Brown', 450.00, 'Paid', 4),
('Sarah Connor', 2100.00, 'Unpaid', 5),
('Tom Hanks', 150.00, 'Unpaid', 6);
