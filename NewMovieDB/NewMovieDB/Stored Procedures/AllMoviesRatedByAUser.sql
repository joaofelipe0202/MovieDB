USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[AllMoviesRateByAUser]    Script Date: 21/05/2021 14:22:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[AllMoviesRateByAUser]
	-- Add the parameters for the stored procedure here
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select author_id as 'Author Id', movie_name as 'Movie Name'
	from Rating join Movies on Movies.id = Rating.movie_id
	join Author on Author.id = Rating.author_id
	where Author.id = @id
END
GO

