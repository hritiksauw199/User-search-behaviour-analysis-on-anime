SELECT
  a.uid,
  a.title,
  r.cleaned_text,
  r.scores,
  SUM(q.QueryCount) OVER (PARTITION BY a.title) AS TotalQueryCount
FROM
  AOL_SCHEMA.ANIMES a
JOIN AOL_SCHEMA.REVIEWS r ON a.uid = r.uid
LEFT JOIN (
  SELECT
    d.TOPIC_7 as title,
    COUNT(q.query) AS QueryCount
  FROM AOL_SCHEMA.DMOZ_CATEGORIES d
  LEFT JOIN AOL_SCHEMA.URL_CATEGORY uc ON d.CATID = uc.categoryid
  LEFT JOIN AOL_SCHEMA.QUERYDIM q ON uc.urlid = q.id
  WHERE LOWER(d.topic) LIKE '%anime/title%' AND d.TOPIC_7 != 'null'
  GROUP BY d.TOPIC_7
) q ON a.title = q.title;
