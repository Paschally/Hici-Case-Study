 SELECT hcci.notified_by,
    count(hcci.product_category) AS number_of_food_rejections
   FROM hcci
  GROUP BY hcci.notified_by
  ORDER BY (count(hcci.product_category)) DESC
 LIMIT 5;
