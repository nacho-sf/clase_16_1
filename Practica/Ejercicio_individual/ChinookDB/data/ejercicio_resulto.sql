-- Ejercicio 1
--SELECT DISTINCT country FROM customers; Compruebo que es "BRAZIL"
SELECT * FROM customers WHERE country="Brazil"; -- Ejercicio 1

--Ejercicio 2
--SELECT DISTINCT title FROM employees; "Sales Support Agent"
SELECT * FROM employees WHERE title = "Sales Support Agent"; 

-- Ejercicio 3
SELECT tracks.* FROM tracks
INNER JOIN albums ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name = "AC/DC"; 

-- Ejercicio 4
SELECT 
    FirstName || ' ' || Lastname AS Nombre_completo, 
    CustomerID AS ID, 
    country AS Pais
FROM customers
WHERE NOT country = "USA"; 

-- Ejercicio 5
SELECT 
    FirstName || ' ' || Lastname AS Nombre_completo, 
    City || ' ' || State || ' ' || Country AS Direccion,
    Email AS Correo
FROM employees
WHERE title = "Sales Support Agent";

-- Ejercicio 6
SELECT DISTINCT BillingCountry
FROM invoices;

-- Ejercicio 6 EXTRA
SELECT DISTINCT BillingCountry, COUNT(InvoiceId)
FROM invoices
GROUP BY 1
ORDER BY 2 DESC;

-- Ejercicio 7
SELECT DISTINCT State
FROM Customers
WHERE Country = "USA";

-- Ejercicio 8
SELECT 
    InvoiceId,
    SUM(Quantity) AS Total_cantidades
FROM invoice_items
WHERE InvoiceId in (37) -- in (37,41,57)
GROUP BY InvoiceId
;

-- Ejercicio 9
SELECT COUNT(tracks.TrackId) FROM tracks
INNER JOIN albums ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name = "AC/DC"; 

-- Ejercicio 10
SELECT 
    InvoiceId,
    SUM(Quantity) AS Total_cantidades
FROM invoice_items
GROUP BY InvoiceId
;

-- Ejercicio 11
SELECT 
    BillingCountry,
    COUNT(InvoiceId)
FROM Invoices
GROUP BY 1
ORDER BY 2 DESC;

-- Ejercicio 12
SELECT 
strftime('%Y', InvoiceDate) AS Anio,
COUNT(InvoiceId) AS N_facturas
FROM invoices
WHERE Anio IN ("2009","2011")
--WHERE Anio = "2009" or Anio = "2011"
GROUP BY 1;

-- Ejercicio 13
SELECT 
strftime('%Y', InvoiceDate) AS Anio,
COUNT(InvoiceId) AS N_facturas
FROM invoices
WHERE Anio BETWEEN "2009" AND "2011"
GROUP BY 1;

-- Ejercicio 14
SELECT 
    Country,
    COUNT(CustomerId)
FROM customers
WHERE country IN ("Spain","Brazil")
--WHERE country ="Spain" or country = "Brazil"
GROUP BY Country;

-- Ejercicio 15
SELECT Name
FROM tracks
--WHERE substr(Name,1,3) = "You";
WHERE Name LIKE "You%";

--PARTE 2
-- Ejercicio 1
SELECT 
    c.FirstName || " " || c.LastName as Nombre,
    i.InvoiceId,
    i.InvoiceDate,
    i.BillingCountry
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
WHERE c.Country = "Brazil";

-- Ejercicio 2
SELECT i.*
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
WHERE c.Country = "Brazil";

-- Ejercicio 3
SELECT 
    e.FirstName || " " || e.LastName as Nombre_empleado,
    i.*
FROM invoices as i
INNER JOIN customers as c ON i.CustomerId = c.CustomerId
INNER JOIN employees as e ON c.SupportRepId = e.EmployeeId
WHERE e.title = "Sales Support Agent";

-- Ejercicio 4
SELECT 
    c.FirstName || " " || c.LastName as Nombre_cliente,
    c.Country,
    e.FirstName || " " || e.LastName as Nombre_empleado,
    SUM(i.Total)
FROM invoices as i
INNER JOIN customers as c ON i.CustomerId = c.CustomerId
INNER JOIN employees as e ON c.SupportRepId = e.EmployeeId
GROUP BY 1,2,3
ORDER BY 4 DESC;

-- Ejercicio 5
SELECT ii.InvoiceId,
ii.TrackId,
t.Name
FROM invoice_items AS ii
INNER JOIN tracks as t ON ii.TrackId = t.TrackId;

-- Ejercicio 6
SELECT 
    t.Name as Nombre_cancion,
    mt.Name as Nombre_formato,
    g.Name as Nombre_genero,
    a.Title as Titulo_album
FROM tracks as t
INNER JOIN albums as a ON t.AlbumId = a.AlbumId
INNER JOIN genres as g ON t.GenreId = g.GenreId
INNER JOIN media_types as mt ON t.MediaTypeId = mt.MediaTypeId;

-- Ejercicio 7
SELECT 
    p.Name,
    COUNT(pt.TrackId)
FROM playlists as p
INNER JOIN playlist_track as pt ON p.PlaylistId = pt.PlaylistId
GROUP BY 1
ORDER BY 2 DESC;

-- Ejercicio 8
SELECT 
    e.FirstName || " " || e.LastName as Nombre_empleado,
    SUM(i.Total)
FROM invoices as i
INNER JOIN customers as c ON i.CustomerId = c.CustomerId
INNER JOIN employees as e ON c.SupportRepId = e.EmployeeId
WHERE e.title = "Sales Support Agent"
GROUP BY 1;

-- Ejercicio 9
SELECT 
    e.FirstName || " " || e.LastName as Nombre_empleado,
    SUM(i.Total) as Total
FROM invoices as i
INNER JOIN customers as c ON i.CustomerId = c.CustomerId
INNER JOIN employees as e ON c.SupportRepId = e.EmployeeId
WHERE e.title = "Sales Support Agent" and strftime('%Y', i.InvoiceDate) = "2009"
GROUP BY 1
ORDER BY 2 DESC;

-- Ejercicio 10
SELECT ar.Name,
SUM(i.Total)
FROM invoices as i
INNER JOIN invoice_items as ii ON i.InvoiceId = ii.InvoiceId
INNER JOIN tracks as t ON ii.TrackId = t.TrackId
INNER JOIN albums as al ON t.AlbumId = al.AlbumId
INNER JOIN artists as ar ON al.ArtistId = ar.ArtistId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;