select * ,case when CUST_NUMBER like '+1%' then 'USA /Canada / Puerto Rico'
			   when CUST_NUMBER like '+972%' then 'Israel' end Country,
		  case when CUST_NUMBER like '+97250%' then '������'
			   when CUST_NUMBER like '+97252%' then '�����'
			   when CUST_NUMBER like '+97254%' then '�����'
			   when CUST_NUMBER like '+97253%' then '��� ������'
			   when CUST_NUMBER like '+97258%' then '���� �����' end 'Mobile Prefix'
from Mrr_Customer
order by customer_id