USE [master]
GO
/****** Object:  Database [SistemaLoja]    Script Date: 25/04/2025 12:44:43 ******/
CREATE DATABASE [SistemaLoja]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaLoja', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaLoja.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaLoja_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaLoja_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaLoja] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaLoja].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaLoja] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaLoja] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaLoja] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaLoja] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaLoja] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaLoja] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemaLoja] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaLoja] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaLoja] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaLoja] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaLoja] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaLoja] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaLoja] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaLoja] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaLoja] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaLoja] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaLoja] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaLoja] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaLoja] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaLoja] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaLoja] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaLoja] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaLoja] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaLoja] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaLoja] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaLoja] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaLoja] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaLoja] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaLoja] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaLoja] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemaLoja] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaLoja] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaLoja]
GO
/****** Object:  User [loja]    Script Date: 25/04/2025 12:44:43 ******/
CREATE USER [loja] FOR LOGIN [loja] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [loja]
GO
USE [SistemaLoja]
GO
/****** Object:  Sequence [dbo].[seq_id_pessoa]    Script Date: 25/04/2025 12:44:43 ******/
CREATE SEQUENCE [dbo].[seq_id_pessoa] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[movimentos_compra]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimentos_compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_produto] [int] NULL,
	[id_pessoa_jur] [int] NULL,
	[quantidade] [int] NULL,
	[preco_unitario] [decimal](10, 2) NULL,
	[data_compra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimentos_venda]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimentos_venda](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_produto] [int] NULL,
	[id_pessoa_fis] [int] NULL,
	[quantidade] [int] NULL,
	[preco_unitario] [decimal](10, 2) NULL,
	[data_venda] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pessoa_fisica]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pessoa_fisica](
	[id_pessoa] [int] NOT NULL,
	[cpf] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pessoa_juridica]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pessoa_juridica](
	[id_pessoa] [int] NOT NULL,
	[cnpj] [char](14) NULL,
	[razao_social] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pessoas]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pessoas](
	[id_pessoa] [int] NOT NULL,
	[nome] [varchar](100) NULL,
	[logradouro] [varchar](150) NULL,
	[cidade] [varchar](100) NULL,
	[estado] [varchar](2) NULL,
	[telefone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[cpf] [varchar](20) NULL,
 CONSTRAINT [PK__pessoas__C2215307A460A703] PRIMARY KEY CLUSTERED 
(
	[id_pessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produtos]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produtos](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[quantidade] [int] NULL,
	[preco_venda] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 25/04/2025 12:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[senha] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movimentos_compra] ADD  DEFAULT (getdate()) FOR [data_compra]
GO
ALTER TABLE [dbo].[movimentos_venda] ADD  DEFAULT (getdate()) FOR [data_venda]
GO
ALTER TABLE [dbo].[pessoas] ADD  CONSTRAINT [DF__pessoas__id_pess__4D94879B]  DEFAULT (NEXT VALUE FOR [seq_id_pessoa]) FOR [id_pessoa]
GO
ALTER TABLE [dbo].[movimentos_compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_pj] FOREIGN KEY([id_pessoa_jur])
REFERENCES [dbo].[pessoa_juridica] ([id_pessoa])
GO
ALTER TABLE [dbo].[movimentos_compra] CHECK CONSTRAINT [fk_compra_pj]
GO
ALTER TABLE [dbo].[movimentos_compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_produto] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produtos] ([id_produto])
GO
ALTER TABLE [dbo].[movimentos_compra] CHECK CONSTRAINT [fk_compra_produto]
GO
ALTER TABLE [dbo].[movimentos_compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[movimentos_compra] CHECK CONSTRAINT [fk_compra_usuario]
GO
ALTER TABLE [dbo].[movimentos_venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_pf] FOREIGN KEY([id_pessoa_fis])
REFERENCES [dbo].[pessoa_fisica] ([id_pessoa])
GO
ALTER TABLE [dbo].[movimentos_venda] CHECK CONSTRAINT [fk_venda_pf]
GO
ALTER TABLE [dbo].[movimentos_venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_produto] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produtos] ([id_produto])
GO
ALTER TABLE [dbo].[movimentos_venda] CHECK CONSTRAINT [fk_venda_produto]
GO
ALTER TABLE [dbo].[movimentos_venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[movimentos_venda] CHECK CONSTRAINT [fk_venda_usuario]
GO
ALTER TABLE [dbo].[pessoa_fisica]  WITH CHECK ADD  CONSTRAINT [fk_pf_pessoa] FOREIGN KEY([id_pessoa])
REFERENCES [dbo].[pessoas] ([id_pessoa])
GO
ALTER TABLE [dbo].[pessoa_fisica] CHECK CONSTRAINT [fk_pf_pessoa]
GO
ALTER TABLE [dbo].[pessoa_juridica]  WITH CHECK ADD  CONSTRAINT [fk_pj_pessoa] FOREIGN KEY([id_pessoa])
REFERENCES [dbo].[pessoas] ([id_pessoa])
GO
ALTER TABLE [dbo].[pessoa_juridica] CHECK CONSTRAINT [fk_pj_pessoa]
GO
USE [master]
GO
ALTER DATABASE [SistemaLoja] SET  READ_WRITE 
GO
