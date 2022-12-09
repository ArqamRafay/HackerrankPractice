
SQL > Basic Join > Top Competitors

`select hackers.hacker_id, hackers.name from hackers
INNER JOIN submissions on hackers.hacker_id = submissions.hacker_id
INNER JOIN challenges on submissions.challenge_id = challenges.challenge_id
INNER JOIN difficulty on challenges.difficulty_level = difficulty.difficulty_level
where 
 difficulty.score = submissions.score
and 
 difficulty.difficulty_level = challenges.difficulty_level
GROUP BY 
hackers.hacker_id, hackers.name
HAVING 
count(submissions.submission_id) > 1
order by 
count(submissions.submission_id ) DESC,
hackers.hacker_id ASC`

<!-- Challenges Find hackerrank  name and Challenges cout -> 
`SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as no_of_challenges
FROM Hackers H
JOIN Challenges C ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING no_of_challenges = (SELECT count(challenge_id) AS max_count FROM Challenges GROUP BY hacker_id ORDER BY max_count DESC LIMIT 1)
OR no_of_challenges NOT IN (SELECT t.cnt FROM (SELECT count(challenge_id) AS cnt FROM Challenges GROUP BY hacker_id) t GROUP BY t.cnt HAVING COUNT(t.cnt) != 1)
ORDER BY no_of_challenges DESC, H.hacker_id ASC;
`
