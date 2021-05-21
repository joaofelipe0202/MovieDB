USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertMoviesData]    Script Date: 21/05/2021 14:23:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertMoviesData]
	-- Add the parameters for the stored procedure here
	@id INT,
	@movie_name VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Movies 
	VALUES (@id, @movie_name)
END
GO

