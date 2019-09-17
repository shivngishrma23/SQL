use Task1
go

select [Start Date]
from [Actual_simulation_AOP_CY_BUHR$]
where [Start Date] is not NULL
order by [Start Date]

--finding missing dates

Select MissingDate = md
From (Select Top (DateDiff(DAY,(Select min([Start Date]) from Actual_simulation_AOP_CY_BUHR$),
(Select max([Start Date]) from Actual_simulation_AOP_CY_BUHR$))+1)

--Ordering the dates first and Ranking them with this->

md=DateAdd(DAY,-1+Row_Number() Over (Order By (Select Null)),cast((Select min([Start Date])
from Actual_simulation_AOP_CY_BUHR$) as date)) 

--joining with master database table
from  master..spt_values n1,master..spt_values n2) A
Left Join Actual_simulation_AOP_CY_BUHR$ B on md=cast([Start Date] as date)
where [Start Date] is null