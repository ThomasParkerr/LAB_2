-- 1. Create / ensure database exists with proper charset
CREATE DATABASE IF NOT EXISTS mobileapps_2026B_thomas_parker
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

-- 2. Switch to the database
USE mobileapps_2026B_thomas_parker;

-- 3. Clean start: drop table if it exists
DROP TABLE IF EXISTS books;

-- 4. Create the books table
CREATE TABLE books (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    phone       VARCHAR(20) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_name (name),
    INDEX idx_phone (phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 5. Insert initial sample data
INSERT INTO books (name, phone) VALUES
    ('The Great Gatsby',     '0240111111'),
    ('To Kill a Mockingbird','0240222222'),
    ('1984',                 '0240333333'),
    ('Pride and Prejudice',  '0240444444'),
    ('The Catcher in the Rye','0240555555');

-- 6. Quick verification
SELECT 'Database setup completed successfully!' AS status;
SELECT COUNT(*) AS total_books FROM books;
SELECT * FROM books;

-- ────────────────────────────────────────────
-- All your other queries (now safe to run sequentially)
-- ────────────────────────────────────────────

SELECT * FROM books;

SELECT id, name, phone FROM books ORDER BY id ASC;

SELECT * FROM books WHERE id = 1;

SELECT * FROM books WHERE name LIKE '%Gatsby%';

SELECT COUNT(*) AS total_books FROM books;

SELECT * FROM books ORDER BY created_at DESC LIMIT 5;

SELECT * FROM books ORDER BY updated_at DESC LIMIT 5;

INSERT INTO books (name, phone) 
VALUES ('The Hobbit', '0240666666');

INSERT INTO books (name, phone) VALUES
    ('Harry Potter',     '0240777777'),
    ('Lord of the Rings','0240888888'),
    ('Brave New World',  '0240999999');

UPDATE books 
SET name = 'The Great Gatsby - Updated' 
WHERE id = 1;

UPDATE books 
SET phone = '0240000000' 
WHERE id = 1;

UPDATE books 
SET name = 'Complete Book Title', 
    phone = '0241111111' 
WHERE id = 2;

DELETE FROM books WHERE id = 10;

DELETE FROM books WHERE phone = '0240999999';

SELECT * FROM books WHERE name LIKE '%Pride%';

SELECT * FROM books WHERE phone = '0240111111';

SELECT * FROM books 
WHERE name LIKE '%the%' 
  AND id > 2;

ALTER TABLE books AUTO_INCREMENT = 1;

DESCRIBE books;

SHOW INDEX FROM books;

SHOW TABLE STATUS LIKE 'books';

INSERT INTO books (name, phone) VALUES ('Test Book', '0240123456');

SELECT * FROM books WHERE name = 'Test Book';

UPDATE books SET phone = '0240654321' WHERE name = 'Test Book';

SELECT * FROM books WHERE name = 'Test Book';

DELETE FROM books WHERE name = 'Test Book';

SELECT * FROM books WHERE name = 'Test Book';

SELECT COUNT(*) AS total FROM books;

SELECT MIN(id) AS first_id, MAX(id) AS last_id FROM books;

SELECT * FROM books 
WHERE DATE(created_at) = CURDATE();

SELECT * FROM books 
WHERE updated_at >= DATE_SUB(NOW(), INTERVAL 24 HOUR);