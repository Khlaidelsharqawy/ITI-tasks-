CREATE DATABASE IF NOT EXISTS social_media;
USE social_media;

CREATE TABLE Auth (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    auth_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    nationality VARCHAR(100),
    gender ENUM('male', 'female'),
    username VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (auth_id) REFERENCES Auth(id) ON DELETE CASCADE
);

CREATE TABLE Messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id1 INT NOT NULL,
    user_id2 INT NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (user_id1) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id2) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Friendship (
    user_id1 INT NOT NULL,
    user_id2 INT NOT NULL,
    PRIMARY KEY (user_id1, user_id2),
    FOREIGN KEY (user_id1) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id2) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Notification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    user_id1 INT NOT NULL,
    user_id2 INT,
    FOREIGN KEY (user_id1) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id2) REFERENCES Users(id) ON DELETE SET NULL
);

CREATE TABLE User_Groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    num_mem INT DEFAULT 0
);

CREATE TABLE Posts (auth
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Reactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    react_sym ENUM('like', 'love', 'haha', 'wow', 'sad', 'angry') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES Posts(id) ON DELETE CASCADE
);

CREATE TABLE Group_Members (
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES User_Groups(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES Posts(id) ON DELETE CASCADE
);
