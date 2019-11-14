--Mrr_Customer
select *
from
(select *, right(CUST_NUMBER,7) 'Number', case when CUST_NUMBER like '+___%' then SUBSTRING(CUST_NUMBER,2,3) end 'Prefix country',
case when  CUST_NUMBER like '+___%' then SUBSTRING(CUST_NUMBER,5,2) end 'Prefix Operation'
from Mrr_Customer
where CUST_NUMBER like '+972%'
Union all 
select *, right(CUST_NUMBER,7) 'Number', case when CUST_NUMBER like '+_%' then SUBSTRING(CUST_NUMBER,2,1) end 'Prefix country',
case when  CUST_NUMBER like '+_%' then SUBSTRING(CUST_NUMBER,3,3) end 'Prefix Operation'
from Mrr_Customer C
where CUST_NUMBER like '+1%') tab
order by customer_id


--Mrr_Customer_Invoice
select *, right(PHONE_NO,7) 'Number', case when PHONE_NO like '+___%' then SUBSTRING(PHONE_NO,2,3) end 'Prefix country', case when  PHONE_NO like '+___%' then SUBSTRING(PHONE_NO,5,2) end 'Prefix Operation'
from Mrr_Customer_Invoice
order by INVOICE_NUM


--Mrr_Customer_Lines
select *, right(PHONE_NO,7) 'Number', case when PHONE_NO like '+___%' then SUBSTRING(PHONE_NO,2,3) end 'Prefix country', case when  PHONE_NO like '+___%' then SUBSTRING(PHONE_NO,5,2) end 'Prefix Operation'
from Mrr_Customer_Lines
where PHONE_NO like '+972%'
Union all 
select *, right(PHONE_NO,7) 'Number', case when PHONE_NO like '+_%' then SUBSTRING(PHONE_NO,2,1) end 'Prefix country',
case when  PHONE_NO like '+_%' then SUBSTRING(PHONE_NO,3,3) end 'Prefix Operation'
from Mrr_Customer_Lines
where PHONE_NO like '+1%'


