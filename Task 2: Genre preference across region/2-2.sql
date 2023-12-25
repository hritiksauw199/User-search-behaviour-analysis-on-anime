WITH RankedQuery AS (
    SELECT
        q.QUERY,
        COUNT(q.QUERY) AS QueryCount, 
        cat.TOPIC_5 AS new_State,
        ROW_NUMBER() OVER (ORDER BY COUNT(q. QUERY) DESC) AS RowNumAlias,
        SUM(COUNT (q. QUERY)) OVER () AS TotalQueryCount
    FROM AOL_SCHEMA.FACTS AS f
    LEFT JOIN AOL_SCHEMA.URLDIM AS d ON f.URLID = d.ID
    LEFT JOIN AOL_SCHEMA.QUERYDIM AS a ON f.QUERYID = q.ID
    LEFT JOIN AOL_SCHEMA.URL_CATEGORY AS U ON U.URLID = d.ID
    LEFT JOIN AOL_SCHEMA.DMOZ_CATEGORIES AS cat ON cat.CATID = U.CATEGORYID
    WHERE lower(q.QUERY) = 'naruto'
        AND cat.TOPIC LIKE '%United_States%'
    GROUP BY GROUPING SETS ((), q. QUERY, cat. TOPIC_5)
)
SELECT
    'naruto' as QUERY,
    QueryCount, 
    new_State
FROM RankedQuery
WHERE ROwNUmAlias > 2
ORDER BY QueryCount DESC;