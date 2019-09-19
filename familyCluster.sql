use Task2
go

--T - 1st

select * from t2

bulk insert t2
from 'C:\Users\Shivangi Sharma\Documents\Actual1.tsv'
with
( firstrow= 2,
  fieldterminator = '	',
  rowterminator='\n'
)


select [start date] as SaleDate,
case when convert(date,[start date],105) < cast(GETDATE() as date) then 'Sale has Ended! '
when convert(date,[start date],105) > cast(GETDATE() as date) then 'Sale COMING soon!'
else  'Sale onGoing! hurry Up!'
end
from t2
where [Start Date] != 'NULL'
 


--T -- t2
--family cluster wise total cost
select [Job Family Cluster],sum([Cost (AOP - FY)]) as TotalFamilyClusterCost
from [Actual_simulation_AOP_CY_BUHR$]
group by [Job Family Cluster]

--maximumm cost of a particular group of Cluster of family

select max(TotalFamilyClusterCost) as maxClusterCost from
(
select [Job Family Cluster],sum([Cost (AOP - FY)]) as TotalFamilyClusterCost
from [Actual_simulation_AOP_CY_BUHR$] a
group by [Job Family Cluster]
) as a