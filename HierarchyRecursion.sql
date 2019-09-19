use Task1
go


select [Position ID],[Parent of Position ID]
from [Actual_simulation_AOP_CY_BUHR$]

--Creating CTE(Recursive) that will call parent id PID to itself


with EmployeeCTE (PID,PpID,lvl) as
  (
   select [Position ID],[Parent of Position ID],1
   from [Actual_simulation_AOP_CY_BUHR$]
   where [Position ID] not like 'NULL'
 
 union all

 select A.[Position ID] ,A.[Parent of Position ID],E.lvl+1
 from [Actual_simulation_AOP_CY_BUHR$] A
 join EmployeeCTE E -- joining cte with itself
 on A.[Position ID] = E.PpID
)

select * from
EmployeeCTE 
option(maxrecursion 20000)

/*
select emp.[Position ID] as Employee ,ISNULL( emp.[Parent of position ID],'SABKA MAALIK')
as Manager
from [Actual_simulation_AOP_CY_BUHR$] emp
left join [Actual_simulation_AOP_CY_BUHR$] mng
on emp.[Position ID] = mng.[parent of position ID]
option (maxrecursion 0)
*/