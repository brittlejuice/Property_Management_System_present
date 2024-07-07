use proj;
show tables;
select * from Flats;
set sql_safe_updates = 0;

-- drop procedure InsertPropertyRecord;
delimiter //

create procedure InsertPropertyRecord(in Property_id int,in Available_Sdate date,in Available_Edate date,in RENT_PM int,
in Annual_Hike int,in Construction_year int,in Locality varchar(20),in Address varchar(40),in Floors int,in Total_Area
 int,in Plinth_Area int,in Owner_Id int)
 
begin
insert into Property values (Property_id,Available_Sdate,Available_Edate,RENT_PM,Annual_Hike,Construction_year,Locality,Address,
Floors,Total_Area,Plinth_Area,Owner_Id);

end //
delimiter ;


-- drop procedure GetPropertyRecords;
delimiter //
create procedure GetPropertyRecords(in Id int)
begin
select * from Property where Owner_Id=Id;
end //
delimiter ;


-- drop procedure GetTenantDetails;
delimiter //
create procedure  GetTenantDetails(in Id int)
begin
select * from user where user_id in(select Tenant_id from Rents where Property_Id=Id and ongoing = 1);
end //
delimiter ;


 drop procedure CreateNewuser;
delimiter //
create procedure CreateNewuser(in User_ID int,in Aadhar_ID int,in u_name varchar(15),in Sex varchar(1),in Age int,
in Door_No int,in Street_No int,in City varchar(20),in State varchar(20),in Pin_code int,in U_Password varchar(20),
in Email varchar(30),in Oflag int,in Min_Renting_Price int,in Max_Buying_Price int,in T_flag int)

begin
insert into user values(User_ID,Aadhar_ID,u_name,Sex,Age,Door_No,Street_No,City,State,Pin_code,U_Password,Email,Oflag,
Min_Renting_Price,Max_Buying_Price,T_flag);

end //
delimiter ;


-- drop procedure SearchPropertyForRent;

DELIMITER //
CREATE procedure SearchPropertyForRent(IN city_locality VARCHAR(255))
BEGIN
    Select * from Property WHERE Locality = city_locality;
END //

DELIMITER ;


-- drop procedure GetRentHistory;

delimiter //
create procedure GetRentHistory(in Id int)
begin
select * from Rents where Property_Id=Id and ongoing = 0;
end //
delimiter ;

call InsertPropertyRecord(208,'2017-03-10','2021-08-16',8000,21300,2012,'Noida','Nawa Kunk appts. Mayur Vihar Phase-1',18,30000,900,105);
call GetPropertyRecords(101);
call GetTenantDetails(201);
call CreateNewuser(108,4119,'Vidhi','F',20,23,6,'Mumbai','Maharashtra',123456,'vid&5','d@gmail.com',0,5000,1000,1);
call SearchPropertyForRent('Jubliee Hills');
call GetRentHistory(201);