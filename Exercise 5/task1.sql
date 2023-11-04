/*
Design indices for the newspaper database. Which fields should be indexed and why?
Write index create statements and explain why you decided to define those indices.

Suunnittele indeksit verkkolehtitietokannalle. Mitkä kentät tulisi indeksoida ja miksi?
Kirjoita indeksien luontilauseet ja perusteet sille, miksi määritit kyseiset indeksit.
*/

-- Create indices for articles

CREATE INDEX i_article_name ON article (article_name);

CREATE INDEX i_article_date ON article (date);

-- Create composite index for a journalist's articles

CREATE INDEX i_article_journalist_articles ON article (journalist_id, date, article_name);

-- Create indices for comments

CREATE INDEX i_comment_article_comments ON comment (article_name, date, user_id);

CREATE INDEX i_comments_by_user_id ON comment (user_id, date, article_name);

-- Create indices for users

CREATE INDEX i_user_name ON user (name);

-- Create indices for journalists

CREATE INDEX i_journalist_name ON journalist (last_name, first_name);



