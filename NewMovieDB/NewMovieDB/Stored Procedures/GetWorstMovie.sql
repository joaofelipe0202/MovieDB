USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[GetWorstMovie]    Script Date: 21/05/2021 14:23:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[GetWorstMovie] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Top(1) movie_name as 'Movie Name', avg(rating_value) as 'Avg Rating'
	from Movies join Rating on Movies.id = Rating.movie_id
	group by movie_name
	order by avg(rating_value)
END
GO

