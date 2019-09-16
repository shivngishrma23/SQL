use triggerss
go
--table 1
create table student(id nvarchar(50),name nvarchar(MAX),Gender nvarchar(10),Department nvarchar(30))
insert into student values('1','Shivi','Female','IT') 
insert into student values('2','Abc','Male','IT') 
insert into student values('3','Shiv','Female','HR') 
insert into student values('4','icy','Female','Finance') 
insert into student values('5','Shivangi','Female','IT') 
select * from student
--table2
create table employee (EmpId nvarchar(10),depname nvarchar(50))
insert into employee values ('1','IT')
insert into employee values ('2','HR')
insert into employee values ('3','IT')

--joining and creating view
create view vwDetails
as
select id,name,Gender,Department
from student
join employee
on student.id=  employee.EmpId
select *from vwDetails

--[Instead of] trigger for inserting in a view with mulpitle base table
create trigger tr_vw_insteadofinsert
on vwDetails
instead of insert
as 
begin
	select * from inserted
	select * from deleted
end

insert into vwDetails values('7','s','female','IT')
/*
--inserting
alter trigger tr_vw_insteadofinsert
on vwDetails
instead of insert
as
begin
	declare @id = id
	from student
	join inserted 
	on inserted.Department = student.Department
--handling wrong inserted valuees
	if (@id is null)
	begin 
		raiserror('invalid department '16,1)
		return
	end
--finaly inserting clean data into student
	insert into student(id,name,Gender,Department)
	select @id,name,Gender ,Department
	from inserted
end
*/


select * from vwDetails





