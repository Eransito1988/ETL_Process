-------------preperation for the loop-------------------
---- answer_time
DECLARE @FromDate DATETIME
DECLARE @ToDate   DATETIME

SET @FromDate = '2015-01-01 08:22:13' 
SET @ToDate = '2015-03-05 17:56:31'

DECLARE @Seconds INT = DATEDIFF(SECOND, @FromDate, @ToDate)
DECLARE @Random INT = ROUND(((@Seconds-1) * RAND()), 0)

declare @answer datetime
select DATEADD(SECOND, @Random, @FromDate)


---- answerd time = seized time = disconnecttime
---the logica: no culomn is calculated by use of those columns. in addition, answer time & disconnect time are omitted in the stg level.


---- call_no
declare @CallNo int
set @CallNo = (select MAX(CALL_NO) from TheVoice.dbo.USAGE_MAIN)+1
print @CallNo

--- seized_time
select GETDATE()

--- Calling_no
declare @Callin_No nvarchar(18)
set @Callin_No = (select top 1 CUST_NUMBER from TheVoice.dbo.customer order by NEWID())
print @Callin_No

---des_no
declare @Des_No nvarchar(18)
set @Des_No = (select top 1 CUST_NUMBER from TheVoice.dbo.customer order by NEWID())
print @Des_No
while @Des_No = @Callin_No
begin
set @Des_No = (select top 1 CUST_NUMBER from TheVoice.dbo.customer order by NEWID())
print @Des_no
end

---Duration
declare @Duration int
set @Duration = rand()*(200-1+1)+1
print @Duration 

---cust_id
declare @cust_id int
set @cust_id = (select top 1 customer_id from TheVoice.dbo.customer order by NEWID())
print @cust_id

---CallType
declare @calltype nvarchar(20)
set @calltype = (select top 1 CALL_TYPE from TheVoice.dbo.USAGE_MAIN order by newid())
print @calltype

---rated_amnt
declare @Rated_Amnt int
set @Rated_Amnt = rand()*(6-0+1)+0
print @rated_amnt 

select * from TheVoice.dbo.USAGE_MAIN


--- Cell origin
select convert(bit, round(1*rand(),0))

go 

---------------- the loop---------------------

declare 
@NumberOfRows int = 540,
@Counter int = 1,
@Callin_No nvarchar(18),
@Des_No nvarchar(18),
@Duration int,
@cust_id int,
@calltype nvarchar(20),
@Rated_Amnt int,
@answer datetime

declare @FromDate DATETIME 
declare @ToDate   DATETIME 

set @FromDate = '2013-10-08 19:32:44'
set @ToDate = '2014-12-31 23:59:59'

declare
@Seconds INT,
@Random INT 


while @Counter < @NumberOfRows
begin
		set @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
		set @Random = ROUND(((@Seconds-1) * RAND()), 0)
		set @answer = DATEADD(SECOND, @Random, @FromDate)
		set @Callin_No = (select top 1 CUST_NUMBER from TheVoice.dbo.customer order by NEWID())
		set @Des_No = (select top 1 CUST_NUMBER from TheVoice.dbo.customer order by NEWID())
				while @Des_No = @Callin_No
					begin
						set @Des_No = (select top 1 CUST_NUMBER from TheVoice.dbo.customer order by NEWID())
					end
		set @Duration = rand()*(200-1+1)+1
		set @cust_id = (select top 1 customer_id from TheVoice.dbo.customer order by NEWID())
		set @calltype = (select top 1 CALL_TYPE from TheVoice.dbo.USAGE_MAIN order by newid())
		set @Rated_Amnt = rand()*(6-0+1)+0
	insert into TheVoice.dbo.usage_main (ANSWER_TIME,SEIZED_TIME, DISCONNECT_TIME,CALLING_NO,DES_NO,DURATION,
												 CUST_ID,CALL_TYPE,RATED_AMNT,CELL_ORIGIN)
	values (@answer,@answer,@answer, @Callin_No, @Des_No, @Duration, @cust_id, @calltype, @Rated_Amnt,(select convert(bit, round(1*rand(),0))))
	
	set @Counter = @Counter +1

	end
		
select MAX(duration) from TheVoice.dbo.usage_main
where CALL_NO < 504






			












