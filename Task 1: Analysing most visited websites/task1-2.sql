SELECT
  COALESCE(FilteredQuery, 'Total') AS FilteredQuery,
  YEA,
  MON,
  COUNT(FilteredQuery) as QueryCount
FROM (
  SELECT
    CASE
      WHEN POSITION('.' IN q.QUERY) > 0 THEN q.QUERY
      ELSE NULL
    END AS FilteredQuery,
    t."year" as YEA,
    t."month" as MON
  FROM AOL_SCHEMA.FACTS AS f
  LEFT JOIN AOL_SCHEMA.URLDIM AS d ON f.URLID = d.ID
  LEFT JOIN AOL_SCHEMA.QUERYDIM AS q ON f.QUERYID = q.ID
  LEFT JOIN AOL_SCHEMA.TIMEDIM AS t ON f.TIMEID = t.ID
  WHERE q.QUERY LIKE '%anime%'
    AND LOWER(q.QUERY) NOT LIKE '%porn%'
    AND LOWER(q.QUERY) NOT LIKE '%sex%'
    AND LOWER(q.QUERY) NOT LIKE '%nude%'
    AND LOWER(q.QUERY) NOT LIKE '%hentai%'
    AND LOWER(q.QUERY) NOT LIKE '%hentia%'
    AND LOWER(q.QUERY) NOT LIKE '%fuck%'
    AND LOWER(q.QUERY) NOT LIKE '%tit%'
    AND LOWER(q.QUERY) NOT LIKE '%xxx%'
    AND LOWER(q.QUERY) NOT LIKE '%rape%'
    AND LOWER(q.QUERY) NOT LIKE '%masturbate%'
    AND LOWER(q.QUERY) NOT LIKE '%boob%'
    AND LOWER(q.QUERY) NOT LIKE '%dick%'
    AND q.QUERY IS NOT NULL
    AND t."year" IS NOT NULL
    AND t."month" IS NOT NULL
) AS FilteredResults
WHERE YEA IS NOT NULL
GROUP BY ROLLUP(FilteredQuery, YEA, MON)
ORDER BY MON, QueryCount DESC
LIMIT 1043;




