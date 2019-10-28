--stg_Customer_Lines

with cte as(
select *, case when PHONE_NO like '+1%' then 'USA /Canada / Puerto Rico'
			   when PHONE_NO like '+972%' then 'Israel' end Country
from Mrr_Customer_Lines
),
cte2 as(
select *, SUBSTRING(PHONE_NO,0, 3) as 'Phone Number', case when PHONE_NO like '+97250%' then 'פלאפון'
														  when PHONE_NO like '+97252%' then 'סלקום'
														  when PHONE_NO like '+97254%' then 'אורנג'
														  when PHONE_NO like '+97253%' then 'הוט מובייל'
														  when PHONE_NO like '+97258%' then 'גולן טלקום' end 'Mobile Prefix'
from cte
where PHONE_NO like '+1%'
),
cte3 as(
select *, SUBSTRING(PHONE_NO,0,5) as 'Phone Number', case when PHONE_NO like '+97250%' then 'פלאפון'
														  when PHONE_NO like '+97252%' then 'סלקום'
														  when PHONE_NO like '+97254%' then 'אורנג'
														  when PHONE_NO like '+97253%' then 'הוט מובייל'
														  when PHONE_NO like '+97258%' then 'גולן טלקום' end 'Mobile Prefix'
from cte
where PHONE_NO like '+972%'
)


select cte.PHONE_NO,cte2.[Phone Number] as [Country Prefix], cte2.createdate, cte2.enddate, cte2.status,cte2.TYPE, cte2.[DESC], cte2.insert_date, cte2.update_date, cte2.discountpct, cte2.numberoffreeminutes, cte.Country, cte2.[Mobile Prefix]
from cte join cte2
on cte.PHONE_NO = cte2.PHONE_NO
where [Phone Number] is not null
union all
select cte3.PHONE_NO, cte3.[Phone Number] as [Country Prefix], cte3.createdate, cte3.enddate, cte3.status,cte3.TYPE, cte3.[DESC], cte3.insert_date, cte3.update_date, cte3.discountpct, cte3.numberoffreeminutes, cte.Country, cte3.[Mobile Prefix]
from cte join cte3
on cte.PHONE_NO = cte3.PHONE_NO
where [Phone Number] is not null


