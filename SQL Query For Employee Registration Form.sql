--Create Table

CREATE TABLE EmployeeDetails
(
SerialNumber int identity(1,1) primary key,
EmployeeName varchar(max),
EmployeeID int,
Emloyee_Date_of_Birth varchar(max),
Mobile_number varchar(max),
Email varchar(max),
Employee_Address varchar(max)
)

SELECT * FROM EmployeeDetails;

--Stored procedure for inserting record into table

CREATE PROC SP_Insert_Into_EmployeeDetails
@EmpName varchar(max),
@EmpID int,
@DOB varchar(max),
@MobileNumber varchar(max),
@EmailID varchar(max),
@EmpAddress varchar(max)
AS
BEGIN
INSERT INTO EmployeeDetails
VALUES(
@EmpName,
@EmpID,
@DOB,
@MobileNumber,
@EmailID,
@EmpAddress
)

END;

SP_Insert_Into_EmployeeDetails 'Durga Mohite', 462, '11/11/2011', '123456789', 'email@gmail.com', 'Shahu Nagar Chinchwad 411033';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored procedure for binding Gridview

CREATE PRoC SP_BindGridView
as 
BEGIN

SELECT * FROM EmployeeDetails
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored procedure for deleting record from Gridview


CREATE PROC SP_DeleteRecord 
@SRNo int
AS
BEGIN
DELETE FROM EmployeeDetails
WHERE SerialNumber=@SRNo;
END