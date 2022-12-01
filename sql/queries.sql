
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
