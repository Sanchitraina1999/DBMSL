create database fifth31155;

use fifth31155;

create table Borrower(
    Rollin int not null,
    Name varchar(25) not null,
    DateofIssue date,
    NameofBook varchar(30),
    Status varchar(5) default 'N',
    primary key(Rollin) 
);

create table fine(
    Rollin int not null, 
    Date date, 
    Amt int default 0, 
    foreign key(Rollin) references Borrower(Rollin) on delete cascade on update cascade
);

insert into Borrower
    (Rollin, Name, DateofIssue, NameofBook)
VALUES
    (1,'sanchit','2020-08-06','junglebook'),
    (2,'ayush','2020-09-11','junglybook'),
    (3,'abhishek','2020-08-05','science'),
    (4,'akash','2020-08-04','maths');

delimiter $$

create procedure calfine(in cid int)
    begin
        declare p_date date;
        declare f_amt int;
        declare diff int;

        declare exit handler for sqlexception select 'Table not found';
        declare exit handler for 1062 select 'duplicate error' as message;
        declare exit handler for not found select 'record not found' as message;

        select DateofIssue into p_date from Borrower where Rollin=cid;
        select datediff(curdate(), p_date) into diff;
         
        if (diff>=15 and diff<=30) then
            set f_amt=diff*5;
            insert into fine values (cid,curdate(),f_amt);
        elseif (diff>30) then
            set f_amt=diff*50;
            insert into fine values (cid,curdate(),f_amt);
        end if;
        update Borrower set Status='P' where Rollin=cid;
    end;
$$
delimiter ;

call calfine(1);

call calfine(2);
