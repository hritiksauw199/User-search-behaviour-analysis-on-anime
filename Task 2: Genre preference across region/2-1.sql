SELECT
    d.TOPIC_7 as Name,
    COUNT(q.query) AS QueryCount
  FROM AOL_SCHEMA.DMOZ_CATEGORIES d
  LEFT JOIN AOL_SCHEMA.URL_CATEGORY uc
      ON d.CATID = uc.categoryid
  LEFT JOIN AOL_SCHEMA.QUERYDIM q ON uc.urlid = q.id
  WHERE LOWER(d.topic) LIKE '%anime/title%'
    AND d.TOPIC_7 IS NOT NULL
  GROUP BY d.TOPIC_7
    order by QueryCount desc



