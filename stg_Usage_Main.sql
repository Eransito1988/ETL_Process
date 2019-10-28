

select CALL_NO,CUST_ID, CALLING_NO,
	case when CALLING_NO like '+1%' then '+1'
	when CALLING_NO like '+972%' then '+972' end 'Calling Country Prefix',
	case when CALLING_NO like '+1%' then 'USA /Canada / Puerto Rico'
	when CALLING_NO like '+972%' then 'Israel' end 'Calling Country',
	ANSWER_TIME, SEIZED_TIME, DISCONNECT_TIME, DURATION,
	CALLED_NO,
	case when CALLED_NO like '+1%' then '+1'
	when CALLED_NO like '+972%' then '+972' end 'Called Country Prefix',
	case when CALLED_NO like '+1%' then 'USA /Canada / Puerto Rico'
	when CALLED_NO like '+972%' then 'Israel' end 'Called Country',
CALL_TYPE, PROD_TYPE, RATED_AMNT,RATED_CURR_CODE, CELL, CELL_ORIGIN, HIGH_LOW_RATE, insert_date,update_date, CALL_DATETIME

from Mrr_Usage_Main
order by CALL_NO
