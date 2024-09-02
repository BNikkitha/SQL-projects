-- Create Schema
DROP SCHEMA IF EXISTS Library_Management CASCADE;
CREATE SCHEMA IF NOT EXISTS Library_Management;

-- User Login Table
DROP TABLE IF EXISTS Library_Management.user_login;
CREATE TABLE Library_Management.user_login (
	user_id TEXT PRIMARY KEY,
	user_password TEXT,
	first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT
);

-- Publisher Table
DROP TABLE IF EXISTS Library_Management.publisher;
CREATE TABLE Library_Management.publisher (
	publisher_id TEXT PRIMARY KEY,
	publisher TEXT,
	distributor TEXT,
	releases_count INT,
	last_release DATE
);

-- Author Table
DROP TABLE IF EXISTS Library_Management.author;
CREATE TABLE Library_Management.author (
	author_id TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	publications_count INT
);

-- Books Table
DROP TABLE IF EXISTS Library_Management.books;
CREATE TABLE Library_Management.books (
	book_id TEXT PRIMARY KEY,
	book_code TEXT,
	book_name TEXT,
	author_id TEXT REFERENCES Library_Management.author (author_id),
	publisher_id TEXT REFERENCES Library_Management.publisher (publisher_id),
	book_version TEXT,
	release_date DATE,
	available_from DATE,
	is_available BOOLEAN
);

-- Staff Table
DROP TABLE IF EXISTS Library_Management.staff;
CREATE TABLE Library_Management.staff (
	staff_id TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	staff_role TEXT,
	start_date DATE,
	last_date DATE,
	is_active BOOLEAN,
	work_shift_start TIME,
	work_shift_end TIME
);

-- Readers Table
DROP TABLE IF EXISTS Library_Management.readers;
CREATE TABLE Library_Management.readers (
	reader_id TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	registered_on DATE,
	books_issued_total INT,
	books_issued_current INT,
	is_issued BOOLEAN,
	last_issue_date DATE,
	total_fine FLOAT,
	current_fine FLOAT
);

-- Books Issue Table
DROP TABLE IF EXISTS Library_Management.books_issue;
CREATE TABLE Library_Management.books_issue (
	issue_id SERIAL PRIMARY KEY,
	book_id TEXT REFERENCES Library_Management.books (book_id),
	issued_to TEXT REFERENCES Library_Management.readers (reader_id),
	issued_on DATE,
	return_on DATE,
	current_fine FLOAT,
	fine_paid BOOLEAN,
	payment_transaction_id TEXT
);

-- Settings Table
DROP TABLE IF EXISTS Library_Management.settings;
CREATE TABLE Library_Management.settings (
	book_issue_count_per_reader INT,
	fine_per_day FLOAT,
	book_return_in_days INT
);
