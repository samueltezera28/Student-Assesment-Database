USE [Student Assesment Database]
GO
/****** Object:  User [Instructor]    Script Date: 02/02/2023 13:48:17 ******/
CREATE USER [Instructor] FOR LOGIN [Instructor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [reg_student]    Script Date: 02/02/2023 13:48:17 ******/
CREATE USER [reg_student] FOR LOGIN [reg_student] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sami]    Script Date: 02/02/2023 13:48:17 ******/
CREATE USER [sami] FOR LOGIN [sami] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [selam]    Script Date: 02/02/2023 13:48:17 ******/
CREATE USER [selam] FOR LOGIN [selam] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Departement]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departement](
	[Dcode] [nchar](15) NOT NULL,
	[Dname] [nchar](25) NULL,
	[faculty] [nchar](25) NULL,
 CONSTRAINT [PK_Departement] PRIMARY KEY CLUSTERED 
(
	[Dcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[code] [nchar](10) NOT NULL,
	[title] [nchar](50) NULL,
	[type] [nchar](10) NULL,
	[CreditHour] [smallint] NULL,
	[department] [nchar](15) NULL,
 CONSTRAINT [PK_course_1] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[INSTID] [nchar](12) NOT NULL,
	[fname] [nchar](15) NULL,
	[lname] [nchar](15) NULL,
	[department] [nchar](15) NULL,
	[gender] [nchar](1) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[INSTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [nchar](50) NOT NULL,
	[fname] [nchar](10) NULL,
	[lname] [nchar](10) NULL,
	[department] [nchar](15) NOT NULL,
	[division] [nchar](20) NULL,
	[section] [int] NULL,
	[DOB] [date] NULL,
	[batch] [int] NULL,
	[entry] [date] NULL,
	[gender] [nchar](1) NULL,
 CONSTRAINT [PK_Student_1] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[sid] [nchar](50) NOT NULL,
	[code] [nchar](10) NOT NULL,
	[INSTID] [nchar](12) NOT NULL,
	[semester] [smallint] NULL,
	[registration_year] [date] NULL,
	[Grade] [nchar](10) NULL,
 CONSTRAINT [PK_Registration_1] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inst_edu_status]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inst_edu_status](
	[eduid] [nchar](12) NOT NULL,
	[level] [nchar](15) NOT NULL,
	[field] [nchar](50) NOT NULL,
	[completion_date] [datetime] NULL,
	[CUN] [nchar](50) NOT NULL,
	[type] [nchar](20) NULL,
 CONSTRAINT [PK_Inst_edu_status] PRIMARY KEY CLUSTERED 
(
	[eduid] ASC,
	[level] ASC,
	[field] ASC,
	[CUN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assesment]    Script Date: 02/02/2023 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment](
	[SID] [nchar](50) NOT NULL,
	[COURSE] [nchar](10) NOT NULL,
	[Assesment name] [nchar](10) NOT NULL,
	[weight] [nchar](10) NOT NULL,
	[result] [float] NULL,
	[assesment date] [date] NULL,
 CONSTRAINT [PK_Assesment_1] PRIMARY KEY CLUSTERED 
(
	[SID] ASC,
	[COURSE] ASC,
	[Assesment name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Assesment_Registration]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Assesment]  WITH CHECK ADD  CONSTRAINT [FK_Assesment_Registration] FOREIGN KEY([SID], [COURSE])
REFERENCES [dbo].[Registration] ([sid], [code])
GO
ALTER TABLE [dbo].[Assesment] CHECK CONSTRAINT [FK_Assesment_Registration]
GO
/****** Object:  ForeignKey [FK_course_Departement]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [FK_course_Departement] FOREIGN KEY([department])
REFERENCES [dbo].[Departement] ([Dcode])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [FK_course_Departement]
GO
/****** Object:  ForeignKey [FK_Inst_edu_status_Instructor1]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Inst_edu_status]  WITH CHECK ADD  CONSTRAINT [FK_Inst_edu_status_Instructor1] FOREIGN KEY([eduid])
REFERENCES [dbo].[Instructor] ([INSTID])
GO
ALTER TABLE [dbo].[Inst_edu_status] CHECK CONSTRAINT [FK_Inst_edu_status_Instructor1]
GO
/****** Object:  ForeignKey [FK_Instructor_Departement]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Departement] FOREIGN KEY([department])
REFERENCES [dbo].[Departement] ([Dcode])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Departement]
GO
/****** Object:  ForeignKey [FK_Registration_course]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_course] FOREIGN KEY([code])
REFERENCES [dbo].[course] ([code])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_course]
GO
/****** Object:  ForeignKey [FK_Registration_Instructor]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Instructor] FOREIGN KEY([INSTID])
REFERENCES [dbo].[Instructor] ([INSTID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Instructor]
GO
/****** Object:  ForeignKey [FK_Registration_Student]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Student]
GO
/****** Object:  ForeignKey [FK_Student_Departement2]    Script Date: 02/02/2023 13:48:17 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Departement2] FOREIGN KEY([department])
REFERENCES [dbo].[Departement] ([Dcode])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Departement2]
GO
