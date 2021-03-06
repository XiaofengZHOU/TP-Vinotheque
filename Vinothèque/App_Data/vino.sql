/****** Object:  Table [dbo].[clients]    Script Date: 09/09/2010 23:31:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clients]') AND type in (N'U'))
DROP TABLE [dbo].[clients]
GO
/****** Object:  Table [dbo].[commandes]    Script Date: 09/09/2010 23:31:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[commandes]') AND type in (N'U'))
DROP TABLE [dbo].[commandes]
GO
/****** Object:  Table [dbo].[prodcomm]    Script Date: 09/09/2010 23:31:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prodcomm]') AND type in (N'U'))
DROP TABLE [dbo].[prodcomm]
GO
/****** Object:  Table [dbo].[vins]    Script Date: 09/09/2010 23:31:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vins]') AND type in (N'U'))
DROP TABLE [dbo].[vins]
GO
/****** Object:  Default [DF_commandes_fraisdeport]    Script Date: 09/09/2010 23:31:10 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_commandes_fraisdeport]') AND parent_object_id = OBJECT_ID(N'[dbo].[commandes]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_commandes_fraisdeport]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[commandes] DROP CONSTRAINT [DF_commandes_fraisdeport]
END


End
GO
/****** Object:  Default [DF_commandes_fait]    Script Date: 09/09/2010 23:31:10 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_commandes_fait]') AND parent_object_id = OBJECT_ID(N'[dbo].[commandes]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_commandes_fait]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[commandes] DROP CONSTRAINT [DF_commandes_fait]
END


End
GO
/****** Object:  Table [dbo].[vins]    Script Date: 09/09/2010 23:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vins](
	[idvin] [int] NULL,
	[nom] [nchar](32) COLLATE French_CI_AS NULL,
	[region] [nchar](32) COLLATE French_CI_AS_WS NULL,
	[millesime] [int] NULL,
	[nomgif] [text] COLLATE French_CI_AS NOT NULL,
	[commentaire] [text] COLLATE French_CI_AS NULL,
	[prix] [float] NULL
)
END
GO
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (1, N'Bandol                          ', N'Provence-Alpes-Côte-d''Azur      ', 2000, N'Images_vins/bandol.gif', NULL, 10)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (2, N'Premier cru de Beaune           ', N'Rhône-Alpe                      ', 2001, N'Images_vins/beaune.gif', NULL, 15)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (3, N'Chinon                          ', N'Indre-et-Loire                  ', 2009, N'Images_vins/chinon.gif', NULL, 25)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (4, N'Gewurztraminer                  ', N'Alsace                          ', 2000, N'Images_vins/gewurz.gif', NULL, 10)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (5, N'Champagne jacquart              ', N'Champagne-Ardenne               ', 1998, N'Images_vins/jacquart.gif', NULL, 35)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (6, N'Julienas                        ', N'Rhône-Alpe                      ', 1999, N'Images_vins/julienas.gif', NULL, 7)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (7, N'Chateau muret                   ', N'Aquitaine                       ', 1989, N'Images_vins/muret.gif', NULL, 12)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (8, N'Chateau neurin                  ', N'Aquitaine                       ', 2006, N'Images_vins/neurin.gif', NULL, 14)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (9, N'Pomerol                         ', N'Aquitaine                       ', 1999, N'Images_vins/pomerol.gif', NULL, 15)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (10, N'Chateau rastouble               ', N'Languedoc-                      ', 2001, N'Images_vins/rastouble.gif', NULL, 21)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (11, N'Champagne Alfred Rothschild     ', N'Aquitaine                       ', 2005, N'Images_vins/rothschild.gif', NULL, 22)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (12, N'Rully                           ', N'Bourgogne                       ', 2007, N'Images_vins/rully.gif', NULL, 16)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (13, N'Sancerre                        ', N'Midi-Pyrén                      ', 2008, N'Images_vins/sancerre.gif', NULL, 18)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (14, N'Apremont                        ', N'Rhône-Alpe                      ', 2009, N'Images_vins/savoie.gif', NULL, 13)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (15, N'Saint-Emilion Grand Cru         ', N'Aquitaine                       ', 2007, N'Images_vins/stemilion.gif', NULL, 16)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (16, N'Pic saint loup                  ', N'Languedoc-                      ', 2008, N'Images_vins/stloup.gif', NULL, 14)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (17, N'Domaine de Tanella              ', N'Corse                           ', 2006, N'Images_vins/tanella.gif', NULL, 16)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (18, N'Tokay pinot gris                ', N'Alsace                          ', 2007, N'Images_vins/tokay.gif', NULL, 18)
INSERT [dbo].[vins] ([idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix]) VALUES (19, N'Beaujolais villages             ', N'Rhône-Alpe                      ', 2008, N'Images_vins/villages.gif', NULL, 20)
/****** Object:  Table [dbo].[prodcomm]    Script Date: 09/09/2010 23:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prodcomm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prodcomm](
	[idprodcomm] [int] IDENTITY(1,1) NOT NULL,
	[idcomm] [int] NOT NULL,
	[idvin] [int] NOT NULL,
	[quantite] [int] NULL,
 CONSTRAINT [PK_prodcomm] PRIMARY KEY CLUSTERED 
(
	[idprodcomm] ASC,
	[idcomm] ASC,
	[idvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[commandes]    Script Date: 09/09/2010 23:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[commandes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[commandes](
	[idcomm] [int] IDENTITY(1,1) NOT NULL,
	[idclient] [int] NULL,
	[date] [datetime] NULL,
	[total] [float] NULL,
	[fraisdeport] [float] NULL,
	[fait] [int] NULL,
 CONSTRAINT [PK_commandes] PRIMARY KEY CLUSTERED 
(
	[idcomm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[clients]    Script Date: 09/09/2010 23:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[clients](
	[idclient] [int] IDENTITY(1,1) NOT NULL,
	[login] [nchar](10) COLLATE French_CI_AS NULL,
	[mdp] [nchar](10) COLLATE French_CI_AS NULL,
	[nom] [nchar](255) COLLATE French_CI_AS NULL,
	[adresse] [nchar](255) COLLATE French_CI_AS NULL,
	[ville] [nchar](64) COLLATE French_CI_AS NULL,
	[pays] [nchar](32) COLLATE French_CI_AS NULL,
	[telephone] [nchar](32) COLLATE French_CI_AS NULL,
	[email] [nchar](64) COLLATE French_CI_AS NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[idclient] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Default [DF_commandes_fraisdeport]    Script Date: 09/09/2010 23:31:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_commandes_fraisdeport]') AND parent_object_id = OBJECT_ID(N'[dbo].[commandes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_commandes_fraisdeport]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[commandes] ADD  CONSTRAINT [DF_commandes_fraisdeport]  DEFAULT ((0)) FOR [fraisdeport]
END


End
GO
/****** Object:  Default [DF_commandes_fait]    Script Date: 09/09/2010 23:31:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_commandes_fait]') AND parent_object_id = OBJECT_ID(N'[dbo].[commandes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_commandes_fait]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[commandes] ADD  CONSTRAINT [DF_commandes_fait]  DEFAULT ((0)) FOR [fait]
END


End
GO
