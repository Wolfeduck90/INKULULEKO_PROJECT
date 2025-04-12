CREATE DATABASE ukonkeDB
-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL, -- Hashed password
    email VARCHAR(100) NOT NULL UNIQUE,
    profile_picture VARCHAR(255),
    bio TEXT,
    location VARCHAR(100),
    membership_type ENUM('free', 'paid') DEFAULT 'free'
);

-- Community Forum Table
CREATE TABLE CommunityForum (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    category VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Knowledge Hub Table
CREATE TABLE KnowledgeHub (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    file_url VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    date_added DATE DEFAULT CURRENT_DATE
);

-- Marketplace Table
CREATE TABLE Marketplace (
    listing_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    category VARCHAR(50),
    date_posted DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Mentorship Program Table
CREATE TABLE MentorshipProgram (
    mentorship_id INT AUTO_INCREMENT PRIMARY KEY,
    mentor_id INT NOT NULL,
    mentee_id INT NOT NULL,
    topic VARCHAR(100),
    start_date DATE DEFAULT CURRENT_DATE,
    status ENUM('active', 'completed') DEFAULT 'active',
    FOREIGN KEY (mentor_id) REFERENCES Users(user_id),
    FOREIGN KEY (mentee_id) REFERENCES Users(user_id)
);

-- Funding Opportunities Table
CREATE TABLE FundingOpportunities (
    funding_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    eligibility TEXT,
    deadline DATE,
    link VARCHAR(255) NOT NULL
);

-- Indexing for Performance
CREATE INDEX idx_user_id ON CommunityForum(user_id);
CREATE INDEX idx_listing_user ON Marketplace(user_id);
CREATE INDEX idx_mentorship_user ON MentorshipProgram(mentor_id);
CREATE INDEX idx_mentorship_user_mentee ON MentorshipProgram(mentee_id);
