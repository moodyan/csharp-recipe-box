USE [master]
GO
/****** Object:  Database [recipe_box]    Script Date: 6/15/2017 4:30:14 PM ******/
CREATE DATABASE [recipe_box]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'recipe_box', FILENAME = N'C:\Users\epicodus\recipe_box.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'recipe_box_log', FILENAME = N'C:\Users\epicodus\recipe_box_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [recipe_box] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [recipe_box].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [recipe_box] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [recipe_box] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [recipe_box] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [recipe_box] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [recipe_box] SET ARITHABORT OFF 
GO
ALTER DATABASE [recipe_box] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [recipe_box] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [recipe_box] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [recipe_box] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [recipe_box] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [recipe_box] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [recipe_box] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [recipe_box] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [recipe_box] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [recipe_box] SET  ENABLE_BROKER 
GO
ALTER DATABASE [recipe_box] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [recipe_box] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [recipe_box] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [recipe_box] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [recipe_box] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [recipe_box] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [recipe_box] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [recipe_box] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [recipe_box] SET  MULTI_USER 
GO
ALTER DATABASE [recipe_box] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [recipe_box] SET DB_CHAINING OFF 
GO
ALTER DATABASE [recipe_box] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [recipe_box] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [recipe_box] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [recipe_box] SET QUERY_STORE = OFF
GO
USE [recipe_box]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [recipe_box]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/15/2017 4:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 6/15/2017 4:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ingredient_name] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recipes]    Script Date: 6/15/2017 4:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_name] [varchar](100) NULL,
	[rating] [int] NULL,
	[instructions] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recipes_categories]    Script Date: 6/15/2017 4:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recipes_id] [int] NULL,
	[categories_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recipes_ingredients]    Script Date: 6/15/2017 4:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes_ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recipes_id] [int] NULL,
	[ingredients_id] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [category_name]) VALUES (1, N'Soup')
INSERT [dbo].[categories] ([id], [category_name]) VALUES (2, N'Pizza')
INSERT [dbo].[categories] ([id], [category_name]) VALUES (3, N'Baked Goods')
INSERT [dbo].[categories] ([id], [category_name]) VALUES (4, N'Pasta')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[ingredients] ON 

INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (1, N'Flour')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (2, N'Butter')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (3, N'Salt')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (4, N'Egg(s)')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (5, N'Onion')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (6, N'Green Peppers')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (7, N'Rosemary')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (8, N'Chicken')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (9, N'Cream Cheese')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (10, N'Powdered Sugar')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (11, N'Olive Oil')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (12, N'Vegetable Oil')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (13, N'Peas')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (14, N'Mozzerella')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (15, N'Pepperoni')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (16, N'Milk')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (17, N'Half and Half')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (18, N'Chocolate Chips')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (19, N'Pizza Sauce')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (20, N'Sugar')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (21, N'Strawberries')
INSERT [dbo].[ingredients] ([id], [ingredient_name]) VALUES (43, N'test')
SET IDENTITY_INSERT [dbo].[ingredients] OFF
SET IDENTITY_INSERT [dbo].[recipes] ON 

INSERT [dbo].[recipes] ([id], [recipe_name], [rating], [instructions]) VALUES (1, N'Navy Bean Soup', 6, N'smash the beans, mix with water')
INSERT [dbo].[recipes] ([id], [recipe_name], [rating], [instructions]) VALUES (2, N'PIZZA BY ME ALYSSA', 6, N'1. Buy pizza dough from Trader Joes.
2. Chop onions and green peppers.
3, Spread dough on pizza pan.
4. Spread pizza sauce on dough.
5. Layer cheese, pepperoni, onions, and peppers.
6. Repeat step 5.
7. Bake in oven at 350 degrees until crust is a nice golden brown.
8, EAT ALL OF IT.')
INSERT [dbo].[recipes] ([id], [recipe_name], [rating], [instructions]) VALUES (3, N'COOKIES by DAVID', 5, N'ENJOY with a FRIEND and a cup of MILK
YAY! ^..^')
INSERT [dbo].[recipes] ([id], [recipe_name], [rating], [instructions]) VALUES (4, N'BISCUITS by OTHER DAVID', 98090, N'1. Equal parts half and half and flour.
2. Blob on pan. SLAP IT.
3. Bake at 350 degrees until a beautiful brown.
')
INSERT [dbo].[recipes] ([id], [recipe_name], [rating], [instructions]) VALUES (8, N'just okay PIZZA', 1, N'meh')
INSERT [dbo].[recipes] ([id], [recipe_name], [rating], [instructions]) VALUES (9, N'flan', 6, N'whisk egg with milk and flour. 
add sugar to taste
Pour the mixture into tiny bowls
Put the bowls into refrigerator for about 1h.
Take them out and eat.
1 by 1.
until they all gone.
remember to wash the tiny bowls when you are done eating.
thank you.')
SET IDENTITY_INSERT [dbo].[recipes] OFF
SET IDENTITY_INSERT [dbo].[recipes_categories] ON 

INSERT [dbo].[recipes_categories] ([id], [recipes_id], [categories_id]) VALUES (1, 1, 1)
INSERT [dbo].[recipes_categories] ([id], [recipes_id], [categories_id]) VALUES (2, 3, 3)
INSERT [dbo].[recipes_categories] ([id], [recipes_id], [categories_id]) VALUES (3, 2, 2)
INSERT [dbo].[recipes_categories] ([id], [recipes_id], [categories_id]) VALUES (4, 4, 4)
INSERT [dbo].[recipes_categories] ([id], [recipes_id], [categories_id]) VALUES (5, 8, 3)
SET IDENTITY_INSERT [dbo].[recipes_categories] OFF
SET IDENTITY_INSERT [dbo].[recipes_ingredients] ON 

INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (1, 1, 1)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (2, 2, 14)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (3, 2, 6)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (12, 2, 5)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (13, 9, 2)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (6, 2, 15)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (7, 2, 11)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (8, 3, 1)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (9, 3, 3)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (10, 4, 1)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (11, 4, 17)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (14, 9, 4)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (15, 9, 1)
INSERT [dbo].[recipes_ingredients] ([id], [recipes_id], [ingredients_id]) VALUES (16, 9, 20)
SET IDENTITY_INSERT [dbo].[recipes_ingredients] OFF
USE [master]
GO
ALTER DATABASE [recipe_box] SET  READ_WRITE 
GO
