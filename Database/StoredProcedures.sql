-----------------------ECafe Stored Procedures creation query------------------
USE DATABASE ECafe;
GO

------------------------------PS4 SP-----------------------------------------
/*SELECTAll PS4s*/
CREATE OR ALTER proc usp_PS4_SelectAll
AS
	SELECT * FROM PS4
/*SelectAllActive PS4s*/
GO
CREATE OR ALTER proc usp_PS4_SelectActive
AS
    SELECT * FROM PS4
	WHERE PS4Status = 1
/*SelectAllInactive PS4s*/
GO
CREATE OR ALTER proc usp_PS4_SelectInactive
AS
    SELECT * FROM PS4
	WHERE PS4Status = 0
/*Insert New PS4*/
GO
CREATE OR ALTER proc usp_PS4_Insert 
    @PS4ID INT,
    @PS4State BIT,
    @PS4Status BIT 
AS
BEGIN	
SET NOCOUNT ON;
  INSERT INTO PS4(PS4ID,PS4State,PS4Status)
  VALUES (@PS4ID,@PS4State,@PS4Status)
END
/*Set PS4 Busy*/
GO
CREATE OR ALTER proc usp_PS4_SetBusy
       @PS4ID INT
  AS
    BEGIN
     UPDATE PS4 
     SET PS4State=0 
     WHERE PS4ID = @PS4ID
    END
/*Set PS4 Available*/
GO
CREATE OR ALTER proc usp_PS4_SetAvailable
       @PS4ID INT
  AS
    BEGIN
     UPDATE PS4 
     SET PS4State=1 
     WHERE PS4ID = @PS4ID
    END
/*Set PS4 Active*/
GO
CREATE OR ALTER proc usp_PS4_SetActive
       @PS4ID INT
  AS
    BEGIN
     UPDATE PS4 
     SET PS4Status=1 
     WHERE PS4ID = @PS4ID
    END	
/*Set PS4 Inactive*/	
GO
CREATE OR ALTER proc usp_PS4_SetInactive
       @PS4ID INT
  AS
    BEGIN
     UPDATE PS4 
     SET PS4Status=0 
     WHERE PS4ID = @PS4ID
    END	
	
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------