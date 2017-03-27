
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

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3104, 1, 2, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3104, 1, 2, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3104, 1, 3, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3104, 1, 4, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3104, 2, 1, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());

insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(58, 3104, 2, 1, 'Ai do da binh luan trong bai viet cua ban ', GETDATE());


select * from Notification
