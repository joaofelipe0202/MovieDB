USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertAuthorData]    Script Date: 21/05/2021 14:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertAuthorData]
	-- Add the parameters for the stored procedure here
	@id INT,
	@author_age INT,
	@author_gender VARCHAR(50),
	@author_occupation VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Author 
	VALUES (@id, @author_age, @author_gender, @author_occupation)
END
GO

