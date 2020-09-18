create database fifth31155;

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

delimiter $$

create procedure calfine(in cid int)
    begin
        declare p_date date;
        declare f_amt int;
        declare diff int;

        declare exit handler for sqlexception select 'Table not found';
        select DateofIssue into p_date from Borrower where Rollin=cid;
        select datediff(curdate(), p_date) into diff;

        if (diff>=15 and diff<=30) then
            set f_amt=diff*5;
            insert into fine values (cid,CURDATE(),f_amt);
        elseif (diff>30) then
            set f_amt=diff*50;
            insert into fine values (cid,CURDATE(),f_amt);
        end if;
        update Borrower set Status='P' where Rollin=cid;
    end;
$$
delimiter ;

call calfine(1);

call calfine(2);