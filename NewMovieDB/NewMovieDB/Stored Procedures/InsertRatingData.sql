USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertRatingData]    Script Date: 21/05/2021 14:24:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertRatingData]
	-- Add the parameters for the stored procedure here
	@author_id INT,
	@movie_id INT,
	@rating_value INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Rating
	VALUES (@author_id, @movie_id, @rating_value)
END
GO

