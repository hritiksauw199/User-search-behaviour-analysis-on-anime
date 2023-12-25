SELECT
    t."weekday",
    t."hour",
    COUNT(q.QUERY) AS QueryCount,
    COUNT(f.click) AS ClickCount
FROM AOL_SCHEMA.FACTS AS f
JOIN AOL_SCHEMA.QUERYDIM AS a ON q.ID = f.QUERYID
JOIN AOL_SCHEMA.TIMEDIM AS t ON t.ID = f.TIMEID
WHERE q.QUERY LIKE '%anime%' AND t."weekday" IS NOT NULL 
GROUP BY CUBE(t."weekday", t."hour")
ORDER BY t."weekday", t."hour";