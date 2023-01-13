-- Challenge Bonus queries.
select * from backers
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select backers_count, outcome, cf_id
from campaign
where (outcome = 'live')
order by backers_count desc;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select count (cf_id), cf_id
from backers
group by cf_id
order by count(cf_id) desc;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select first_name, last_name, email, (goal - pledged) as Remaining_Goal_Amount
into email_contacts_remaining_goal_amount
from campaign
inner join contacts
on (campaign.contact_id = contacts.contact_id)
where (campaign.outcome = 'live')
order by Remaining_Goal_Amount desc;




-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT b.email, b.first_name, b.last_name, c.cf_id, c.company_name, c.blurb as description, (c.goal - c.pledged) as left_of_goal 
INTO email_backers_remaining_goal_amount
FROM campaign as c
INNER JOIN backers as b
ON (c.cf_id = b.cf_id)
WHERE (c.outcome = 'live')
ORDER BY b.last_name;

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount;

