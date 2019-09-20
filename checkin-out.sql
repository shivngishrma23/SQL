use [20Septask]
go
create table guest(gid nvarchar(20),GStatus nvarchar(20),gTime time)

insert into guest values('101','check in','3:12PM')
insert into guest values('102','check in','1:12PM')
insert into guest values('103','check in','2:12PM')
insert into guest values('101','check out','7:12PM')
insert into guest values('102','check out','9:12PM')
insert into guest values('104','check in','3:12PM')
insert into guest values('105','check in','7:00AM')
insert into guest values('104','check out','10:1PM')
insert into guest values('106','check in','3:12AM')

select * from  guest
--static method with subquery and join
select * from
(select g1.gid, g1.gtime as [check in time],
g2.gtime as [check out time] from guest g1 
 join guest g2 on g1.gid = g2.gid
 where g1.GStatus='check in' and g2.GStatus = 'check out' )as g
 

 -- using pivot
select *
from guest
pivot
(
max(gtime)
for[gstatus] in ([check in],[check out])

)as p













guest g1  , guest g2
where g1.GStatus = 'check in'  
and g2.GStatus = 'check out' 
and g1.gid= g2.gid
 
