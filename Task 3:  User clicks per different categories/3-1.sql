SELECT f.QueryID, q.QUERY, U.URL, cat.TOPIC_5 AS Category
FROM AOL_SCHEMA.FACTS f
JOIN AOL_SCHEMA.URLDIM U ON f.URLID = U.ID
JOIN AOL_SCHEMA.QUERYDIM q ON f.QueryID = q.ID
left join AOL_SCHEMA.URL_CATEGORY as d on d.URLID = U.ID
LEFT JOIN AOL_SCHEMA.DMOZ_CATEGORIES AS cat ON cat.CATID = d.CATEGORYID
WHERE f.Click = true AND a.QUERY LIKE '%anime%' and cat.TOPIC_5 !='Titles' and cat.TOPIC_4 = 'Anime'