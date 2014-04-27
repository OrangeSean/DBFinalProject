clear column
column name format A50
select proj_number, name, start_date, decode(total_cost, null, 'on-going', 'complete') as "status"
from project left outer join (
select P, sum(R) as iscontinue
from (
select P, A, S, E, mins, maxe, L, LO, PREV_LO,
	decode(sign(LO - PREV_LO - L - 2), -1, 0, 1) as R
from (
select P, A, S, E, mins, maxe,
	e - s as L,
	maxe - mins as LO,
decode(lag((maxe - mins), 1) over (partition by P order by S), null, 0,
	lag((maxe - mins), 1) over (partition by P order by S)) as PREV_LO
from (
select proj_number as P, assign_num as A, date_assigned as S, decode(date_ended, null, sysdate, date_ended) as E,
min(date_assigned) over
	(partition by proj_number order by date_assigned rows between unbounded preceding and current row) as mins,
max(decode(date_ended, null, sysdate, date_ended)) over 
	(partition by proj_number order by date_assigned rows between unbounded preceding and current row) as maxe
from assignment
order by proj_number, date_assigned)
)
)
group by P
) on (proj_number = P)
where iscontinue != 0
order by proj_number;