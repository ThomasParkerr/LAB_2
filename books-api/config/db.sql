-- Create database
CREATE DATABASE IF NOT EXISTS mobileapps_2026B_thomas_parker
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

-- Switch to the database
USE mobileapps_2026B_thomas_parker;

-- Drop table if it exists (clean start)
DROP TABLE IF EXISTS books;

-- Create the books table
CREATE TABLE books (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    phone       VARCHAR(20) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_name (name),
    INDEX idx_phone (phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert sample data
INSERT INTO books (name, phone) VALUES
    ('The Great Gatsby',      '0240111111'),
    ('To Kill a Mockingbird', '0240222222'),
    ('1984',                  '0240333333'),
    ('Pride and Prejudice',   '0240444444'),
    ('The Catcher in the Rye','0240555555');

-- Verify setup
SELECT 'Database setup completed successfully!' AS status;
SELECT * FROM books;