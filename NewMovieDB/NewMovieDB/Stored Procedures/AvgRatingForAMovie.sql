USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[AvgRatingForAMovie]    Script Date: 21/05/2021 14:22:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[AvgRatingForAMovie]
	-- Add the parameters for the stored procedure here
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select movie_name as 'Movie Name', AVG(rating_value) as 'AVG Rating Value'
	from Rating join Movies on Rating.movie_id = Movies.id
	where Movies.id = @id
	group by movie_name
END
GO

