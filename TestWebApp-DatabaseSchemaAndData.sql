USE [master]
GO
/****** Object:  Database [umbracoMapperTestWebApp]    Script Date: 12/12/2013 19:01:35 ******/
CREATE DATABASE [umbracoMapperTestWebApp] ON  PRIMARY 
( NAME = N'umbracoMapperTestWebApp', FILENAME = N'D:\Databases\SqlServer\Data\umbracoMapperTestWebApp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'umbracoMapperTestWebApp_log', FILENAME = N'D:\Databases\SqlServer\Data\umbracoMapperTestWebApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [umbracoMapperTestWebApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET ANSI_NULLS OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET ANSI_PADDING OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET ARITHABORT OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET  DISABLE_BROKER
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET  READ_WRITE
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET RECOVERY SIMPLE
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET  MULTI_USER
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [umbracoMapperTestWebApp] SET DB_CHAINING OFF
GO
USE [umbracoMapperTestWebApp]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType] 
(
	[alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON
INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
/****** Object:  Table [dbo].[cmsTags]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsStylesheetProperty]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheetProperty](
	[nodeId] [int] NOT NULL,
	[stylesheetPropertyEditor] [bit] NULL,
	[stylesheetPropertyAlias] [nvarchar](50) NULL,
	[stylesheetPropertyValue] [nvarchar](400) NULL,
 CONSTRAINT [PK_cmsStylesheetProperty] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NOT NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroPropertyType]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroPropertyTypeAlias] [nvarchar](50) NULL,
	[macroPropertyTypeRenderAssembly] [nvarchar](255) NULL,
	[macroPropertyTypeRenderType] [nvarchar](255) NULL,
	[macroPropertyTypeBaseType] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacroPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsMacroPropertyType] ON
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (3, N'mediaCurrent', N'umbraco.macroRenderings', N'media', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (4, N'contentSubs', N'umbraco.macroRenderings', N'content', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (5, N'contentRandom', N'umbraco.macroRenderings', N'content', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (6, N'contentPicker', N'umbraco.macroRenderings', N'content', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (13, N'number', N'umbraco.macroRenderings', N'numeric', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (14, N'bool', N'umbraco.macroRenderings', N'yesNo', N'Boolean')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (16, N'text', N'umbraco.macroRenderings', N'text', N'String')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (17, N'contentTree', N'umbraco.macroRenderings', N'content', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (18, N'contentType', N'umbraco.macroRenderings', N'contentTypeSingle', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (19, N'contentTypeMultiple', N'umbraco.macroRenderings', N'contentTypeMultiple', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (20, N'contentAll', N'umbraco.macroRenderings', N'content', N'Int32')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (21, N'tabPicker', N'umbraco.macroRenderings', N'tabPicker', N'String')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (22, N'tabPickerMultiple', N'umbraco.macroRenderings', N'tabPickerMultiple', N'String')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (23, N'propertyTypePicker', N'umbraco.macroRenderings', N'propertyTypePicker', N'String')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (24, N'propertyTypePickerMultiple', N'umbraco.macroRenderings', N'propertyTypePickerMultiple', N'String')
INSERT [dbo].[cmsMacroPropertyType] ([id], [macroPropertyTypeAlias], [macroPropertyTypeRenderAssembly], [macroPropertyTypeRenderType], [macroPropertyTypeBaseType]) VALUES (25, N'textMultiLine', N'umbraco.macroRenderings', N'textMultiple', N'String')
SET IDENTITY_INSERT [dbo].[cmsMacroPropertyType] OFF
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
/****** Object:  Table [dbo].[umbracoUserLogins]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogins](
	[contextID] [uniqueidentifier] NOT NULL,
	[userID] [int] NOT NULL,
	[timeout] [bigint] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [umbracoUserLogins_Index] ON [dbo].[umbracoUserLogins] 
(
	[contextID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[umbracoUserLogins] ([contextID], [userID], [timeout]) VALUES (N'1e664544-399c-4bec-97fd-00fc784ee37a', 0, 635224000245953866)
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer] 
(
	[computerName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer] 
(
	[isActive] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode] 
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode] 
(
	[parentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoNode] ON
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textbox multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-38, 0, -1, 0, 1, N'-1,-38', 2, N'fd9f1447-6c61-4a7c-9595-5aa39147d318', N'Folder Browser', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A291009911F3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A291009911F3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A291009911F0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A291009911F8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A291009911F8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A291009911F8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1038, 0, -1, 0, 1, N'-1,1038', 2, N'1251c96c-185c-4e9b-93f4-b48205573cbd', N'Simple Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1039, 0, -1, 0, 1, N'-1,1039', 2, N'06f349a9-c949-4b6a-8660-59c10451af42', N'Ultimate Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1042, 0, -1, 0, 1, N'-1,1042', 2, N'0a452bd5-83f9-4bc3-8403-1286e13fb77e', N'Macro Container', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A291009911F9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'bf86e811-33f9-4d91-8b01-61cf9da058fc', N'UberDocType', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A29100DB7D84 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 0, N'd1d85063-f063-4753-b775-ee3487e747e9', N'UberDocType', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A29100DB7DA4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 0, N'd239369e-97bc-4084-bbe9-9b22cf7dd685', N'Test Page', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A29100DBB39A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, 0, 1, N'-1,1047', 1, N'47ba02a8-79e7-401a-a9d1-bbcdf6d36a14', N'Comment', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A29100F8959C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, 1046, 0, 2, N'-1,1046,1048', 0, N'9ad134f8-7cdb-43e9-ac2f-6d0dd4285058', N'First Comment', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A29100F92D56 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, 1046, 0, 2, N'-1,1046,1049', 1, N'cfb9f76d-fc28-4de1-a400-e1881a0d081d', N'Second Comment', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A29100F95900 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 1, N'd3b66414-0bbe-4ab3-9123-64c6522b305b', N'DAMP Image', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2910124308E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, -1, 0, 1, N'-1,1051', 0, N'06754f05-3b75-4453-9241-38e9b4be9dcd', N'Images', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A291012460C5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1052, 0, 1051, 0, 2, N'-1,1051,1052', 0, N'bf1a5d90-2042-47d8-a412-26489f0923fa', N'Flower Image', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A29101247B76 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1053, 0, -1, 0, 1, N'-1,1053', 2, N'18c4e100-fbb0-4044-ab94-73a89409d5e0', N'Data Folder', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A29101265A97 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, -1, 0, 1, N'-1,1054', 3, N'bc8e0a1e-050c-46fa-aefd-c95b4930718f', N'Country', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A2910126735A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, -1, 0, 1, N'-1,1055', 1, N'ba2953db-cb00-4c87-91f2-3ac5639c7765', N'Countries', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A2910126E13A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, 1055, 0, 2, N'-1,1055,1056', 0, N'bcf12825-5c20-4036-a64b-9de9cc6869fa', N'United Kingdom', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A29101270803 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, 1055, 0, 2, N'-1,1055,1057', 1, N'f880f743-40d1-4eaf-857a-5bc67b150ac3', N'Italy', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A29101271395 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1058, 0, 1055, 0, 2, N'-1,1055,1058', 2, N'2e7d8cb6-7493-4216-9bda-b68fb19718d6', N'Spain', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A29101272427 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 0, -1, 0, 1, N'-1,1059', 2, N'32577010-5a29-48ca-909d-8ab25f41bfce', N'Country Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A29101274312 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog] 
(
	[NodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLog] ON
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, 1045, CAST(0x0000A29100DB7DD4 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, 1045, CAST(0x0000A29100DB8AEF AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 1045, CAST(0x0000A29100DB994F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 1046, CAST(0x0000A29100DBB3E8 AS DateTime), N'New', N'Content ''Test Page'' was created with Id 1046')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 1046, CAST(0x0000A29100DBB437 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1046, CAST(0x0000A29100DBB5A8 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 1046, CAST(0x0000A29100DBBC32 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 1045, CAST(0x0000A29100F0B592 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 1046, CAST(0x0000A29100F0E525 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, 1046, CAST(0x0000A29100F0F9BD AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 1045, CAST(0x0000A29100F1A3E9 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, 1046, CAST(0x0000A29100F1ABF5 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, 1046, CAST(0x0000A29100F1B969 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, 1045, CAST(0x0000A29100F494A3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, 1046, CAST(0x0000A29100F49B98 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, 1046, CAST(0x0000A29100F4A832 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, 1045, CAST(0x0000A29100F6F657 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, 1046, CAST(0x0000A29100F6FDEB AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, 1046, CAST(0x0000A29100F721E6 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, 1045, CAST(0x0000A29100F74062 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1046, CAST(0x0000A29100F7464E AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 1046, CAST(0x0000A29100F75049 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 1047, CAST(0x0000A29100F89614 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 1047, CAST(0x0000A29100F8A66F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1047, CAST(0x0000A29100F8BECC AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 1047, CAST(0x0000A29100F8CD55 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 1047, CAST(0x0000A29100F8E045 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, 1047, CAST(0x0000A29100F8E368 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, 1045, CAST(0x0000A29100F8EBE5 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 1045, CAST(0x0000A29100F902FF AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 1047, CAST(0x0000A29100F914F3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 1046, CAST(0x0000A29100F91C0B AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 1048, CAST(0x0000A29100F92D79 AS DateTime), N'New', N'Content ''First Comment'' was created with Id 1048')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 1048, CAST(0x0000A29100F92DF3 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 1048, CAST(0x0000A29100F92F2D AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 1048, CAST(0x0000A29100F94BD5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1049, CAST(0x0000A29100F95921 AS DateTime), N'New', N'Content ''Second Comment'' was created with Id 1049')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 1049, CAST(0x0000A29100F95950 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1049, CAST(0x0000A29100F95A67 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1049, CAST(0x0000A29100F97268 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, -1, CAST(0x0000A2910107F290 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, -1, CAST(0x0000A29101083F74 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, -1, CAST(0x0000A2910108792E AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1051, CAST(0x0000A2910124613B AS DateTime), N'New', N'Media ''Images'' was created with Id 1051')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1052, CAST(0x0000A29101247B88 AS DateTime), N'New', N'Media ''Flower Image'' was created with Id 1052')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1052, CAST(0x0000A2910124AA99 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 1052, CAST(0x0000A2910124AAD6 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1045, CAST(0x0000A2910124CF6D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 1046, CAST(0x0000A2910124E526 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1046, CAST(0x0000A2910124E993 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1046, CAST(0x0000A29101257063 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1046, CAST(0x0000A29101258730 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1045, CAST(0x0000A291012640FD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 1053, CAST(0x0000A29101265AC6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1053, CAST(0x0000A291012665C3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1054, CAST(0x0000A29101267372 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1053, CAST(0x0000A29101268191 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 1054, CAST(0x0000A2910126CE11 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1046, CAST(0x0000A2910126DDA8 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 1055, CAST(0x0000A2910126E166 AS DateTime), N'New', N'Content ''Countries'' was created with Id 1055')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1055, CAST(0x0000A2910126E1C2 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 1055, CAST(0x0000A2910126F5DF AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1055, CAST(0x0000A2910126F99E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1056, CAST(0x0000A29101270815 AS DateTime), N'New', N'Content ''United Kingdom'' was created with Id 1056')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1056, CAST(0x0000A29101270834 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 1056, CAST(0x0000A2910127097E AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1056, CAST(0x0000A29101270BB8 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 1057, CAST(0x0000A291012713AC AS DateTime), N'New', N'Content ''Italy'' was created with Id 1057')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1057, CAST(0x0000A291012713E3 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 1057, CAST(0x0000A29101271480 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1057, CAST(0x0000A2910127171B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1058, CAST(0x0000A2910127243C AS DateTime), N'New', N'Content ''Spain'' was created with Id 1058')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1058, CAST(0x0000A2910127245D AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1058, CAST(0x0000A29101272580 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 1058, CAST(0x0000A2910127295B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 1058, CAST(0x0000A29101279107 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1045, CAST(0x0000A2910127A7B8 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 1058, CAST(0x0000A2910127AF8F AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1046, CAST(0x0000A2910127B498 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1046, CAST(0x0000A2910127F66B AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1046, CAST(0x0000A291012806B5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1045, CAST(0x0000A291013F4C68 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1046, CAST(0x0000A291013F5B06 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1046, CAST(0x0000A291013F5DF7 AS DateTime), N'Open', N'')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1046, CAST(0x0000A291013FA35E AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 12/12/2013 19:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage] 
(
	[languageISOCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[master] [int] NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [master], [alias], [design]) VALUES (1, 1044, NULL, N'UberDocType', N' ')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](125) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userDefaultPermissions] [nvarchar](50) NULL,
	[userLanguage] [nvarchar](10) NULL,
	[defaultToLiveEditing] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser] 
(
	[userLogin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoUser] ON
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userDefaultPermissions], [userLanguage], [defaultToLiveEditing]) VALUES (0, 0, 0, 1, -1, -1, N'admin', N'admin', N'W477AMlLwwJQeAGlPZKiEILr8TA=', N'admin@example.com', NULL, N'en', 0)
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroPropertyHidden] [bit] NOT NULL,
	[macroPropertyType] [int] NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsStylesheet]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheet](
	[nodeId] [int] NOT NULL,
	[filename] [nvarchar](100) NOT NULL,
	[content] [ntext] NULL,
 CONSTRAINT [PK_cmsStylesheet] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType] 
(
	[icon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContentType] ON
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'folder.gif', N'folder.png', NULL, 1, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'mediaPhoto.gif', N'mediaPhoto.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'mediaFile.gif', N'mediaFile.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1045, N'UberDocType', N'.sprTreeDoc', N'folder.png', N'', 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1047, N'Comment', N'.sprTreeMember', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (537, 1053, N'DataFolder', N'folder.gif', N'folder.png', N'', 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1054, N'Country', N'.sprTreeSettingScript', N'folder.png', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
/****** Object:  Table [dbo].[cmsContent]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1046, 1045)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (2, 1048, 1047)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1049, 1047)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1051, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1052, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1055, 1053)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (7, 1056, 1054)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1057, 1054)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1058, 1054)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[controlId] [uniqueidentifier] NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsDataType] ON
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (1, -49, N'38b352c1-e9f8-4fd8-9324-9a2eab06d97a', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (2, -51, N'1413afcb-d19a-4173-8e9a-68288d2a73b8', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (3, -87, N'5e9b75ae-face-41c8-b47e-5f4b0fd82f83', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (4, -88, N'ec15c1e5-9d90-422a-aa52-4f7622c63bea', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (5, -89, N'67db8357-ef57-493e-91ac-936d305e0f2a', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (6, -90, N'5032a6e6-69e3-491d-bb28-cd31cd11086c', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (7, -92, N'6c738306-4c17-4d88-b9bd-6546f3771597', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (8, -36, N'b6fb1622-afa5-4bbf-a3cc-d9672a442222', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (9, -37, N'f8d60f68-ec59-4974-b43b-c46eb5677985', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (10, -38, N'cccd4ae9-f399-4ed2-8038-2e88d19e810c', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (11, -39, N'928639ed-9c73-4028-920c-1e55dbb68783', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (12, -40, N'a52c7c1c-c330-476e-8605-d63d3b84b6a6', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (13, -41, N'23e93522-3200-44e2-9f29-e61a6fcbb79a', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (14, -42, N'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (15, -43, N'b4471851-82b6-4c75-afa4-39fa9c6a75e9', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (16, 1034, N'158aa029-24ed-4948-939e-c3da209e5fba', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (17, 1035, N'ead69342-f06d-4253-83ac-28000225583b', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (18, 1036, N'39f533e4-0551-4505-a64b-e0425c5ce775', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (19, 1038, N'60b7dabf-99cd-41eb-b8e9-4d2e669bbde9', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (20, 1039, N'cdbf0b5d-5cb2-445f-bc12-fcaaec07cf2c', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (21, 1040, N'71b8ad1a-8dc2-425c-b6b8-faa158075e63', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (22, 1041, N'4023e540-92f5-11dd-ad8b-0800200c9a66', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (23, 1042, N'474fcff8-9d2d-11de-abc6-ad7a56d89593', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (24, 1043, N'7a2d436c-34c2-410f-898f-4a23b3d79f54', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (25, 1050, N'ef94c406-9e83-4058-a780-0375624ba7ca', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [controlId], [dbType]) VALUES (26, 1059, N'7e062c13-7c41-4ad9-b389-41d88aeef87c', N'Ntext')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1045, 1044, 1)
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[alias] [nvarchar](255) NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument] 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'cf9a0f83-1b18-4723-ab9a-0d36d618387b', N'Test Page', NULL, NULL, CAST(0x0000A29100DBBBEF AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1058, 1, 0, N'57d6ab69-1f5a-4999-8a85-0f2bc68ddfcf', N'Spain', NULL, NULL, CAST(0x0000A29101272922 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'6a614c27-c1eb-451e-b14c-19d171e99735', N'Test Page', NULL, NULL, CAST(0x0000A29100DBB39A AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', N'Test Page', NULL, NULL, CAST(0x0000A29100F7214C AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1056, 1, 0, N'8ef3a4c3-11e8-4845-b86e-415b738d0070', N'United Kingdom', NULL, NULL, CAST(0x0000A29101270B83 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'02ca2770-2655-436c-9627-49b5b96fcff4', N'Test Page', NULL, NULL, CAST(0x0000A29100F1B8E2 AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', N'Test Page', NULL, NULL, CAST(0x0000A29100F75024 AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1057, 0, 0, N'bd218f62-4307-4190-a3ea-58db654ce2ef', N'Italy', NULL, NULL, CAST(0x0000A291012713BA AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'56cbf9f8-45fc-41ee-9d8b-63d790b176f1', N'Test Page', NULL, NULL, CAST(0x0000A29100DBB420 AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1048, 0, 0, N'ece58501-76e2-4add-b83e-81344e68c5a1', N'First Comment', NULL, NULL, CAST(0x0000A29100F92DB2 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1055, 1, 0, N'000d8e56-dbd8-4a4b-98a4-848ffc333a5b', N'Countries', NULL, NULL, CAST(0x0000A2910126F950 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 1, 0, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', N'Test Page', NULL, NULL, CAST(0x0000A291013FA2E1 AS DateTime), 1044, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1057, 1, 0, N'239cd738-d65f-4f36-b9d5-8a0faa95be36', N'Italy', NULL, NULL, CAST(0x0000A291012716EA AS DateTime), NULL, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1049, 0, 0, N'6a1209ad-3dac-4c05-abf7-a8e6a4940b0b', N'Second Comment', NULL, NULL, CAST(0x0000A29100F95944 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1049, 1, 0, N'ed485879-c76a-49d6-a5ee-b212b38179cc', N'Second Comment', NULL, NULL, CAST(0x0000A29100F97228 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1056, 0, 0, N'9c983c58-fd89-425d-bcb8-bc042c720dc7', N'United Kingdom', NULL, NULL, CAST(0x0000A29101270829 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1055, 0, 0, N'dfebc1e8-7bf7-4e08-a7d8-bd27e62f627e', N'Countries', NULL, NULL, CAST(0x0000A2910126E17A AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'cd714699-9f2f-4e44-845e-c3e9ce35f3fc', N'Test Page', NULL, NULL, CAST(0x0000A29100F0F8E0 AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1048, 0, 0, N'7d967787-d4be-4b07-ab3a-d2a4ece428a1', N'First Comment', NULL, NULL, CAST(0x0000A29100F92D56 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1049, 0, 0, N'19ca462b-76b6-4d0d-8a7c-e70a6d0788e3', N'Second Comment', NULL, NULL, CAST(0x0000A29100F95900 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1058, 0, 0, N'9e9099ce-56a2-4dd2-8d04-ea6919135732', N'Spain', NULL, NULL, CAST(0x0000A29101272452 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1048, 1, 0, N'61990e64-9cf3-481e-b77f-ead15e4a8fca', N'First Comment', NULL, NULL, CAST(0x0000A29100F94B94 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', N'Test Page', NULL, NULL, CAST(0x0000A291012586EB AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', N'Test Page', NULL, NULL, CAST(0x0000A29100F4A78C AS DateTime), 1044, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1046, 0, 0, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', N'Test Page', NULL, NULL, CAST(0x0000A2910128068E AS DateTime), 1044, NULL, 0)
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1046, N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T19:23:45" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
  <averageScore>21.5</averageScore>
  <mainImage>1052</mainImage>
  <countries><![CDATA[1057,1058]]></countries>
  <relatedLinks>
    <links>
      <link title="Zone Website" link="http://www.thisiszone.com" type="external" newwindow="0" />
      <link title="Umbraco Website" link="http://www.umbraco.com" type="external" newwindow="0" />
    </links>
  </relatedLinks>
</UberDocType>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1048, N'<Comment id="1048" parentID="1046" level="2" creatorID="0" sortOrder="0" createDate="2013-12-11T15:07:13" updateDate="2013-12-11T15:07:39" nodeName="First Comment" urlName="first-comment" path="-1,1046,1048" isDoc="" nodeType="1047" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Comment">
  <text><![CDATA[This is the first comment]]></text>
  <author>Fred</author>
  <createdOn>2013-12-11T14:15:00</createdOn>
</Comment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1049, N'<Comment id="1049" parentID="1046" level="2" creatorID="0" sortOrder="1" createDate="2013-12-11T15:07:50" updateDate="2013-12-11T15:08:12" nodeName="Second Comment" urlName="second-comment" path="-1,1046,1049" isDoc="" nodeType="1047" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Comment">
  <text><![CDATA[This is the second comment]]></text>
  <author>Sally</author>
  <createdOn>2013-12-11T18:00:00</createdOn>
</Comment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1051, N'<Folder id="1051" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T17:44:30" updateDate="2013-12-11T17:44:30" nodeName="Images" urlName="images" path="-1,1051" isDoc="" nodeType="1031" writerName="admin" writerID="0" version="02dd148a-9531-415b-8c70-13c67030a5ef" template="0" nodeTypeAlias="Folder">
  <contents></contents>
</Folder>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1052, N'<Image id="1052" version="4972feab-29eb-4b99-8bc6-f60e590aff12" parentID="1051" level="2" writerID="0" nodeType="1032" template="0" sortOrder="0" createDate="2013-12-11T17:44:53" updateDate="2013-12-11T17:45:34" nodeName="Flower Image" urlName="flowerimage" writerName="admin" nodeTypeAlias="Image" path="-1,1051,1052"><umbracoFile>/media/1001/flowers.jpg</umbracoFile><umbracoWidth>208</umbracoWidth><umbracoHeight>208</umbracoHeight><umbracoBytes>34305</umbracoBytes><umbracoExtension>jpg</umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1055, N'<DataFolder id="1055" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2013-12-11T17:53:37" updateDate="2013-12-11T17:53:58" nodeName="Countries" urlName="countries" path="-1,1055" isDoc="" nodeType="1053" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="DataFolder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1056, N'<Country id="1056" parentID="1055" level="2" creatorID="0" sortOrder="0" createDate="2013-12-11T17:54:10" updateDate="2013-12-11T17:54:13" nodeName="United Kingdom" urlName="united-kingdom" path="-1,1055,1056" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1057, N'<Country id="1057" parentID="1055" level="2" creatorID="0" sortOrder="1" createDate="2013-12-11T17:54:20" updateDate="2013-12-11T17:54:23" nodeName="Italy" urlName="italy" path="-1,1055,1057" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1058, N'<Country id="1058" parentID="1055" level="2" creatorID="0" sortOrder="2" createDate="2013-12-11T17:54:34" updateDate="2013-12-11T17:54:38" nodeName="Spain" urlName="spain" path="-1,1055,1058" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
	[LanguageLocale] [nvarchar](10) NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion] 
(
	[VersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (1, 1046, N'6a614c27-c1eb-451e-b14c-19d171e99735', CAST(0x0000A29100DBB39A AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (2, 1046, N'56cbf9f8-45fc-41ee-9d8b-63d790b176f1', CAST(0x0000A29100DBB420 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (3, 1046, N'cf9a0f83-1b18-4723-ab9a-0d36d618387b', CAST(0x0000A29100DBBBEF AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (4, 1046, N'cd714699-9f2f-4e44-845e-c3e9ce35f3fc', CAST(0x0000A29100F0F8E0 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (5, 1046, N'02ca2770-2655-436c-9627-49b5b96fcff4', CAST(0x0000A29100F1B8E2 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (6, 1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', CAST(0x0000A29100F4A78C AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (7, 1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', CAST(0x0000A29100F7214C AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (8, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', CAST(0x0000A29100F75024 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (9, 1048, N'7d967787-d4be-4b07-ab3a-d2a4ece428a1', CAST(0x0000A29100F92D56 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (10, 1048, N'ece58501-76e2-4add-b83e-81344e68c5a1', CAST(0x0000A29100F92DB2 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (11, 1048, N'61990e64-9cf3-481e-b77f-ead15e4a8fca', CAST(0x0000A29100F94B94 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (12, 1049, N'19ca462b-76b6-4d0d-8a7c-e70a6d0788e3', CAST(0x0000A29100F95900 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (13, 1049, N'6a1209ad-3dac-4c05-abf7-a8e6a4940b0b', CAST(0x0000A29100F95944 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (14, 1049, N'ed485879-c76a-49d6-a5ee-b212b38179cc', CAST(0x0000A29100F97228 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (15, 1051, N'02dd148a-9531-415b-8c70-13c67030a5ef', CAST(0x0000A291012460C5 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (16, 1052, N'4972feab-29eb-4b99-8bc6-f60e590aff12', CAST(0x0000A29101247B76 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (17, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', CAST(0x0000A291012586EB AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (18, 1055, N'dfebc1e8-7bf7-4e08-a7d8-bd27e62f627e', CAST(0x0000A2910126E17A AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (19, 1055, N'000d8e56-dbd8-4a4b-98a4-848ffc333a5b', CAST(0x0000A2910126F950 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (20, 1056, N'9c983c58-fd89-425d-bcb8-bc042c720dc7', CAST(0x0000A29101270829 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (21, 1056, N'8ef3a4c3-11e8-4845-b86e-415b738d0070', CAST(0x0000A29101270B83 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (22, 1057, N'bd218f62-4307-4190-a3ea-58db654ce2ef', CAST(0x0000A291012713BA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (23, 1057, N'239cd738-d65f-4f36-b9d5-8a0faa95be36', CAST(0x0000A291012716EA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (24, 1058, N'9e9099ce-56a2-4dd2-8d04-ea6919135732', CAST(0x0000A29101272452 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (25, 1058, N'57d6ab69-1f5a-4999-8a85-0f2bc68ddfcf', CAST(0x0000A29101272922 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (26, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', CAST(0x0000A2910128068E AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (27, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', CAST(0x0000A291013FA2E1 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1045, 1047, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1053, 1054, 0)
/****** Object:  Table [dbo].[cmsTask]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentGroupId] [int] NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (3, NULL, 1032, N'Image', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (4, NULL, 1033, N'File', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (5, NULL, 1031, N'Contents', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (6, NULL, 1045, N'Content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (7, NULL, 1047, N'Content', 0)
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [nvarchar](2500) NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1050, N'id', 1, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1050, N'picker', 7, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1050, N'1051', 2, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (8, 1050, N'', 8, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (9, 1050, N'False', 9, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, 1050, N'', 3, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, 1050, N'', 11, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, 1050, N'', 12, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (13, 1050, N'1033', 13, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (14, 1050, N'False', 10, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (15, 1050, N'True', 4, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (16, 1050, N'-1', 5, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (17, 1050, N'-1', 6, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (18, 1050, N'', 16, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (19, 1050, N'', 17, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (20, 1050, N'100', 14, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (21, 1050, N'100', 15, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (22, 1050, N'False', 18, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (23, 1050, N'False', 19, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (24, 1050, N'False', 20, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (25, 1050, N'False', 21, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (26, 1050, N'False', 22, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (27, 1050, N'', 23, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (28, 1059, N'content', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (29, 1059, N'/*[self::Country]', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (30, 1059, N'3', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (31, 1059, N'False', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (32, 1059, N'1', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (33, 1059, N'1', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (34, 1059, N'1055', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (35, 1059, N'False', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (36, 1059, N'0', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (37, 1059, N'1', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (38, 1059, N'', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (39, 1059, N'200', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (40, 1059, N'0', 0, N'')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
/****** Object:  Table [dbo].[cmsMember]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'cf9a0f83-1b18-4723-ab9a-0d36d618387b', CAST(0x0000A29100DBBBF7 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T13:20:01" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', CAST(0x0000A29100F7219A AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T14:59:46" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
  <averageScore></averageScore>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'02ca2770-2655-436c-9627-49b5b96fcff4', CAST(0x0000A29100F1B92D AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T14:40:05" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', CAST(0x0000A29100F75031 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T15:00:26" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
  <averageScore>21.5</averageScore>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'56cbf9f8-45fc-41ee-9d8b-63d790b176f1', CAST(0x0000A29100DBB433 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T13:19:54" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading></heading>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', CAST(0x0000A291013FA325 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T19:23:45" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
  <averageScore>21.5</averageScore>
  <mainImage>1052</mainImage>
  <countries><![CDATA[1057,1058]]></countries>
  <relatedLinks>
    <links>
      <link title="Zone Website" link="http://www.thisiszone.com" type="external" newwindow="0" />
      <link title="Umbraco Website" link="http://www.umbraco.com" type="external" newwindow="0" />
    </links>
  </relatedLinks>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'cd714699-9f2f-4e44-845e-c3e9ce35f3fc', CAST(0x0000A29100F0F933 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T14:37:21" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', CAST(0x0000A29101258704 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T17:48:41" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
  <averageScore>21.5</averageScore>
  <mainImage>1052</mainImage>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', CAST(0x0000A29100F4A7E6 AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T14:50:45" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', CAST(0x0000A2910128069E AS DateTime), N'<UberDocType id="1046" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-11T13:19:54" updateDate="2013-12-11T17:57:47" nodeName="Test Page" urlName="test-page" path="-1,1046" isDoc="" nodeType="1045" creatorName="admin" writerName="admin" writerID="0" template="1044" nodeTypeAlias="UberDocType">
  <heading>Test Heading</heading>
  <bodyText><![CDATA[<p>This is the <strong>body text</strong>.</p>]]></bodyText>
  <starRating>5</starRating>
  <isApproved>1</isApproved>
  <averageScore>21.5</averageScore>
  <mainImage>1052</mainImage>
  <countries><![CDATA[1057,1058]]></countries>
</UberDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1048, N'ece58501-76e2-4add-b83e-81344e68c5a1', CAST(0x0000A29100F92DE9 AS DateTime), N'<Comment id="1048" parentID="1046" level="2" creatorID="0" sortOrder="0" createDate="2013-12-11T15:07:13" updateDate="2013-12-11T15:07:13" nodeName="First Comment" urlName="first-comment" path="-1,1046,1048" isDoc="" nodeType="1047" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Comment">
  <text><![CDATA[]]></text>
  <author></author>
  <createdOn></createdOn>
</Comment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1048, N'61990e64-9cf3-481e-b77f-ead15e4a8fca', CAST(0x0000A29100F94BA3 AS DateTime), N'<Comment id="1048" parentID="1046" level="2" creatorID="0" sortOrder="0" createDate="2013-12-11T15:07:13" updateDate="2013-12-11T15:07:39" nodeName="First Comment" urlName="first-comment" path="-1,1046,1048" isDoc="" nodeType="1047" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Comment">
  <text><![CDATA[This is the first comment]]></text>
  <author>Fred</author>
  <createdOn>2013-12-11T14:15:00</createdOn>
</Comment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1049, N'6a1209ad-3dac-4c05-abf7-a8e6a4940b0b', CAST(0x0000A29100F9594C AS DateTime), N'<Comment id="1049" parentID="1046" level="2" creatorID="0" sortOrder="1" createDate="2013-12-11T15:07:50" updateDate="2013-12-11T15:07:51" nodeName="Second Comment" urlName="second-comment" path="-1,1046,1049" isDoc="" nodeType="1047" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Comment">
  <text><![CDATA[]]></text>
  <author></author>
  <createdOn></createdOn>
</Comment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1049, N'ed485879-c76a-49d6-a5ee-b212b38179cc', CAST(0x0000A29100F9723E AS DateTime), N'<Comment id="1049" parentID="1046" level="2" creatorID="0" sortOrder="1" createDate="2013-12-11T15:07:50" updateDate="2013-12-11T15:08:12" nodeName="Second Comment" urlName="second-comment" path="-1,1046,1049" isDoc="" nodeType="1047" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Comment">
  <text><![CDATA[This is the second comment]]></text>
  <author>Sally</author>
  <createdOn>2013-12-11T18:00:00</createdOn>
</Comment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1055, N'000d8e56-dbd8-4a4b-98a4-848ffc333a5b', CAST(0x0000A2910126F95F AS DateTime), N'<DataFolder id="1055" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2013-12-11T17:53:37" updateDate="2013-12-11T17:53:58" nodeName="Countries" urlName="countries" path="-1,1055" isDoc="" nodeType="1053" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="DataFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1055, N'dfebc1e8-7bf7-4e08-a7d8-bd27e62f627e', CAST(0x0000A2910126E1B9 AS DateTime), N'<DataFolder id="1055" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2013-12-11T17:53:37" updateDate="2013-12-11T17:53:37" nodeName="Countries" urlName="countries" path="-1,1055" isDoc="" nodeType="1053" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="DataFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'8ef3a4c3-11e8-4845-b86e-415b738d0070', CAST(0x0000A29101270B93 AS DateTime), N'<Country id="1056" parentID="1055" level="2" creatorID="0" sortOrder="0" createDate="2013-12-11T17:54:10" updateDate="2013-12-11T17:54:13" nodeName="United Kingdom" urlName="united-kingdom" path="-1,1055,1056" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'9c983c58-fd89-425d-bcb8-bc042c720dc7', CAST(0x0000A2910127082F AS DateTime), N'<Country id="1056" parentID="1055" level="2" creatorID="0" sortOrder="0" createDate="2013-12-11T17:54:10" updateDate="2013-12-11T17:54:10" nodeName="United Kingdom" urlName="united-kingdom" path="-1,1055,1056" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1057, N'bd218f62-4307-4190-a3ea-58db654ce2ef', CAST(0x0000A291012713CC AS DateTime), N'<Country id="1057" parentID="1055" level="2" creatorID="0" sortOrder="1" createDate="2013-12-11T17:54:20" updateDate="2013-12-11T17:54:20" nodeName="Italy" urlName="italy" path="-1,1055,1057" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1057, N'239cd738-d65f-4f36-b9d5-8a0faa95be36', CAST(0x0000A291012716FD AS DateTime), N'<Country id="1057" parentID="1055" level="2" creatorID="0" sortOrder="1" createDate="2013-12-11T17:54:20" updateDate="2013-12-11T17:54:23" nodeName="Italy" urlName="italy" path="-1,1055,1057" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1058, N'57d6ab69-1f5a-4999-8a85-0f2bc68ddfcf', CAST(0x0000A2910127292F AS DateTime), N'<Country id="1058" parentID="1055" level="2" creatorID="0" sortOrder="2" createDate="2013-12-11T17:54:34" updateDate="2013-12-11T17:54:38" nodeName="Spain" urlName="spain" path="-1,1055,1058" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1058, N'9e9099ce-56a2-4dd2-8d04-ea6919135732', CAST(0x0000A2910127245A AS DateTime), N'<Country id="1058" parentID="1055" level="2" creatorID="0" sortOrder="2" createDate="2013-12-11T17:54:34" updateDate="2013-12-11T17:54:34" nodeName="Spain" urlName="spain" path="-1,1055,1058" isDoc="" nodeType="1054" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="Country" />')
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[helpText] [nvarchar](1000) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (6, -90, 1032, 3, N'umbracoFile', N'Upload image', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (27, -38, 1031, 5, N'contents', N'Contents:', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (28, -88, 1045, 6, N'heading', N'Heading', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (29, -87, 1045, 6, N'bodyText', N'Body Text', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (30, -51, 1045, 6, N'starRating', N'Star Rating', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (31, -49, 1045, 6, N'isApproved', N'Is Approved', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (32, -88, 1045, 6, N'averageScore', N'Average Score', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (33, -89, 1047, 7, N'text', N'Text', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (34, -88, 1047, 7, N'author', N'Author', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (35, -36, 1047, 7, N'createdOn', N'Created On', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (36, 1050, 1045, 6, N'mainImage', N'Main Image', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (37, 1059, 1045, 6, N'countries', N'Countries', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (38, 1040, 1045, 6, N'relatedLinks', N'Related Links', NULL, 0, 0, N'', N'')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 12/12/2013 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData] ON [dbo].[cmsPropertyData] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData] 
(
	[contentNodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData] 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData] 
(
	[propertytypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1046, N'6a614c27-c1eb-451e-b14c-19d171e99735', 28, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1046, N'56cbf9f8-45fc-41ee-9d8b-63d790b176f1', 28, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1046, N'cf9a0f83-1b18-4723-ab9a-0d36d618387b', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1046, N'cf9a0f83-1b18-4723-ab9a-0d36d618387b', 29, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1046, N'cd714699-9f2f-4e44-845e-c3e9ce35f3fc', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1046, N'cd714699-9f2f-4e44-845e-c3e9ce35f3fc', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1046, N'cd714699-9f2f-4e44-845e-c3e9ce35f3fc', 30, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1046, N'02ca2770-2655-436c-9627-49b5b96fcff4', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1046, N'02ca2770-2655-436c-9627-49b5b96fcff4', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1046, N'02ca2770-2655-436c-9627-49b5b96fcff4', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1046, N'02ca2770-2655-436c-9627-49b5b96fcff4', 31, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', 31, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1046, N'3a071a3a-b7dd-4926-b7ec-f269d9d694af', 32, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', 31, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1046, N'81d9ad97-ee3b-42fd-b893-34e3fe26b464', 32, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', 31, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', 32, NULL, NULL, N'21.5', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1048, N'7d967787-d4be-4b07-ab3a-d2a4ece428a1', 33, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1048, N'7d967787-d4be-4b07-ab3a-d2a4ece428a1', 34, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1048, N'7d967787-d4be-4b07-ab3a-d2a4ece428a1', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1048, N'ece58501-76e2-4add-b83e-81344e68c5a1', 33, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1048, N'ece58501-76e2-4add-b83e-81344e68c5a1', 34, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1048, N'ece58501-76e2-4add-b83e-81344e68c5a1', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1048, N'61990e64-9cf3-481e-b77f-ead15e4a8fca', 33, NULL, NULL, NULL, N'This is the first comment')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1048, N'61990e64-9cf3-481e-b77f-ead15e4a8fca', 34, NULL, NULL, N'Fred', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1048, N'61990e64-9cf3-481e-b77f-ead15e4a8fca', 35, NULL, CAST(0x0000A29100EAD530 AS DateTime), NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1049, N'19ca462b-76b6-4d0d-8a7c-e70a6d0788e3', 33, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1049, N'19ca462b-76b6-4d0d-8a7c-e70a6d0788e3', 34, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1049, N'19ca462b-76b6-4d0d-8a7c-e70a6d0788e3', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1049, N'6a1209ad-3dac-4c05-abf7-a8e6a4940b0b', 33, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1049, N'6a1209ad-3dac-4c05-abf7-a8e6a4940b0b', 34, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (41, 1049, N'6a1209ad-3dac-4c05-abf7-a8e6a4940b0b', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1049, N'ed485879-c76a-49d6-a5ee-b212b38179cc', 33, NULL, NULL, NULL, N'This is the second comment')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1049, N'ed485879-c76a-49d6-a5ee-b212b38179cc', 34, NULL, NULL, N'Sally', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1049, N'ed485879-c76a-49d6-a5ee-b212b38179cc', 35, NULL, CAST(0x0000A2910128A180 AS DateTime), NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1051, N'02dd148a-9531-415b-8c70-13c67030a5ef', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1052, N'4972feab-29eb-4b99-8bc6-f60e590aff12', 6, NULL, NULL, N'/media/1001/flowers.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1052, N'4972feab-29eb-4b99-8bc6-f60e590aff12', 7, NULL, NULL, N'208', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1052, N'4972feab-29eb-4b99-8bc6-f60e590aff12', 8, NULL, NULL, N'208', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1052, N'4972feab-29eb-4b99-8bc6-f60e590aff12', 9, NULL, NULL, N'34305', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1052, N'4972feab-29eb-4b99-8bc6-f60e590aff12', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1046, N'027b2d9b-4a46-4a50-bb36-5013e2237e3a', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (52, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (53, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (55, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 31, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 32, NULL, NULL, N'21.5', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 36, NULL, NULL, N'1052', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1046, N'ac8254c0-a2ef-4ade-b497-f1e6d4806c0f', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 31, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 32, NULL, NULL, N'21.5', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 36, NULL, NULL, N'1052', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 37, NULL, NULL, NULL, N'1057,1058')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 38, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1046, N'02b69f48-55d9-4a5b-95cb-f8040b89fa22', 38, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 28, NULL, NULL, N'Test Heading', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (69, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 29, NULL, NULL, NULL, N'<p>This is the <strong>body text</strong>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (70, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 30, 5, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (71, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 31, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (72, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 32, NULL, NULL, N'21.5', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (73, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 36, NULL, NULL, N'1052', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (74, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 37, NULL, NULL, NULL, N'1057,1058')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1046, N'b3e053ce-dd06-44a2-b618-856e158fd3b7', 38, NULL, NULL, NULL, N'<links><link title="Zone Website" link="http://www.thisiszone.com" type="external" newwindow="0" /><link title="Umbraco Website" link="http://www.umbraco.com" type="external" newwindow="0" /></links>')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
/****** Object:  Default [DF_cmsMacro_macroUseInEditor]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
/****** Object:  Default [DF_cmsMacro_macroRefreshRate]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
/****** Object:  Default [DF_cmsMacro_macroCacheByPage]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
/****** Object:  Default [DF_cmsMacro_macroCachePersonalized]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
/****** Object:  Default [DF_cmsMacro_macroDontRender]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
/****** Object:  Default [DF_umbracoServer_registeredDate]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
/****** Object:  Default [DF_umbracoServer_lastNotifiedDate]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_lastNotifiedDate]  DEFAULT (getdate()) FOR [lastNotifiedDate]
GO
/****** Object:  Default [DF_umbracoNode_trashed]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
/****** Object:  Default [DF_umbracoNode_createDate]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoLog_Datestamp]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
/****** Object:  Default [DF_umbracoUser_userDisabled]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
/****** Object:  Default [DF_umbracoUser_userNoConsole]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
/****** Object:  Default [DF_umbracoUser_defaultToLiveEditing]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_defaultToLiveEditing]  DEFAULT ('0') FOR [defaultToLiveEditing]
GO
/****** Object:  Default [DF_umbracoRelation_datetime]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
/****** Object:  Default [DF_cmsMacroProperty_macroPropertyHidden]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertyHidden]  DEFAULT ('0') FOR [macroPropertyHidden]
GO
/****** Object:  Default [DF_cmsMacroProperty_macroPropertySortOrder]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
/****** Object:  Default [DF_cmsContentType_thumbnail]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
/****** Object:  Default [DF_cmsContentType_isContainer]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
/****** Object:  Default [DF_cmsContentType_allowAtRoot]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
/****** Object:  Default [DF_cmsDocumentType_IsDefault]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
/****** Object:  Default [DF_cmsDocument_updateDate]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_cmsDocument_newest]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
/****** Object:  Default [DF_cmsContentVersion_VersionDate]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
/****** Object:  Default [df_cmsContentTypeAllowedContentType_sortOrder]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
/****** Object:  Default [DF_cmsTask_closed]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
/****** Object:  Default [DF_cmsTask_DateTime]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
/****** Object:  Default [DF_cmsMember_Email]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
/****** Object:  Default [DF_cmsMember_LoginName]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
/****** Object:  Default [DF_cmsMember_Password]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
/****** Object:  Default [DF_cmsMemberType_memberCanEdit]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
/****** Object:  Default [DF_cmsMemberType_viewOnProfile]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
/****** Object:  Default [DF_cmsPropertyType_sortOrder]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
/****** Object:  Default [DF_cmsPropertyType_mandatory]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
/****** Object:  ForeignKey [FK_umbracoNode_umbracoNode_id]    Script Date: 12/12/2013 19:01:37 ******/
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoDomains_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTemplate_cmsTemplate]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_cmsTemplate] FOREIGN KEY([master])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_cmsTemplate]
GO
/****** Object:  ForeignKey [FK_cmsTemplate_umbracoNode]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
/****** Object:  ForeignKey [FK_umbracoUser_umbracoUserType_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoNode]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoNode1]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoRelationType_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
/****** Object:  ForeignKey [FK_cmsMacroProperty_cmsMacro_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
/****** Object:  ForeignKey [FK_cmsMacroProperty_cmsMacroPropertyType_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacroPropertyType_id] FOREIGN KEY([macroPropertyType])
REFERENCES [dbo].[cmsMacroPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacroPropertyType_id]
GO
/****** Object:  ForeignKey [FK_cmsStylesheet_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsStylesheet]  WITH CHECK ADD  CONSTRAINT [FK_cmsStylesheet_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsStylesheet] CHECK CONSTRAINT [FK_cmsStylesheet_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsTags_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContentType2ContentType_umbracoNode_child]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
/****** Object:  ForeignKey [FK_cmsContentType2ContentType_umbracoNode_parent]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
/****** Object:  ForeignKey [FK_cmsContentType_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContent_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDataType_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsLanguageText_cmsDictionary_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_cmsContentType_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_cmsTemplate_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDocument_cmsContent_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocument_cmsTemplate_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocument_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContentXml_cmsContent_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContentVersion_cmsContent_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContentTypeAllowedContentType_cmsContentType]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
/****** Object:  ForeignKey [FK_cmsContentTypeAllowedContentType_cmsContentType1]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
/****** Object:  ForeignKey [FK_cmsTask_cmsTaskType_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoUser]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoUser1]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
/****** Object:  ForeignKey [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id] FOREIGN KEY([parentGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id]
GO
/****** Object:  ForeignKey [FK_cmsDataTypePreValues_cmsDataType_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember_cmsContent_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsMemberType_cmsContentType_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMemberType_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodePermission_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodePermission_umbracoUser_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodeNotify_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodeNotify_umbracoUser_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2app_umbracoUser_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_cmsPreviewXml_cmsContent_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPreviewXml_cmsContentVersion_VersionId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
/****** Object:  ForeignKey [FK_cmsMember2MemberGroup_cmsMember_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember2MemberGroup_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsContentType_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsDataType_nodeId]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsPropertyTypeGroup_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyData_cmsPropertyType_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyData_umbracoNode_id]    Script Date: 12/12/2013 19:01:38 ******/
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
