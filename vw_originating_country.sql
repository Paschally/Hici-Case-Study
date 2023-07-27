WITH table_a AS (
         SELECT hcci.product_category,
            count(hcci.product_category) AS number_of_rejections
           FROM hcci
          GROUP BY hcci.product_category
        ), table_b AS (
         SELECT hcci.product_category,
            hcci.country_of_origin,
            count(hcci.product_category) AS rejections
           FROM hcci
          GROUP BY hcci.product_category, hcci.country_of_origin
        )
 SELECT table_b.country_of_origin,
    table_b.rejections
   FROM table_a
     JOIN table_b USING (product_category)
  WHERE table_a.number_of_rejections = (( SELECT max(table_a_1.number_of_rejections) AS max
           FROM table_a table_a_1))
  ORDER BY table_b.rejections DESC
 LIMIT 5;
