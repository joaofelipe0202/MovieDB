USE [WorkTaskMovieDB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateWithDate]    Script Date: 21/05/2021 14:24:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[UpdateWithDate]
	-- Add the parameters for the stored procedure here
	@id INT,
	@released_date DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Movies
	SET released_date = @released_date
	where id = @id
END
GO

