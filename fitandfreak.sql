-- Table to store users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table to store blog posts
CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    image_url VARCHAR(255), -- New column for post image URL
    author_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(user_id)
);

-- Table to store categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Table to associate posts with categories (many-to-many relationship)
CREATE TABLE post_categories (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Table to store comments on blog posts
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- Insert sample user
INSERT INTO users (username, email, password_hash) 
VALUES ('healthlover', 'healthlover@example.com', 'hashed_password');

-- Insert sample categories
INSERT INTO categories (name) VALUES 
('Fitness'), 
('Skincare'), 
('Summer Health');

-- Insert sample posts
-- Insert sample posts
INSERT INTO posts (title, content, image_url, author_id) 
VALUES 
('How to Stay Fit in Summer', 'Summer is a great time to get outside and get active. Here are some tips to stay fit during the summer months:
1. Stay hydrated by drinking plenty of water throughout the day.
2. Take advantage of early mornings or late evenings for outdoor workouts to avoid the heat.
3. Choose lighter, breathable clothing for exercise to stay cool.
4. Incorporate water-based activities like swimming or water aerobics to beat the heat while staying active.
5. Don''t forget sunscreen to protect your skin from harmful UV rays.', 'https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 1),
('How to Prevent Acne', 'Acne can be a frustrating skin condition, but there are steps you can take to prevent breakouts:
1. Keep your skin clean by washing your face twice a day with a gentle cleanser.
2. Avoid touching your face, as this can transfer bacteria and oils to your skin.
3. Use non-comedogenic skincare products to prevent clogged pores.
4. Maintain a healthy diet rich in fruits, vegetables, and whole grains, and limit processed foods and sugary drinks.
5. Manage stress levels through techniques like exercise, meditation, or deep breathing exercises.', 'https://plus.unsplash.com/premium_photo-1676667573030-48721c675dd2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 1),
('How to Prevent Heat-Related', 'High temperatures can increase the risk of heat-related illnesses like heat exhaustion and heatstroke. Here''s how to stay safe:
1. Stay indoors during the hottest part of the day, usually between 10 a.m. and 4 p.m.
2. If you must be outside, wear lightweight, loose-fitting clothing and a wide-brimmed hat to shade your face and neck.
3. Drink plenty of water throughout the day, even if you don''t feel thirsty.
4. Avoid strenuous activity during peak heat hours.
5. Take cool showers or baths to lower your body temperature if you start to feel overheated.', 'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 1);


-- Associate posts with categories
INSERT INTO post_categories (post_id, category_id) VALUES
(1, 3), -- How to Stay Fit in Summer -> Summer Health
(2, 2), -- How to Prevent Acne -> Skincare
(3, 3); -- How to Prevent Heat-Related Illnesses -> Summer Health

-- Insert sample comments
INSERT INTO comments (post_id, user_id, content) 
VALUES 
(1, 1, 'Great tips for staying fit in the summer! I ll definitely be incorporating some of these into my routine.'),
(2, 1, 'Thanks for the helpful advice on preventing acne. It can be so frustrating dealing with breakouts.'),
(3, 1, 'These tips for preventing heat-related illnesses are so important, especially during the summer months.');