--Mrr_Usage_Main
select *
from 
(select CALL_NO as [Call Number], CUST_ID as [Customer ID], CALLING_NO as [Calling Number], right(CALLING_NO,7) as [C_Number], case when CALLING_NO like '+___%' then SUBSTRING(CALLING_NO,2,3) end [Calling Country Prefix], case when CALLING_NO like '+___%' then SUBSTRING(CALLING_NO,5,2) end [Calling Prefix Operation],
ANSWER_TIME as [Answer Time], convert(date,SEIZED_TIME) as [Seized Date], convert(time,(convert(smalldatetime,SEIZED_TIME))) as [Seized Time], DISCONNECT_TIME as [Disconnect Time], DURATION as [Duration], DES_NO as [Destination Number], right(DES_NO,7) as [D_Number], case when DES_NO like '+___%' then SUBSTRING(DES_NO,2,3) end [Destination Country Prefix], case when DES_NO like '+___%' then SUBSTRING(DES_NO,5,2) end [Destination Prefix Operation],
CALL_TYPE as [Call Type], PROD_TYPE as [Call Type Descripion], RATED_AMNT as [Call Rank], RATED_CURR_CODE as [Currency], CELL as [Cell], CELL_ORIGIN as [Cell Origin], HIGH_LOW_RATE as [High or Low Time Rating], convert(date,CALL_DATETIME) as [Call Date]
from Mrr_Usage_Main
where CALLING_NO like '+972%' and DES_NO like '+972%'
union all
select CALL_NO as [Call Number], CUST_ID as [Customer ID], CALLING_NO as [Calling Number], right(CALLING_NO,7) as [C_Number], case when CALLING_NO like '+_%' then SUBSTRING(CALLING_NO,2,1) end [Calling Country Prefix], case when CALLING_NO like '+_%' then SUBSTRING(CALLING_NO,3,3) end [Calling Prefix Operation],
ANSWER_TIME as [Answer Time], convert(date,SEIZED_TIME) as [Seized Date], convert(time,(convert(smalldatetime,SEIZED_TIME))) as [Seized Time], DISCONNECT_TIME as [Disconnect Time], DURATION as [Duration], DES_NO as [Destination Number], right(DES_NO,7) as [D_Number], case when DES_NO like '+___%' then SUBSTRING(DES_NO,2,3) end [Destination Country Prefix], case when DES_NO like '+___%' then SUBSTRING(DES_NO,5,2) end [Destination Prefix Operation],
CALL_TYPE as [Call Type], PROD_TYPE as [Call Type Descripion], RATED_AMNT as [Call Rank], RATED_CURR_CODE as [Currency], CELL as [Cell], CELL_ORIGIN as [Cell Origin], HIGH_LOW_RATE as [High or Low Time Rating], convert(date,CALL_DATETIME) as [Call Date]
from Mrr_Usage_Main
where CALLING_NO like '+1%' and DES_NO like '+972%'
union all
select CALL_NO as [Call Number], CUST_ID as [Customer ID], CALLING_NO as [Calling Number], right(CALLING_NO,7) as [C_Number], case when CALLING_NO like '+___%' then SUBSTRING(CALLING_NO,2,3) end [Calling Country Prefix], case when CALLING_NO like '+___%' then SUBSTRING(CALLING_NO,5,2) end [Calling Prefix Operation],
ANSWER_TIME as [Answer Time], convert(date,SEIZED_TIME) as [Seized Date], convert(time,(convert(smalldatetime,SEIZED_TIME))) as [Seized Time], DISCONNECT_TIME as [Disconnect Time], DURATION as [Duration], DES_NO as [Destination Number], right(DES_NO,7) as [D_Number], case when DES_NO like '+_%' then SUBSTRING(DES_NO,2,1) end [Destination Country Prefix], case when DES_NO like '+_%' then SUBSTRING(DES_NO,3,3) end [Destination Prefix Operation],
CALL_TYPE as [Call Type], PROD_TYPE as [Call Type Descripion], RATED_AMNT as [Call Rank], RATED_CURR_CODE as [Currency], CELL as [Cell], CELL_ORIGIN as [Cell Origin], HIGH_LOW_RATE as [High or Low Time Rating], convert(date,CALL_DATETIME) as [Call Date]
from Mrr_Usage_Main
where CALLING_NO like '+972%' and DES_NO like '+1%'
union all
select CALL_NO as [Call Number], CUST_ID as [Customer ID], CALLING_NO as [Calling Number], right(CALLING_NO,7) as [C_Number], case when CALLING_NO like '+_%' then SUBSTRING(CALLING_NO,2,1) end [Calling Country Prefix], case when CALLING_NO like '+_%' then SUBSTRING(CALLING_NO,3,3) end [Calling Prefix Operation],
ANSWER_TIME as [Answer Time], convert(date,SEIZED_TIME) as [Seized Date], convert(time,(convert(smalldatetime,SEIZED_TIME))) as [Seized Time], DISCONNECT_TIME as [Disconnect Time], DURATION as [Duration], DES_NO as [Destination Number], right(DES_NO,7) as [D_Number], case when DES_NO like '+_%' then SUBSTRING(DES_NO,2,1) end [Destination Country Prefix], case when DES_NO like '+_%' then SUBSTRING(DES_NO,3,3) end [Destination Prefix Operation],
CALL_TYPE as [Call Type], PROD_TYPE as [Call Type Descripion], RATED_AMNT as [Call Rank], RATED_CURR_CODE as [Currency], CELL as [Cell], CELL_ORIGIN as [Cell Origin], HIGH_LOW_RATE as [High or Low Time Rating], convert(date,CALL_DATETIME) as [Call Date]
from Mrr_Usage_Main
where CALLING_NO like '+1%' and DES_NO like '+1%') tab
order by [Call Number]