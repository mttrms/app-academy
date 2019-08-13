-- Case

case
when condition_1 then result_1
when condition_2 then result_2
end

-- Simple Case
CASE expression
WHEN value_1 THEN
	result_1
WHEN value_2 THEN
	result_2
ELSE
	result_n
END

SELECT
SUM (
	CASE rental_rate
WHEN 0.99 THEN
	1
ELSE
	0
END
) As "Mass",
SUM (
	CASE rental_rate
WHEN 2.99 THEN
	1
ELSE
	0
END
) AS "Economic",
SUM (
	CASE rental_rate
WHEN 4.99 THEN
	1
ELSE
	0
END
) AS "Luxury"
FROM
film

-- Coalesce
 COALESCE (argument_1, argument_2, ...);
-- Accepts unlimited number of arguments. Returns the first argument that is not null.

SELECT COALESCE (NULL, 2 , 1);
-- # => 2

-- if "discount" is NULL, use 0
SELECT
   product,
   (price - COALESCE(discount,0)) AS net_price
FROM
   items;

INNER JOIN -- Match rows from first table and second table which have the same key (defined by ON constraint)

SELECT column, another_table_column, …
FROM mytable
INNER JOIN another_table 
    ON mytable.id = another_table.id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;

