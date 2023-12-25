INSERT INTO AOL_SCHEMA."Custom" (
    SELECT
        'lain' as InputText, 
        new_State, 
        TotalQueryCount
    FROM (
        SELECT
            cat.TOPIC_S AS new_State, 
            COUNT(q.QUERY) AS TotalQueryCount,
            ROW_NUMBER() OVER (ORDER BY COUNT(q.QUERY) DESC) AS RowNumAlias
        FROM AOL_SCHEMA.FACTS AS f 
        LEFT JOIN AOL_SCHEMA.URLDIM AS d ON f.URLID = d.ID
        LEFT JOIN AOL_SCHEMA.QUERYDIM AS q ON f.QUERYID = q.ID
        LEFT JOIN AOL_SCHEMA.URL_CATEGORY AS U ON U.URLID = d.ID
        LEFT JOIN AOL_SCHEMA.DMOZ_CATEGORIES AS cat ON cat.CATID = U.CATEGORYID
        WHERE lower (q.QUERY) = 'lain' AND cat.TOPIC LIKE '%United_States%'
        GROUP BY GROUPING SETS ((), q. QUERY, cat.TOPIC_5)
    ) RankedQuery
    WHERE RowNumAlias > 2
    ORDER BY TotalQueryCount DESC
);