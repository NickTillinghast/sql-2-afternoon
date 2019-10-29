SELECT * FROM invoice 
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice_line.unit_price > .99;

SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total 
FROM invoice
JOIN customer ON invoice.customer_id = customer.customer_id;

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
FROM customer
JOIN  employee ON customer.support_rep_id = employee.employee_id;

SELECT album.title, artist.name
FROM album
JOIN artist ON album.artist_id = artist.artist_id;

SELECT playlist_track.track_id
FROM playlist_track
JOIN playlist ON playlist.playlist_id = playlist_track.playlist_id
WHERE playlist.name = 'Music';

SELECT track.name
FROM track
JOIN playlist_track ON playlist_track.track_id = track.track_id
WHERE playlist_track.playlist_id = 5;

SELECT track.name, playlist.name
FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id;

SELECT track.name, album.title
FROM track
JOIN album ON track.album_id = album.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Alternative & Punk';

--------------- nested queries----------------
SELECT * FROM invoice
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE playlist.name = 'Music');

SELECT * FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE genre.name = 'Comedy');

SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE album.title = 'Fireball');

SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (SELECT artist_id FROM artist WHERE name = 'Queen'));

-----------------Updating Rows----------------
UPDATE customer 
SET fax = null
WHERE fax IS NOT null;

UPDATE customer
SET company = 'Self'
WHERE company IS null;

UPDATE customer
SET last_name  = 'Thompson'
WHERE first_name = 'Julia', last_name = 'Barnett';

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
AND composer IS null;

-----------------Group by --------------------

SELECT COUNT(*), genre.name
FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP By genre.name;

SELECT COUNT(*), genre.name
FROM track
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY  genre.name;

SELECT artist.name, COUNT(*)
FROM album 
JOIN artist ON artist.artist_id = album.artist_id
GROUP BY artist.name;

------------Distinct-----------------------

SELECT DISTINCT composer
FROM track;

SELECT DISTINCT billing_postal_code
FROM invoice;

SELECT DISTINCT company
FROM customer;
------------------Delete Rows--------------

DELETE 
FROM practice_delete
WHERE type = 'bronze';

DELETE 
FROM practice_delete
WHERE type = 'silver';

DELETE
FROM practice_delete
WHERE value = 150;
----------------e commerce----------------

CREATE TABLE customers (
    user_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_price  INTEGER NOT NULL
);
CREATE TABLE orders (
    order_number SERIAL PRIMARY KEY,
    order_total INTEGER NOT NULL
);
INSERT INTO customers (name, email)
VALUES('Amber', 'amber@amber.com');

INSERT INTO customers (name, email)
VALUES('Scarlett', 'scarlett@scarlett.com');

INSERT INTO customers (name, email)
VALUES('Cora', 'cora@cora.com');

INSERT INTO products (product_name, product_price)
VALUES('pizza', 100);

INSERT INTO products (product_name, product_price)
VALUES('meatballs', 25);

INSERT INTO products (product_name, product_price)
VALUES('mt dew', 2);

INSERT INTO orders (order_total)
VALUES(152);

INSERT INTO orders (order_total)
VALUES(256);

INSERT INTO orders (order_total)
VALUES(56);
















