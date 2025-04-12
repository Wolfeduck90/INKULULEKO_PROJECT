CREATE DATABASE ukonkeDB
-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each user
    username VARCHAR(50) NOT NULL,          -- User's username
    password VARCHAR(255) NOT NULL,         -- Hashed password
    email VARCHAR(100) NOT NULL UNIQUE,     -- Email address
    profile_picture VARCHAR(255),           -- URL for profile picture
    bio TEXT,                               -- Short bio
    location VARCHAR(100),                  -- User's location
    membership_type ENUM('free', 'paid') DEFAULT 'free' -- Membership status
);

-- Community Forum Table
CREATE TABLE CommunityForum (
    post_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for posts
    user_id INT NOT NULL,                   -- Links posts to Users table
    title VARCHAR(255) NOT NULL,            -- Title of post
    content TEXT NOT NULL,                  -- Post content
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, -- When the post was created
    category VARCHAR(50),                   -- Optional post category
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Knowledge Hub Table
CREATE TABLE KnowledgeHub (
    resource_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for resources
    title VARCHAR(255) NOT NULL,                -- Resource title
    description TEXT,                           -- Brief overview of resource
    file_url VARCHAR(255) NOT NULL,             -- URL link to the resource
    author VARCHAR(100),                        -- Contributor or creator
    category VARCHAR(50),                       -- Resource category
    date_added DATE DEFAULT CURRENT_DATE        -- Date resource was added
);

-- Marketplace Table
CREATE TABLE Marketplace (
    listing_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for listings
    user_id INT NOT NULL,                      -- Links listings to Users table
    item_name VARCHAR(100) NOT NULL,           -- Name of the item
    description TEXT,                          -- Item description
    price DECIMAL(10, 2) NOT NULL,             -- Price of item
    quantity INT NOT NULL,                     -- Available quantity
    category VARCHAR(50),                      -- Item category
    date_posted DATETIME DEFAULT CURRENT_TIMESTAMP, -- When the listing was created
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Mentorship Program Table
CREATE TABLE MentorshipProgram (
    mentorship_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for mentorships
    mentor_id INT NOT NULL,                       -- Links mentor to Users table
    mentee_id INT NOT NULL,                       -- Links mentee to Users table
    topic VARCHAR(100),                           -- Mentorship topic
    start_date DATE DEFAULT CURRENT_DATE,         -- Date mentorship starts
    status ENUM('active', 'completed') DEFAULT 'active', -- Status of mentorship
    FOREIGN KEY (mentor_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (mentee_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Funding Opportunities Table
CREATE TABLE FundingOpportunities (
    funding_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for funding opportunities
    title VARCHAR(255) NOT NULL,               -- Title of the funding opportunity
    description TEXT,                          -- Description of the funding opportunity
    eligibility TEXT,                          -- Eligibility criteria
    deadline DATE,                             -- Application deadline
    link VARCHAR(255) NOT NULL                 -- Application link
);


ALTER TABLE Users ADD COLUMN role ENUM('admin', 'user') DEFAULT 'user';
