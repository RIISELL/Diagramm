USE [master]
GO
/****** Object:  Database [CurrencyExchange]    Script Date: 10.02.2023 22:05:50 ******/
CREATE DATABASE [CurrencyExchange]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CurrencyExchange].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CurrencyExchange] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CurrencyExchange] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CurrencyExchange] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CurrencyExchange] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CurrencyExchange] SET ARITHABORT OFF 
GO
ALTER DATABASE [CurrencyExchange] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CurrencyExchange] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CurrencyExchange] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CurrencyExchange] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CurrencyExchange] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CurrencyExchange] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CurrencyExchange] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CurrencyExchange] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CurrencyExchange] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CurrencyExchange] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CurrencyExchange] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CurrencyExchange] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CurrencyExchange] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CurrencyExchange] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CurrencyExchange] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CurrencyExchange] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CurrencyExchange] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CurrencyExchange] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CurrencyExchange] SET  MULTI_USER 
GO
ALTER DATABASE [CurrencyExchange] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CurrencyExchange] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CurrencyExchange] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CurrencyExchange] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CurrencyExchange] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CurrencyExchange] SET QUERY_STORE = OFF
GO
USE [CurrencyExchange]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10.02.2023 22:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id_account] [int] NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[id_role] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10.02.2023 22:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id_country] [int] NOT NULL,
	[name_country] [nvarchar](50) NULL,
	[flag_image] [image] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10.02.2023 22:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id_currency_first] [int] NOT NULL,
	[id_currency_second] [int] NOT NULL,
	[course] [money] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id_currency_first] ASC,
	[id_currency_second] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 10.02.2023 22:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[id_currency] [int] NOT NULL,
	[name_currency] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[id_currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_]    Script Date: 10.02.2023 22:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_](
	[id_role] [int] NOT NULL,
	[role_] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role_] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.02.2023 22:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_account] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[second_name] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
	[balance] [money] NULL,
	[id_currency] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([id_account], [login], [password], [id_role]) VALUES (1, N'user', N'user', 1)
INSERT [dbo].[Account] ([id_account], [login], [password], [id_role]) VALUES (2, N'admin', N'admin', 2)
GO
INSERT [dbo].[Country] ([id_country], [name_country], [flag_image]) VALUES (1, N'Россия', NULL)
INSERT [dbo].[Country] ([id_country], [name_country], [flag_image]) VALUES (2, N'Казахстан', NULL)
GO
INSERT [dbo].[Course] ([id_currency_first], [id_currency_second], [course]) VALUES (1, 2, 6.2100)
GO
INSERT [dbo].[Currency] ([id_currency], [name_currency], [id_country]) VALUES (1, N'Рубль', 1)
INSERT [dbo].[Currency] ([id_currency], [name_currency], [id_country]) VALUES (2, N'Тенге', 2)
GO
INSERT [dbo].[Role_] ([id_role], [role_]) VALUES (1, N'Пользователь')
INSERT [dbo].[Role_] ([id_role], [role_]) VALUES (2, N'Администратор')
GO
INSERT [dbo].[Users] ([id_account], [id_user], [second_name], [name], [patronymic], [balance], [id_currency]) VALUES (1, 1, N'Пупкин', N'Григорий', N'Васильевич', 1000.0000, 1)
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_] FOREIGN KEY([id_role])
REFERENCES [dbo].[Role_] ([id_role])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role_]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Currency] FOREIGN KEY([id_currency_first])
REFERENCES [dbo].[Currency] ([id_currency])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Currency]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Currency1] FOREIGN KEY([id_currency_second])
REFERENCES [dbo].[Currency] ([id_currency])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Currency1]
GO
ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [FK_Currency_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id_country])
GO
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Account] FOREIGN KEY([id_account])
REFERENCES [dbo].[Account] ([id_account])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Account]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Currency] FOREIGN KEY([id_currency])
REFERENCES [dbo].[Currency] ([id_currency])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Currency]
GO
USE [master]
GO
ALTER DATABASE [CurrencyExchange] SET  READ_WRITE 
GO
