CREATE DATABASE IF NOT EXISTS foods;

USE foods;

CREATE TABLE IF NOT EXISTS dishes(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS ingredients(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  calories DECIMAL(4.2) DEFAULT(0.0)
);

CREATE TABLE IF NOT EXISTS contains(
  id INT AUTO_INCREMENT PRIMARY KEY,
  dish_id INT,
  ingredient_id INT,
  amount DECIMAL(4.2) DEFAULT(0.0)
);

INSERT INTO dishes (id, name) VALUES (1, "Lohikeitto");
INSERT INTO dishes (id, name) VALUES (2, "Kanakeitto");
INSERT INTO dishes (id, name) VALUES (3, "Lihapiirakka");

INSERT INTO ingredients (id, name, calories) VALUES (1, "Lohi", 1000);
INSERT INTO ingredients (id, name, calories) VALUES (2, "Peruna", 200);
INSERT INTO ingredients (id, name, calories) VALUES (3, "Sipuli", 50);
INSERT INTO ingredients (id, name, calories) VALUES (4, "Jauheliha", 800);
INSERT INTO ingredients (id, name, calories) VALUES (5, "Vehnäjauho", 20);
INSERT INTO ingredients (id, name, calories) VALUES (6, "Kana", 600);
INSERT INTO ingredients (id, name, calories) VALUES (7, "Riisi", 100);

INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (1, 1, 500);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (1, 2, 500);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (1, 3, 400);

INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (2, 2, 400);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (2, 6, 400);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (2, 3, 200);

INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (3, 3, 100);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (3, 4, 100);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (3, 5, 100);
INSERT INTO contains (dish_id, ingredient_id, amount) VALUES (3, 7, 100);
