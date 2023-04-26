USE [master]
GO
/****** Object:  Database [project]    Script Date: 4/27/2023 2:57:36 AM ******/
CREATE DATABASE [project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project] SET ARITHABORT OFF 
GO
ALTER DATABASE [project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project] SET RECOVERY FULL 
GO
ALTER DATABASE [project] SET  MULTI_USER 
GO
ALTER DATABASE [project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'project', N'ON'
GO
ALTER DATABASE [project] SET QUERY_STORE = OFF
GO
USE [project]
GO
/****** Object:  Table [dbo].[account]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[full_name] [varchar](100) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [varchar](100) NULL,
	[date_of_birth] [date] NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
	[parent_category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[status_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[description] [varchar](500) NULL,
	[category_id] [int] NOT NULL,
	[image_url] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((-1)) FOR [role]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[cart] ([cart_id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD FOREIGN KEY([parent_category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[order_status] ([status_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
/****** Object:  StoredProcedure [dbo].[add_cart_item]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_cart_item] @cart_id int,@product_id int
  as 
  begin
  declare @count int
  select @count=count(*) from cart_item
where cart_id=@cart_id  and product_id=@product_id
	if(@count=0) begin INSERT INTO [dbo].[cart_item]
           ([cart_id]
           ,[product_id]
           ,[quantity])
     VALUES (@cart_id,@product_id,1)
	 end
  end
GO
/****** Object:  StoredProcedure [dbo].[insert_into_detail]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_into_detail] @oid int,@pid int, @quantity int
  as
  begin 
  INSERT INTO [dbo].[order_detail]
           ([order_id]
           ,[product_id]
           ,[quantity])
     VALUES
           (@oid
           ,@pid
           ,@quantity)
  end
GO
/****** Object:  StoredProcedure [dbo].[insert_into_order]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_into_order] @aid int
  as
  begin
  INSERT INTO [dbo].[order]
           ([account_id]
           ,[order_date]
           ,[total_price]
           ,[status_id])
     VALUES
           (@aid
           ,getdate()
           ,0.0
           ,1) 
  end
GO
/****** Object:  StoredProcedure [dbo].[insert_order]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[insert_order] @aid int
  as
  begin
  INSERT INTO [dbo].[order]
           ([account_id]
           ,[order_date]
           ,[total_price]
           ,[status_id])
     VALUES
           (@aid
           ,getdate()
           ,0.0
           ,1)
  
  end
GO
/****** Object:  StoredProcedure [dbo].[update_price_order]    Script Date: 4/27/2023 2:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_price_order] @oid int, @price float
as begin
UPDATE [dbo].[order]
   SET 
      [total_price] = @price

      
 WHERE order_id=@oid
end
GO
USE [master]
GO
ALTER DATABASE [project] SET  READ_WRITE 
GO
