 SELECT hcci.product_category,
    count(hcci.product_category) AS number_of_rejections
   FROM hcci
  GROUP BY hcci.product_category
  ORDER BY (count(hcci.product_category)) DESC
  LIMIT 5;
