use Task1
go
 
--TAsk 1
  select AVG(CAST(CTC_Amount as bigint)) as averages
  from [dbo].['Fact  Employee Central Table$']
  where Position_ID != 'NULL' and [Employment_Details_Hire_Date] > '1 Apr 2017' and
  CTC_Amount != 'NULL'

--Task 2]


--using XML and nodes // Eficient way
select DISTINCT
    S.a.value('(/H/r)[1]', 'VARCHAR(100)') as Employee_ID
   ,S.a.value('(/H/r)[2]', 'VARCHAR(100)')  as Psotion_ID
   
from
(
select *,cast (N'<H><r>' + REPLACE([Anaplan ID], '-', '</r><r>')  
               + '</r></H>' AS XML) as [vals]
from [Actual_simulation_AOP_CY_BUHR$]) d 
CROSS APPLY d.[vals].nodes('/H/r') S(a)
where [Anaplan ID]!='NULL' 

/*-- using CTE
with c as(
select [Anaplan ID],value
from
[Actual_simulation_AOP_CY_BUHR$] cross apply string_split([Anaplan ID],'-') as A)
select
	   [1] as Employee_ID,
	   [2] as Position_ID
	   from c
	   pivot(
	   max([Anaplan ID])
	   for RN in ([1],[2])
	   ) as PVT
*/