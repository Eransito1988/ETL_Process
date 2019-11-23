--гез 2
with cte as
(
select [Call ID], [Key Customer], Duration, [Billable Amount], ct.[Call Type], ct.[Category Of Call] ,Row_Number () over (partition by CT.[Call Type] order by CT.[Call Type] asc) 'Row Of Calls Per Types'
from Fact_Usage_Main UM join Dim_Call_Types CT
on UM.[Key Call Type] = CT.[Key Call Type]
),
cte2 as
(
select [Call ID], [Key Customer], [Call Type], Duration, [Billable Amount], max([Row Of Calls Per Types]) over (partition by [Call Type]) 'Sum Of Calls'
from cte
)
select [Call Type], sum(Duration) 'Duration Per Type', sum([Billable Amount]) [Billable Amount Per Type], count([Sum Of Calls])[Sum Of Calls Per Type] 
from cte2
group by [Call Type]

--гез 6
with cte as
(
Select distinct [Customer ID]
from Dim_Customers
EXCEPT
select distinct UM.[Key Customer]
from Fact_Usage_Main UM join Dim_Customers C
on UM.[Key Customer] = C.[Customer ID]
)
select count([Customer ID]) 'InActive Customers', (Select count([Customer ID]) from Dim_Customers) 'Registered Customers', (select count(*) from(select distinct [Key Customer] from Fact_Usage_Main)T) 'Active Customers'
from cte