Use TheVoice
go

--Create View Rand
create view [dbo].[vv_getRANDValue]
as
select rand() as value
GO

--Create function for random number
Create function [dbo].[fn_RandomNum](@Lower int, @Upper int)
returns int
as
Begin

DECLARE @Random INT;
if @Upper > @Lower
	SELECT @Random = (@Upper - @Lower) * (SELECT Value FROM vv_getRANDValue) + @Lower
Else
	SELECT @Random = (@Lower - @Upper) * (SELECT Value FROM vv_getRANDValue) + @Upper
return @Random
end
GO

--check
select dbo.fn_RandomNum (40,59)


-- T-SQL Exercise - Part 2
select* from USAGE_MAIN
select* from [Call Type]
select* from [OPFILEOPP]
select* from [customer]
select* from [Call Type]


--Let's see the participants
Select count(*) from USAGE_MAIN
Select Max(CALL_NO) from USAGE_MAIN
--USAGE_MAIN Amt = 504
--Max USAGE_MAIN = 504

---------------------------------------------
Declare

@NumberOfNewRows int = 200,
@I int = 1,
@CallNumber int,
@CallingNumber nvarchar(20),
@CalledNumber nvarchar(20),
@Duration int,
@CustomerID int,
@CallType nvarchar (20),
@DestinationNumber nvarchar(20),
@ProductType nvarchar (20),
@Cell int,
@CellOrigin int,
@RatedAmount int,
@AnswerTime datetime,
@DisconectTime datetime,
@FromDate datetime,
@ToDate datetime, 
@Minutes int,
@Max int,
@Min int,
@CallDateTime date


set @FromDate = '2013-10-10 19:32:44'
set @ToDate = '2014-12-31 23:59:59'


While @NumberOfNewRows >= @I
	BEGIN
		BEGIN
			set @Minutes = DATEDIFF(MINUTE, @FromDate, @ToDate)
			set @Max = (select MAX(DURATION) as Duration from USAGE_MAIN)
			set @Min = (select MIN(DURATION) as Duration from USAGE_MAIN)
			set @Duration = dbo.fn_RandomNum(@Max,@Min)
		END
		BEGIN
			set @Minutes = @Duration
			set @AnswerTime = DATEADD(DAY, @Duration, @FromDate)
			set @DisconectTime = DATEADD(MINUTE, @Duration, @AnswerTime)
			set @CallDateTime = @AnswerTime
		END
		BEGIN
			set @CallType = (Select top 1 [Call Type Code] from [Call Type] order by NEWID())
			set @CallingNumber = (Select top 1 CUST_NUMBER from customer order by NEWID())
			set @CalledNumber = (Select top 1 CUST_NUMBER from customer order by NEWID())
			set @CustomerID = (select customer_id from customer where CUST_NUMBER = @CallingNumber)
			set @RatedAmount = dbo.fn_RandomNum(6,0)
			set @DestinationNumber = @CalledNumber
		END
		BEGIN 
			IF LEN(@CallingNumber) = 13
			SET @Cell = 1
			ELSE 
			SET @Cell = 0
		END

		BEGIN 
			IF LEN(@CalledNumber) = 13
			SET @CellOrigin = 1
			ELSE 
			SET @CellOrigin = 0
		END
		BEGIN
			set @ProductType = (Select top 1 [Call Type Desc] from [Call Type] where @CallType = [Call Type Code])

				Insert into USAGE_MAIN (ANSWER_TIME,SEIZED_TIME, DISCONNECT_TIME, CALL_DATETIME,CALLING_NO,CALLED_NO, DES_NO, DURATION, CUST_ID, CALL_TYPE, PROD_TYPE,RATED_AMNT,RATED_CURR_CODE,CELL, CELL_ORIGIN, HIGH_LOW_RATE, insert_DATE,update_date)
				Values (@AnswerTime, @AnswerTime, @DisconectTime, @CallDateTime, @CallingNumber, @CalledNumber, @DestinationNumber, @Duration, @CustomerID, @CallType, @ProductType, @RatedAmount, 'SHEKEL', @Cell, @CellOrigin, 1, @AnswerTime, NULL)
		

			Set @I = @I + 1

		END
	END

