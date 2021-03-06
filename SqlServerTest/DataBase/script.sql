USE [master]
GO
/****** Object:  Database [SqlSugar4XTest]    Script Date: 2017/5/29 20:01:11 ******/
CREATE DATABASE [SqlSugar4XTest] 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SqlSugar4XTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SqlSugar4XTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SqlSugar4XTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SqlSugar4XTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SqlSugar4XTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SqlSugar4XTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SqlSugar4XTest] SET RECOVERY FULL 
GO
ALTER DATABASE [SqlSugar4XTest] SET  MULTI_USER 
GO
ALTER DATABASE [SqlSugar4XTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SqlSugar4XTest] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SqlSugar4XTest', N'ON'
GO
USE [SqlSugar4XTest]
GO
/****** Object:  Table [dbo].[School]    Script Date: 2017/5/29 20:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[School](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2017/5/29 20:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NULL,
	[Name] [varchar](50) NULL CONSTRAINT [DF_Student_Name]  DEFAULT ('default name'),
	[CreateTime] [datetime] NULL CONSTRAINT [DF_Student_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [SchoolId], [Name], [CreateTime]) VALUES (92992, 0, N'jack', CAST(N'2010-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([Id], [SchoolId], [Name], [CreateTime]) VALUES (92993, 0, NULL, CAST(N'2010-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  StoredProcedure [dbo].[sp_school]    Script Date: 2017/5/29 20:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_school]
@p1 int,
@p2 int output
as
set @p2=100
select * from  School
 
GO
EXEC [SqlSugar4XTest].sys.sp_addextendedproperty @name=N'Student', @value=N'Student Info' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pk' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Student', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Student Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Student', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'student info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Student'
GO
USE [master]
GO
ALTER DATABASE [SqlSugar4XTest] SET  READ_WRITE 
GO
