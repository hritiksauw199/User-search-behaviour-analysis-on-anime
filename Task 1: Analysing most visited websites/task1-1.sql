SELECT
    FilteredQuery,
    COUNT (FilteredQuery) as QueryCount
FROM (
         SELECT CASE WHEN POSITION('' IN q.QUERY) > 0 THEN q.QUERY ELSE NULL END AS FilteredQuery
         FROM AOL_SCHEMA.FACTS AS f
                  LEFT JOIN AOL_SCHEMA.URLDIM AS d ON f.URLID = d.ID
                  LEFT JOIN AOL_SCHEMA.QUERYDIM
             AS q ON f.QUERYID = q.ID
         WHERE q.QUERY LIKE '%anime%'
           AND LOWER(q.QUERY) NOT LIKE '%porn%'
           AND LOWER(q.QUERY) NOT LIKE '%sex%'
           AND LOWER(q.QUERY) NOT LIKE '%nude%'
           AND LOWER(q.QUERY) NOT LIKE '%henta1%'
           AND LOWER(q.QUERY) NOT LIKE '%hentia%'
           AND LOWER(q.QUERY) NOT LIKE '%fuck%'
           AND LOWER(q.QUERY) NOT LIKE '%tit%'
           AND LOWER(q.QUERY) NOT LIKE '%xxx%'
           AND LOWER(q.QUERY) NOT LIKE '%rape%'
           AND LOWER(q.QUERY) NOT LIKE '%masturbate%'
           AND LOWER(q.QUERY) NOT LIKE '%b00b%'
           AND LOWER(q.QUERY) NOT LIKE '%dick%'
         )AS FilteredResults
WHERE FilteredQuery IS NOT NULL
GROUP BY FilteredQuery
ORDER BY QueryCount DESC;