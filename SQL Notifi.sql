
create table Notification
(
	notificationId int IDENTITY(1,1),
	threadId int,
	rateId int,
	accountId int,
	accountIdPush int,
	content nvarchar(500),
	created datetime, 
	status bit ,
	constraint pk_Notification primary key (notificationId),
	CONSTRAINT fk_Thread_Notification FOREIGN KEY (threadId)
	REFERENCES Thread(threadId),
	CONSTRAINT fk_Account_Notification FOREIGN KEY (accountId)
	REFERENCES Account(accountId), 
	CONSTRAINT fk_Account_NotificationPush FOREIGN KEY (accountIdPush)
	REFERENCES Account(accountId), 
	CONSTRAINT fk_Rate_Notification FOREIGN KEY (rateId)
	REFERENCES Rate(rateId)
)
DBCC CHECKIDENT (Notification, RESEED, 1);

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3091, 1, 2, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3092, 1, 2, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3093, 1, 3, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3100, 1, 4, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 4097, 2, 1, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 4098, 2, 1, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());


select * from Notification


select Thread.*, temp.avgScore from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId   WHERE  categoryId =  3 AND Thread.latitude between -0.17997438487199915 and 0.17997438487199915 and Thread.longitude between -0.17997438487199915 and 0.17997438487199915 AND   Province.provinceId = 2 AND   District.districtId = 3 AND   Village.villageId = 19 and status = 1  order by threadId offset 0 rows fetch next 12 row only


select Thread.*, temp.avgScore from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId   WHERE  kindOf = 1  AND     categoryId =  1 AND   object = 1 AND   Village.villageId = 2 and status = 1  order by threadId offset 0 rows fetch next 12 row only

select Thread.*, temp.avgScore from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId   WHERE  kindOf = 1  AND   waterSource =  2 AND   categoryId =  1 AND   object = 1 AND   Village.villageId = 20 and status = 1  order by threadId offset 0 rows fetch next 12 row only
