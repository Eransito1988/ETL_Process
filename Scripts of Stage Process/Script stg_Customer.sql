select * ,case when CUST_NUMBER like '+1%' then 'USA /Canada / Puerto Rico'
			   when CUST_NUMBER like '+972%' then 'Israel' end Country,
		  case when CUST_NUMBER like '+97250%' then 'פלאפון'
			   when CUST_NUMBER like '+97252%' then 'סלקום'
			   when CUST_NUMBER like '+97254%' then 'אורנג'
			   when CUST_NUMBER like '+97253%' then 'הוט מובייל'
			   when CUST_NUMBER like '+97258%' then 'גולן טלקום' end 'Mobile Prefix'
from Mrr_Customer
order by customer_id