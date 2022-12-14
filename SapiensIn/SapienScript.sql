USE [master]
GO
/****** Object:  Database [SapiensIn]    Script Date: 6/27/2022 5:50:14 PM ******/
CREATE DATABASE [SapiensIn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SapiensIn', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\SapiensIn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SapiensIn_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\SapiensIn_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SapiensIn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SapiensIn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SapiensIn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SapiensIn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SapiensIn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SapiensIn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SapiensIn] SET ARITHABORT OFF 
GO
ALTER DATABASE [SapiensIn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SapiensIn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SapiensIn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SapiensIn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SapiensIn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SapiensIn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SapiensIn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SapiensIn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SapiensIn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SapiensIn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SapiensIn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SapiensIn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SapiensIn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SapiensIn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SapiensIn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SapiensIn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SapiensIn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SapiensIn] SET RECOVERY FULL 
GO
ALTER DATABASE [SapiensIn] SET  MULTI_USER 
GO
ALTER DATABASE [SapiensIn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SapiensIn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SapiensIn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SapiensIn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SapiensIn] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SapiensIn', N'ON'
GO
ALTER DATABASE [SapiensIn] SET QUERY_STORE = OFF
GO
USE [SapiensIn]
GO
/****** Object:  User [IIS APPPOOL\SapiensInAPI]    Script Date: 6/27/2022 5:50:14 PM ******/
CREATE USER [IIS APPPOOL\SapiensInAPI] FOR LOGIN [IIS APPPOOL\SapiensInAPI] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [IIS APPPOOL\SapiensInAPI]
GO
/****** Object:  Table [dbo].[Appointment_Proceedings]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Proceedings](
	[AppointmentProceedingID] [bigint] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[SenderUserTypeID] [int] NULL,
	[ReceiverUserTypeID] [int] NULL,
	[AttachmentFileName] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Appointment_Proceedings] PRIMARY KEY CLUSTERED 
(
	[AppointmentProceedingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountVouchers]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountVouchers](
	[DiscountVoucherID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherTitle] [varchar](100) NOT NULL,
	[VoucherCode] [varchar](50) NOT NULL,
	[VoucherDecription] [nvarchar](max) NULL,
	[VoucherImage] [nvarchar](max) NULL,
	[DiscountPercentage] [float] NULL,
	[DiscountAmount] [money] NULL,
	[IsLabApplicable] [bit] NULL,
	[IsMedicineApplicable] [bit] NULL,
	[IsAppointmentApplicable] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_DiscountVouchers] PRIMARY KEY CLUSTERED 
(
	[DiscountVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Labs]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Labs](
	[LabID] [int] IDENTITY(1,1) NOT NULL,
	[LabTitle] [varchar](200) NOT NULL,
	[DisplayPicture] [nvarchar](max) NULL,
	[DiscountPercentage] [float] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Labs] PRIMARY KEY CLUSTERED 
(
	[LabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabTests]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTests](
	[LabTestID] [int] IDENTITY(1,1) NOT NULL,
	[LabTestTitle] [nvarchar](500) NOT NULL,
	[LabTestPrice] [money] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_LabTests] PRIMARY KEY CLUSTERED 
(
	[LabTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineTitle] [nvarchar](200) NOT NULL,
	[DisplayPicture] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Appointments]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Appointments](
	[AppointmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TeamID] [int] NOT NULL,
	[SessionCharges] [money] NOT NULL,
	[PaymentImage] [nvarchar](max) NULL,
	[SessionStartDate] [date] NOT NULL,
	[SessionStartTime] [time](7) NOT NULL,
	[TeamTimeSlotID] [int] NULL,
	[BillingAddress] [nvarchar](max) NULL,
	[IsSessionEnded] [bit] NULL,
	[SessionEndDatetime] [datetime] NULL,
	[DiscountVoucherID] [int] NULL,
	[VoucherTitle] [varchar](100) NULL,
	[DiscountVoucherPercentage] [float] NULL,
	[DiscountVoucherAmount] [money] NULL,
	[FinalAmount] [money] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Patient_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_LabTests]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_LabTests](
	[PatientLabTestID] [bigint] IDENTITY(1,1) NOT NULL,
	[LabID] [int] NOT NULL,
	[LabTestID] [int] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AppointmentID] [bigint] NULL,
	[DiscountPercentage] [float] NOT NULL,
	[LabTestPrice] [money] NOT NULL,
	[FinalAmount] [money] NOT NULL,
	[PaymentImage] [nvarchar](max) NULL,
	[LabResultFileAttachment] [nvarchar](max) NULL,
	[BillingAddress] [nvarchar](max) NULL,
	[DiscountVoucherID] [int] NULL,
	[VoucherTitle] [varchar](100) NULL,
	[DiscountVoucherPercentage] [float] NULL,
	[DiscountVoucherAmount] [money] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Patient_LabTests] PRIMARY KEY CLUSTERED 
(
	[PatientLabTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_MedicineOrder]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_MedicineOrder](
	[PatientMedicineOrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](50) NOT NULL,
	[PrescriptionImage] [nvarchar](max) NULL,
	[UserID] [bigint] NOT NULL,
	[AppointmentID] [bigint] NULL,
	[FinalAmount] [money] NOT NULL,
	[PaymentImage] [nvarchar](max) NULL,
	[IsDelivered] [bit] NULL,
	[IsDeliveredDateTime] [datetime] NULL,
	[OrderDate] [date] NULL,
	[BillingAddress] [nvarchar](max) NULL,
	[DiscountVoucherID] [int] NULL,
	[VoucherTitle] [varchar](100) NULL,
	[DiscountVoucherPercentage] [float] NULL,
	[DiscountVoucherAmount] [money] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Patient_MedicineOrder] PRIMARY KEY CLUSTERED 
(
	[PatientMedicineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Medicines]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Medicines](
	[PatientMedicineID] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientMedicineOrderID] [bigint] NOT NULL,
	[MedicineID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Patient_Medicines] PRIMARY KEY CLUSTERED 
(
	[PatientMedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingAndReviews]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingAndReviews](
	[RatingReviewID] [bigint] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NULL,
	[ReviewStatement] [nvarchar](1000) NULL,
	[UserID] [bigint] NOT NULL,
	[TeamID] [int] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_RatingAndReviews] PRIMARY KEY CLUSTERED 
(
	[RatingReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[SpecialityID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityTitle] [varchar](500) NOT NULL,
	[DisplayPicture] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Specialities] PRIMARY KEY CLUSTERED 
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_TimeSlots]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_TimeSlots](
	[TeamTimeSlotID] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[DayNumber] [int] NOT NULL,
	[TimeSlot] [time](7) NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Team_TimeSlots] PRIMARY KEY CLUSTERED 
(
	[TeamTimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[TeamMemberID] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED 
(
	[TeamMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamTitle] [varchar](100) NULL,
	[SpecialityID] [int] NOT NULL,
	[SessionCharges] [money] NOT NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[SpecialityID] [int] NULL,
	[Experience] [varchar](50) NULL,
	[SatisfactionPercentage] [float] NULL,
	[DisplayPicture] [nvarchar](max) NULL,
	[MobileNumber] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ResidentialAddress] [nvarchar](max) NULL,
	[Education] [nvarchar](max) NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 6/27/2022 5:50:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment_Proceedings] ON 

INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (1, 4, 20049, 5, 2, NULL, N'undefined', CAST(N'2022-05-01T01:58:51.640' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (2, 4, 20049, 5, 2, N'2022050101591459140.CHANGES', N'null', CAST(N'2022-05-01T01:59:21.203' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (3, 4, 20049, 5, 2, N'202205010201471470.pdf', N'pk city', CAST(N'2022-05-01T02:02:22.467' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (4, 5, 20011, 2, 5, NULL, N'hello', CAST(N'2022-05-01T02:43:32.037' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (5, 5, 20011, 2, 5, NULL, N'sir', CAST(N'2022-05-01T02:43:59.793' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (6, 5, 20011, 2, 5, NULL, N'hjgjhgjh gjhgjhg', CAST(N'2022-05-01T02:45:49.610' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (7, 7, 20051, 5, 3, NULL, N'hey', CAST(N'2022-05-02T09:43:32.330' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (8, 7, 20051, 5, 3, NULL, N'null', CAST(N'2022-05-02T09:43:38.507' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (9, 7, 20051, 5, 4, NULL, N'hey', CAST(N'2022-05-02T09:43:45.057' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10, 7, 20051, 5, 2, NULL, N'hey', CAST(N'2022-05-02T09:43:59.567' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (11, 8, 20051, 5, 2, NULL, N'I need to know more information about this. Kindly make sure I do', CAST(N'2022-05-02T10:44:41.470' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (12, 8, 20052, 2, 5, NULL, N'hgjhgjhgj hjhh', CAST(N'2022-05-02T15:27:49.153' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (13, 5, 20011, 2, 5, NULL, N'hi', CAST(N'2022-05-02T15:34:04.637' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (14, 5, 20011, 2, 5, NULL, N'tytytytytyt', CAST(N'2022-05-02T15:35:31.833' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (15, 5, 20010, 5, 2, NULL, N'hjghjhgg uiiuyi iuoi oiu', CAST(N'2022-05-02T15:35:51.103' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (16, 5, 20011, 2, 5, N'2022050215361636160.doc', N'null', CAST(N'2022-05-02T15:36:27.690' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (17, 8, 20052, 2, 5, NULL, N'Okay', CAST(N'2022-05-02T17:43:50.590' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (18, 8, 20053, 4, 5, NULL, N'I will send your prescription', CAST(N'2022-05-02T17:53:31.930' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (19, 8, 20051, 5, 2, NULL, N'Hello Doctor Sahib, I need to know more information about my diagnosis. When can we have an appointment', CAST(N'2022-05-05T17:02:44.447' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20, 8, 20052, 2, 5, NULL, N'Alright, update me with your history', CAST(N'2022-05-05T17:04:09.597' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (21, 8, 20051, 5, 2, N'20220505170702720.pdf', N'This is my previous medical history', CAST(N'2022-05-05T17:07:02.787' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (22, 8, 20052, 2, 5, NULL, N'Ahmad paste this link. And Join this meeting https://us04web.zoom.us/j/77302694410?pwd=CydaCoS1fCT4LUwZteQLRdV-UqzagK.1', CAST(N'2022-05-05T17:09:34.253' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (23, 8, 20052, 2, 5, N'202205051719021920.pdf', N'Ahmad this is your Diagnosis Sheet. Pharmacist will write your Prescription.', CAST(N'2022-05-05T17:19:03.097' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (24, 8, 20051, 5, 2, NULL, N'Thanks Dr.Allen', CAST(N'2022-05-05T17:20:23.403' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (25, 8, 20053, 4, 5, NULL, N'Hello Ahmad. Dr.Allen has briefed me about your diagnosis. Kindly join this link. I will be taking care of your medicine. https://us04web.zoom.us/j/77302694410?pwd=CydaCoS1fCT4LUwZteQLRdV-UqzagK.1', CAST(N'2022-05-05T17:24:42.550' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (26, 8, 20053, 4, 5, N'202205051726002600.pdf', N'Ahmad this is your prescription. Take medicine as per instructions. If you need to, ask me any question, whenever you like', CAST(N'2022-05-05T17:26:01.073' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (27, 8, 20054, 3, 5, NULL, N'Hi Ahmad I am your Nutritionist.', CAST(N'2022-05-05T17:29:19.403' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (28, 8, 20054, 3, 5, NULL, N'Kindly join this link. I will be taking care of your medicine. https://us04web.zoom.us/j/77302694410?pwd=CydaCoS1fCT4LUwZteQLRdV-UqzagK.1', CAST(N'2022-05-05T17:30:06.920' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (29, 8, 20054, 3, 5, NULL, N'Join above meeting. I will be giving you your diet and exercise plan', CAST(N'2022-05-05T17:30:34.677' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (30, 8, 20054, 3, 5, N'202205051731053150.pdf', N'Ahmad this is your Diet Plan.', CAST(N'2022-05-05T17:31:06.080' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (31, 8, 20052, 2, 5, N'2022050517325732570.pdf', N'Ahmad this are your Goals of therapy. We will check on them after two months', CAST(N'2022-05-05T17:32:57.840' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (32, 8, 20053, 4, 5, NULL, N'We want you to watch these videos on your condition. On next Appointment, We will quiz you and will reward accordingly https://www.youtube.com/watch?v=ozyruyITxKg', CAST(N'2022-05-05T17:36:46.480' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (33, 8, 20052, 2, 5, NULL, N'We want you to watch these videos on your condition. On next Appointment, We will quiz you and will reward accordingly https://www.youtube.com/watch?v=ozyruyITxKg', CAST(N'2022-05-05T17:38:44.870' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (34, 8, 20051, 5, 2, NULL, N'Thank you Dr.Allen for sharing all this. I will be in touch.', CAST(N'2022-05-05T17:39:29.180' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10002, 10, 20052, 2, 2, NULL, N'Hi', CAST(N'2022-05-11T02:02:09.090' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10003, 8, 20051, 5, 2, NULL, N'he', CAST(N'2022-05-11T02:06:50.883' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10004, 8, 20052, 2, 2, NULL, N'hi', CAST(N'2022-05-11T02:07:18.963' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10005, 8, 20053, 4, 4, NULL, N'hi', CAST(N'2022-05-11T02:08:31.113' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10006, 8, 20051, 5, 2, NULL, N'hi', CAST(N'2022-05-11T02:08:41.673' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10007, 8, 20054, 3, 3, NULL, N'Hello Ahmad I am your Phrmacist', CAST(N'2022-05-11T02:10:15.570' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10008, 11, 20052, 2, 2, NULL, N'hello', CAST(N'2022-05-11T02:33:18.603' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10009, 10, 20054, 3, 3, NULL, N'hello', CAST(N'2022-05-11T02:33:57.250' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10010, 11, 20054, 3, 3, NULL, N'hello', CAST(N'2022-05-11T02:34:45.130' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10011, 11, 20052, 2, 2, NULL, N'jhi', CAST(N'2022-05-11T02:35:11.200' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10012, 11, 20051, 5, 2, NULL, N'thank you for getting in touch with me', CAST(N'2022-05-11T02:38:38.133' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10013, 11, 20051, 5, 2, NULL, N'I am your Nutritionist', CAST(N'2022-05-11T02:39:26.147' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10014, 11, 20053, 4, 4, NULL, N'hello', CAST(N'2022-05-11T02:41:51.963' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10015, 10, 20053, 4, 4, NULL, N'hello', CAST(N'2022-05-11T02:42:19.687' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10016, 11, 20051, 5, 2, NULL, N'Hello Doctor Sahib', CAST(N'2022-05-13T23:43:18.597' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10017, 11, 20053, 4, 4, NULL, N'Hello Ahmad Sahib', CAST(N'2022-05-13T23:45:45.350' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10018, 10, 20053, 4, 4, NULL, N'Hello Doctor Sahib', CAST(N'2022-05-13T23:46:12.203' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10019, 11, 20051, 5, 2, NULL, N'We need to communicate more information with this.', CAST(N'2022-05-14T00:02:56.683' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10020, 11, 20053, 4, 4, NULL, N'Something is not working at all', CAST(N'2022-05-14T00:03:49.197' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10021, 13, 20052, 2, 2, NULL, N'Hello Mister Ahmad', CAST(N'2022-05-14T00:10:30.763' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10022, 13, 20051, 5, 2, NULL, N'jee]', CAST(N'2022-05-14T00:10:56.210' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10023, 13, 20053, 4, 4, NULL, N'hello', CAST(N'2022-05-14T00:11:12.583' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10024, 13, 20051, 5, 2, NULL, N'hello', CAST(N'2022-05-14T00:11:48.477' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10025, 13, 20051, 5, 2, NULL, N'Where is my Pharmacist and Nutritionist?', CAST(N'2022-05-14T00:12:48.680' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10026, 13, 20053, 4, 4, NULL, N'Why I cannot see my patient?', CAST(N'2022-05-14T00:15:48.247' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10027, 13, 20052, 2, 2, NULL, N'Communication is not centralized', CAST(N'2022-05-14T00:21:12.453' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10028, 13, 20054, 3, 3, NULL, N'Where is my patient', CAST(N'2022-05-14T00:24:07.210' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10029, 17, 20051, 5, 2, NULL, N'Hello Dcotor Allen I am looking forward to learn this role from you.', CAST(N'2022-05-22T18:17:38.617' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10030, 17, 20051, 5, 2, NULL, N'It would mean a lot if we can work on this thing togethter', CAST(N'2022-05-22T18:17:52.967' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10031, 17, 20051, 5, 2, NULL, N'undefined', CAST(N'2022-05-22T18:24:40.473' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10032, 17, 20051, 5, 4, NULL, N'Hello Sir', CAST(N'2022-05-22T18:27:06.703' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10033, 17, 20051, 5, 3, NULL, N'U are not going to get text', CAST(N'2022-05-22T18:28:04.387' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10034, 17, 20051, 5, 3, NULL, N'I''m waiting for my Nutriotionst to get misinformation', CAST(N'2022-05-22T18:29:43.293' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10035, 17, 20051, 5, 3, NULL, N'Why Can''t o access eepoets', CAST(N'2022-05-22T18:29:53.170' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10036, 17, 20051, 5, 4, NULL, N'HELLO Sir. How do you do ?', CAST(N'2022-05-22T18:30:07.750' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10037, 17, 20051, 5, 3, N'2022052218334233420.pdf', N'null', CAST(N'2022-05-22T18:33:43.793' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (10038, 18, 20051, 5, 2, NULL, N'Hey kjdbky check me', CAST(N'2022-05-25T19:36:28.733' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20019, 19, 30046, 5, 2, NULL, N'wewewe', CAST(N'2022-06-03T19:52:03.923' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20020, 19, 30046, 5, 2, N'2022060319541354130.jpg', N'undefined', CAST(N'2022-06-03T19:54:14.000' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20021, 19, 30046, 5, 2, NULL, N'null', CAST(N'2022-06-03T19:54:18.597' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20022, 19, 30044, 2, 2, NULL, N'ddsf dsesf dsf dsf dsf sf', CAST(N'2022-06-10T18:43:49.323' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20023, 19, 30046, 5, 2, NULL, N'sdfsf sf dsf sfs fsdf', CAST(N'2022-06-10T18:44:51.837' AS DateTime), 1)
INSERT [dbo].[Appointment_Proceedings] ([AppointmentProceedingID], [AppointmentID], [UserID], [SenderUserTypeID], [ReceiverUserTypeID], [AttachmentFileName], [Comment], [AddedDateTime], [Status]) VALUES (20024, 19, 30037, 4, 4, NULL, N'okokokokok', CAST(N'2022-06-10T18:50:26.853' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Appointment_Proceedings] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountVouchers] ON 

INSERT [dbo].[DiscountVouchers] ([DiscountVoucherID], [VoucherTitle], [VoucherCode], [VoucherDecription], [VoucherImage], [DiscountPercentage], [DiscountAmount], [IsLabApplicable], [IsMedicineApplicable], [IsAppointmentApplicable], [IsEnabled], [AddedDateTime], [Status]) VALUES (1, N'abcE', N'123', N'AAAAAAAAA', N'2022061617325232520.PNG', 25, 0.0000, 0, 1, 1, 1, CAST(N'2022-06-16T17:18:45.867' AS DateTime), 1)
INSERT [dbo].[DiscountVouchers] ([DiscountVoucherID], [VoucherTitle], [VoucherCode], [VoucherDecription], [VoucherImage], [DiscountPercentage], [DiscountAmount], [IsLabApplicable], [IsMedicineApplicable], [IsAppointmentApplicable], [IsEnabled], [AddedDateTime], [Status]) VALUES (2, N'First order voucher', N'1111', N'200 discount for new user.', N'2022061617442144210.PNG', 0, 200.0000, 1, 1, 1, 0, CAST(N'2022-06-16T17:44:21.920' AS DateTime), 1)
INSERT [dbo].[DiscountVouchers] ([DiscountVoucherID], [VoucherTitle], [VoucherCode], [VoucherDecription], [VoucherImage], [DiscountPercentage], [DiscountAmount], [IsLabApplicable], [IsMedicineApplicable], [IsAppointmentApplicable], [IsEnabled], [AddedDateTime], [Status]) VALUES (3, N'Flat 30% off on first order', N'2222', N'Flat 30% off on first order', N'202206161803133130.PNG', 30, 0.0000, 1, 1, 1, 0, CAST(N'2022-06-16T18:03:13.967' AS DateTime), 1)
INSERT [dbo].[DiscountVouchers] ([DiscountVoucherID], [VoucherTitle], [VoucherCode], [VoucherDecription], [VoucherImage], [DiscountPercentage], [DiscountAmount], [IsLabApplicable], [IsMedicineApplicable], [IsAppointmentApplicable], [IsEnabled], [AddedDateTime], [Status]) VALUES (4, N'ghgvh c', N'333', N'sarasrfaw', N'voucher.png', 22, 0.0000, 1, 1, 1, 1, CAST(N'2022-06-17T17:39:15.130' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DiscountVouchers] OFF
GO
SET IDENTITY_INSERT [dbo].[Labs] ON 

INSERT [dbo].[Labs] ([LabID], [LabTitle], [DisplayPicture], [DiscountPercentage], [AddedDateTime], [Status]) VALUES (1003, N'Chugtai Lab', N'11.png', 10, CAST(N'2022-04-29T01:36:29.040' AS DateTime), 1)
INSERT [dbo].[Labs] ([LabID], [LabTitle], [DisplayPicture], [DiscountPercentage], [AddedDateTime], [Status]) VALUES (1004, N'Zeenat Laboratories', N'20220523050608680.jpg', 15, CAST(N'2022-05-23T05:06:08.550' AS DateTime), 1)
INSERT [dbo].[Labs] ([LabID], [LabTitle], [DisplayPicture], [DiscountPercentage], [AddedDateTime], [Status]) VALUES (1005, N'Doctor Essa Laboratories', N'202205230511041140.jpg', 15, CAST(N'2022-05-23T05:07:25.363' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Labs] OFF
GO
SET IDENTITY_INSERT [dbo].[LabTests] ON 

INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (5, N'Renal Function Test (RFT)', 600.0000, CAST(N'2022-04-28T23:13:12.200' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (6, N'CORONAVIRUS (COVID-19) TEST', 2970.0000, CAST(N'2022-04-28T23:13:27.393' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (7, N'Lipid Profile', 525.0000, CAST(N'2022-04-28T23:13:39.470' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (8, N'Urine C/E', 113.0000, CAST(N'2022-04-29T01:26:06.577' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (9, N'HBs Ag', 375.0000, CAST(N'2022-04-29T01:26:34.340' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (10, N'Liver Function Test with GGT (LFT)', 750.0000, CAST(N'2022-04-29T01:27:22.347' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (11, N'Beta HCG', 1352.0000, CAST(N'2022-04-29T01:27:52.227' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (12, N'Cholesterol', 188.0000, CAST(N'2022-04-29T01:28:14.220' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (13, N'HbA1C (Glycosated HB)', 750.0000, CAST(N'2022-04-29T01:29:08.247' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (14, N'Blood C/E', 578.0000, CAST(N'2022-04-29T01:32:14.133' AS DateTime), 1)
INSERT [dbo].[LabTests] ([LabTestID], [LabTestTitle], [LabTestPrice], [AddedDateTime], [Status]) VALUES (15, N'COVID-19 IgG Antibody', 1000.0000, CAST(N'2022-04-29T01:33:06.300' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LabTests] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicines] ON 

INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1, N'Evion 400 mg capsule', N'202205071754065460.jpg', 604.0000, CAST(N'2022-04-30T13:04:23.603' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2, N'Getformin Tab 2mg/500mg', N'202205071737053750.jpg', 360.0000, CAST(N'2022-05-04T07:28:08.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3, N'Getformin Tab 1mg/500mg', N'2022050717453645360.jpg', 220.0000, CAST(N'2022-05-04T07:28:47.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (4, N'Gluconormet Tab 2mg/500mg 30''s', N'20220507180203230.png', 270.0000, CAST(N'2022-05-04T07:29:12.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (5, N'Empaa-M Tab 12.5mg/500mg 14''s', N'medicine.png', 392.0000, CAST(N'2022-05-04T07:29:28.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (6, N'Empaa Tab 10mg 28''s', N'202205071806276270.jpg', 700.0000, CAST(N'2022-05-04T07:29:41.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (7, N'Dex-D Cap 60mg 30''s', N'202205071808478470.jpg', 900.0000, CAST(N'2022-05-04T07:29:52.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (8, N'Diotiz-M Tab 50/1000mg 14''s', N'2022050719262526250.jpg', 460.0000, CAST(N'2022-05-04T07:30:06.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (9, N'Dex-D Cap 30mg 30''s', N'medicine.png', 600.0000, CAST(N'2022-05-04T07:30:15.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (10, N'Diotiz-M Tab 50/850mg 14''s', N'medicine.png', 448.0000, CAST(N'2022-05-04T07:30:39.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (11, N'Diotiz-M Tab 50/500mg 14''s', N'medicine.png', 418.0000, CAST(N'2022-05-04T07:30:54.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (12, N'Sita Zan Tab 50/1000mg 14''s', N'medicine.png', 375.0000, CAST(N'2022-05-04T07:31:14.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (13, N'Sita Zan Tab 50/500mg 14''s', N'medicine.png', 395.0000, CAST(N'2022-05-04T07:31:26.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (14, N'Diaglib Tab 5mg 6x10''s', N'medicine.png', 40.0000, CAST(N'2022-05-04T07:31:42.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (15, N'Gluplus Tab 500mg/15mg 2x7''s', N'medicine.png', 98.0000, CAST(N'2022-05-04T07:31:50.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (16, N'Gluplus Tab 850mg/15mg 2x7''s', N'202205071931033130.jpg', 100.0000, CAST(N'2022-05-04T07:32:01.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (17, N'Glimso Tab 2mg 2x10''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:32:20.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (18, N'Initial Tab 4mg 2x10''s', N'medicine.png', 340.0000, CAST(N'2022-05-04T07:32:36.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (19, N'Initial Tab 2mg 2x10''s', N'medicine.png', 170.0000, CAST(N'2022-05-04T07:32:45.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (20, N'Gvia-M Tab 50mg/1000mg 2x7''s', N'medicine.png', 390.0000, CAST(N'2022-05-04T07:32:59.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (21, N'Gvia-M Tab 50mg/500mg 2x7''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T07:33:08.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (22, N'Gvia Tab 100mg 2x7''s', N'medicine.png', 560.0000, CAST(N'2022-05-04T07:33:28.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (23, N'Gvia Tab 50mg 2x7''s', N'medicine.png', 345.0000, CAST(N'2022-05-04T07:33:37.933' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (24, N'Metadox Tab 850mg 5x10''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T07:33:58.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (25, N'Metadox Tab 850mg 3x10''s', N'medicine.png', 60.0000, CAST(N'2022-05-04T07:34:08.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (26, N'Metadox Tab 500mg 5x10''s', N'medicine.png', 50.0000, CAST(N'2022-05-04T07:34:25.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (27, N'Metadox Tab 1000mg 5x10''s', N'medicine.png', 98.0000, CAST(N'2022-05-04T07:34:34.577' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (28, N'Glicare Tab 5mg 6x10''s', N'medicine.png', 40.0000, CAST(N'2022-05-04T07:34:51.753' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (29, N'Glycon M Tab 50/1000mg 14''s', N'medicine.png', 392.0000, CAST(N'2022-05-04T07:35:11.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (30, N'Glycon M Tab 50/500mg 14''s', N'medicine.png', 378.0000, CAST(N'2022-05-04T07:35:33.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (31, N'Vpride Tab 2mg 1x20''s', N'medicine.png', 165.0000, CAST(N'2022-05-04T07:35:44.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (32, N'Vpride Tab 2mg 1x20''s', N'medicine.png', 165.0000, CAST(N'2022-05-04T07:35:44.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (33, N'Glusit Tab 50mg 1x14''s', N'medicine.png', 375.0000, CAST(N'2022-05-04T07:36:01.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (34, N'Glusit Tab 100mg 1x14''s', N'medicine.png', 620.0000, CAST(N'2022-05-04T07:36:09.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (35, N'Glusimet Tab 50mg/850mg 2x7''s', N'medicine.png', 399.0000, CAST(N'2022-05-04T07:36:27.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (36, N'Glusimet Tab 50mg/1000mg 4x7''s', N'medicine.png', 810.0000, CAST(N'2022-05-04T07:36:37.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (37, N'Glusimet Tab 50mg/500mg 4x7''s', N'medicine.png', 790.0000, CAST(N'2022-05-04T07:37:01.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (38, N'Scicon MR Tab 30mg 1x20''s', N'medicine.png', 190.0000, CAST(N'2022-05-04T07:37:11.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (39, N'Jardy-Met Tab 5/1000mg 14''s', N'medicine.png', 278.0000, CAST(N'2022-05-04T07:37:28.593' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (40, N'Jardy-Met Tab 12.5/500mg 14''s', N'medicine.png', 320.0000, CAST(N'2022-05-04T07:37:37.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (41, N'Jardy-Met Tab 12.5/1000mg 14''s', N'medicine.png', 375.0000, CAST(N'2022-05-04T07:37:59.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (42, N'SITA-MET XR Tab 100/1000 14''s', N'medicine.png', 504.0000, CAST(N'2022-05-04T07:38:11.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (43, N'SITA-MET XR Tab 50/1000 14''s', N'medicine.png', 434.0000, CAST(N'2022-05-04T07:38:37.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (44, N'SITA-MET XR Tab 50/500 14''s', N'medicine.png', 425.0000, CAST(N'2022-05-04T07:38:47.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (45, N'Jardy Tab 25mg 14''s', N'medicine.png', 455.0000, CAST(N'2022-05-04T07:38:58.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (46, N'Jardy Tab 10mg 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-04T07:39:17.757' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (47, N'Xiga Tab 10mg 14''s', N'medicine.png', 430.0000, CAST(N'2022-05-04T07:39:35.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (48, N'Xiga Tab 5mg 14''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T07:39:44.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (49, N'Galza-Met Tab 50mg/1000mg 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T07:46:03.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (50, N'Galza-Met Tab 50mg/850mg 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T07:46:15.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (51, N'Galza Tab 50mg 28''s', N'medicine.png', 753.0000, CAST(N'2022-05-04T07:46:38.823' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (52, N'Sita?Ã¿Met Tab 50mg/1000mg 14''s', N'medicine.png', 405.0000, CAST(N'2022-05-04T07:46:49.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (53, N'Sita?Ã¿Met Tab 50mg/500mg 14''s', N'medicine.png', 395.0000, CAST(N'2022-05-04T07:47:14.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (54, N'Sita Tab 100mg 14''s', N'medicine.png', 620.0000, CAST(N'2022-05-04T07:47:24.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (55, N'Sita Tab 50mg 14''s', N'medicine.png', 375.0000, CAST(N'2022-05-04T07:47:36.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (56, N'Piomet Tab 15mg/500mg 14''s', N'medicine.png', 144.0000, CAST(N'2022-05-04T07:47:46.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (57, N'Orinase-Met Tab 2mg/500mg 30''s', N'medicine.png', 336.0000, CAST(N'2022-05-04T07:48:05.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (58, N'Orinase-Met Tab 1mg/500mg 30''s', N'medicine.png', 220.0000, CAST(N'2022-05-04T07:48:14.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (59, N'Orinase Tab 4mg 20''s', N'medicine.png', 450.0000, CAST(N'2022-05-04T07:48:32.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (60, N'Orinase Tab 3mg 20''s', N'medicine.png', 297.0000, CAST(N'2022-05-04T07:48:44.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (61, N'Orinase Tab 2mg 20''s', N'medicine.png', 202.0000, CAST(N'2022-05-04T07:49:00.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (62, N'Orinase Tab 1mg 20''s', N'medicine.png', 135.0000, CAST(N'2022-05-04T07:49:09.973' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (63, N'Glimet?Ã¿Tab 5mg/500mg 30''s', N'medicine.png', 117.0000, CAST(N'2022-05-04T07:49:20.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (64, N'Glimet?Ã¿Tab 2.5mg/500mg 30''s', N'medicine.png', 103.0000, CAST(N'2022-05-04T07:49:36.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (65, N'Glimet?ÿTab 1.25mg/250mg 30''s', N'medicine.png', 59.0000, CAST(N'2022-05-04T07:50:00.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (66, N'Janumet Tab 50mg/1000mg 14''s', N'medicine.png', 1000.0000, CAST(N'2022-05-04T07:50:11.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (67, N'Janumet Tab 50mg/500mg 14''s', N'medicine.png', 1000.0000, CAST(N'2022-05-04T07:50:21.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (68, N'Januvia Tab 100mg 28''s', N'medicine.png', 3100.0000, CAST(N'2022-05-04T07:50:36.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (69, N'Ligazo Tab 45mg 14''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:50:50.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (70, N'Ligazo Tab 30mg 14''s', N'medicine.png', 140.0000, CAST(N'2022-05-04T07:51:00.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (71, N'Ligazo Tab 15mg 14''s', N'medicine.png', 85.0000, CAST(N'2022-05-04T07:51:17.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (72, N'Gliride Tab 4mg 20''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T07:51:28.220' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (73, N'Gliride Tab 3mg 20''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T07:51:47.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (74, N'Gliride Tab 2mg 20''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:51:56.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (75, N'Gliride Tab 1mg 20''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T07:52:11.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (76, N'Glinext MR Tab 30mg 30''s', N'medicine.png', 273.0000, CAST(N'2022-05-04T07:52:23.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (77, N'Glinext MR Tab 60mg 30''s', N'medicine.png', 452.0000, CAST(N'2022-05-04T07:52:40.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (78, N'Sitanext Tab 50mg/1000mg 14''s', N'medicine.png', 404.0000, CAST(N'2022-05-04T07:52:52.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (79, N'Sitanext Tab 50mg/500mg 14''s', N'medicine.png', 393.0000, CAST(N'2022-05-04T07:53:06.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (80, N'Zansulin 70/30 Inj 100iu 1Vialx10ml', N'medicine.png', 670.0000, CAST(N'2022-05-04T07:53:20.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (81, N'Zansulin Regular Inj 100iu 1Vialx10ml', N'medicine.png', 754.0000, CAST(N'2022-05-04T07:53:48.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (82, N'Zansulin N.P.H Inj 100iu 1Vialx10ml', N'medicine.png', 754.0000, CAST(N'2022-05-04T07:53:57.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (83, N'Zaclazide Tab 80mg 20''s', N'medicine.png', 125.0000, CAST(N'2022-05-04T07:54:17.787' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (84, N'Diglyta Plus Tab 15mg/500mg 14''s', N'medicine.png', 144.0000, CAST(N'2022-05-04T07:54:30.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (85, N'Diab-Tus Tab 250mg 100''s', N'medicine.png', 69.0000, CAST(N'2022-05-04T07:54:53.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (86, N'GPD Tab 1mg 20''S', N'medicine.png', 100.0000, CAST(N'2022-05-04T07:55:04.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (87, N'GPD Tab 2mg 20''S', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:55:19.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (88, N'GPD Tab 4mg 20''S', N'medicine.png', 400.0000, CAST(N'2022-05-04T07:55:30.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (89, N'GPD Tab 3mg 20''S', N'medicine.png', 300.0000, CAST(N'2022-05-04T07:55:48.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (90, N'Diclazide Tab 80mg 2x10''s', N'medicine.png', 53.0000, CAST(N'2022-05-04T07:55:59.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (91, N'Fantasia Tab 45mg 2x7''s', N'medicine.png', 213.0000, CAST(N'2022-05-04T07:56:11.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (92, N'Fantasia Tab 30mg 2x7''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T07:56:26.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (93, N'Fantasia Tab 15mg 2x7''s', N'medicine.png', 94.0000, CAST(N'2022-05-04T07:56:41.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (94, N'Glyset Tab 4mg 2x10''s', N'medicine.png', 437.0000, CAST(N'2022-05-04T07:56:52.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (95, N'Glyset Tab 3mg 2x10''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T07:57:11.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (96, N'Glyset Tab 2mg 2x10''s', N'medicine.png', 181.0000, CAST(N'2022-05-04T07:57:23.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (97, N'Glyset Tab 1mg 2x10''s', N'medicine.png', 125.0000, CAST(N'2022-05-04T07:57:48.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (98, N'Raptrol Tab 1mg 2x15''s', N'medicine.png', 285.0000, CAST(N'2022-05-04T07:57:58.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (99, N'Qosmet Tab 50mg/1gm 2x5''s', N'medicine.png', 275.0000, CAST(N'2022-05-04T07:58:11.787' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (100, N'Qosmet Tab 50mg/1gm 2x5''s', N'medicine.png', 265.0000, CAST(N'2022-05-04T07:58:22.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (101, N'Fantasmic Plus Tab 4mg/30mg 2x10''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T07:58:35.907' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (102, N'Fantasmic Plus Tab 2mg/30mg 2x10''s', N'medicine.png', 290.0000, CAST(N'2022-05-04T07:58:47.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (103, N'Glimecide Tab 4mg 2x10''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:59:04.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (104, N'Glimecide Tab 3mg 2x10''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:59:14.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (105, N'Glimecide Tab 2mg 2x10''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T07:59:29.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (106, N'Glimecide Tab 1mg 2x10''s', N'medicine.png', 55.0000, CAST(N'2022-05-04T07:59:38.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (107, N'Glizon Tab 8mg 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T07:59:48.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (108, N'Glizon Tab 4mg 10''s', N'medicine.png', 105.0000, CAST(N'2022-05-04T08:00:04.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (109, N'Glizon Tab 2mg 10''s', N'medicine.png', 53.0000, CAST(N'2022-05-04T08:00:20.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (110, N'Zona-4 Tab 4mg 10’s', N'medicine.png', 105.0000, CAST(N'2022-05-04T08:00:30.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (111, N'Metfor Tab 850mg 5x10''s', N'medicine.png', 60.0000, CAST(N'2022-05-04T08:00:45.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (112, N'Metfor Tab 850mg 3x10''s', N'medicine.png', 36.0000, CAST(N'2022-05-04T08:00:58.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (113, N'Metfor Tab 1g 5x10''s', N'medicine.png', 85.0000, CAST(N'2022-05-04T08:01:18.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (114, N'Metfor Tab 500mg 50''s', N'medicine.png', 54.0000, CAST(N'2022-05-04T08:01:28.787' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (115, N'Glizid Tab 80mg 30''s', N'medicine.png', 130.0000, CAST(N'2022-05-04T08:01:45.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (116, N'Benclamide Tab 5mg 60''s', N'medicine.png', 40.0000, CAST(N'2022-05-04T08:01:54.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (117, N'Praba Tab 3mg 2x10''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T08:02:10.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (118, N'Praba Tab 2mg 2x10''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T08:02:19.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (119, N'Praba Tab 1mg 2x10''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T08:02:34.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (120, N'Tagamicron Tab 80mg 2x10''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T08:02:46.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (121, N'Fraxy Cap 500mg 30''s', N'medicine.png', 885.0000, CAST(N'2022-05-04T08:03:11.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (122, N'Metliptin Tab 50/1000mg 2x14''s', N'medicine.png', 780.0000, CAST(N'2022-05-04T08:03:22.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (123, N'Metliptin Tab 50/500mg 2x14''s', N'medicine.png', 660.0000, CAST(N'2022-05-04T08:03:40.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (124, N'Liptin Tab 50mg 10''s', N'medicine.png', 240.0000, CAST(N'2022-05-04T08:03:51.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (125, N'Metliptin Tab 50mg/850mg 28''s', N'medicine.png', 750.0000, CAST(N'2022-05-04T08:04:06.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (126, N'Glumet Tab 500mg 5x10''s', N'medicine.png', 55.0000, CAST(N'2022-05-04T08:04:19.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (127, N'Glukil Tab 5mg 6x10''s', N'medicine.png', 48.0000, CAST(N'2022-05-04T08:04:38.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (128, N'Admit Tab 50/1000mg 14''s', N'medicine.png', 325.0000, CAST(N'2022-05-04T08:04:50.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (129, N'Admit Tab 50/500mg 14''s', N'medicine.png', 320.0000, CAST(N'2022-05-04T08:05:04.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (130, N'Admit Tab 50mg 14''s', N'medicine.png', 310.0000, CAST(N'2022-05-04T08:05:15.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (131, N'Admit Tab 25mg 14''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T08:05:36.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (132, N'Admit Tab 100mg 14''s', N'medicine.png', 520.0000, CAST(N'2022-05-04T08:05:47.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (133, N'Diamicron Tab 80mg 20''s', N'medicine.png', 196.0000, CAST(N'2022-05-04T08:06:01.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (134, N'Diamicron MR Tab 60mg 20''s', N'medicine.png', 441.0000, CAST(N'2022-05-04T08:06:10.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (135, N'Diamicron MR Tab 30mg 20''s', N'medicine.png', 307.0000, CAST(N'2022-05-04T08:06:25.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (136, N'Dapaglu Tab 10mg 14''s', N'medicine.png', 325.0000, CAST(N'2022-05-04T08:06:38.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (137, N'Dapaglu Tab 5mg 14''s', N'medicine.png', 215.0000, CAST(N'2022-05-04T08:06:51.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (138, N'Voreta Plus Tab 12.5/1000mg 10''s', N'medicine.png', 260.0000, CAST(N'2022-05-04T08:07:02.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (139, N'Voreta Tab 25mg 10''s', N'medicine.png', 270.0000, CAST(N'2022-05-04T08:07:18.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (140, N'Voreta Tab 10mg 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-04T08:07:29.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (141, N'Trapeze Tab 50mg 14''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T08:07:40.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (142, N'Trapeze Plus Tab 50mg/500mg 10''s', N'medicine.png', 269.0000, CAST(N'2022-05-04T08:07:53.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (143, N'Trapeze Plus Tab 50mg/1000mg 10''s', N'medicine.png', 279.0000, CAST(N'2022-05-04T08:08:11.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (144, N'Jentin Met Tab 50mg/500mg 14''s', N'medicine.png', 402.0000, CAST(N'2022-05-04T08:08:24.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (145, N'Jentin Met Tab 50mg/1000mg 14''s', N'medicine.png', 387.0000, CAST(N'2022-05-04T08:08:52.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (146, N'Glitos Plus Tab 15mg/850mg 14''s', N'medicine.png', 102.0000, CAST(N'2022-05-04T08:09:04.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (147, N'Glitos Plus Tab 15mg/500mg 14''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T08:09:19.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (148, N'Glitos Tab 45mg 14''s', N'medicine.png', 211.0000, CAST(N'2022-05-04T08:09:32.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (149, N'Glitos Tab 15mg 14''s', N'medicine.png', 105.0000, CAST(N'2022-05-04T08:09:44.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (150, N'Glitos Tab 30mg 14''s', N'medicine.png', 172.0000, CAST(N'2022-05-04T08:09:58.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (151, N'Piofit Plus Tab 500mg 2x10''s', N'medicine.png', 189.0000, CAST(N'2022-05-04T08:10:22.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (152, N'Piofit Plus Tab 15mg/850mg 2x10''s', N'medicine.png', 183.0000, CAST(N'2022-05-04T08:10:33.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (153, N'Piofit Plus Tab 15mg/850mg 2x10''s', N'medicine.png', 183.0000, CAST(N'2022-05-04T08:11:33.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (154, N'Piofit Tab 30mg 2x10''s', N'medicine.png', 437.0000, CAST(N'2022-05-04T08:11:51.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (155, N'Glemex Tab 4mg 2x10''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T08:12:03.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (156, N'Glemex Tab 1mg 2x10''s', N'medicine.png', 124.0000, CAST(N'2022-05-04T08:12:17.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (157, N'Glemex Tab 2mg 2x10''s', N'medicine.png', 190.0000, CAST(N'2022-05-04T08:12:28.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (158, N'Piofit Plus Tab 15mg/500mg 2x10''s', N'medicine.png', 190.0000, CAST(N'2022-05-04T08:12:44.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (159, N'Toujeo Solostar Pen 300 IU/ml...', N'medicine.png', 5962.0000, CAST(N'2022-05-04T08:13:01.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (160, N'Lantus Solostar Inj 100IU 1PFPx3ml', N'medicine.png', 1132.0000, CAST(N'2022-05-04T08:13:19.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (161, N'Daonil M Tab 5mg/500mg 3x10''s', N'medicine.png', 140.0000, CAST(N'2022-05-04T08:13:33.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (162, N'Neodipar Tab 850mg 3x10''s', N'medicine.png', 91.0000, CAST(N'2022-05-04T08:13:49.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (163, N'Neodipar Tab 500mg 5x10''s', N'medicine.png', 104.0000, CAST(N'2022-05-04T08:13:59.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (164, N'Lantus Solostar Inj 100IU 5PFPx3ml', N'medicine.png', 5660.0000, CAST(N'2022-05-04T08:14:14.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (165, N'Lantus Inj 100IU 1Vialx10ml', N'medicine.png', 3860.0000, CAST(N'2022-05-04T08:14:34.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (166, N'Daonil Tab 5mg 2x30''s', N'medicine.png', 144.0000, CAST(N'2022-05-04T08:14:46.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (167, N'Apidra Solostar Inj 100IU/ml 5PFPx3ml', N'medicine.png', 4666.0000, CAST(N'2022-05-04T08:15:00.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (168, N'Amaryl Tab 4mg 2x15''s', N'medicine.png', 932.0000, CAST(N'2022-05-04T08:15:18.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (169, N'Amaryl Tab 3mg 2x15''s', N'medicine.png', 700.0000, CAST(N'2022-05-04T08:15:29.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (170, N'Amaryl Tab 2mg 2x15''s', N'medicine.png', 466.0000, CAST(N'2022-05-04T08:15:47.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (171, N'Amaryl Tab 1mg 2x15''s', N'medicine.png', 235.0000, CAST(N'2022-05-04T08:15:58.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (172, N'Amaryl M SR Tab 2mg/500mg..', N'medicine.png', 790.0000, CAST(N'2022-05-04T08:16:15.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (173, N'Amaryl M SR Tab 1mg/500mg...', N'medicine.png', 440.0000, CAST(N'2022-05-04T08:16:26.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (174, N'Itaglip Plus Tab 50mg/1000mg 14''s', N'medicine.png', 350.0000, CAST(N'2022-05-04T08:16:40.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (175, N'Viptin Met Tab 50mg/1000mg 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T08:16:52.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (176, N'Viptin Met Tab 50mg/500mg 14''s', N'medicine.png', 370.0000, CAST(N'2022-05-04T08:17:12.567' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (177, N'Viptin Met Tab 50mg/850mg 14''s', N'medicine.png', 375.0000, CAST(N'2022-05-04T08:17:26.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (178, N'Gpride-M SR Tab 2mg/500mg 30''s', N'medicine.png', 390.0000, CAST(N'2022-05-04T08:17:41.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (179, N'Gpride-M SR Tab 1mg/500mg 30''s', N'medicine.png', 213.0000, CAST(N'2022-05-04T08:17:55.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (180, N'Itaglip Plus Tab 50mg/500mg 14''s', N'medicine.png', 290.0000, CAST(N'2022-05-04T08:18:17.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (181, N'Itaglip Tab 50mg 14''s', N'medicine.png', 275.0000, CAST(N'2022-05-04T08:18:28.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (182, N'Gpride Tab 4mg 2x10''s', N'medicine.png', 330.0000, CAST(N'2022-05-04T08:18:51.023' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (183, N'Gpride Tab 2mg 2x10''s', N'medicine.png', 210.0000, CAST(N'2022-05-04T08:19:03.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (184, N'Gpride Tab 1mg 2x10''s', N'medicine.png', 130.0000, CAST(N'2022-05-04T08:19:24.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (185, N'Safgo-Met Tab 2mg/500mg 3x10''s', N'medicine.png', 250.0000, CAST(N'2022-05-04T08:19:42.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (186, N'Safgo-Met Tab 1mg/500mg 3x10''s', N'medicine.png', 156.0000, CAST(N'2022-05-04T08:19:54.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (187, N'Alosita-Met Tab 50mg/1000mg 2x7''s', N'medicine.png', 315.0000, CAST(N'2022-05-04T08:20:07.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (188, N'Alosita-Met Tab 50mg/500mg 2x7''s', N'medicine.png', 308.0000, CAST(N'2022-05-04T08:20:26.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (189, N'Alosita Tab 100mg 2x7''s', N'medicine.png', 462.0000, CAST(N'2022-05-04T08:20:43.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (190, N'Alosita Tab 50mg 2x7''s', N'medicine.png', 294.0000, CAST(N'2022-05-04T08:21:08.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (191, N'Safgo Tab 4mg 2x10''s', N'medicine.png', 187.0000, CAST(N'2022-05-04T08:21:19.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (192, N'Safgo Tab 2mg 2x10''s', N'medicine.png', 125.0000, CAST(N'2022-05-04T08:21:37.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (193, N'Safgo Tab 1mg 2x10''s', N'medicine.png', 73.0000, CAST(N'2022-05-04T08:21:49.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (194, N'Amarit Plus Tab 2mg/500mg 3x10''s', N'medicine.png', 172.0000, CAST(N'2022-05-04T08:32:34.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (195, N'Amarit Plus Tab 2mg/500mg 3x10''s', N'medicine.png', 172.0000, CAST(N'2022-05-04T17:21:28.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (196, N'Diactal Tab 45mg 1x14''s', N'medicine.png', 186.0000, CAST(N'2022-05-04T17:21:40.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (197, N'Diactal Tab 30mg 1x14''s', N'medicine.png', 133.0000, CAST(N'2022-05-04T17:21:54.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (198, N'Diactal Tab 15mg 1x14''s', N'medicine.png', 67.0000, CAST(N'2022-05-04T17:22:05.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (199, N'Amarit Tab 4mg 2x10''s', N'medicine.png', 152.0000, CAST(N'2022-05-04T17:22:21.863' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (200, N'Amarit Tab 3mg 2x10''s', N'medicine.png', 114.0000, CAST(N'2022-05-04T17:22:32.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (201, N'Amarit Tab 2mg 2x10''s', N'medicine.png', 86.0000, CAST(N'2022-05-04T17:22:50.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (202, N'Sugral Tab 2mg 20''s', N'medicine.png', 163.0000, CAST(N'2022-05-04T17:23:01.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (203, N'Sugral Tab 4mg 20''s', N'medicine.png', 340.0000, CAST(N'2022-05-04T17:23:19.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (204, N'Sugral Tab 2mg 20''s', N'medicine.png', 60.0000, CAST(N'2022-05-04T17:24:39.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (205, N'Piozone Tab 30mg', N'medicine.png', 120.0000, CAST(N'2022-05-04T17:24:58.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (206, N'Piozone Tab 45mg 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-04T17:25:13.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (207, N'Piozone Tab 15mg 14''s', N'medicine.png', 72.0000, CAST(N'2022-05-04T17:25:25.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (208, N'Piozone Plus Tab 850Mg/15Mg', N'medicine.png', 95.0000, CAST(N'2022-05-04T17:25:42.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (209, N'Piozone Plus Tab 500Mg/15Mg', N'medicine.png', 94.0000, CAST(N'2022-05-04T17:25:54.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (210, N'Biguanil Tab 250mg 10x10''s', N'medicine.png', 85.0000, CAST(N'2022-05-04T17:26:12.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (211, N'Protect Tab 80mg 20''s', N'medicine.png', 124.0000, CAST(N'2022-05-04T17:26:24.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (212, N'Inosita Plus Tab 50mg/500mg 28''s', N'medicine.png', 790.0000, CAST(N'2022-05-04T17:26:54.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (213, N'Inosita Tab 100mg 28''s', N'medicine.png', 1160.0000, CAST(N'2022-05-04T17:27:05.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (214, N'Inosita Tab 50mg 28''s', N'medicine.png', 764.0000, CAST(N'2022-05-04T17:27:26.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (215, N'Inosita Plus Tab 50mg/850mg 28''s', N'medicine.png', 757.0000, CAST(N'2022-05-04T17:27:39.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (216, N'Inosita Plus Tab 50mg/1000mg 28''s', N'medicine.png', 773.0000, CAST(N'2022-05-04T17:27:56.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (217, N'Inosita Plus XR Tab 50/1000mg..', N'medicine.png', 419.0000, CAST(N'2022-05-04T17:28:09.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (218, N'Inosita Plus XR Tab 100/1000mg...', N'medicine.png', 580.0000, CAST(N'2022-05-04T17:28:35.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (219, N'Inosita Plus XR Tab 50/500mg', N'medicine.png', 403.0000, CAST(N'2022-05-04T17:28:48.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (220, N'Inosita Plus Tab 50mg/850mg 10''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T17:29:11.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (221, N'Galvecta Plus Tab 50mg/1000mg 14''s', N'medicine.png', 440.0000, CAST(N'2022-05-04T17:29:23.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (222, N'Galvecta Plus Tab 50mg/850mg 14''s', N'medicine.png', 440.0000, CAST(N'2022-05-04T17:29:38.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (223, N'Galvecta Tab 50mg 10''s', N'medicine.png', 295.0000, CAST(N'2022-05-04T17:29:57.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (224, N'Evopride Tab 3mg 30''s', N'medicine.png', 356.0000, CAST(N'2022-05-04T17:30:09.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (225, N'Evopride Tab 2mg 30''s', N'medicine.png', 310.0000, CAST(N'2022-05-04T17:30:22.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (226, N'Evopride Tab 1mg 30''s', N'medicine.png', 186.0000, CAST(N'2022-05-04T17:30:42.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (227, N'Evopride Tab 4mg 30''s', N'medicine.png', 531.0000, CAST(N'2022-05-04T17:30:55.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (228, N'Inosita Tab 25mg 10''s', N'medicine.png', 137.0000, CAST(N'2022-05-04T17:31:09.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (229, N'Innogen R Inj 100IU 1Vialx10ml', N'medicine.png', 441.0000, CAST(N'2022-05-04T17:31:30.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (230, N'Innogen N Inj 100IU 1Vialx10ml', N'medicine.png', 441.0000, CAST(N'2022-05-04T17:31:51.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (231, N'Innogen M30 Inj 100IU 1Vialx10ml', N'medicine.png', 418.0000, CAST(N'2022-05-04T17:32:03.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (232, N'Evopride Plus Tab 2mg/500mg 30''s', N'medicine.png', 252.0000, CAST(N'2022-05-04T17:32:19.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (233, N'Evopride Plus Tab 1mg/500mg 30''s', N'medicine.png', 213.0000, CAST(N'2022-05-04T17:32:35.163' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (234, N'Glucomet Tab 2.5mg/500mg 6x10''s', N'medicine.png', 211.0000, CAST(N'2022-05-04T17:32:55.023' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (235, N'Glucomet Plus Tab 5mg/500mg 6x10''s', N'medicine.png', 238.0000, CAST(N'2022-05-04T17:33:07.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (236, N'Minidiab AF Tab 2.5mg/250mg 10''s', N'medicine.png', 57.0000, CAST(N'2022-05-04T17:33:25.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (237, N'Minidiab Tab 5mg 30''s', N'medicine.png', 81.0000, CAST(N'2022-05-04T17:33:37.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (238, N'Xultophy100/3.6 FlexPen Inj 100IU 1PFPx3ml', N'medicine.png', 7610.0000, CAST(N'2022-05-04T17:33:58.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (239, N'Ryzodeg FlexPen Inj 100IU 5PFPx3ml', N'medicine.png', 13950.0000, CAST(N'2022-05-04T17:34:19.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (240, N'Victoza Inj 6mg/ml 3ml PFP', N'medicine.png', 10372.0000, CAST(N'2022-05-04T17:34:37.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (241, N'NovoRapid FlexPen Inj 100IU 1PFPx3ml', N'medicine.png', 1167.0000, CAST(N'2022-05-04T17:34:55.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (242, N'NovoMix 50 FlexPen Inj 100IU', N'medicine.png', 5835.0000, CAST(N'2022-05-04T17:35:24.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (243, N'NovoRapid FlexPen Inj 100IU 5PFPx3ml', N'medicine.png', 5543.0000, CAST(N'2022-05-04T17:35:37.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (244, N'Levemir FlexPen Inj 100IU 5PFPx3ml', N'medicine.png', 5940.0000, CAST(N'2022-05-04T17:35:58.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (245, N'NovoMix 30 FlexPen Inj 100IU', N'medicine.png', 5835.0000, CAST(N'2022-05-04T17:36:17.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (246, N'Novonorm Tab 2mg 30''s', N'medicine.png', 775.0000, CAST(N'2022-05-04T17:36:40.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (247, N'Novonorm Tab 0.5mg 30''s', N'medicine.png', 533.0000, CAST(N'2022-05-04T17:36:53.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (248, N'Novonorm Tab 1mg 30''s', N'medicine.png', 588.0000, CAST(N'2022-05-04T17:37:19.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (249, N'Mixtard 30 Penfill Inj 100IU', N'medicine.png', 330.0000, CAST(N'2022-05-04T17:37:35.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (250, N'Insulatard Penfill Inj 100IU 5Cartridgesx3ml', N'medicine.png', 1670.0000, CAST(N'2022-05-04T17:38:09.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (251, N'Mixtard 30 HM Inj 100IU', N'medicine.png', 763.0000, CAST(N'2022-05-04T17:38:29.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (252, N'Actrapid Penfill Inj 100IU 5Cartridgesx3ml', N'medicine.png', 1670.0000, CAST(N'2022-05-04T17:38:48.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (253, N'Insulatard HM Inj 100IU 1Vialx10ml', N'medicine.png', 806.0000, CAST(N'2022-05-04T17:39:16.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (254, N'Actrapid HM Inj 100IU 1Vialx10ml', N'medicine.png', 806.0000, CAST(N'2022-05-04T17:39:31.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (255, N'Xultophy100/3.6 FlexPen Inj 100IU 5PFPx3ml', N'medicine.png', 7610.0000, CAST(N'2022-05-04T17:39:48.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (256, N'Galvus Met Tab 50/500mg 30''s', N'medicine.png', 1780.0000, CAST(N'2022-05-04T17:40:12.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (257, N'Galvus Met Tab 50mg/1000mg 30''s', N'medicine.png', 1655.0000, CAST(N'2022-05-04T17:40:32.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (258, N'Galvus Met Tab 50mg/850mg 30''s', N'medicine.png', 1655.0000, CAST(N'2022-05-04T17:40:51.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (259, N'Galvus Tab 50mg 28''s', N'medicine.png', 1580.0000, CAST(N'2022-05-04T17:41:05.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (260, N'Glory Tab 4mg 20''s', N'medicine.png', 265.0000, CAST(N'2022-05-04T17:41:31.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (261, N'Medipride Plus Tab 30''s', N'medicine.png', 250.0000, CAST(N'2022-05-04T17:41:45.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (262, N'Medipride Tab 4mg 20''s', N'medicine.png', 171.0000, CAST(N'2022-05-04T17:42:06.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (263, N'Medipride Tab 3mg 20''s', N'medicine.png', 133.0000, CAST(N'2022-05-04T17:42:22.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (264, N'Medipride Tab 1mg 20''s', N'medicine.png', 57.0000, CAST(N'2022-05-04T17:42:40.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (265, N'Metformed Tab 500mg 5x10''s', N'medicine.png', 56.0000, CAST(N'2022-05-04T17:42:54.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (266, N'Metformed Tab 1gm 5x10''s', N'medicine.png', 63.0000, CAST(N'2022-05-04T17:46:51.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (267, N'Glip Tab 4mg 2x10''s', N'medicine.png', 235.0000, CAST(N'2022-05-04T17:47:05.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (268, N'Glip Tab 4mg 2x10''s', N'medicine.png', 90.0000, CAST(N'2022-05-04T17:47:32.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (269, N'Glip Tab 2mg 3x10''s', N'medicine.png', 180.0000, CAST(N'2022-05-04T17:47:50.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (270, N'Empator Tab 25mg 14''s', N'medicine.png', 343.0000, CAST(N'2022-05-04T17:48:08.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (271, N'Empator Tab 10mg 14''s', N'medicine.png', 273.0000, CAST(N'2022-05-04T17:48:24.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (272, N'Glucophage XR Tab 750mg 3x10''s', N'medicine.png', 215.0000, CAST(N'2022-05-04T17:48:46.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (273, N'Glucophage Tab 500mg 10''s', N'medicine.png', 25.0000, CAST(N'2022-05-04T17:49:01.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (274, N'Duvel Plus Tab 50mg/1000mg 14''s', N'medicine.png', 390.0000, CAST(N'2022-05-04T17:49:32.807' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (275, N'Duvel Plus Tab 50mg/500mg 14''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T17:49:46.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (276, N'Euglucon Tab 5mg 60''s', N'medicine.png', 88.0000, CAST(N'2022-05-04T17:50:13.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (277, N'Dowglit Tab 45mg 14''s', N'medicine.png', 210.0000, CAST(N'2022-05-04T17:50:28.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (278, N'Dowglit Tab 30mg 14''s', N'medicine.png', 161.0000, CAST(N'2022-05-04T17:50:47.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (279, N'Dowglit Tab 15mg 14''s', N'medicine.png', 91.0000, CAST(N'2022-05-04T17:51:00.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (280, N'Diatrol Tab 4mg 20''s', N'medicine.png', 275.0000, CAST(N'2022-05-04T17:51:22.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (281, N'Diatrol Tab 2mg 20''s', N'medicine.png', 166.0000, CAST(N'2022-05-04T17:51:41.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (282, N'Diatrol Tab 3mg 20''s', N'medicine.png', 204.0000, CAST(N'2022-05-04T17:52:03.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (283, N'Diatrol Tab 1mg 20''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T17:52:22.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (284, N'Nidonil Tab 80mg 2x10''s', N'medicine.png', 122.0000, CAST(N'2022-05-04T17:52:47.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (285, N'Glucovance Tab 5mg/500mg 2x15''s', N'medicine.png', 140.0000, CAST(N'2022-05-04T17:53:13.973' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (286, N'Glucovance Tab 2.5mg/500mg 2x15''s', N'medicine.png', 124.0000, CAST(N'2022-05-04T17:54:13.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (287, N'Glucovance Tab 1.25mg/250mg 2x15''s', N'medicine.png', 70.0000, CAST(N'2022-05-04T17:54:30.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (288, N'Glucophage Tab 1g 5x10''s', N'medicine.png', 250.0000, CAST(N'2022-05-04T17:55:25.850' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (289, N'Glucophage Tab 850mg 3x10''s', N'medicine.png', 138.0000, CAST(N'2022-05-04T17:55:49.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (290, N'Glucophage Tab 500mg 5x10''s', N'medicine.png', 136.0000, CAST(N'2022-05-04T17:56:29.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (291, N'Glioptim Tab 4mg 2x10''s', N'medicine.png', 322.0000, CAST(N'2022-05-04T17:56:44.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (292, N'Glucophage Tab 250mg 5x10''s', N'medicine.png', 72.0000, CAST(N'2022-05-04T17:57:05.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (293, N'Glioptim Tab 2mg 2x10''s', N'medicine.png', 124.0000, CAST(N'2022-05-04T17:57:21.303' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (294, N'Glioptim Tab 3mg 2x10''s', N'medicine.png', 279.0000, CAST(N'2022-05-04T17:57:52.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (295, N'Glioptim Tab 1mg 2x10''s', N'medicine.png', 90.0000, CAST(N'2022-05-04T17:58:18.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (296, N'Empozin-M 12.5/1000mg Tab 14''s', N'medicine.png', 350.0000, CAST(N'2022-05-04T17:58:54.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (297, N'Silo M Tab 50mg/500mg 14''s', N'medicine.png', 251.0000, CAST(N'2022-05-04T17:59:20.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (298, N'Silo M Tab 50mg/1000mg 14''s', N'medicine.png', 392.0000, CAST(N'2022-05-04T17:59:55.180' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (299, N'Glio-P Tab 2mg/15mg 14''s', N'medicine.png', 177.0000, CAST(N'2022-05-04T18:00:13.457' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (300, N'Glio-P Tab 2mg/15mg 14''s', N'medicine.png', 306.0000, CAST(N'2022-05-04T18:00:46.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (301, N'Silo Tab 100mg 14''s', N'medicine.png', 465.0000, CAST(N'2022-05-04T18:01:08.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (302, N'Glio Tab 3mg 20''s', N'medicine.png', 162.0000, CAST(N'2022-05-04T18:15:20.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (303, N'Glio Tab 4mg 20''s', N'medicine.png', 209.0000, CAST(N'2022-05-04T18:15:36.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (304, N'Glio Tab 2mg 20''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T18:15:55.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (305, N'Glio Tab 1mg 20''s', N'medicine.png', 105.0000, CAST(N'2022-05-04T18:16:14.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (306, N'Glio-P Tab 4mg/30mg 14''s', N'medicine.png', 379.0000, CAST(N'2022-05-04T18:16:35.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (307, N'Glio-P Tab 2mg/30mg 14''s', N'medicine.png', 187.0000, CAST(N'2022-05-04T18:16:55.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (308, N'Glucodal Tab 500mg 5x10''s', N'medicine.png', 102.0000, CAST(N'2022-05-04T18:17:19.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (309, N'Imepryl Tab 4mg 2x10''s', N'medicine.png', 228.0000, CAST(N'2022-05-04T18:17:35.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (310, N'Imepryl Tab 2mg 2x10''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T18:17:57.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (311, N'Imepryl Tab 1mg 2x10''s', N'medicine.png', 76.0000, CAST(N'2022-05-04T18:18:13.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (312, N'Vildrozon-M Tab 50mg/1000mg 14''s', N'medicine.png', 406.0000, CAST(N'2022-05-04T18:18:35.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (313, N'Vildrozon Tab 50mg 10''s', N'medicine.png', 304.0000, CAST(N'2022-05-04T18:18:53.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (314, N'Empaa-M Tab 12.5mg/500mg 14''s', N'medicine.png', 392.0000, CAST(N'2022-05-04T18:19:31.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (315, N'Empaa Tab 25mg 14''s', N'medicine.png', 450.0000, CAST(N'2022-05-04T18:19:47.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (316, N'Empaa Tab 10mg 14''s', N'medicine.png', 350.0000, CAST(N'2022-05-04T18:20:12.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (317, N'Vildrozon-M Tab 50/500mg 14''s', N'medicine.png', 406.0000, CAST(N'2022-05-04T18:20:27.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (318, N'Gliptin Plus Tab 50mg/1000mg 10''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T18:20:49.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (319, N'Gliptin Plus Tab 50mg/500mg 10''s', N'medicine.png', 330.0000, CAST(N'2022-05-04T18:21:07.553' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (320, N'Gliptin Tab 100mg 14''s', N'medicine.png', 660.0000, CAST(N'2022-05-04T18:21:29.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (321, N'Gliptin Tab 50mg 14''s', N'medicine.png', 440.0000, CAST(N'2022-05-04T18:21:45.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (322, N'Pamaryl Plus Tab 2mg/500mg 30''s', N'medicine.png', 462.0000, CAST(N'2022-05-04T18:22:08.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (323, N'Pamaryl Plus Tab 1mg/500mg 30''s', N'medicine.png', 156.0000, CAST(N'2022-05-04T18:22:27.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (324, N'Pamaryl Tab 4mg 20''s', N'medicine.png', 415.0000, CAST(N'2022-05-04T18:22:49.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (325, N'Pamaryl Tab 3mg 20''s', N'medicine.png', 311.0000, CAST(N'2022-05-04T18:23:04.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (326, N'Pamaryl Tab 2mg 20''s', N'medicine.png', 208.0000, CAST(N'2022-05-04T18:23:27.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (327, N'Pamaryl Tab 1mg 20''s', N'medicine.png', 104.0000, CAST(N'2022-05-04T18:24:02.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (328, N'Diocid Tab 80mg 30''s', N'medicine.png', 271.0000, CAST(N'2022-05-04T18:24:21.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (329, N'Sitaglu Met XR Tab 100/1000...', N'medicine.png', 504.0000, CAST(N'2022-05-04T18:24:37.803' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (330, N'Sitaglu Met XR Tab 50/1000mg...', N'medicine.png', 333.0000, CAST(N'2022-05-04T18:25:02.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (331, N'Sitaglu Met XR Tab 50/500', N'medicine.png', 334.0000, CAST(N'2022-05-04T18:25:20.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (332, N'Xenglu Met Tab 5/850mg 14''s', N'medicine.png', 285.0000, CAST(N'2022-05-04T18:25:40.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (333, N'Xenglu Met Tab 5/1000mg 14''s', N'medicine.png', 285.0000, CAST(N'2022-05-04T18:25:58.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (334, N'Xenglu Met Tab 12.5/850mg 14''s', N'medicine.png', 366.0000, CAST(N'2022-05-04T18:26:17.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (335, N'Xenglu Met Tab 12.5/1000mg 14''s', N'medicine.png', 366.0000, CAST(N'2022-05-04T18:26:32.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (336, N'Xenglu Met Tab 12.5/500mg 14''s', N'medicine.png', 319.0000, CAST(N'2022-05-04T18:27:03.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (337, N'Xenglu Tab 10mg 14''s', N'medicine.png', 285.0000, CAST(N'2022-05-04T18:27:21.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (338, N'Xenglu Tab 25mg 14''s', N'medicine.png', 445.0000, CAST(N'2022-05-04T18:27:57.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (339, N'Dapa-Met Tab 5/1000mg 14''s', N'medicine.png', 335.0000, CAST(N'2022-05-04T18:28:11.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (340, N'Dapa-Met Tab 5/850mg 14''s', N'medicine.png', 320.0000, CAST(N'2022-05-04T18:28:29.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (341, N'Sitaglu Met Tab 50/850mg 14''s', N'medicine.png', 395.0000, CAST(N'2022-05-04T18:28:44.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (342, N'Dapa Tab 10mg 14''s', N'medicine.png', 445.0000, CAST(N'2022-05-04T18:29:01.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (343, N'Dapa Tab 5mg 14''s', N'medicine.png', 285.0000, CAST(N'2022-05-04T18:29:17.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (344, N'Sitaglu Tab 25mg 14''s', N'medicine.png', 223.0000, CAST(N'2022-05-04T18:29:38.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (345, N'Sitaglu Met Tab 50mg/500mg 14''s', N'medicine.png', 390.0000, CAST(N'2022-05-04T18:29:57.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (346, N'Sitaglu Met Tab 50mg/1000mg 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T18:30:16.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (347, N'Sitaglu Tab 50mg 14''s', N'medicine.png', 345.0000, CAST(N'2022-05-04T18:30:32.973' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (348, N'Sitaglu Tab 100mg 14''s', N'medicine.png', 595.0000, CAST(N'2022-05-04T18:30:55.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (349, N'Piozer-G Tab 30mg/4mg 14''s', N'medicine.png', 348.0000, CAST(N'2022-05-04T18:31:16.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (350, N'Piozer-G Tab 30mg/2mg 14''s', N'medicine.png', 310.0000, CAST(N'2022-05-04T18:31:42.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (351, N'Piozer-G Tab 15mg/2mg 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-04T18:31:58.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (352, N'Piozer Tab 45mg 14''s', N'medicine.png', 395.0000, CAST(N'2022-05-04T18:32:23.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (353, N'Piozer Tab 30mg 14''s', N'medicine.png', 355.0000, CAST(N'2022-05-04T18:32:43.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (354, N'Piozer Tab 15mg 14''s', N'medicine.png', 230.0000, CAST(N'2022-05-04T18:33:05.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (355, N'Piozer Plus Tab 15mg/850mg 14''s', N'medicine.png', 133.0000, CAST(N'2022-05-04T18:33:29.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (356, N'Piozer Plus Tab 15mg/500mg 14''s', N'medicine.png', 154.0000, CAST(N'2022-05-04T18:33:50.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (357, N'Vildomet Tab 50mg/500mg 14''s', N'medicine.png', 396.0000, CAST(N'2022-05-04T18:34:05.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (358, N'Zeenaryl Tab 3mg 20''s', N'medicine.png', 240.0000, CAST(N'2022-05-04T18:34:25.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (359, N'Zeenaryl Tab 2mg 20''s', N'medicine.png', 184.0000, CAST(N'2022-05-04T18:34:41.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (360, N'Zeenaryl Tab 1mg 20''s', N'medicine.png', 120.0000, CAST(N'2022-05-04T18:35:00.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (361, N'Zeenaryl Tab 4mg 20''s', N'medicine.png', 278.0000, CAST(N'2022-05-04T18:35:16.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (362, N'Vildos Tab 50mg 28''s', N'medicine.png', 639.0000, CAST(N'2022-05-04T18:35:47.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (363, N'Vildomet Tab 50mg/850mg 14''s', N'medicine.png', 377.0000, CAST(N'2022-05-04T18:36:03.433' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (364, N'Vildomet Tab 50mg/1000mg 14''s', N'medicine.png', 377.0000, CAST(N'2022-05-04T18:36:24.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (365, N'Daploz-Met Tab 5/850mg 14''s', N'medicine.png', 266.0000, CAST(N'2022-05-04T18:36:41.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (366, N'Daploz-Met Tab 5/1000mg 14''s', N'medicine.png', 300.0000, CAST(N'2022-05-04T18:36:59.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (367, N'Daploz Tab 10mg 14''s', N'medicine.png', 364.0000, CAST(N'2022-05-04T18:37:17.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (368, N'Daploz Tab 5mg 14''s', N'medicine.png', 252.0000, CAST(N'2022-05-04T18:37:39.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (369, N'Tagipmet XR Tab 50mg/500mg 14''s', N'medicine.png', 420.0000, CAST(N'2022-05-04T18:51:15.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (370, N'Tagipmet XR Tab 50mg/1000mg 14''s', N'medicine.png', 434.0000, CAST(N'2022-05-04T18:51:38.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (371, N'Tagipmet XR Tab 100mg/1000mg 14''s', N'medicine.png', 518.0000, CAST(N'2022-05-04T18:51:56.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (372, N'Tagip Tab 25mg 14''s', N'medicine.png', 252.0000, CAST(N'2022-05-04T18:52:18.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (373, N'Tagip Tab 100mg 14''s', N'medicine.png', 550.0000, CAST(N'2022-05-04T18:52:42.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (374, N'Tagip Tab 50mg 14''s', N'medicine.png', 342.0000, CAST(N'2022-05-04T18:53:10.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (375, N'Tagip Tab 50mg 14''s', N'medicine.png', 392.0000, CAST(N'2022-05-04T18:53:27.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (376, N'Tagipmet Tab 50mg/500mg 14''s', N'medicine.png', 373.0000, CAST(N'2022-05-04T18:53:51.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (377, N'Juvia-M Plus Tab 50mg/500mg 10''s', N'medicine.png', 253.0000, CAST(N'2022-05-04T18:54:15.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (378, N'Juvia-M Plus Tab 50mg/1000mg 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-04T18:54:45.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (379, N'G-Helix Tab 4mg 2x10''s', N'medicine.png', 220.0000, CAST(N'2022-05-04T18:55:02.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (380, N'G-Helix Tab 2mg 2x10''s', N'medicine.png', 120.0000, CAST(N'2022-05-04T18:55:39.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (381, N'G-Helix Tab 1mg 2x10''s', N'medicine.png', 64.0000, CAST(N'2022-05-04T18:55:59.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (382, N'Diampa Tab 25mg 14''s', N'medicine.png', 559.0000, CAST(N'2022-05-04T18:56:18.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (383, N'Diampa-M Tab 12.5mg/1000mg 14''s', N'medicine.png', 375.0000, CAST(N'2022-05-04T18:56:35.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (384, N'Vilget-M Tab 50mg/500mg 14''s', N'medicine.png', 465.0000, CAST(N'2022-05-04T18:56:56.163' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (385, N'Diampa Tab 10mg 14''s', N'medicine.png', 349.0000, CAST(N'2022-05-04T18:57:16.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (386, N'Treviamet XR Tab 50mg/1000mg 14''s', N'medicine.png', 532.0000, CAST(N'2022-05-04T19:21:36.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (387, N'Treviamet XR Tab 50mg/500mg 14''s', N'medicine.png', 518.0000, CAST(N'2022-05-04T19:21:51.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (388, N'Treviamet Tab 50mg/850mg 14''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T19:22:23.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (389, N'Vilget-M Tab 50mg/850mg 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T19:22:39.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (390, N'Vilget-M Tab 50mg/1000mg 14''s', N'medicine.png', 465.0000, CAST(N'2022-05-04T19:22:57.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (391, N'Vilget Tab 50mg 28''s', N'medicine.png', 910.0000, CAST(N'2022-05-04T19:23:12.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (392, N'Zoliget Tab 30mg/4mg 14''s', N'medicine.png', 373.0000, CAST(N'2022-05-04T19:23:37.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (393, N'Zoliget Tab 30mg/2mg 14''s', N'medicine.png', 307.0000, CAST(N'2022-05-04T19:23:52.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (394, N'Zoliget Tab 15mg/2mg 14''s', N'medicine.png', 209.0000, CAST(N'2022-05-04T19:24:12.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (395, N'Zolid Plus Tab 15mg/850mg 14''S', N'medicine.png', 147.0000, CAST(N'2022-05-04T19:24:28.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (396, N'Zolid Plus Tab 15mg/500mg 28''s', N'medicine.png', 272.0000, CAST(N'2022-05-04T19:26:26.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (397, N'Zolid Tab 45mg 14''s', N'medicine.png', 450.0000, CAST(N'2022-05-04T19:26:37.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (398, N'Zolid Tab 30mg 14''s', N'medicine.png', 360.0000, CAST(N'2022-05-04T19:26:57.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (399, N'Zolid Tab 15mg 14''s', N'medicine.png', 250.0000, CAST(N'2022-05-04T19:27:09.730' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (400, N'Treviamet Tab 50mg/1000mg 14''s', N'medicine.png', 418.0000, CAST(N'2022-05-04T19:27:29.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (401, N'Treviamet Tab 50mg/500mg 14''s', N'medicine.png', 404.0000, CAST(N'2022-05-04T19:27:48.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (402, N'Trevia Tab 50mg 14''s', N'medicine.png', 409.0000, CAST(N'2022-05-04T19:28:09.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (403, N'Trevia Tab 100mg 14''s', N'medicine.png', 635.0000, CAST(N'2022-05-04T19:28:24.703' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (404, N'Insuget R Inj 100IU 1Vialx10ml', N'medicine.png', 618.0000, CAST(N'2022-05-04T19:28:43.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (405, N'Insuget 70/30 Inj 100IU 1Vialx10ml', N'medicine.png', 650.0000, CAST(N'2022-05-04T19:28:58.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (406, N'Insuget N Inj 100IU 1Vialx10ml', N'medicine.png', 618.0000, CAST(N'2022-05-04T19:29:17.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (407, N'Getryl Tab 4mg 2x10''s', N'medicine.png', 485.0000, CAST(N'2022-05-04T19:29:36.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (408, N'Getryl Tab 3mg 2x10''s', N'medicine.png', 335.0000, CAST(N'2022-05-04T19:29:55.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (409, N'Getryl Tab 2mg 2x10''s', N'medicine.png', 240.0000, CAST(N'2022-05-04T19:30:13.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (410, N'Getryl Tab 1mg 2x10''s', N'medicine.png', 139.0000, CAST(N'2022-05-04T19:32:54.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (411, N'Getformin Tab 2mg/500mg', N'medicine.png', 361.0000, CAST(N'2022-05-04T19:33:07.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (412, N'Getformin Tab 1mg/500mg', N'medicine.png', 219.0000, CAST(N'2022-05-04T19:33:29.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (413, N'Basagine Inj 100iu 1Vialx3ml', N'medicine.png', 855.0000, CAST(N'2022-05-04T19:33:45.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (414, N'Trevia Tab 100mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:34:47.953' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (415, N'Treviamet Tab 50mg/500mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:35:53.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (416, N'Treviamet Tab 50mg/1000mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:36:12.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (417, N'Vilget-M Tab  50mg/1000mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:36:39.083' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (418, N'Vilget-M Tab 50mg/850mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:36:55.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (419, N'Vilget Tab 50mg 28''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:38:00.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (420, N'Insuget N Inj 100IU 1Vialx10ml..', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:38:24.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (421, N'Insuget 70/30 Inj 100IU 1Vialx10ml...', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:38:46.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (422, N'Zolid Plus Tab 15mg/850mg 14''s...', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:39:08.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (423, N'Zolid Plus Tab 15mg/500mg 28''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:39:30.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (424, N'Zolid Tab 15mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:39:51.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (425, N'Zolid Tab 30mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:40:17.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (426, N'Zolid Tab 45mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:40:39.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (427, N'Zoliget Tab 30mg/4mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:41:07.603' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (428, N'Zoliget Tab 15mg/2mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:41:25.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (429, N'Zoliget Tab 30mg/2mg 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:41:49.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (430, N'Getformin Tab 1mg/500mg 30’s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:42:28.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (431, N'Getformin Tab 2mg/500mg 30’s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:42:57.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (432, N'Basagine Inj 100IU 1Vialx3ml', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:43:12.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (433, N'Geopride Tab 1mg 20''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T19:44:48.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (434, N'Geopride Tab 3mg 20''s', N'medicine.png', 285.0000, CAST(N'2022-05-04T19:45:24.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (435, N'Geopride Tab 2mg 2x10''s', N'medicine.png', 143.0000, CAST(N'2022-05-04T19:45:41.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (436, N'Glabinol Tab 5mg 10x6''s', N'medicine.png', 84.0000, CAST(N'2022-05-04T19:46:02.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (437, N'Diabimin Tab 850mg 5x10''s', N'medicine.png', 48.0000, CAST(N'2022-05-04T19:46:20.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (438, N'Sitagen Tab 100mg 1x30''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:46:35.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (439, N'Sitagen Tab 50mg 1x30''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:47:00.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (440, N'Sitagen-M Tab 50mg/500mg 1x30''s', N'medicine.png', 713.0000, CAST(N'2022-05-04T19:47:18.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (441, N'Diabetron Tab 80mg 20''s', N'medicine.png', 160.0000, CAST(N'2022-05-04T19:47:56.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (442, N'Gliclazide Tab 80mg 2x10''s', N'medicine.png', 91.0000, CAST(N'2022-05-04T19:48:25.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (443, N'Trulicity Inj 1.5mg/0.5ml 1PFS Pack Size: 1PFSx0.5ml', N'medicine.png', 4610.0000, CAST(N'2022-05-04T19:48:59.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (444, N'Trulicity Inj 1.5mg/0.5ml 4PFS Pack Size: 4PFSx0.5ml', N'medicine.png', 19500.0000, CAST(N'2022-05-04T19:49:16.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (445, N'Humalog Mix 50 Inj 100u/ml... Pack Size: 5cartridgesx3ml', N'medicine.png', 4870.0000, CAST(N'2022-05-04T19:49:41.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (446, N'Humalog Mix 25 Kwikpen Inj... Pack Size: 5pfpx3ml', N'medicine.png', 6000.0000, CAST(N'2022-05-04T19:49:58.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (447, N'Humalog Kwikpen Inj 100u/ml 5PFPx3ml Pack Size: 5pfpx3ml', N'medicine.png', 6700.0000, CAST(N'2022-05-04T19:50:39.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (448, N'Humalog Lispro Inj 100u/ml 5cartiridgesx3ml Pack Size: 5cartridgesx3ml', N'medicine.png', 5250.0000, CAST(N'2022-05-04T19:50:59.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (449, N'Humalog Mix 50 Kwikpen Inj... Pack Size: 5pfpx3ml', N'medicine.png', 6955.0000, CAST(N'2022-05-04T19:51:23.253' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (450, N'Humulin 70/30 Inj 100iu/ml 5Cartridgesx3ml Pack Size: 5''s', N'medicine.png', 2100.0000, CAST(N'2022-05-04T19:51:42.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (451, N'Humalog Mix 25 Inj 100u/ml... Pack Size: 5cartridgesx3ml', N'medicine.png', 4695.0000, CAST(N'2022-05-04T19:52:01.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (452, N'Humulin-R Inj 100iu/ml 1Vialx10ml', N'medicine.png', 979.0000, CAST(N'2022-05-04T19:52:17.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (453, N'Humalog Inj 100iu/ml 1Vialx10ml', N'medicine.png', 2030.0000, CAST(N'2022-05-04T19:52:57.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (454, N'Humulin-N Inj 100iu/ml 1Vialx10ml', N'medicine.png', 923.0000, CAST(N'2022-05-04T19:53:21.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (455, N'Humulin 70/30 Inj 100iu/ml 1Vialx10ml Pack Size: 1''s', N'medicine.png', 1050.0000, CAST(N'2022-05-04T19:53:43.703' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (456, N'Metcon Plus Tab 5mg/500mg 30''s Pack Size: 30''s', N'medicine.png', 106.0000, CAST(N'2022-05-04T19:53:59.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (457, N'Glicon Tab 5mg 60''s', N'medicine.png', 134.0000, CAST(N'2022-05-04T19:55:38.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (458, N'METFORMINA Tab 850mg 50''s', N'medicine.png', 150.0000, CAST(N'2022-05-04T19:55:52.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (459, N'Metformina Tab 500mg 50''s', N'medicine.png', 97.0000, CAST(N'2022-05-04T19:56:11.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (460, N'METFORMINA Tab 1g 50''s', N'medicine.png', 161.0000, CAST(N'2022-05-04T19:56:45.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (461, N'Tagozer-G Tab 30mg/4mg 1x14''s Pack Size: 14''s', N'medicine.png', 102.0000, CAST(N'2022-05-04T19:57:04.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (462, N'Tagozer-G Tab 30mg/2mg 1x14''s Pack Size: 14''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T19:57:28.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (463, N'Tagozer-G Tab 15mg/2mg 1x10''s Pack Size: 10''s', N'medicine.png', 43.0000, CAST(N'2022-05-04T19:57:48.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (464, N'Tagozer Tab 45mg 1x10''s Pack Size: 10''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T19:58:06.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (465, N'Tagozer Tab 30mg 1x10''s Pack Size: 10''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T19:58:27.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (466, N'Tagozer Tab 15mg 1x10''s Pack Size: 10''s', N'medicine.png', 58.0000, CAST(N'2022-05-04T19:58:48.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (467, N'Steady Tab 4mg 2x10''s Pack Size: 20''s', N'medicine.png', 228.0000, CAST(N'2022-05-04T19:59:09.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (468, N'Steady Tab 3mg 2x10''s Pack Size: 20''s', N'medicine.png', 171.0000, CAST(N'2022-05-04T19:59:24.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (469, N'Steady Tab 1mg 2x10''s Pack Size: 20''s', N'medicine.png', 67.0000, CAST(N'2022-05-04T19:59:43.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (470, N'Pioryl-M Tab 15mg/500mg 2x7''s', N'medicine.png', 91.0000, CAST(N'2022-05-04T20:00:07.093' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (471, N'Pioryl-M Tab 15mg/850mg 2x7''s Pack Size: 14''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T20:00:27.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (472, N'Glucobay Tab 50mg 3x10''s Pack Size: 30''s', N'medicine.png', 287.0000, CAST(N'2022-05-04T20:00:43.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (473, N'Vilcret Plus Tab 50mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 414.0000, CAST(N'2022-05-04T20:01:08.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (474, N'Vilcret Plus Tab 50mg/850mg 14''s Pack Size: 14''s', N'medicine.png', 376.0000, CAST(N'2022-05-04T20:01:44.093' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (475, N'Vilcret Plus Tab 50mg/1000mg 14''s Pack Size: 14''s', N'medicine.png', 414.0000, CAST(N'2022-05-04T20:02:04.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (476, N'S-Gliptin Plus Tab 50mg/850mg 2x7''s', N'medicine.png', 329.0000, CAST(N'2022-05-04T20:02:24.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (477, N'S-gliptin Plus Tab 50mg/1000mg 2x7''s', N'medicine.png', 389.0000, CAST(N'2022-05-04T20:02:54.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (478, N'S-gliptin Plus Tab 50mg/500mg 2x7''s', N'medicine.png', 383.0000, CAST(N'2022-05-04T20:03:11.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (479, N'S-gliptin Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 650.0000, CAST(N'2022-05-04T20:03:33.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (480, N'S-gliptin Tab 25mg 14''s', N'medicine.png', 239.0000, CAST(N'2022-05-04T20:03:56.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (481, N'Diabold Plus Tab 1mg/500mg 3x10''s Pack Size: 30''s', N'medicine.png', 205.0000, CAST(N'2022-05-04T20:05:16.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (482, N'Diabold Tab 4mg 2x10''s', N'medicine.png', 322.0000, CAST(N'2022-05-04T20:05:36.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (483, N'Diabold Tab 3mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 238.0000, CAST(N'2022-05-04T20:05:58.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (484, N'Diabold Tab 2mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 157.0000, CAST(N'2022-05-04T20:06:14.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (485, N'Diabold Tab 1mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 82.0000, CAST(N'2022-05-04T20:06:35.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (486, N'Neoglip Tab 50mg/1000mg 14''s Pack Size: 14''s', N'medicine.png', 345.0000, CAST(N'2022-05-04T20:06:53.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (487, N'Neoglip Tab 50mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 345.0000, CAST(N'2022-05-04T20:07:14.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (488, N'A-Glip Tab 100mg 14''s', N'medicine.png', 451.0000, CAST(N'2022-05-04T20:07:28.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (489, N'A-Glip Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 342.0000, CAST(N'2022-05-04T20:07:54.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (490, N'Viglip-M Tab 50mg/1000mg 2x7''s Pack Size: 14''s', N'medicine.png', 473.0000, CAST(N'2022-05-04T20:08:12.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (491, N'Viglip-M Tab 50mg/850mg 2x7''s Pack Size: 14''s', N'medicine.png', 472.0000, CAST(N'2022-05-04T20:08:33.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (492, N'Viglip Tab 50mg 2x14''s Pack Size: 28''s', N'medicine.png', 899.0000, CAST(N'2022-05-04T20:08:52.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (493, N'Piotone Plus Tab 15mg/850mg 14''s Pack Size: 14''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T20:09:15.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (494, N'Piotone Plus Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 98.0000, CAST(N'2022-05-04T20:09:35.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (495, N'Poze-G Tab 4mg/30mg 14''s Pack Size: 14''s', N'medicine.png', 471.0000, CAST(N'2022-05-04T20:09:56.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (496, N'Pozemet Tab 15mg/850mg 14''s Pack Size: 14''s', N'medicine.png', 139.0000, CAST(N'2022-05-04T20:10:18.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (497, N'Poze-G Tab 30mg/2mg 14''s', N'medicine.png', 307.0000, CAST(N'2022-05-04T20:10:49.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (498, N'Pozemet Tab 15mg/500mg 14''s', N'medicine.png', 144.0000, CAST(N'2022-05-04T20:11:07.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (499, N'Poze Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 275.0000, CAST(N'2022-05-04T20:11:29.267' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (500, N'Poze-G Tab 4mg/30mg 14''s', N'medicine.png', 471.0000, CAST(N'2022-05-04T20:15:33.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (501, N'Pozemet Tab 15mg/850mg 14''s', N'medicine.png', 139.0000, CAST(N'2022-05-04T20:15:56.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (502, N'Poze-G Tab 30mg/2mg 14''s', N'medicine.png', 307.0000, CAST(N'2022-05-04T20:16:21.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (503, N'Pozemet Tab 15mg/500mg 14''s', N'medicine.png', 144.0000, CAST(N'2022-05-04T20:16:39.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (504, N'Poze Tab 30mg 14''s', N'medicine.png', 260.0000, CAST(N'2022-05-04T20:17:08.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (505, N'Poze Tab 45mg 14''s', N'medicine.png', 275.0000, CAST(N'2022-05-04T20:17:22.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (506, N'Poze Tab 15mg 14''s', N'medicine.png', 150.0000, CAST(N'2022-05-04T20:17:46.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (507, N'Gluconormet Tab 2mg/500mg 30''s', N'medicine.png', 270.0000, CAST(N'2022-05-04T20:18:05.217' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (508, N'Gluconorm Tab 4mg 20''s', N'medicine.png', 320.0000, CAST(N'2022-05-04T20:18:40.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (509, N'Gluconormet Tab 1mg/500mg 30''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T20:18:56.503' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (510, N'Gluconorm Tab 1mg 20''s', N'medicine.png', 120.0000, CAST(N'2022-05-04T20:19:21.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (511, N'Gluconorm Tab 3mg 20''s', N'medicine.png', 240.0000, CAST(N'2022-05-04T20:19:39.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (512, N'Gluconorm Tab 2mg 20''s', N'medicine.png', 152.0000, CAST(N'2022-05-04T20:20:10.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (513, N'Glow Tab 4mg 2x10''s', N'medicine.png', 207.0000, CAST(N'2022-05-04T20:20:32.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (514, N'Glow Tab 3mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 165.0000, CAST(N'2022-05-04T20:20:52.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (515, N'Glow Tab 1mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 62.0000, CAST(N'2022-05-04T20:21:18.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (516, N'Glow Tab 2mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 110.0000, CAST(N'2022-05-04T20:21:46.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (517, N'Econid Tab 3mg 2x10''s', N'medicine.png', 299.0000, CAST(N'2022-05-04T20:22:03.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (518, N'Econid Tab 1mg 2x10''s', N'medicine.png', 100.0000, CAST(N'2022-05-04T20:22:25.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (519, N'Japril Tab 10mg 2x10''s', N'medicine.png', 66.0000, CAST(N'2022-05-04T20:56:05.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (520, N'Japril Tab 5mg 2x10''s', N'medicine.png', 55.0000, CAST(N'2022-05-04T20:56:24.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (521, N'Trupril Tab 10mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 154.0000, CAST(N'2022-05-04T20:56:44.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (522, N'Trupril Tab 5mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 78.0000, CAST(N'2022-05-04T20:56:59.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (523, N'Trupril Tab 10mg 1x14''s 144... Pack Size:  144..', N'medicine.png', 0.0000, CAST(N'2022-05-04T20:57:20.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (524, N'Trupril Tab 5mg 1x14''s 144', N'medicine.png', 0.0000, CAST(N'2022-05-04T20:57:34.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (525, N'Capril Tab 50mg 10''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T20:57:59.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (526, N'Capril Tab 25mg 100''s', N'medicine.png', 46.0000, CAST(N'2022-05-04T20:58:25.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (527, N'Capril Tab 25mg 30''s', N'medicine.png', 186.0000, CAST(N'2022-05-04T20:58:42.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (528, N'Novatec Tab 10mg 30''s', N'medicine.png', 369.0000, CAST(N'2022-05-04T20:59:22.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (529, N'Novatec Tab 5mg 30''s', N'medicine.png', 255.0000, CAST(N'2022-05-04T20:59:42.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (530, N'Co-Renitec Tab 10mg/25mg 20''s', N'medicine.png', 324.0000, CAST(N'2022-05-04T21:00:13.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (531, N'Renitec Tab 20mg 20''s', N'medicine.png', 416.0000, CAST(N'2022-05-04T21:00:38.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (532, N'Renitec Tab 10mg 20''s', N'medicine.png', 282.0000, CAST(N'2022-05-04T21:00:56.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (533, N'Renitec Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 151.0000, CAST(N'2022-05-04T21:01:25.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (534, N'Lipra Tab 5mg 28''s Pack Size: 28''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T21:01:46.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (535, N'Lipra Tab 10mg 28''s Pack Size: 28''s', N'medicine.png', 580.0000, CAST(N'2022-05-04T21:02:13.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (536, N'Lipra Tab 2.5mg 28''s Pack Size: 28''s', N'medicine.png', 350.0000, CAST(N'2022-05-04T21:03:15.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (537, N'Lipra Tab 1.25mg 28''s Pack Size: 28''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T21:03:57.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (538, N'Amper Tab 10mg/8mg 10''s Pack Size: 10''s', N'medicine.png', 282.0000, CAST(N'2022-05-04T21:04:15.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (539, N'Amper Tab 5mg/8mg 10''s Pack Size: 10''s', N'medicine.png', 256.0000, CAST(N'2022-05-04T21:04:38.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (540, N'Lisna Tab 5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 81.0000, CAST(N'2022-05-04T21:04:53.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (541, N'Lisna Tab 20mg 2x10''s Pack Size: 20''s', N'medicine.png', 217.0000, CAST(N'2022-05-04T21:05:24.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (542, N'Cardace-H Tab 5mg/12.5mg 20''s Pack Size: 20''s', N'medicine.png', 61.0000, CAST(N'2022-05-04T21:05:45.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (543, N'Cardace Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 56.0000, CAST(N'2022-05-04T21:06:28.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (544, N'Cardace Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 88.0000, CAST(N'2022-05-04T21:06:48.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (545, N'Acetopril Tab 25mg 20''s Pack Size: 20''s', N'medicine.png', 97.0000, CAST(N'2022-05-04T21:07:14.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (546, N'Co-Cardiotec Tab 10mg/25mg 10''s', N'medicine.png', 67.0000, CAST(N'2022-05-04T21:07:30.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (547, N'Cardiotec Tab 5mg 1x20''s Pack Size: 1x20''s', N'medicine.png', 60.0000, CAST(N'2022-05-04T21:08:31.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (548, N'Cardiotec Tab 10mg 1x20''s', N'medicine.png', 158.0000, CAST(N'2022-05-04T21:08:46.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (549, N'Lispril Tab 20mg 14''s Pack Size: 14''s', N'medicine.png', 350.0000, CAST(N'2022-05-04T21:09:07.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (550, N'Lispril Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 170.0000, CAST(N'2022-05-04T21:09:23.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (551, N'Lispril Tab 5mg 14''s', N'medicine.png', 85.0000, CAST(N'2022-05-04T21:09:55.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (552, N'Hyperace Tab 5mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 290.0000, CAST(N'2022-05-04T21:10:09.897' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (553, N'Hyperace Tab 2.5mg 3x10''s', N'medicine.png', 195.0000, CAST(N'2022-05-04T21:11:49.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (554, N'Co-Zeal Tab 10mg/25mg 2x10''s', N'medicine.png', 115.0000, CAST(N'2022-05-04T21:12:15.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (555, N'Captil Tab 50mg 2x10''s', N'medicine.png', 290.0000, CAST(N'2022-05-04T21:12:50.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (556, N'Captil Tab 25mg 2x10''s Pack Size', N'medicine.png', 150.0000, CAST(N'2022-05-04T21:13:07.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (557, N'Captil Tab 25mg 2x10''s Pack Size', N'medicine.png', 150.0000, CAST(N'2022-05-04T21:13:11.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (558, N'Zopril Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 66.0000, CAST(N'2022-05-04T21:13:40.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (559, N'Zopril Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 55.0000, CAST(N'2022-05-04T21:14:03.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (560, N'Valopril Tab 50mg 20''s Pack Size', N'medicine.png', 222.0000, CAST(N'2022-05-04T21:14:33.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (561, N'Valopril Tab 25mg 20''s Pack Size', N'medicine.png', 113.0000, CAST(N'2022-05-04T21:14:54.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (562, N'Ziscar Tab 20mg 1x14''s Pack Size: 14''s', N'medicine.png', 211.0000, CAST(N'2022-05-04T21:15:20.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (563, N'Ziscar Tab 10mg 1x14''s Pack Size: 14''s', N'medicine.png', 143.0000, CAST(N'2022-05-04T21:15:35.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (564, N'Ziscar Tab 5mg 1x14''s Pack Size: 14''s', N'medicine.png', 78.0000, CAST(N'2022-05-04T21:16:01.953' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (565, N'Co-Ziscar Tab 20mg/12.5mg 2x14''s', N'medicine.png', 579.0000, CAST(N'2022-05-04T21:16:40.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (566, N'Co-Ziscar Tab 20mg/25mg 1x14''s', N'medicine.png', 290.0000, CAST(N'2022-05-04T21:17:16.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (567, N'Co-Ziscar Tab 10mg/12.5mg 1x14''s', N'medicine.png', 174.0000, CAST(N'2022-05-04T21:17:36.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (568, N'Coversyl Tab 8mg 10''s', N'medicine.png', 349.0000, CAST(N'2022-05-04T21:18:12.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (569, N'Coversyl Plus Tab 4mg/1.25mg 10''s', N'medicine.png', 364.0000, CAST(N'2022-05-04T21:18:34.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (570, N'Coversyl Tab 4mg 10''s Pack Size: 10''s', N'medicine.png', 290.0000, CAST(N'2022-05-04T21:19:05.177' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (571, N'Coversyl Tab 2mg 10''s Pack Size: 10''s', N'medicine.png', 183.0000, CAST(N'2022-05-04T21:19:32.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (572, N'Coversam Tab 8mg/5mg 10''s', N'medicine.png', 365.0000, CAST(N'2022-05-04T21:20:05.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (573, N'Coversam Tab 4mg/10mg 10''s', N'medicine.png', 265.0000, CAST(N'2022-05-04T21:20:19.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (574, N'Coversam Tab 4mg/5mg 10''s', N'medicine.png', 296.0000, CAST(N'2022-05-04T21:20:56.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (575, N'Co-Tritace Tab 5mg/25mg 2x14''s', N'medicine.png', 749.0000, CAST(N'2022-05-04T21:21:23.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (576, N'Tritace Tab 5mg 1x28''s Pack Size: 1x28''s', N'medicine.png', 701.0000, CAST(N'2022-05-04T21:22:03.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (577, N'Tritace Tab 2.5mg 1x28''s Pack Size: 1x28''s', N'medicine.png', 561.0000, CAST(N'2022-05-04T21:22:29.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (578, N'Tritace Tab 10mg 1x28''s Pack Size: 28...', N'medicine.png', 846.0000, CAST(N'2022-05-04T21:23:08.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (579, N'Veskor Tab 5mg 30''s Pack Size: 30''s', N'medicine.png', 95.0000, CAST(N'2022-05-04T21:23:29.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (580, N'Veskor Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 181.0000, CAST(N'2022-05-04T21:27:06.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (581, N'Hipril Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 28.0000, CAST(N'2022-05-04T21:27:26.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (582, N'Hipril Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 28.0000, CAST(N'2022-05-04T21:33:40.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (583, N'Hipril Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 38.0000, CAST(N'2022-05-04T21:34:03.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (584, N'Ramipace Tab 2.5mg 28''s Pack Size: 28''s', N'medicine.png', 421.0000, CAST(N'2022-05-04T21:34:22.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (585, N'Ramipace Tab 1.25mg 28''s Pack Size: 28''s', N'medicine.png', 267.0000, CAST(N'2022-05-04T21:34:44.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (586, N'Ramipace Tab 5mg 28''s Pack Size: 28''s', N'medicine.png', 560.0000, CAST(N'2022-05-04T21:35:03.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (587, N'Ramipace Tab 2.5mg 10''s Pack Size: 10''s', N'medicine.png', 690.0000, CAST(N'2022-05-04T21:35:25.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (588, N'Ramipace Tab 10mg 28''s Pack Size: 28...', N'medicine.png', 679.0000, CAST(N'2022-05-04T21:35:49.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (589, N'Lotide Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 62.0000, CAST(N'2022-05-04T21:36:17.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (590, N'Lotide Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 119.0000, CAST(N'2022-05-04T21:36:37.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (591, N'Accupril Tab 5mg 28''s Pack Size: 28''s', N'medicine.png', 246.0000, CAST(N'2022-05-04T21:37:02.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (592, N'Accupril Tab 20mg 28''s Pack Size: 28''s', N'medicine.png', 702.0000, CAST(N'2022-05-04T21:37:36.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (593, N'APTIL Tab 25mg 20''s', N'medicine.png', 99.0000, CAST(N'2022-05-04T21:38:38.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (594, N'Redopril 10 Tab 10mg 20''s', N'medicine.png', 66.0000, CAST(N'2022-05-04T21:39:22.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (595, N'Cortec Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 81.0000, CAST(N'2022-05-04T21:39:55.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (596, N'Cortec Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 160.0000, CAST(N'2022-05-04T21:40:19.497' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (597, N'Cortec Plus Tab 10mg/25mg 20''s', N'medicine.png', 141.0000, CAST(N'2022-05-04T21:40:40.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (598, N'Bpmed Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 57.0000, CAST(N'2022-05-04T21:40:57.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (599, N'Bpmed Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 114.0000, CAST(N'2022-05-04T21:41:27.447' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (600, N'Co-Amotac Tab 10mg/25mg 2x10''s', N'medicine.png', 99.0000, CAST(N'2022-05-04T21:41:55.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (601, N'Amotac Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 62.0000, CAST(N'2022-05-04T21:42:23.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (602, N'Adytum Tab 5mg 28''s Pack Size: 28''s', N'medicine.png', 265.0000, CAST(N'2022-05-04T21:42:52.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (603, N'Adytum Tab 2.5mg 28''s', N'medicine.png', 209.0000, CAST(N'2022-05-04T21:43:23.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (604, N'Adytum Tab 1.25mg 28''s', N'medicine.png', 148.0000, CAST(N'2022-05-04T21:43:48.533' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (605, N'Adytum Tab 1.25mg 28''s', N'medicine.png', 148.0000, CAST(N'2022-05-04T23:27:28.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (606, N'Adytum Tab 1.25mg 28''s', N'medicine.png', 148.0000, CAST(N'2022-05-04T23:27:28.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (607, N'Zestril Tab 20mg 14''s', N'medicine.png', 441.0000, CAST(N'2022-05-04T23:28:09.823' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (608, N'Zestril Tab 5mg 14''s', N'medicine.png', 141.0000, CAST(N'2022-05-04T23:28:29.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (609, N'Zestril Tab 10mg 14''s', N'medicine.png', 295.0000, CAST(N'2022-05-04T23:28:54.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (610, N'Zestoretic-20 Tab 20mg/12.5mg 28''s', N'medicine.png', 1054.0000, CAST(N'2022-05-04T23:29:13.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (611, N'Cardil Tab 5mg 20''s', N'medicine.png', 92.0000, CAST(N'2022-05-04T23:30:05.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (612, N'Cardil Tab 10mg 20''s', N'medicine.png', 213.0000, CAST(N'2022-05-04T23:30:23.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (613, N'Capoten Tab 25mg 10''s', N'medicine.png', 82.0000, CAST(N'2022-05-04T23:30:46.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (614, N'Capoten Tab 25mg 10''s', N'medicine.png', 82.0000, CAST(N'2022-05-04T23:30:49.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (615, N'Capoten Tab 50mg 20''s', N'medicine.png', 380.0000, CAST(N'2022-05-04T23:31:13.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (616, N'Capoten Tab 25mg 20''s', N'medicine.png', 194.0000, CAST(N'2022-05-04T23:31:45.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (617, N'Linopril-H 10mg/12.5mg Tab 14''s', N'medicine.png', 135.0000, CAST(N'2022-05-04T23:32:02.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (618, N'Linopril Tab 10mg 10''s', N'medicine.png', 82.0000, CAST(N'2022-05-04T23:32:32.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (619, N'Ramril Tab 5mg 14x2''s', N'medicine.png', 400.0000, CAST(N'2022-05-04T23:32:59.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (620, N'Ramril Tab 2.5mg 14x2''s', N'medicine.png', 350.0000, CAST(N'2022-05-04T23:33:35.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (621, N'Ramril Tab 1.25mg 14x2''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T23:33:56.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (622, N'Ramril Tab 1.25mg 14x2''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T23:33:58.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (623, N'Zepres Plus Tab 20''s', N'medicine.png', 180.0000, CAST(N'2022-05-04T23:34:24.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (624, N'Zepres Plus Tab 20''s', N'medicine.png', 180.0000, CAST(N'2022-05-04T23:34:28.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (625, N'Nobeten Tab 25mg 20''s', N'medicine.png', 85.0000, CAST(N'2022-05-04T23:34:59.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (626, N'Nobeten Tab 12.5mg 20''s', N'medicine.png', 57.0000, CAST(N'2022-05-04T23:35:24.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (627, N'Enpril Tab 5mg 2x10''s', N'medicine.png', 0.0000, CAST(N'2022-05-04T23:35:45.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (628, N'Enpril Tab 10mg 2x10''s', N'medicine.png', 87.0000, CAST(N'2022-05-04T23:36:20.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (629, N'Lace Tab 10mg 2x10''s', N'medicine.png', 150.0000, CAST(N'2022-05-04T23:36:46.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (630, N'Lace Tab 5mg 2x10''s', N'medicine.png', 75.0000, CAST(N'2022-05-04T23:37:12.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (631, N'Corace Tab 20mg 2x10''s', N'medicine.png', 242.0000, CAST(N'2022-05-04T23:37:26.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (632, N'Corace Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 120.0000, CAST(N'2022-05-04T23:37:55.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (633, N'Corace Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 200.0000, CAST(N'2022-05-04T23:38:09.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (634, N'Lamoretic Tab 20mg/12.5mg 2x14''s', N'medicine.png', 598.0000, CAST(N'2022-05-04T23:38:35.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (635, N'Lamoretic Tab 20mg/12.5mg 2x14''s', N'medicine.png', 598.0000, CAST(N'2022-05-04T23:38:38.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (636, N'Lame Tab 10mg 2x15''s', N'medicine.png', 370.0000, CAST(N'2022-05-04T23:39:00.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (637, N'Lame Tab 5mg 2x15''s', N'medicine.png', 176.0000, CAST(N'2022-05-04T23:39:29.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (638, N'Lame Tab 5mg 2x15''s', N'medicine.png', 380.0000, CAST(N'2022-05-05T00:17:13.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (639, N'Lame Tab 5mg 2x15''s', N'medicine.png', 380.0000, CAST(N'2022-05-05T00:17:14.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (640, N'Uritreat Cap 0.4mg 10''s Pack Size: 10''s', N'medicine.png', 355.0000, CAST(N'2022-05-05T00:17:50.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (641, N'Uriflow Cap 0.4mg 30''s Pack Size: 30''s', N'medicine.png', 1110.0000, CAST(N'2022-05-05T00:31:54.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (642, N'Contiflo Cap 0.4mg 10''s', N'medicine.png', 320.0000, CAST(N'2022-05-05T00:32:14.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (643, N'MAXFLOW-D Cap 20''s Pack Size: 20''s', N'medicine.png', 1437.0000, CAST(N'2022-05-05T00:32:57.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (644, N'Maxflow-D Cap 10''s', N'medicine.png', 719.0000, CAST(N'2022-05-05T00:33:21.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (645, N'Maxflow Cap 0.4mg 20''s', N'medicine.png', 840.0000, CAST(N'2022-05-05T00:33:58.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (646, N'Maxron Cap 0.4mg 2x5''s Pack Size: 10''s', N'medicine.png', 395.0000, CAST(N'2022-05-05T00:34:12.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (647, N'Easypas Cap 0.4mg 20''s Pack Size: 20''s', N'medicine.png', 1045.0000, CAST(N'2022-05-05T00:34:52.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (648, N'Easy Pas Cap 0.4mg 10''s Pack Size: 10''s', N'medicine.png', 550.0000, CAST(N'2022-05-05T00:35:24.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (649, N'Flowzak Cap 0.4mg 2x5''s Pack Size: 2x5''s', N'medicine.png', 390.0000, CAST(N'2022-05-05T00:35:56.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (650, N'Urivent Cap 0.4mg 1x10''s Pack Size: 10''s', N'medicine.png', 335.0000, CAST(N'2022-05-05T00:36:14.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (651, N'Alfamax Cap 0.4mg 20''s Pack Size: 20''s', N'medicine.png', 725.0000, CAST(N'2022-05-05T00:36:44.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (652, N'Sinzon Cap 0.4mg 10''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-05T00:37:04.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (653, N'Prostam Cap 0.4mg 10''s Pack Size: 10''s', N'medicine.png', 220.0000, CAST(N'2022-05-05T00:37:36.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (654, N'Tamsol Cap 0.4mg 20''s Pack Size: 20''s', N'medicine.png', 900.0000, CAST(N'2022-05-05T00:38:02.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (655, N'Tamsolin Caps 0.4mg 20''s Pack Size: 20''s', N'medicine.png', 900.0000, CAST(N'2022-05-05T00:38:41.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (656, N'Tamsolin Caps 0.4mg 20''s 117.', N'medicine.png', 0.0000, CAST(N'2022-05-05T00:39:11.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (657, N'Tamsolin Cap 0.4mg 10''s 123', N'medicine.png', 0.0000, CAST(N'2022-05-05T00:39:37.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (658, N'Flosure Cap 0.4mg 20''s Pack Size: 20''s', N'medicine.png', 760.0000, CAST(N'2022-05-05T00:39:59.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (659, N'Flosure Cap 0.4mg 20''s Pack Size: 20''s', N'medicine.png', 878.0000, CAST(N'2022-05-05T00:40:43.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (660, N'Beclo-Sal Inh 1''s Pack Size: 1''s', N'medicine.png', 262.0000, CAST(N'2022-05-05T00:41:08.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (661, N'Hivate Nasal Spray 50mcg 60Spray Pack Size: 50mcg', N'medicine.png', 250.0000, CAST(N'2022-05-05T00:41:30.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (662, N'Hivate Nasal Spray 50mcg 120Spray Pack Size: 1''s', N'medicine.png', 409.0000, CAST(N'2022-05-05T00:41:59.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (663, N'Bekson Forte HFA Inh 250mcg...', N'medicine.png', 485.0000, CAST(N'2022-05-05T00:42:34.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (664, N'Bekson HFA Inh 50mcg 1''s... Pack Size: 300', N'medicine.png', 58140.0000, CAST(N'2022-05-05T00:43:13.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (665, N'Bekson Forte HFA Inh 250mcg... Pack Size: 300', N'medicine.png', 96416.0000, CAST(N'2022-05-05T00:43:45.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (666, N'Diclair-ST Inj 1.5MIU 1Vial Pack Size: 1Vial', N'medicine.png', 6375.0000, CAST(N'2022-05-05T00:44:58.097' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (667, N'Ozac Inj 40Mg 1Vial Pack Size: 50''s', N'medicine.png', 290.0000, CAST(N'2022-05-05T00:45:12.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (668, N'Ozac Inj 80Mg 1Vial Pack Size: 1vial', N'medicine.png', 643.0000, CAST(N'2022-05-05T00:45:43.497' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (669, N'Ozac Inj 80Mg 1Vial Pack Size: 1vial', N'medicine.png', 643.0000, CAST(N'2022-05-05T00:45:43.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (670, N'Ozac Inj 20Mg 1Vial Pack Size: 30''s', N'medicine.png', 175.0000, CAST(N'2022-05-05T00:46:14.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (671, N'Ozac Inj 20Mg 1Vial Pack Size: 30''s', N'medicine.png', 175.0000, CAST(N'2022-05-05T00:46:17.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (672, N'Akinase Inj 1.5MIU 1Amp Pack Size: 1', N'medicine.png', 4416.0000, CAST(N'2022-05-05T00:46:38.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (673, N'Akinase Inj 1.5MIU 1Amp Pack Size: 1', N'medicine.png', 4416.0000, CAST(N'2022-05-05T00:46:43.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (674, N'Atcoplex-Z Kidz Syrup 120ml', N'medicine.png', 176.0000, CAST(N'2022-05-05T00:47:27.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (675, N'Zofen Syp 60ml Pack Size: 60ml', N'medicine.png', 43.0000, CAST(N'2022-05-05T00:47:54.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (676, N'B-Form Rota caps 200 6mcg 3x10''s Pack Size: 3x10''s', N'medicine.png', 330.0000, CAST(N'2022-05-05T00:48:18.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (677, N'Asthotifen Tab 1mg 30''s Pack Size: 30''s', N'medicine.png', 73.0000, CAST(N'2022-05-05T00:48:39.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (678, N'Asthotifen Syp 1mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 64.0000, CAST(N'2022-05-05T00:49:12.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (679, N'Asfen Tab 1mg 3x10''s Pack Size: 30''s', N'medicine.png', 66.0000, CAST(N'2022-05-05T00:49:37.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (680, N'Asfen Syp 0.2mg/ml 60ml Pack Size: 60ml', N'medicine.png', 46.0000, CAST(N'2022-05-05T00:50:08.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (681, N'Asfen Syp 0.2mg/ml 60ml Pack Size: 60ml', N'medicine.png', 46.0000, CAST(N'2022-05-05T00:50:13.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (682, N'Asfen Syp 0.2mg/ml 60ml Pack Size: 60ml', N'medicine.png', 188.0000, CAST(N'2022-05-05T00:50:42.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (683, N'Easair Dry Susp 20mcg/ml 60ml Pack Size: 60ml', N'medicine.png', 230.0000, CAST(N'2022-05-05T00:51:08.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (684, N'Proasma Tab 1mg 3x10''s Pack Size: 30''s', N'medicine.png', 103.0000, CAST(N'2022-05-05T00:51:37.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (685, N'Proasma Syp 1mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 73.0000, CAST(N'2022-05-05T00:52:09.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (686, N'Zatofen Tab 1mg 30''s Pack Size: 30''s', N'medicine.png', 300.0000, CAST(N'2022-05-05T00:52:37.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (687, N'Zatofen Syp 1mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 107.0000, CAST(N'2022-05-05T00:53:11.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (688, N'Asthacure Tab 1Mg Pack Size: 30''s', N'medicine.png', 67.0000, CAST(N'2022-05-05T00:53:28.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (689, N'Asthacure Syp 1Mg/5Ml 60Ml Pack Size: 60ml', N'medicine.png', 41.0000, CAST(N'2022-05-05T00:54:01.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (690, N'Asthacure Syp 1Mg/5Ml 60Ml Pack Size: 60ml', N'medicine.png', 41.0000, CAST(N'2022-05-05T00:54:07.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (691, N'Asmofen Syp 1mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 62.0000, CAST(N'2022-05-05T00:54:44.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (692, N'Mactifen Cap 1.38mg 20''s Pack Size: 20''s', N'medicine.png', 86.0000, CAST(N'2022-05-05T00:55:16.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (693, N'Mactifen Syp 1.38mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 0.0000, CAST(N'2022-05-05T00:55:56.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (694, N'Combivair 400 Rotacap Cap 30''s Pack Size: 30''s', N'medicine.png', 425.0000, CAST(N'2022-05-05T00:56:24.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (695, N'Aria Tab 1mg 30''s Pack Size: 30''s', N'medicine.png', 135.0000, CAST(N'2022-05-05T00:56:44.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (696, N'Combivair 200 Rotacap Cap 30''s Pack Size: 30''s', N'medicine.png', 372.0000, CAST(N'2022-05-05T00:57:18.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (697, N'Fortide MDI Hfa Inh 6mcg/200mcg', N'medicine.png', 722.0000, CAST(N'2022-05-05T00:57:40.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (698, N'Aldomet Tab 250mg 10''s Pack Size: 10''s', N'medicine.png', 89.0000, CAST(N'2022-05-05T00:59:13.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (699, N'Aldomet Tab 250mg 10x10''s Pack Size: 10x10''s', N'medicine.png', 884.0000, CAST(N'2022-05-05T00:59:57.857' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (700, N'Hydralazine Hcl Inj 20mg 1Amp Pack Size: 1Amp', N'medicine.png', 35.0000, CAST(N'2022-05-05T01:00:30.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (701, N'Hydralazine HCL Tab 25mg 20''s Pack Size: 20''s', N'medicine.png', 69.0000, CAST(N'2022-05-05T01:00:59.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (702, N'Uri-Dox Tab 4mg 2x10''s Pack Size: 20''s', N'medicine.png', 350.0000, CAST(N'2022-05-05T01:01:44.703' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (703, N'Uri-Dox Tab 1mg 10''s Pack Size: 10''s', N'medicine.png', 75.0000, CAST(N'2022-05-05T01:02:02.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (704, N'Xatral SR Tab 5mg 2x14''s Pack Size: 28', N'medicine.png', 1073.0000, CAST(N'2022-05-05T01:02:31.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (705, N'Xatral LP Tab 10mg 3x10''s Pack Size: 30', N'medicine.png', 1576.0000, CAST(N'2022-05-05T01:02:49.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (706, N'Cardura Tab 4mg 20''s Pack Size: 20''s', N'medicine.png', 1092.0000, CAST(N'2022-05-05T01:03:19.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (707, N'Cardura Tab 2mg 20''s Pack Size: 20''s', N'medicine.png', 504.0000, CAST(N'2022-05-05T01:04:06.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (708, N'Bosmon Tab 125mg 14''s Pack Size: 14''s', N'medicine.png', 1890.0000, CAST(N'2022-05-05T01:04:41.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (709, N'Bosmon Tab 62.5mg 14''s Pack Size: 14''s', N'medicine.png', 1120.0000, CAST(N'2022-05-05T01:05:06.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (710, N'Hyzosin Tab 1mg 10''s Pack Size: 10''s', N'medicine.png', 60.0000, CAST(N'2022-05-05T01:05:38.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (711, N'Hyzosin Tab 5mg 3x10''s Pack Size: 30''s', N'medicine.png', 468.0000, CAST(N'2022-05-05T01:06:35.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (712, N'Hytrin Tab 5mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 1657.0000, CAST(N'2022-05-05T01:07:46.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (713, N'Hytrin Tab 1mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 346.0000, CAST(N'2022-05-05T01:08:06.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (714, N'Maxna Cap 500mg 10''s Pack Size: 10''s', N'medicine.png', 177.0000, CAST(N'2022-05-05T01:26:31.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (715, N'Koate-Dvi Antihemophilic Factor (Human) Inj', N'medicine.png', 11106.0000, CAST(N'2022-05-05T01:27:22.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (716, N'Vasamin Inj 500mg 10Vialx5ml', N'medicine.png', 850.0000, CAST(N'2022-05-05T01:28:00.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (717, N'Vasamin Inj 250mg 10Vialx5ml', N'medicine.png', 458.0000, CAST(N'2022-05-05T01:29:02.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (718, N'Vasamin Cap 500mg 2x10''s Pack Size: 1vial', N'medicine.png', 250.0000, CAST(N'2022-05-05T01:29:35.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (719, N'Vasamin Cap 250mg 10x10''s Pack Size: 200''s', N'medicine.png', 650.0000, CAST(N'2022-05-05T01:30:20.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (720, N'Zatranex Inj 250mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 427.0000, CAST(N'2022-05-05T01:30:36.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (721, N'Zatranex Inj 250mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 427.0000, CAST(N'2022-05-05T01:30:36.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (722, N'Zatranex Inj 250mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 427.0000, CAST(N'2022-05-05T01:30:40.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (723, N'Zatranex Inj 250mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 427.0000, CAST(N'2022-05-05T01:30:45.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (724, N'Zatranex Cap 250mg 30''s Pack Size: 30''s', N'medicine.png', 285.0000, CAST(N'2022-05-05T01:31:20.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (725, N'Flexitran Inj 500mg 10Ampx5ml Pack Size: 10Ampx5ml', N'medicine.png', 835.0000, CAST(N'2022-05-05T01:31:38.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (726, N'Flexitran Inj 250mg 10Ampx5ml Pack Size: 10Ampx5ml', N'medicine.png', 655.0000, CAST(N'2022-05-05T01:32:14.850' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (727, N'K-Shot Oral Drops 2mg/3ml 1''s Pack Size: 1''s', N'medicine.png', 200.0000, CAST(N'2022-05-05T01:32:49.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (728, N'Vanaxamic Cap 250mg 10x10''s Pack Size: 100''s', N'medicine.png', 650.0000, CAST(N'2022-05-05T01:33:00.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (729, N'Vanaxamic Cap 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 250.0000, CAST(N'2022-05-05T01:33:39.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (730, N'Utramax IM/IV Inj 500mg 10Vial Pack Size: 10', N'medicine.png', 350.0000, CAST(N'2022-05-05T01:34:26.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (731, N'Utramax IM/IV Inj 250mg 10Vial Pack Size: 10', N'medicine.png', 200.0000, CAST(N'2022-05-05T01:35:00.217' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (732, N'Brino Cap 500mg 20''s Pack Size: 20''s', N'medicine.png', 354.0000, CAST(N'2022-05-05T01:36:10.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (733, N'Brino Cap 250mg 20''s Pack Size: 20''s', N'medicine.png', 185.0000, CAST(N'2022-05-05T01:36:42.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (734, N'Brino Inj 250mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 535.0000, CAST(N'2022-05-05T01:37:25.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (735, N'Brino Inj 500mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 950.0000, CAST(N'2022-05-05T01:37:51.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (736, N'Transadix Cap 250mg 100''s Pack Size: 30''s', N'medicine.png', 650.0000, CAST(N'2022-05-05T01:38:45.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (737, N'Transadix Cap 250mg 20''s Pack Size: 20''s', N'medicine.png', 125.0000, CAST(N'2022-05-05T01:39:29.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (738, N'Transadix Cap 500mg 20''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-05T01:40:01.180' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (739, N'Ranmic Inj 250mg 10Ampx5ml Pack Size: 10...', N'medicine.png', 143.0000, CAST(N'2022-05-05T01:40:50.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (740, N'Ranmic Cap 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 133.0000, CAST(N'2022-05-05T01:41:18.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (741, N'Ranmic Cap 250mg 100''s Pack Size: 100''s', N'medicine.png', 333.0000, CAST(N'2022-05-05T01:43:32.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (742, N'Xed Inj 500mg 10Ampx5ml Pack Size: 10', N'medicine.png', 652.0000, CAST(N'2022-05-05T01:44:23.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (743, N'Xed Inj 250mg 10Ampx5ml Pack Size: 10ampx5ml', N'medicine.png', 358.0000, CAST(N'2022-05-05T01:45:00.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (744, N'Xed Cap 500mg 5x6''s Pack Size: 5x6''s', N'medicine.png', 594.0000, CAST(N'2022-05-05T01:45:32.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (745, N'Xed Cap 250mg 5x6''s Pack Size: 5x6''s', N'medicine.png', 244986.0000, CAST(N'2022-05-05T01:46:16.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (746, N'Hixamic Inj 500mg 10Ampx5ml Pack Size: 10', N'medicine.png', 621.0000, CAST(N'2022-05-05T01:46:37.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (747, N'Hixamic Cap 500mg 20''s Pack Size: 20''s', N'medicine.png', 267.0000, CAST(N'2022-05-05T01:47:40.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (748, N'Hixamic Inj 250Mg Pack Size: 10.', N'medicine.png', 320.0000, CAST(N'2022-05-05T01:48:18.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (749, N'Hixamic Cap 250Mg Pack Size: 20''s', N'medicine.png', 140.0000, CAST(N'2022-05-05T01:48:42.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (750, N'Transamin S Inj 1000mg 10Ampx5ml Pack Size', N'medicine.png', 1547.0000, CAST(N'2022-05-05T01:49:38.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (751, N'Transamin Inj 500mg 10Ampx5ml Pack Size: 10ampx5ml', N'medicine.png', 1170.0000, CAST(N'2022-05-05T01:50:19.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (752, N'Transamin Inj 250mg 10Ampx5ml Pack Size: 10.', N'medicine.png', 561.0000, CAST(N'2022-05-05T01:50:36.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (753, N'Transamin Cap 500mg 20''s Pack Size: 20''s', N'medicine.png', 447.0000, CAST(N'2022-05-05T01:51:02.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (754, N'Transamin Cap 500mg 20''s Pack Size: 20''s', N'medicine.png', 467.0000, CAST(N'2022-05-05T01:52:20.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (755, N'Transamin Cap 250mg 100''s Pack Size: 100''s', N'medicine.png', 1055.0000, CAST(N'2022-05-05T01:52:54.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (756, N'Transolide Inj 500mg 2x5''s Pack Size: 10''s', N'medicine.png', 456.0000, CAST(N'2022-05-05T01:54:02.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (757, N'Transolide Inj 250mg 5Ampx2ml Pack Size: 5', N'medicine.png', 238.0000, CAST(N'2022-05-05T01:54:28.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (758, N'Transolide Cap 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 213.0000, CAST(N'2022-05-05T01:55:02.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (759, N'Transolide Cap 250mg 3x10''s Pack Size: 30''s', N'medicine.png', 186.0000, CAST(N'2022-05-05T01:55:45.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (760, N'Dravix Inj 500mg 10Vials 90... Pack Size: 10Vials', N'medicine.png', 61774.0000, CAST(N'2022-05-05T01:56:31.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (761, N'Dravix Inj 500mg 10Vials 90... Pack Size: 10Vials', N'medicine.png', 61774.0000, CAST(N'2022-05-05T01:57:40.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (762, N'Dravix Inj 250mg 10Vials 90... Pack Size: 90', N'medicine.png', 33286.0000, CAST(N'2022-05-05T01:58:20.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (763, N'Dravix Cap 500mg 20''s 48... Pack Size: 48', N'medicine.png', 9690.0000, CAST(N'2022-05-05T01:59:12.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (764, N'Dravix Cap 250mg 100''s 16... Pack Size: 16', N'medicine.png', 8398.0000, CAST(N'2022-05-05T01:59:47.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (765, N'Enxamin Inj 500mg 10Ampx5ml Pack Size: 10Ampx5ml', N'medicine.png', 583.0000, CAST(N'2022-05-05T02:00:38.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (766, N'Enxamin Inj 250mg 10Ampx5ml Pack Size: 10Ampx5ml', N'medicine.png', 300.0000, CAST(N'2022-05-05T02:01:00.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (767, N'Enxamin Cap 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 250.0000, CAST(N'2022-05-05T02:02:05.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (768, N'Enxamin Cap 250mg 10x10''s Pack Size: 100''s', N'medicine.png', 650.0000, CAST(N'2022-05-05T02:02:27.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (769, N'Transcam Ds Inj 500Mg Pack Size: 10', N'medicine.png', 475.0000, CAST(N'2022-05-05T02:02:50.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (770, N'Transcam Ds Cap 500Mg Pack Size: 20''s', N'medicine.png', 238.0000, CAST(N'2022-05-05T02:03:06.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (771, N'Transcam Inj 250Mg Pack Size: 10..', N'medicine.png', 285.0000, CAST(N'2022-05-05T02:03:40.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (772, N'Transcam Cap 250Mg Pack Size: 10''s', N'medicine.png', 62.0000, CAST(N'2022-05-05T02:04:21.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (773, N'Btrol Inj 500mg 5Ampx5ml Pack Size: 5Ampx5ml', N'medicine.png', 437.0000, CAST(N'2022-05-05T02:05:27.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (774, N'Btrol Inj 250mg 5Ampx5ml Pack Size: 5Ampx5ml', N'medicine.png', 226.0000, CAST(N'2022-05-05T02:06:01.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (775, N'Btrol Cap 500mg 10''s Pack Size: 10''s', N'medicine.png', 176.0000, CAST(N'2022-05-05T02:06:34.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (776, N'Btrol Cap 250mg 10''s Pack Size: 10''s', N'medicine.png', 82.0000, CAST(N'2022-05-05T02:07:06.603' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (777, N'Maxna IM/IV Inj 500mg 10Ampx5ml Pack Size: 10''s', N'medicine.png', 1170.0000, CAST(N'2022-05-05T02:07:48.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (778, N'Maxna Cap 250mg 2x10''s Pack Size: 20''s', N'medicine.png', 135.0000, CAST(N'2022-05-05T02:08:03.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (779, N'Maxna Cap 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 354.0000, CAST(N'2022-05-05T02:08:49.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (780, N'Silliver Tab 200mg 30''s Pack Size: 30''s', N'medicine.png', 306.0000, CAST(N'2022-05-05T02:21:52.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (781, N'Epuram Tab 40''s Pack Size: 40...', N'medicine.png', 350.0000, CAST(N'2022-05-05T02:22:11.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (782, N'Silliver Susp 100mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 237.0000, CAST(N'2022-05-05T02:22:45.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (783, N'Hep-52 Syp 120ml Pack Size: 120ml', N'medicine.png', 300.0000, CAST(N'2022-05-05T02:23:00.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (784, N'Jetepar Inj 5Ampx10ml Pack Size: 10ml', N'medicine.png', 255.0000, CAST(N'2022-05-05T02:23:31.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (785, N'Aminoleban Oral Powder Granules 450g Pack Size: 1', N'medicine.png', 4537.0000, CAST(N'2022-05-05T02:24:23.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (786, N'Jetepar Syrup 112ml Pack Size: 112ml', N'medicine.png', 250.0000, CAST(N'2022-05-05T02:24:36.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (787, N'Urso Cap 250mg 10''s Pack Size: 10''s', N'medicine.png', 436.0000, CAST(N'2022-05-05T02:24:52.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (788, N'Silimarin Tab 200mg 2x10''s Pack Size: 20''s', N'medicine.png', 232.0000, CAST(N'2022-05-05T02:25:17.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (789, N'Epuram Inj 5Ampx2ml Pack Size: 5', N'medicine.png', 194.0000, CAST(N'2022-05-05T02:25:44.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (790, N'Epuram Syp 120ml Pack Size: 120ml', N'medicine.png', 214.0000, CAST(N'2022-05-05T02:26:03.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (791, N'Levijon Syp 120ml Pack Size: 120ml', N'medicine.png', 207.0000, CAST(N'2022-05-05T02:26:21.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (792, N'Triptor Cap 250mg 10''s Pack Size: 10''s', N'medicine.png', 246.0000, CAST(N'2022-05-05T02:27:17.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (793, N'Triptor Cap 500mg 10''s Pack Size: 10''s', N'medicine.png', 405.0000, CAST(N'2022-05-05T02:27:32.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (794, N'Urso Susp 120ml Pack Size: 120ml', N'medicine.png', 1036.0000, CAST(N'2022-05-05T02:27:55.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (795, N'Urso Susp 60ml Pack Size: 60ml', N'medicine.png', 375.0000, CAST(N'2022-05-05T02:28:12.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (796, N'Silimarin Susp 100mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 59.0000, CAST(N'2022-05-05T02:28:40.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (797, N'INF-A 3MIU Inj 11.1mcg 1Vial Pack Size: 1.', N'medicine.png', 427.0000, CAST(N'2022-05-05T02:29:08.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (798, N'Peg-INF Inj 180mcg 1Vial Pack Size: 1vial', N'medicine.png', 4341.0000, CAST(N'2022-05-05T02:29:29.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (799, N'Peg-INF Inj 180mcg Pack of... Pack Size: 41vial', N'medicine.png', 15600.0000, CAST(N'2022-05-05T02:29:43.360' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (800, N'Hepa-Merz Granules Powder Sachet 5''s Pack Size: 5''s', N'medicine.png', 495.0000, CAST(N'2022-05-05T02:30:01.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (801, N'Hepa-Merz Inf 5gm 1Ampx10ml Pack Size: 1Ampx10ml.', N'medicine.png', 307.0000, CAST(N'2022-05-05T02:30:21.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (802, N'Hepa-Merz Syp 300mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 228.0000, CAST(N'2022-05-05T02:30:47.307' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (803, N'Heptocam Cap 3x10''s Pack Size: 3x10''s', N'medicine.png', 274.0000, CAST(N'2022-05-05T02:31:04.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (804, N'Heptocam Susp 60ml Pack Size: 60ml', N'medicine.png', 67925.0000, CAST(N'2022-05-05T02:31:58.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (805, N'Ornivit Syp 60ml Pack Size: 60ml', N'medicine.png', 74.0000, CAST(N'2022-05-05T02:32:12.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (806, N'Package of Sofiget Tab 400mg... Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-05T02:32:46.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (807, N'Cure-C Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 4987.0000, CAST(N'2022-05-05T02:33:01.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (808, N'G-Care Syp 120ml Pack Size: 120ml.', N'medicine.png', 120.0000, CAST(N'2022-05-05T02:33:20.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (809, N'Heptacare Syp 120ml Pack Size: 120ml..', N'medicine.png', 120.0000, CAST(N'2022-05-05T02:33:30.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (810, N'Hepatovit Tab 30''s Pack Size: 30''s', N'medicine.png', 642.0000, CAST(N'2022-05-05T02:33:47.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (811, N'Lvofix-15 SS Tab 60''s Pack Size: 60''s', N'medicine.png', 445.0000, CAST(N'2022-05-05T02:34:02.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (812, N'Lvofix-15 DS Tab 60''s Pack Size: 60''s', N'medicine.png', 536.0000, CAST(N'2022-05-05T02:34:18.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (813, N'Lvofix-15 Syp 120ml Pack Size: 120ml', N'medicine.png', 313.0000, CAST(N'2022-05-05T02:34:32.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (814, N'Hep-52 DS Tab 60''s Pack Size: 60''s', N'medicine.png', 300.0000, CAST(N'2022-05-05T02:34:45.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (815, N'Hepamed Inj 500mg 1Vialx5ml Pack Size: 1x5ml', N'medicine.png', 33.0000, CAST(N'2022-05-05T02:34:57.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (816, N'Sarim Syp 105mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 85.0000, CAST(N'2022-05-05T02:35:13.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (817, N'Sarim Syp 105mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 57.0000, CAST(N'2022-05-05T02:35:59.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (818, N'Aminoleban Without Set Inf 500ml Pack Size: 500ml', N'medicine.png', 788.0000, CAST(N'2022-05-05T02:36:21.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (819, N'Aminocid Syp 120ml Pack Size: 120ml', N'medicine.png', 85.0000, CAST(N'2022-05-05T02:36:36.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (820, N'Levijon Inj 1Ampx5ml Pack Size: 1''s', N'medicine.png', 68.0000, CAST(N'2022-05-05T02:36:53.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (821, N'Levijon Inf 1Ampx10ml Pack Size: 1''s', N'medicine.png', 257.0000, CAST(N'2022-05-05T02:37:10.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (822, N'Ocvir Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5000.0000, CAST(N'2022-05-05T02:37:28.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (823, N'Hepa-Zaf Cap 36''s Pack Size: 36''s', N'medicine.png', 231.0000, CAST(N'2022-05-05T02:37:41.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (824, N'Milk Thistle Liver Formula Sotfgel', N'medicine.png', 570.0000, CAST(N'2022-05-05T02:38:01.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (825, N'Tenovir Tab 300mg 30''s Pack Size: 30''s', N'medicine.png', 3450.0000, CAST(N'2022-05-05T02:38:16.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (826, N'Liveright Syp 120ml Pack Size: 120ml', N'medicine.png', 177.0000, CAST(N'2022-05-05T02:38:51.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (827, N'Ceron-Alpha Inj 5MIU 1Vial Pack Size: 10''s', N'medicine.png', 1080.0000, CAST(N'2022-05-05T02:39:06.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (828, N'Ceron-Alpha Inj 3MIU 1Vial Pack Size: 10''s', N'medicine.png', 646.0000, CAST(N'2022-05-05T02:39:30.533' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (829, N'Hepsrin Cap 150mg 30mg 8.2mg 2x10''s', N'medicine.png', 65.0000, CAST(N'2022-05-05T02:39:53.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (830, N'Package of Sofohil 400mg Tab... Pack Size: 28''s', N'medicine.png', 3400.0000, CAST(N'2022-05-05T02:41:32.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (831, N'Package of Sofohil Tab 400mg... Pack Size: 28''s', N'medicine.png', 2800.0000, CAST(N'2022-05-05T02:41:57.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (832, N'Ocvir-V Tab 400mg/100mg 28''s Pack Size: 28''s', N'medicine.png', 8000.0000, CAST(N'2022-05-05T02:42:13.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (833, N'Fosbu Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5951.0000, CAST(N'2022-05-05T02:42:35.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (834, N'Package of Fosbu Tab 400mg... Pack Size: 28''s', N'medicine.png', 3500.0000, CAST(N'2022-05-05T02:42:51.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (835, N'Package of Sofiget Tab 400mg... Pack Size: 28''s', N'medicine.png', 2300.0000, CAST(N'2022-05-05T02:43:08.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (836, N'Daclaget Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 1500.0000, CAST(N'2022-05-05T02:43:34.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (837, N'Velpaget Tab 400mg/100mg 28''s Pack Size:', N'medicine.png', 9500.0000, CAST(N'2022-05-05T02:43:54.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (838, N'Sofohil Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 2800.0000, CAST(N'2022-05-05T02:44:10.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (839, N'Viktana Tab 400mg/100mg 28''s Pack Size: 28.', N'medicine.png', 10000.0000, CAST(N'2022-05-05T02:44:35.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (840, N'Package of Sofiget Tab 400mg... Pack Size: 28''s', N'medicine.png', 2300.0000, CAST(N'2022-05-05T02:45:01.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (841, N'Hilvel Tab 400mg/100mg 28''s Pack Size: 28''s', N'medicine.png', 8500.0000, CAST(N'2022-05-05T02:45:15.023' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (842, N'Package of Savera Tab 400mg... Pack Size: 28''s', N'medicine.png', 3500.0000, CAST(N'2022-05-05T02:45:58.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (843, N'Package of Sofiget Tab 400mg... Pack Size: 28''s', N'medicine.png', 2300.0000, CAST(N'2022-05-05T02:46:15.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (844, N'Sofiget Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 6000.0000, CAST(N'2022-05-05T02:46:36.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (845, N'Package of Sofiget 400mg Tab... Pack Size: 28''s', N'medicine.png', 3700.0000, CAST(N'2022-05-05T02:46:51.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (846, N'Clavir Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:47:04.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (847, N'Package of Myhep 400mg Tab... Pack Size: 28''s', N'medicine.png', 5900.0000, CAST(N'2022-05-05T02:47:17.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (848, N'Myhep all Tab 400mg/100mg 28''s Pack Size: 28''s', N'medicine.png', 10000.0000, CAST(N'2022-05-05T02:47:34.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (849, N'Package of Myhep all Tab... Pack Size: 28''s 10''s', N'medicine.png', 10000.0000, CAST(N'2022-05-05T02:47:49.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (850, N'Hepgard Tab 400mg 28''s Pack Size: 28s', N'medicine.png', 5868.0000, CAST(N'2022-05-05T02:48:04.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (851, N'Savera Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5868.0000, CAST(N'2022-05-05T02:48:22.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (852, N'Daklana Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:48:41.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (853, N'Package of Hilvel Tab 400mg/100mg... Pack Size: 28''s', N'medicine.png', 8500.0000, CAST(N'2022-05-05T02:48:56.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (854, N'Package of Sofiget Tab 400mg... Pack Size: 50.', N'medicine.png', 414105.0000, CAST(N'2022-05-05T02:49:27.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (855, N'Package of Sofiget Tab 400mg... Pack Size: 50.', N'medicine.png', 375630.0000, CAST(N'2022-05-05T02:49:59.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (856, N'Package of Sofiget Tab 400mg... Pack Size: 50', N'medicine.png', 395580.0000, CAST(N'2022-05-05T02:50:17.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (857, N'Package of Sofiget Tab 400mg', N'medicine.png', 424080.0000, CAST(N'2022-05-05T02:50:43.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (858, N'Daclavia Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 9500.0000, CAST(N'2022-05-05T02:50:58.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (859, N'Sofiget Tab 400mg 28''s 70... Pack Size: 70.', N'medicine.png', 395741.0000, CAST(N'2022-05-05T02:51:19.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (860, N'Package of Sofiget 400mg Tab... Pack Size: 28''s', N'medicine.png', 3700.0000, CAST(N'2022-05-05T02:51:42.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (861, N'Package of Sofiget 400mg Tab... Pack Size: 28''s', N'medicine.png', 3700.0000, CAST(N'2022-05-05T02:51:56.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (862, N'Package of Cure-C Tab 400mg.', N'medicine.png', 4988.0000, CAST(N'2022-05-05T02:52:12.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (863, N'Daclata Tab 60mg 28''s Pack Size: Tablets', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:52:36.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (864, N'Package of Sofohil Tab 400mg... Pack Size: 28''s', N'medicine.png', 5000.0000, CAST(N'2022-05-05T02:52:55.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (865, N'Viirso Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5868.0000, CAST(N'2022-05-05T02:53:15.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (866, N'Package of Zoval 400mg Tab... Pack Size: 28''s', N'medicine.png', 3000.0000, CAST(N'2022-05-05T02:53:36.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (867, N'Dakvir Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:53:51.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (868, N'Dakvir Tab 30mg 28''s Pack Size: 28’s', N'medicine.png', 2782.0000, CAST(N'2022-05-05T02:54:04.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (869, N'Sovelpa Tab 400mg/100mg 28''s Pack Size: 28''s', N'medicine.png', 10000.0000, CAST(N'2022-05-05T02:54:21.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (870, N'Devazo Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 2000.0000, CAST(N'2022-05-05T02:54:35.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (871, N'Package of Ocvir 400mg Tab... Pack Size: 28''s', N'medicine.png', 5000.0000, CAST(N'2022-05-05T02:54:47.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (872, N'Dascot Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:55:04.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (873, N'Hepaldi Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 2941.0000, CAST(N'2022-05-05T02:55:24.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (874, N'Nisita Tab 60mg 28''s Pack Size', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:55:36.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (875, N'Vibrenta Tab 400mg 2x14''s Pack Size', N'medicine.png', 5868.0000, CAST(N'2022-05-05T02:55:52.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (876, N'Vibrenta VPT Tab 400/100mg 28''s Pack Size', N'medicine.png', 10000.0000, CAST(N'2022-05-05T02:56:07.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (877, N'Abriva Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5868.0000, CAST(N'2022-05-05T02:56:18.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (878, N'Dacriva Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:56:53.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (879, N'Abriva Plus Tab 28''s Pack Size: 28''s', N'medicine.png', 12344.0000, CAST(N'2022-05-05T02:57:08.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (880, N'Sofos Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5951.0000, CAST(N'2022-05-05T02:57:33.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (881, N'Sofos Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5951.0000, CAST(N'2022-05-05T02:57:33.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (882, N'Package of Sofos Tab 400mg... Pack Size: 28''s', N'medicine.png', 6468.0000, CAST(N'2022-05-05T02:57:54.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (883, N'Mydekla Tab 60mg 28''s Pack Size: 28''s', N'medicine.png', 4552.0000, CAST(N'2022-05-05T02:58:14.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (884, N'Myhep Tab 400mg 28''s Pack Size: 28''s', N'medicine.png', 5868.0000, CAST(N'2022-05-05T02:58:34.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (885, N'Detrusitol Tab 2mg 28''s Pack Size: 28''s', N'medicine.png', 1514.0000, CAST(N'2022-05-05T03:12:43.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (886, N'Neosev Tab 400mg 30''s Pack Size: 30''s', N'medicine.png', 1120.0000, CAST(N'2022-05-05T03:13:03.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (887, N'Keto Alfa Tab 10x10''s Pack Size: 10x10''s', N'medicine.png', 2962.0000, CAST(N'2022-05-05T03:13:19.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (888, N'Ketocell Tab 100''s Pack Size: 100''s', N'medicine.png', 3135.0000, CAST(N'2022-05-05T03:13:43.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (889, N'Salver Tab 400mg 30''s Pack Size: 30''s', N'medicine.png', 1355.0000, CAST(N'2022-05-05T03:13:59.850' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (890, N'Renavel Tab 800mg 30''s Pack Size: 30''s', N'medicine.png', 2379.0000, CAST(N'2022-05-05T03:14:11.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (891, N'Solifen Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 475.0000, CAST(N'2022-05-05T03:14:39.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (892, N'Mibega Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 930.0000, CAST(N'2022-05-05T03:14:53.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (893, N'Genurin Semplice Forte Tab 200mg... Pack Size: 30''s', N'medicine.png', 645.0000, CAST(N'2022-05-05T03:15:06.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (894, N'Solfy Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 510.0000, CAST(N'2022-05-05T03:15:20.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (895, N'Renvela Tab 800mg 30''s Pack Size: 30''s', N'medicine.png', 2379.0000, CAST(N'2022-05-05T03:15:33.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (896, N'Tolodin Tab 2mg 28''s Pack Size: 28''s', N'medicine.png', 550.0000, CAST(N'2022-05-05T03:15:46.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (897, N'Lospin Tab 10Mg Pack Size: 100''s', N'medicine.png', 200.0000, CAST(N'2022-05-05T03:16:08.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (898, N'Uricontrol Tab 5mg 1x10''s Pack Size: 10''s', N'medicine.png', 410.0000, CAST(N'2022-05-05T03:16:24.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (899, N'LoPhos Tab 667mg 1x10â€™s Pack Size: 1x10''s', N'medicine.png', 43.0000, CAST(N'2022-05-05T03:16:41.447' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (900, N'LoPhos Tab 667mg Pack Size: 100''s', N'medicine.png', 435.0000, CAST(N'2022-05-05T03:16:57.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (901, N'Urgesin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 880.0000, CAST(N'2022-05-05T03:17:09.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (902, N'Urgesin Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 528.0000, CAST(N'2022-05-05T03:17:24.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (903, N'Sobonate Bicarbonate Inj 84mg 1Vailx20ml', N'medicine.png', 15.0000, CAST(N'2022-05-05T03:17:46.533' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (904, N'Solifen Tab 5mg 10''s 160... Pack Size: 160', N'medicine.png', 63536.0000, CAST(N'2022-05-05T03:18:14.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (905, N'Solifen Tab 10mg 10''s 192... Pack Size: 192.', N'medicine.png', 126950.0000, CAST(N'2022-05-05T03:19:04.953' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (906, N'Solifen Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 850.0000, CAST(N'2022-05-05T03:19:28.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (907, N'Mibega Tab 50mg 10''s Pack Size: 10''s', N'medicine.png', 1500.0000, CAST(N'2022-05-05T03:19:45.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (908, N'Urilef Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 800.0000, CAST(N'2022-05-05T03:19:57.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (909, N'Solcina Tab 5mg 10''s Pack Size: 10.', N'medicine.png', 450.0000, CAST(N'2022-05-05T03:20:16.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (910, N'Fenaso Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-05T03:20:28.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (911, N'Fenaso Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 600.0000, CAST(N'2022-05-05T03:20:40.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (912, N'Haemomed Concentrate Sol 4ltr', N'medicine.png', 356.0000, CAST(N'2022-05-05T03:21:04.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (913, N'Haemomed Concentrate Sol 10ltr', N'medicine.png', 770.0000, CAST(N'2022-05-05T03:21:20.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (914, N'Medisol Peri-hyper Sol 2000ml', N'medicine.png', 128.0000, CAST(N'2022-05-05T03:21:41.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (915, N'Medisol Peri-ISO Sol 2000ml', N'medicine.png', 128.0000, CAST(N'2022-05-05T03:22:01.883' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (916, N'Medisol AC BC Sol 4ltr Pack Size: 4liter', N'medicine.png', 294.0000, CAST(N'2022-05-05T03:22:16.083' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (917, N'Alkacitron Syp 1.25gm/5ml 120ml Pack Size', N'medicine.png', 39.0000, CAST(N'2022-05-05T03:22:33.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (918, N'Cystalgon Tab 30''s Pack Size: 30''s', N'medicine.png', 441.0000, CAST(N'2022-05-05T03:22:53.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (919, N'Detrusitol SR Cap 4mg 30''s Pack Size: 30''s', N'medicine.png', 2400.0000, CAST(N'2022-05-05T03:23:15.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (920, N'LoPhos Tab 667mg 10x10????????s Pack Size: 100''s', N'medicine.png', 465.0000, CAST(N'2022-05-05T03:23:31.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (921, N'LoPhos Tab 667mg 1x10’s Pack Size: 1x10''s', N'medicine.png', 43.0000, CAST(N'2022-05-05T03:23:52.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (922, N'Solfy Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 600.0000, CAST(N'2022-05-05T03:24:10.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (923, N'Tolodin Tab 1mg 28''s Pack Size: 28''s', N'medicine.png', 390.0000, CAST(N'2022-05-05T03:24:29.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (924, N'Lospin Tab 10Mg Pack Size: 30''s', N'medicine.png', 60.0000, CAST(N'2022-05-05T03:24:48.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (925, N'Peritozaf Sol 1000ml Pack Size: 1000ml', N'medicine.png', 103.0000, CAST(N'2022-05-05T03:25:02.803' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (926, N'Mannitozaf Inf 20% 500ml Pack Size: 500ml', N'medicine.png', 167.0000, CAST(N'2022-05-05T03:25:20.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (927, N'Haemodialysis Concentrate Sol 10 Liter', N'medicine.png', 1201.0000, CAST(N'2022-05-05T03:25:53.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (928, N'Sobicarb Inj 84mg 1Vailx20ml Pack Size: 1', N'medicine.png', 22.0000, CAST(N'2022-05-05T03:26:16.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (929, N'Uricontrol Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 700.0000, CAST(N'2022-05-05T03:26:41.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (930, N'Steriflutol Inf 20% 500ml Pack Size: 500ml', N'medicine.png', 117.0000, CAST(N'2022-05-05T03:27:05.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (931, N'Vezitic Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 480.0000, CAST(N'2022-05-05T03:27:21.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (932, N'Vezitic Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 800.0000, CAST(N'2022-05-05T03:27:34.253' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (933, N'Mirabet Tab 25mg 20''s Pack Size: 20''s', N'medicine.png', 900.0000, CAST(N'2022-05-05T03:28:20.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (934, N'Mirabet Tab 50mg 20''s Pack Size: 20''s', N'medicine.png', 1400.0000, CAST(N'2022-05-05T03:28:38.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (935, N'Caramet Tab 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 10.0000, CAST(N'2022-05-05T03:28:52.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (936, N'Tolter Tab 2mg 2x14''s Pack Size: 1vial', N'medicine.png', 550.0000, CAST(N'2022-05-05T03:29:13.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (937, N'Renavel Tab 400mg 30''s Pack Size: 30''s', N'medicine.png', 1427.0000, CAST(N'2022-05-05T03:29:26.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (938, N'Detriflow Tab 2mg 28''s Pack Size: 28''s', N'medicine.png', 987.0000, CAST(N'2022-05-05T03:29:39.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (939, N'Metroil Tab 100''s Pack Size: 100''s', N'medicine.png', 2822.0000, CAST(N'2022-05-05T03:29:58.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (940, N'Ketosteril Tab 5x20''s Pack Size: 100''s', N'medicine.png', 3895.0000, CAST(N'2022-05-05T03:30:13.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (941, N'Ketosteril Tab 1x20''s Pack Size: 1x20''s', N'medicine.png', 779.0000, CAST(N'2022-05-05T03:30:28.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (942, N'Neosev Tab 800mg 30''s Pack Size: 30''s', N'medicine.png', 1560.0000, CAST(N'2022-05-05T03:30:44.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (943, N'Poze Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 150.0000, CAST(N'2022-05-05T03:35:25.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (944, N'Poze Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 260.0000, CAST(N'2022-05-05T03:35:42.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (945, N'Poze Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 275.0000, CAST(N'2022-05-05T03:35:54.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (946, N'Pozemet Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 143.0000, CAST(N'2022-05-05T03:36:18.497' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (947, N'Pozemet Tab 15mg/850mg 14''s Pack Size: 14''s', N'medicine.png', 138.0000, CAST(N'2022-05-05T03:36:35.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (948, N'Poze-G Tab 30mg/2mg 14''s Pack Size: 14''s', N'medicine.png', 306.0000, CAST(N'2022-05-05T03:36:53.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (949, N'Poze-G Tab 4mg/30mg 14''s Pack Size: 14''s', N'medicine.png', 470.0000, CAST(N'2022-05-05T03:37:10.803' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (950, N'Piotone Plus Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 98.0000, CAST(N'2022-05-05T03:37:23.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (951, N'Piotone Plus Tab 15mg/850mg 14''s', N'medicine.png', 100.0000, CAST(N'2022-05-05T03:37:35.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (952, N'Tagozer Tab 15mg 1x10''s Pack Size: 10''s', N'medicine.png', 57.0000, CAST(N'2022-05-05T03:37:58.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (953, N'Tagozer Tab 45mg 1x10''s Pack Size: 10''s', N'medicine.png', 135717.0000, CAST(N'2022-05-05T03:38:09.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (954, N'Tagozer-G Tab 30mg/2mg 1x14''s Pack Size: 14''s', N'medicine.png', 99.0000, CAST(N'2022-05-05T03:38:27.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (955, N'Tagozer-G Tab 15mg/2mg 1x10''s Pack Size: 10''s', N'medicine.png', 42.0000, CAST(N'2022-05-05T03:38:39.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (956, N'Tagozer-G Tab 30mg/4mg 1x14''s Pack Size: 14''s', N'medicine.png', 101.0000, CAST(N'2022-05-05T03:38:54.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (957, N'Zoliget Tab 30mg/4mg 14''s 108... Pack Size: 108', N'medicine.png', 28728.0000, CAST(N'2022-05-05T03:39:11.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (958, N'Zolid Tab 45mg 14''s 108... Pack Size: 108.', N'medicine.png', 34473.0000, CAST(N'2022-05-05T03:39:34.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (959, N'Zolid Tab 30mg 14''s 108... Pack Size: 108', N'medicine.png', 28728.0000, CAST(N'2022-05-05T03:39:49.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (960, N'Zolid Tab 15mg 14''s 108', N'medicine.png', 18673.0000, CAST(N'2022-05-05T03:40:08.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (961, N'Zolid Plus Tab 15mg/500mg 28''s... Pack Size:  60', N'medicine.png', 10744.0000, CAST(N'2022-05-05T03:40:32.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (962, N'Zolid Plus Tab 15mg/850mg 14''s... Pack Size: 40 Packs', N'medicine.png', 3838.0000, CAST(N'2022-05-05T03:40:52.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (963, N'Zolid Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 250.0000, CAST(N'2022-05-05T03:41:11.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (964, N'Zolid Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 359.0000, CAST(N'2022-05-05T03:41:27.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (965, N'Zolid Plus Tab 15mg/500mg 28''s Pack Size: 28''s', N'medicine.png', 271.0000, CAST(N'2022-05-05T03:41:41.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (966, N'Zolid Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 450.0000, CAST(N'2022-05-05T03:42:06.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (967, N'Zolid Plus Tab 15mg/850mg 14''S Pack Size: 14''s', N'medicine.png', 146.0000, CAST(N'2022-05-05T03:42:21.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (968, N'Zoliget Tab 15mg/2mg 14''s Pack Size: 14''s', N'medicine.png', 208.0000, CAST(N'2022-05-05T03:42:35.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (969, N'Zoliget Tab 30mg/4mg 14''s Pack Size: 14''s', N'medicine.png', 372.0000, CAST(N'2022-05-05T03:42:52.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (970, N'Zoliget Tab 30mg/2mg 14''s Pack Size: 14''s', N'medicine.png', 306.0000, CAST(N'2022-05-05T03:43:10.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (971, N'Piozer Plus Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 153.0000, CAST(N'2022-05-05T03:43:30.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (972, N'Piozer Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 355.0000, CAST(N'2022-05-05T03:43:50.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (973, N'Piozer Plus Tab 15mg/850mg 14''s Pack Size: 14''s', N'medicine.png', 132.0000, CAST(N'2022-05-05T03:44:05.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (974, N'Piozer Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 230.0000, CAST(N'2022-05-05T03:44:20.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (975, N'Piozer Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 395.0000, CAST(N'2022-05-05T03:44:39.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (976, N'Piozer-G Tab 15mg/2mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-05T03:44:51.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (977, N'Piozer-G Tab 30mg/4mg 14''s Pack Size: 14''s', N'medicine.png', 348.0000, CAST(N'2022-05-05T03:45:03.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (978, N'Piozer-G Tab 30mg/2mg 14''s Pack Size: 14''s', N'medicine.png', 310.0000, CAST(N'2022-05-05T03:45:18.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (979, N'Dowglit Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 91.0000, CAST(N'2022-05-05T03:45:30.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (980, N'Dowglit Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 161.0000, CAST(N'2022-05-05T03:45:43.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (981, N'Dowglit Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 210.0000, CAST(N'2022-05-05T03:46:01.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (982, N'Piozone Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 71.0000, CAST(N'2022-05-05T03:46:18.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (983, N'Piozone Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 119.0000, CAST(N'2022-05-05T03:46:33.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (984, N'Piozone Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-05T03:46:48.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (985, N'Diactal Tab 15mg 1x14''s Pack Size: 14''s', N'medicine.png', 66.0000, CAST(N'2022-05-05T03:47:04.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (986, N'Diactal Tab 45mg 1x14''s Pack Size: 14''s', N'medicine.png', 185.0000, CAST(N'2022-05-05T03:47:19.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (987, N'Diactal Tab 30mg 1x14''s Pack Size: 14''s', N'medicine.png', 133.0000, CAST(N'2022-05-05T03:47:39.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (988, N'Piofit Plus Tab 15mg/500mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 188.0000, CAST(N'2022-05-05T03:47:54.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (989, N'Piofit Tab 30mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 437.0000, CAST(N'2022-05-05T03:48:07.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (990, N'Piofit Plus Tab 15mg/850mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 182.0000, CAST(N'2022-05-05T03:48:34.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (991, N'Piofit Plus Tab 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 188.0000, CAST(N'2022-05-05T03:48:51.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (992, N'Glitos Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 171.0000, CAST(N'2022-05-05T03:49:06.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (993, N'Glitos Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 104.0000, CAST(N'2022-05-05T03:49:25.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (994, N'Glitos Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 210.0000, CAST(N'2022-05-05T03:49:44.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (995, N'Zona-4 Tab 4mg 10’s Pack Size: 10''s', N'medicine.png', 105.0000, CAST(N'2022-05-05T03:49:56.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (996, N'Glizon Tab 2mg 10''s Pack Size: 10''s', N'medicine.png', 53.0000, CAST(N'2022-05-05T03:50:12.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (997, N'Glizon Tab 4mg 10''s Pack Size: 10''s', N'medicine.png', 105.0000, CAST(N'2022-05-05T03:50:26.703' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (998, N'Glizon Tab 8mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-05T03:50:40.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (999, N'Fantasmic Plus Tab 4mg/30mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 300.0000, CAST(N'2022-05-05T03:50:58.527' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1000, N'Fantasmic Plus Tab 2mg/30mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 290.0000, CAST(N'2022-05-05T03:51:12.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1001, N'Fantasia Tab 15mg 2x7''s Pack Size: 14''s', N'medicine.png', 93.0000, CAST(N'2022-05-05T03:51:24.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1002, N'Fantasia Tab 30mg 2x7''s Pack Size: 14''s', N'medicine.png', 300.0000, CAST(N'2022-05-05T03:51:40.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1003, N'Fantasia Tab 45mg 2x7''s Pack Size: 14''s', N'medicine.png', 212.0000, CAST(N'2022-05-05T03:51:53.663' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1004, N'Diglyta Plus Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 143.0000, CAST(N'2022-05-05T03:52:06.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1005, N'Diglyta Plus Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 143.0000, CAST(N'2022-05-05T03:52:06.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1006, N'Ligazo Tab 45mg 14''s Pack Size: 14''s', N'medicine.png', 200.0000, CAST(N'2022-05-05T03:52:41.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1007, N'Ligazo Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 85.0000, CAST(N'2022-05-05T03:52:57.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1008, N'Ligazo Tab 30mg 14''s Pack Size: 14''s', N'medicine.png', 140.0000, CAST(N'2022-05-05T03:53:11.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1009, N'Piomet Tab 15mg/500mg 14''s Pack Size: 14''s', N'medicine.png', 143.0000, CAST(N'2022-05-05T03:53:36.923' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1010, N'Zexa Tab 10mg 7x8''s Pack Size: 56''s', N'medicine.png', 2240.0000, CAST(N'2022-05-05T03:55:23.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1011, N'Stir-Up Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 750.0000, CAST(N'2022-05-05T03:55:38.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1012, N'Alzagon Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 450.0000, CAST(N'2022-05-05T03:55:54.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1013, N'Afdol Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 460.0000, CAST(N'2022-05-05T03:56:09.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1014, N'Donecept Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 253.0000, CAST(N'2022-05-05T03:56:28.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1015, N'Donecept Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 199.0000, CAST(N'2022-05-05T03:56:41.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1016, N'Zexa Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 900.0000, CAST(N'2022-05-05T03:56:55.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1017, N'Zexa Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 2700.0000, CAST(N'2022-05-05T03:57:13.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1018, N'Zexa Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 1800.0000, CAST(N'2022-05-05T03:57:26.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1019, N'Alzentine Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 1050.0000, CAST(N'2022-05-05T03:57:41.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1020, N'Ebixa Tab 10mg 56''s Pack Size: 56''s', N'medicine.png', 11290.0000, CAST(N'2022-05-05T03:57:57.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1021, N'Exelon Cap 6.0mg 60''s Pack Size: 60''s', N'medicine.png', 5875.0000, CAST(N'2022-05-05T05:20:58.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1022, N'Exelon Patch 4.6mg 30''s Pack Size: 30''s', N'medicine.png', 10737.0000, CAST(N'2022-05-05T05:21:49.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1023, N'Exelon Patch 9.5mg 30''s Pack Size: 30''s', N'medicine.png', 10737.0000, CAST(N'2022-05-05T05:22:10.553' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1024, N'Exelon Patch-15 30''s Pack Size: 30''s', N'medicine.png', 12347.0000, CAST(N'2022-05-05T05:22:23.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1025, N'Exelon Cap 1.5 mg 28''s Pack Size', N'medicine.png', 6097.0000, CAST(N'2022-05-05T05:22:42.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1026, N'Exelon Cap 4.5 mg 28''s Pack Size', N'medicine.png', 5875.0000, CAST(N'2022-05-05T05:22:58.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1027, N'Exelon Cap 3.0 mg 28''s Pack Size', N'medicine.png', 6097.0000, CAST(N'2022-05-05T05:23:15.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1028, N'Exelon Cap 6.0 mg 28''s Pack Size', N'medicine.png', 5875.0000, CAST(N'2022-05-05T05:23:33.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1029, N'Xantol Tab 10mg 56''s Pack Size: 56''s', N'medicine.png', 1680.0000, CAST(N'2022-05-05T05:23:49.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1030, N'Alzagon Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 207.0000, CAST(N'2022-05-05T05:24:08.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1031, N'Foliant Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 465.0000, CAST(N'2022-05-05T05:24:28.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1032, N'Zildon Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 178.0000, CAST(N'2022-05-05T05:24:46.343' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1033, N'Zivas Tab 3mg 6x10''s 60... Pack Size: 60...', N'medicine.png', 90000.0000, CAST(N'2022-05-05T05:24:59.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1034, N'Zexa Tab 10mg 7x8''s 96... Pack Size: 96...', N'medicine.png', 138720.0000, CAST(N'2022-05-05T05:25:33.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1035, N'Zexa Tab 10mg 7x8''s 42... Pack Size: 42...', N'medicine.png', 60690.0000, CAST(N'2022-05-05T05:25:47.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1036, N'Zivas Tab 3mg 6x10''s Pack Size: 60...', N'medicine.png', 2375.0000, CAST(N'2022-05-05T05:25:59.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1037, N'Zexa Syp 10mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 1092.0000, CAST(N'2022-05-05T05:26:20.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1038, N'Azenil Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 216.0000, CAST(N'2022-05-05T05:26:31.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1039, N'Contine Tab 10mg 4x14''s Pack Size: 56''s', N'medicine.png', 2500.0000, CAST(N'2022-05-05T05:26:43.933' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1040, N'Dementio ER Tab 8mg 30''s Pack Size: 30''s', N'medicine.png', 2023.0000, CAST(N'2022-05-05T05:27:05.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1041, N'Dementio ER Tab 12mg 30''s Pack Size: 30''s', N'medicine.png', 2359.0000, CAST(N'2022-05-05T05:27:20.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1042, N'Donep Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 344.0000, CAST(N'2022-05-05T05:27:36.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1043, N'Donep Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 480.0000, CAST(N'2022-05-05T05:27:52.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1044, N'Cara-Tine Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 900.0000, CAST(N'2022-05-05T05:28:06.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1045, N'Demantin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 725.0000, CAST(N'2022-05-05T05:28:20.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1046, N'Demantin Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 1400.0000, CAST(N'2022-05-05T05:28:36.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1047, N'Neulin Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 680.0000, CAST(N'2022-05-05T05:28:49.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1048, N'Neulin Syp 500mg 120ml Pack Size: 120ml', N'medicine.png', 750.0000, CAST(N'2022-05-05T05:29:05.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1049, N'Carveda Tab 12.5mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 349.0000, CAST(N'2022-05-05T05:30:38.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1050, N'Sacvin Tab 49/51mg 30''s Pack Size: 30...', N'medicine.png', 1133.0000, CAST(N'2022-05-05T05:30:51.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1051, N'Epler Tab 50Mg Pack Size: 10..', N'medicine.png', 774.0000, CAST(N'2022-05-05T05:31:04.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1052, N'Carveda Tab 6.25mg 3x10''s Pack Size: 2x10''s', N'medicine.png', 237.0000, CAST(N'2022-05-05T05:31:19.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1053, N'Carveda Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 212.0000, CAST(N'2022-05-05T05:31:37.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1054, N'Dopamine Inj 200mg 1Ampx5ml Pack Size: 1Ampx5ml', N'medicine.png', 122.0000, CAST(N'2022-05-05T05:31:53.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1055, N'Hart Tab 12.5mg 10''s Pack Size: 30''s', N'medicine.png', 70.0000, CAST(N'2022-05-05T05:32:08.803' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1056, N'Vadil Tab 6.25mg 3x10''s Pack Size: 30''s', N'medicine.png', 255.0000, CAST(N'2022-05-05T05:32:19.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1057, N'Milron Inj 10mg 1Vialx10ml Pack Size: 1vialx10ml', N'medicine.png', 1693.0000, CAST(N'2022-05-05T05:32:31.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1058, N'Noradrin Inj 4mg 5Ampx4ml Pack Size: 5ampx4ml', N'medicine.png', 1888.0000, CAST(N'2022-05-05T05:32:57.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1059, N'Delaware Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-05T05:33:12.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1060, N'Buta Inj 250mg 10Ampx5ml Pack Size: 10Ampx5ml', N'medicine.png', 2300.0000, CAST(N'2022-05-05T05:33:24.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1061, N'Carveda Tab 3.125mg 1x10''s Pack Size: 10''s', N'medicine.png', 87.0000, CAST(N'2022-05-05T05:33:41.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1062, N'Savesto 50 Tab 24mg/26mg 14''s Pack Size: 14''s', N'medicine.png', 528.0000, CAST(N'2022-05-05T05:33:55.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1063, N'Savesto 100 Tab 49mg/51mg 14''s Pack Size: 14''s', N'medicine.png', 747.0000, CAST(N'2022-05-05T05:34:08.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1064, N'Savesto 200 Tab 97mg/103mg 14''s Pack Size: 14', N'medicine.png', 980.0000, CAST(N'2022-05-05T05:34:29.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1065, N'Hidilol Tab 12.5mg 1x10''s Pack Size: 10''s', N'medicine.png', 59.0000, CAST(N'2022-05-05T05:34:45.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1066, N'Hidilol Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 136.0000, CAST(N'2022-05-05T05:35:00.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1067, N'Epliron Tab 25mg 14''s Pack Size', N'medicine.png', 350.0000, CAST(N'2022-05-05T05:35:26.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1068, N'Epliron Tab 50mg 14''s Pack Size:', N'medicine.png', 518.0000, CAST(N'2022-05-05T05:35:38.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1069, N'Carlov Tab 6.25mg 30''s Pack Size: 30''s', N'medicine.png', 235.0000, CAST(N'2022-05-05T05:35:51.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1070, N'Carlov Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 205.0000, CAST(N'2022-05-05T05:36:08.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1071, N'Carlov Tab 12.5mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-05T05:36:20.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1072, N'Carlov Tab 3.125mg 10''s Pack Size: 10''s', N'medicine.png', 70.0000, CAST(N'2022-05-05T05:36:33.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1073, N'Hart Tab 6.25mg 30''s Pack Size', N'medicine.png', 151905.0000, CAST(N'2022-05-05T05:37:08.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1074, N'Dilatrend Tab 6.25mg 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-05T05:37:25.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1075, N'Dilatrend Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 1800.0000, CAST(N'2022-05-05T05:37:44.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1076, N'Duvig Inj 250mg 1Vial Pack Size: 1vial', N'medicine.png', 386.0000, CAST(N'2022-05-05T05:38:05.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1077, N'Uperio Tab 100mg 28''s Pack Size: 28''s', N'medicine.png', 2823.0000, CAST(N'2022-05-05T05:38:25.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1078, N'Uperio Tab 200mg 28''s Pack Size: 28''s', N'medicine.png', 2940.0000, CAST(N'2022-05-05T05:38:38.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1079, N'Sacvin Tab 97/103mg 30''s Pack Size: 30''s', N'medicine.png', 2400.0000, CAST(N'2022-05-05T05:39:56.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1080, N'Valbit Tab 49mg/51mg 14''s Pack Size: 14''s', N'medicine.png', 747.0000, CAST(N'2022-05-05T05:40:16.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1081, N'Valbit Tab 24mg/26mg 14''s Pack Size: 14''s', N'medicine.png', 448.0000, CAST(N'2022-05-05T05:40:27.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1082, N'Cordion Inj 250mg/5ml 10Amp Pack Size: 10ampx5ml', N'medicine.png', 2300.0000, CAST(N'2022-05-05T05:40:44.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1083, N'Vadil Tab 3.125mg 3x10''s Pack Size: 30...', N'medicine.png', 181.0000, CAST(N'2022-05-05T05:40:56.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1084, N'Vadil Tab 12.5mg 3x10''s Pack Size: 30''s', N'medicine.png', 330.0000, CAST(N'2022-05-05T05:41:09.787' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1085, N'Vadil Tab 25mg 1x10''s Pack Size: 10''s', N'medicine.png', 193.0000, CAST(N'2022-05-05T05:41:23.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1086, N'Cara-Doba Inj 250mg 1Vialx5ml Pack Size: 5ml', N'medicine.png', 386.0000, CAST(N'2022-05-05T05:41:34.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1087, N'Cara-Doba Inj 250mg 10Vialx5ml Pack Size: 5ml', N'medicine.png', 2300.0000, CAST(N'2022-05-05T05:41:45.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1088, N'Carapamin Inj 200mg 10Vialx5ml Pack Size: 20''s', N'medicine.png', 700.0000, CAST(N'2022-05-05T05:42:02.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1089, N'Carapamin Inj 200mg 50Vialx5ml Pack Size: 10vialx5ml', N'medicine.png', 2850.0000, CAST(N'2022-05-05T05:42:18.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1090, N'Carapamin Inj 200mg 1Vialx5ml Pack Size: 30''s', N'medicine.png', 70.0000, CAST(N'2022-05-05T05:42:31.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1091, N'Norepine Inj 8mg 10Ampx4ml Pack Size: 10Ampx4ml', N'medicine.png', 3000.0000, CAST(N'2022-05-05T05:42:48.180' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1092, N'Dobamin Inj 250mg/5ml 10Amp Pack Size: 10ampx5ml', N'medicine.png', 2750.0000, CAST(N'2022-05-05T05:43:00.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1093, N'Revolizer Device 1''s Pack Size: 1''s', N'medicine.png', 530.0000, CAST(N'2022-05-05T05:44:01.753' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1094, N'Budeform 200 Hfa Inh 1''s Pack Size: 1''s', N'medicine.png', 653.0000, CAST(N'2022-05-05T05:44:17.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1095, N'Ventolin Resp Sol 100mcg 20ml Pack Size: 20ml', N'medicine.png', 48.0000, CAST(N'2022-05-05T05:44:28.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1096, N'Xaltide HFA Inh 100mcg/50mcg 1''s Pack Size: 1''s', N'medicine.png', 379.0000, CAST(N'2022-05-05T05:44:54.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1097, N'Seretide MDI Inh 25mcg/250mcg 1''s Pack Size: 1''s', N'medicine.png', 1253.0000, CAST(N'2022-05-05T05:45:08.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1098, N'Seretide Diskus 50mg/250mg 60Doses Pack Size:', N'medicine.png', 845.0000, CAST(N'2022-05-05T05:45:23.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1099, N'Breavent Rotacaps 200mcg 30''s Pack Size: 30''s', N'medicine.png', 90.0000, CAST(N'2022-05-05T05:45:42.470' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1100, N'Bronkal Respirator Sol 5mg/ml 20ml Pack Size: 20ml', N'medicine.png', 45.0000, CAST(N'2022-05-05T05:45:54.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1101, N'Foster Inhalation Sol 100mcg/6mcg 1''s', N'medicine.png', 1238.0000, CAST(N'2022-05-05T05:46:08.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1102, N'Rinoclenil Inh 500mcg 1 ''s Pack Size: 1''s', N'medicine.png', 284.0000, CAST(N'2022-05-05T05:46:29.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1103, N'Rinoclenil 100 Inh 100mcg 1''s Pack Size: 30ml', N'medicine.png', 756.0000, CAST(N'2022-05-05T05:46:41.553' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1104, N'Ipratec Nebulization Sol 250mcg 5Vialx', N'medicine.png', 322.0000, CAST(N'2022-05-05T05:47:05.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1105, N'Bekson Inh 50mcg 1''s 300... Pack Size: 300', N'medicine.png', 32703.0000, CAST(N'2022-05-05T05:47:28.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1106, N'Optra HFA Aerosol Inh 20mcg... Pack Size: 300', N'medicine.png', 106875.0000, CAST(N'2022-05-05T05:47:50.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1107, N'Xaltide HFA Inh 100mcg/50mcg 1''s... Pack Size: 300.', N'medicine.png', 89775.0000, CAST(N'2022-05-05T05:48:05.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1108, N'Salbo Sol 5mg/ml 20ml 189... Pack Size: 189..', N'medicine.png', 6284.0000, CAST(N'2022-05-05T05:48:23.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1109, N'Salbo HFA Inh 100mcg 1''s... Pack Size: 300...', N'medicine.png', 57000.0000, CAST(N'2022-05-05T05:48:37.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1110, N'Optra HFA Aerosol Inh 20mcg... Pack Size: 200''s', N'medicine.png', 515.0000, CAST(N'2022-05-05T05:49:07.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1111, N'Saltra MDI Hfa Inh 25mcg/125mcg... Pack Size: 1''s', N'medicine.png', 660.0000, CAST(N'2022-05-05T05:49:28.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1112, N'Saltra MDI Hfa Inh 25mcg/250mcg... Pack Size: 1''s', N'medicine.png', 815.0000, CAST(N'2022-05-05T05:49:40.923' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1113, N'Seretide MDI Inh 25mcg/125mcg 1''s Pack Size: 1''s', N'medicine.png', 973.0000, CAST(N'2022-05-05T05:49:55.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1114, N'Seretide Diskus 50mg/100mg 60Doses', N'medicine.png', 695.0000, CAST(N'2022-05-05T05:50:11.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1115, N'Seretide Diskus 50mg/500mg 60Doses', N'medicine.png', 940.0000, CAST(N'2022-05-05T05:50:26.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1116, N'Betatec 200 Rotacap Cap 200mcg.', N'medicine.png', 185.0000, CAST(N'2022-05-05T05:50:46.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1117, N'Foracort Inh 6mcg/100mcg 1''s Pack Size: 1''s', N'medicine.png', 487.0000, CAST(N'2022-05-05T05:55:33.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1118, N'Foracort Inh 6mcg/200mcg 1''s Pack Size: 1''s', N'medicine.png', 738.0000, CAST(N'2022-05-05T05:55:48.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1119, N'Breavent - B Rotacaps 30''s Pack Size: 30''s', N'medicine.png', 190.0000, CAST(N'2022-05-05T05:56:00.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1120, N'Sprahaler 20 Hfa Inh 1''s Pack Size: 1''s', N'medicine.png', 364.0000, CAST(N'2022-05-05T05:56:24.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1121, N'Inspirol Inh 100mcg 1''s Pack Size: 1''s', N'medicine.png', 175.0000, CAST(N'2022-05-05T05:56:42.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1122, N'Macticort Inh 250mcg 1''s Pack Size: 1''s', N'medicine.png', 258.0000, CAST(N'2022-05-05T05:56:54.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1123, N'Salmicort Inh 25mcg/125mcg 1''s Pack Size: 1''s', N'medicine.png', 565.0000, CAST(N'2022-05-05T05:57:15.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1124, N'Salnon Inh 100mcg/50mcg 1''s Pack Size: 1''s', N'medicine.png', 346.0000, CAST(N'2022-05-05T05:57:28.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1125, N'Salmicort Inh 25mcg/250mcg 1''s Pack Size: 1''s', N'medicine.png', 713.0000, CAST(N'2022-05-05T05:57:40.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1126, N'Ventomed Respirator Sol 20Ml Pack Size: 20ml', N'medicine.png', 22.0000, CAST(N'2022-05-05T05:57:56.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1127, N'Salbeclo Inh 100mcg/50mcg 1''s Pack Size: 200', N'medicine.png', 238.0000, CAST(N'2022-05-05T05:58:08.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1128, N'Salnafot Inh 25mcg/250mcg 1''s Pack Size: 1''s', N'medicine.png', 575.0000, CAST(N'2022-05-05T05:58:20.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1129, N'Zaftolin Aerosol Inh 100mcg 1''s Pack Size: 1''s', N'medicine.png', 188.0000, CAST(N'2022-05-05T05:58:35.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1130, N'Zaftolin Sol 5mg/ml 20ml Pack Size: 20ml', N'medicine.png', 48.0000, CAST(N'2022-05-05T05:58:49.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1131, N'Deltacortril Enteric Coated Tab 5mg... Pack Size: 100''s', N'medicine.png', 318.0000, CAST(N'2022-05-05T06:01:46.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1132, N'Steron Syp 15mg/ml 60ml Pack Size: 60ml', N'medicine.png', 110.0000, CAST(N'2022-05-05T06:02:07.907' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1133, N'Deltacortril Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 2332.0000, CAST(N'2022-05-05T06:02:26.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1134, N'Rapicort 5mg Tab 100''s Pack Size: 100''s', N'medicine.png', 297.0000, CAST(N'2022-05-05T06:02:44.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1135, N'Betnesol Inj 4mg 5Ampx1ml Pack Size: 5ampx1ml', N'medicine.png', 93.0000, CAST(N'2022-05-05T06:02:56.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1136, N'Betnelan Tab 0.5mg 500''s Pack Size: 20''s', N'medicine.png', 637.0000, CAST(N'2022-05-05T06:03:08.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1137, N'Decadron Inj 4mg 1Vialx5ml Pack Size: 1vialx5ml', N'medicine.png', 86.0000, CAST(N'2022-05-05T06:03:23.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1138, N'Tricort Inj 40mg 1Amp Pack Size: 1.', N'medicine.png', 39615.0000, CAST(N'2022-05-05T06:03:43.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1139, N'Hyzonate Inj 250mg 1Vial Pack Size: 1vial', N'medicine.png', 167.0000, CAST(N'2022-05-05T06:03:55.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1140, N'Hyzonate Inj 500mg 1Vial Pack Size: 1vial', N'medicine.png', 366.0000, CAST(N'2022-05-05T06:04:20.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1141, N'Hyzonate Inj 100mg 1Vial Pack Size: 1vial', N'medicine.png', 84.0000, CAST(N'2022-05-05T06:04:32.220' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1142, N'Dexamex Inj 4mg 25Ampx1ml Pack Size: 4mg', N'medicine.png', 351.0000, CAST(N'2022-05-05T06:04:50.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1143, N'D-Cort Inj 25Ampx1ml Pack Size: 1ml', N'medicine.png', 404.0000, CAST(N'2022-05-05T06:05:07.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1144, N'Hy-Cortisone Inj 500mg 1Vial Pack Size:', N'medicine.png', 303525.0000, CAST(N'2022-05-05T06:05:21.163' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1145, N'Hy-Cortisone Inj 250mg 1Vial Pack Size: 1vial', N'medicine.png', 141.0000, CAST(N'2022-05-05T06:05:32.217' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1146, N'Hy-Cortisone Inj 100mg 1Vial Pack Size: 1', N'medicine.png', 80655.0000, CAST(N'2022-05-05T06:05:51.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1147, N'Dexafort Inj 40mg 1Ampx1ml Pack Size: 1', N'medicine.png', 43.0000, CAST(N'2022-05-05T06:06:09.097' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1148, N'Atneson Inj 4mg 25Ampx1ml Pack Size: 25Ampx1ml', N'medicine.png', 250.0000, CAST(N'2022-05-05T06:06:22.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1149, N'Dexamedron Inj 4mg 25Ampx1ml Pack Size', N'medicine.png', 237956.0000, CAST(N'2022-05-05T06:06:42.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1150, N'Presolone Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 359727.0000, CAST(N'2022-05-05T06:07:05.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1151, N'Betamethasone Tab 0.5mg 500'' Pack Size: 500''s', N'medicine.png', 253.0000, CAST(N'2022-05-05T06:07:19.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1152, N'Dexamedron Inj 4mg 1Ampx5ml Pack Size: 1', N'medicine.png', 56.0000, CAST(N'2022-05-05T06:07:38.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1153, N'Dexonil Inj 4mg 25Ampx1ml Pack Size: 1ml', N'medicine.png', 161.0000, CAST(N'2022-05-05T06:07:50.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1154, N'Dexonil Inj 4mg 5Ampx5ml Pack Size: 25''s', N'medicine.png', 250.0000, CAST(N'2022-05-05T06:08:07.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1155, N'Irzalone Tab 0.5mg 50x10''s Pack Size: 500''s', N'medicine.png', 196.0000, CAST(N'2022-05-05T06:08:33.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1156, N'Irzalone Tab 0.5mg 20''s Pack Size: 20''s', N'medicine.png', 7.0000, CAST(N'2022-05-05T06:08:48.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1157, N'Irzalone Tab 0.5mg 250''s Pack Size: 250''s', N'medicine.png', 91.0000, CAST(N'2022-05-05T06:09:05.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1158, N'I-Cort Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 1140.0000, CAST(N'2022-05-05T06:09:23.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1159, N'I-Cort Tab 5mg 3x10''s Pack Size: 30''s', N'medicine.png', 57.0000, CAST(N'2022-05-05T06:09:34.953' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1160, N'Irzalone Tab 0.5mg 500''s Pack Size: 100''s', N'medicine.png', 388.0000, CAST(N'2022-05-05T06:09:47.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1161, N'Irzalone Tab 0.5mg 20x25''s Pack Size: 500''s', N'medicine.png', 338.0000, CAST(N'2022-05-05T06:10:04.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1162, N'Prednisolone Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 2003.0000, CAST(N'2022-05-05T06:10:21.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1163, N'Depo Medrol Inj 40mg 1Vialx1ml Pack Size: 1vialx1ml', N'medicine.png', 157.0000, CAST(N'2022-05-05T06:10:36.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1164, N'Solu Cortef Inj 100mg 1Vial Pack Size: 1''s', N'medicine.png', 150.0000, CAST(N'2022-05-05T06:10:55.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1165, N'Solu Medrol Inj 1000mg 1Vial Pack Size: 1Vial', N'medicine.png', 4210.0000, CAST(N'2022-05-05T06:11:08.567' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1166, N'Solu Medrol Inj 500mg 1Vial Pack Size: 1''s', N'medicine.png', 2306.0000, CAST(N'2022-05-05T06:11:21.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1167, N'Depo Medrol Inj 40mg 1Vialx2ml Pack Size: 1...', N'medicine.png', 234.0000, CAST(N'2022-05-05T06:11:35.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1168, N'Triton Inj 40mg 1Ampx1ml Pack Size: 1''s', N'medicine.png', 52.0000, CAST(N'2022-05-05T06:11:49.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1169, N'Triton Inj 1ml 5''s Pack Size: 5''s', N'medicine.png', 277.0000, CAST(N'2022-05-05T06:12:01.767' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1170, N'Rekabson Inj 4mg 5Ampx1ml Pack Size: 5..', N'medicine.png', 47.0000, CAST(N'2022-05-05T06:12:17.083' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1171, N'Neupred Susp 15mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 92.0000, CAST(N'2022-05-05T06:12:28.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1172, N'Hydro Sod Suc Inj 100mg... Pack Size: 1''s', N'medicine.png', 101.0000, CAST(N'2022-05-05T06:12:38.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1173, N'Hydro Sod Suc Inj 250mg... Pack Size: 1''s', N'medicine.png', 175.0000, CAST(N'2022-05-05T06:12:53.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1174, N'Lonacort Inj 40mg 1Vialx1ml Pack Size: 1', N'medicine.png', 68.0000, CAST(N'2022-05-05T06:13:06.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1175, N'Decadron Inj 4mg 25Vialx1ml Pack Size: 251vialx1ml', N'medicine.png', 546.0000, CAST(N'2022-05-05T06:13:17.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1176, N'Decadron Inj 4mg 1Vialx1ml Pack Size: 1vial', N'medicine.png', 21.0000, CAST(N'2022-05-05T06:13:29.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1177, N'Triway Inj 40mg 1Vial Pack Size: 1vailx125ml', N'medicine.png', 30.0000, CAST(N'2022-05-05T06:13:48.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1178, N'Schazobutol-H Tab 10x10''s Pack Size: 100''s', N'medicine.png', 1066.0000, CAST(N'2022-05-05T06:18:48.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1179, N'Pyrazid Tab 500mg 5x10''s Pack Size: 50''s', N'medicine.png', 320.0000, CAST(N'2022-05-05T06:19:12.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1180, N'Rifapin-H 300 Tab 150/300mg 10x10''s Pack Size: 10x10''s', N'medicine.png', 1756.0000, CAST(N'2022-05-05T06:19:27.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1181, N'Rifapin-H Dry Syp 50ml Pack Size: 50ml', N'medicine.png', 113.0000, CAST(N'2022-05-05T06:19:50.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1182, N'Rifampicin Cap 300mg 40''s Pack Size: 40''s', N'medicine.png', 218.0000, CAST(N'2022-05-05T06:20:06.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1183, N'Rifampicin Cap 300mg 8''s Pack Size: 8''s', N'medicine.png', 43.0000, CAST(N'2022-05-05T06:20:20.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1184, N'Rifatol Tab 10x10''s Pack Size: 10x10''s', N'medicine.png', 1489.0000, CAST(N'2022-05-05T06:20:40.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1185, N'Rifac Syrup 100mg/5ml60ml Pack Size: 60ml', N'medicine.png', 31.0000, CAST(N'2022-05-05T06:20:52.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1186, N'PZA-Ciba Syp 250mg/5ml 60ml Pack Size: 60', N'medicine.png', 39.0000, CAST(N'2022-05-05T06:21:10.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1187, N'Rimactal Cap 300mg 5x8''s Pack Size: 5x8''s', N'medicine.png', 243.0000, CAST(N'2022-05-05T06:21:24.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1188, N'Rimactal Tab 450mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 282.0000, CAST(N'2022-05-05T06:21:39.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1189, N'Rimcure Tab 100''s Pack Size: 100''s..', N'medicine.png', 463.0000, CAST(N'2022-05-05T06:21:51.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1190, N'Rimstar Tab 100''s Pack Size: 100''s..', N'medicine.png', 876.0000, CAST(N'2022-05-05T06:22:07.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1191, N'Rimactal 2% Syp 100mg/5ml 60ml Pack Size: 60ml...', N'medicine.png', 45.0000, CAST(N'2022-05-05T06:22:20.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1192, N'Rifin E Tab 10x8''s Pack Size', N'medicine.png', 680.0000, CAST(N'2022-05-05T06:22:32.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1193, N'Rifin Tab 150mg 48''s Pack Size', N'medicine.png', 234.0000, CAST(N'2022-05-05T06:22:51.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1194, N'Ethomid Tab 250mg 3x10''s Pack Size: 3x10''s.', N'medicine.png', 668.0000, CAST(N'2022-05-05T06:23:04.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1195, N'Rifa 4 Plus Tab 10x10''s Pack Size: 100''s', N'medicine.png', 2008.0000, CAST(N'2022-05-05T06:23:17.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1196, N'Rifa-4 Tab 10x10''s Pack Size: 100''s', N'medicine.png', 1849.0000, CAST(N'2022-05-05T06:23:45.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1197, N'Rifapin-H 450 Tab 10x10''s Pack Size: 10x10''s', N'medicine.png', 2605.0000, CAST(N'2022-05-05T06:24:03.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1198, N'Rifapin-H Junior Powder Sachet 1x30''s', N'medicine.png', 290.0000, CAST(N'2022-05-05T06:24:14.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1199, N'Rifazol Pediatric Tab 10x10''s Pack Size: 100''s', N'medicine.png', 873.0000, CAST(N'2022-05-05T06:24:30.020' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1200, N'Rifazol Junior Powder Sachet 1x30''s', N'medicine.png', 367.0000, CAST(N'2022-05-05T06:24:48.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1201, N'Myrin-P Forte Tab 10x8''s Pack Size: 80''s', N'medicine.png', 1324.0000, CAST(N'2022-05-05T06:25:04.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1202, N'Rin Tab 48''s Pack Size: 48''s', N'medicine.png', 230.0000, CAST(N'2022-05-05T06:25:36.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1203, N'Rin Tab 100''s Pack Size: 100''s', N'medicine.png', 442.0000, CAST(N'2022-05-05T06:25:48.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1204, N'Rin Tab 500''s Pack Size: 500''s', N'medicine.png', 2208.0000, CAST(N'2022-05-05T06:25:59.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1205, N'Rifampicin INH Cap 8''s Pack Size: 8''s', N'medicine.png', 44.0000, CAST(N'2022-05-05T06:26:16.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1206, N'Rifampicin INH Cap 30''s Pack Size: 30''s', N'medicine.png', 168.0000, CAST(N'2022-05-05T06:26:29.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1207, N'Rifampicin Cap 150mg 48''s Pack Size: 48''s', N'medicine.png', 154.0000, CAST(N'2022-05-05T06:26:46.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1208, N'Rifampicin Cap 150mg 8''s Pack Size: 8''s', N'medicine.png', 25.0000, CAST(N'2022-05-05T06:27:15.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1209, N'Rifampicin Cap 450mg 30''s Pack Size: 30''s', N'medicine.png', 254.0000, CAST(N'2022-05-05T06:27:31.307' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1210, N'Rifampicin Cap 450mg 8''s Pack Size: 8''s', N'medicine.png', 67.0000, CAST(N'2022-05-05T06:27:47.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1211, N'Rifampicin Syp 100mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 42.0000, CAST(N'2022-05-05T06:28:05.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1212, N'Gefcin Eye Ear Drops 0.3 Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-05T18:38:54.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1213, N'Nebcin Inj 10Mg Pack Size: 5''s', N'medicine.png', 272.0000, CAST(N'2022-05-05T18:39:09.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1214, N'Nebcin Inj 20Mg Pack Size: 1ampx1ml', N'medicine.png', 165.0000, CAST(N'2022-05-05T18:39:31.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1215, N'Nebcin Inj 80mg 1Ampx2ml Pack Size: 1Ampx2ml', N'medicine.png', 305.0000, CAST(N'2022-05-05T18:39:52.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1216, N'Amkay 100 Inj 100Mg Pack Size: 1ampx2ml', N'medicine.png', 351.0000, CAST(N'2022-05-05T18:40:09.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1217, N'Amkay 250 Inj 250Mg Pack Size: 1Ampx2ml', N'medicine.png', 126.0000, CAST(N'2022-05-05T18:40:21.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1218, N'Amkay 500 Inj 500Mg Pack Size: 1''s', N'medicine.png', 211.0000, CAST(N'2022-05-05T18:40:40.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1219, N'Amkay 25 Inj 25Mg Pack Size: 5Ampx1ml', N'medicine.png', 154.0000, CAST(N'2022-05-05T18:40:54.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1220, N'Amkay 50 Inj 50Mg Pack Size: 5Ampx1ml', N'medicine.png', 175.0000, CAST(N'2022-05-05T18:41:12.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1221, N'Gentic Inj 10Mg Pack Size: 2ml', N'medicine.png', 33.0000, CAST(N'2022-05-05T18:41:27.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1222, N'Gentic Inj 20Mg Pack Size: 2ml', N'medicine.png', 60.0000, CAST(N'2022-05-05T18:41:40.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1223, N'Gentic Inj 160Mg Pack Size: 2ml', N'medicine.png', 282.0000, CAST(N'2022-05-05T18:41:53.433' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1224, N'Gentic Inj 40Mg Pack Size: 1ml', N'medicine.png', 100.0000, CAST(N'2022-05-05T18:42:13.757' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1225, N'Gentic Inj 80Mg Pack Size: 2ml', N'medicine.png', 181.0000, CAST(N'2022-05-05T18:42:29.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1226, N'Aika Inj 25Mg 5Amp Pack Size: 5.', N'medicine.png', 95.0000, CAST(N'2022-05-05T18:42:46.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1227, N'Aika Inj 50Mg 5Amp Pack Size: 5.', N'medicine.png', 118.0000, CAST(N'2022-05-05T18:43:17.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1228, N'Kanacyn Inj 1g 1Vial Pack Size: 1.', N'medicine.png', 142025.0000, CAST(N'2022-05-05T18:43:35.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1229, N'Kanacyn Inj 500Mg Pack Size: 1Vial', N'medicine.png', 140.0000, CAST(N'2022-05-05T18:44:01.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1230, N'Ekacin Inj 250Mg Pack Size: 1Ampx2ml', N'medicine.png', 66.0000, CAST(N'2022-05-05T18:44:20.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1231, N'Ekacin Inj 500Mg Pack Size: 1Ampx2ml', N'medicine.png', 125.0000, CAST(N'2022-05-05T18:44:33.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1232, N'Ekacin Inj 100Mg Pack Size: 1Ampx2ml', N'medicine.png', 41.0000, CAST(N'2022-05-05T18:44:52.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1233, N'Ekacin Inj 50Mg Pack Size: 1Ampx1ml', N'medicine.png', 25.0000, CAST(N'2022-05-05T18:45:09.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1234, N'Genom Inj 40Mg Pack Size: 3.', N'medicine.png', 31.0000, CAST(N'2022-05-05T18:45:28.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1235, N'Genom Inj 80Mg Pack Size: 2', N'medicine.png', 49.0000, CAST(N'2022-05-05T18:45:44.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1236, N'Geokacin Inj 100Mg Pack Size: 1.', N'medicine.png', 38.0000, CAST(N'2022-05-05T18:46:10.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1237, N'Geokacin Inj 250Mg Pack Size: 1.', N'medicine.png', 62.0000, CAST(N'2022-05-05T18:46:34.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1238, N'Geokacin Inj 500Mg Pack Size: 1.', N'medicine.png', 118.0000, CAST(N'2022-05-05T18:46:50.663' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1239, N'Bioseptic Powder 10g Pack Size: 10g', N'medicine.png', 19.0000, CAST(N'2022-05-05T18:47:15.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1240, N'Amikin Im Iv Inj 500Mg Pack Size: 1', N'medicine.png', 533.0000, CAST(N'2022-05-05T18:47:35.253' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1241, N'Bakacin Inj 100mg 1Vial Pack Size: 1.', N'medicine.png', 38.0000, CAST(N'2022-05-05T18:47:55.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1242, N'Bakacin Inj 500mg 1Vial Pack Size: 1.', N'medicine.png', 118.0000, CAST(N'2022-05-05T18:48:20.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1243, N'Gentaquin Inj 80Mg Pack Size: 2ml', N'medicine.png', 30.0000, CAST(N'2022-05-05T18:48:37.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1244, N'Mikacin Inj 500Mg Pack Size: 1''s', N'medicine.png', 118.0000, CAST(N'2022-05-05T18:48:51.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1245, N'Mikacin Inj 100Mg Pack Size: 1''s', N'medicine.png', 38.0000, CAST(N'2022-05-05T18:49:13.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1246, N'Amikaye Inj 500Mg Pack Size: 1', N'medicine.png', 349.0000, CAST(N'2022-05-05T18:49:33.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1247, N'Gentamicin Inj 80mg 2Ampx2ml Pack Size: 2Ampx2ml', N'medicine.png', 65265.0000, CAST(N'2022-05-05T18:49:48.503' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1248, N'Refobacin Inj 40mg 5Ampx1ml Pack Size: 5Ampx1ml', N'medicine.png', 130.0000, CAST(N'2022-05-05T18:50:05.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1249, N'Refobacin Inj 80mg 5Ampx2ml Pack Size: 5Ampx2ml', N'medicine.png', 193.0000, CAST(N'2022-05-05T18:50:23.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1250, N'Mink Inj 100Mg Pack Size: 1''s', N'medicine.png', 41.0000, CAST(N'2022-05-05T18:50:35.097' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1251, N'Mink Inj 250Mg Pack Size: 1''s', N'medicine.png', 66.0000, CAST(N'2022-05-05T18:50:52.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1252, N'Mink Inj 500Mg Pack Size: 1''s', N'medicine.png', 112.0000, CAST(N'2022-05-05T18:51:10.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1253, N'Microrid Inj 100mg 1Vialx2ml Pack Size: 1', N'medicine.png', 38.0000, CAST(N'2022-05-05T18:51:29.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1254, N'Tobcin Inj 20mg 1Ampx2ml Pack Size: 1.', N'medicine.png', 47.0000, CAST(N'2022-05-05T18:51:55.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1255, N'Negramin Inj 500mg 1Vialx5ml Pack Size: 1', N'medicine.png', 142.0000, CAST(N'2022-05-05T18:52:14.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1256, N'Negramin Inj 100mg 1Vialx2ml Pack Size: 1.', N'medicine.png', 52.0000, CAST(N'2022-05-05T18:52:33.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1257, N'Sefkin Inj 500mg 1Vialx2ml Pack Size: 1', N'medicine.png', 155.0000, CAST(N'2022-05-05T18:53:13.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1258, N'Sefkin Inj 250mg 1Vialx2ml Pack Size: 1', N'medicine.png', 103.0000, CAST(N'2022-05-05T18:53:31.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1259, N'Sefkin Inj 100mg 1Vialx2ml Pack Size: 1', N'medicine.png', 70.0000, CAST(N'2022-05-05T18:53:46.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1260, N'Grasil Inj 25Mg Pack Size: 5''s', N'medicine.png', 115.0000, CAST(N'2022-05-05T18:54:10.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1261, N'Grasil Inj 50Mg Pack Size: 5''s', N'medicine.png', 144.0000, CAST(N'2022-05-05T18:54:25.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1262, N'Grasil Inj 100Mg Pack Size: 1''s', N'medicine.png', 112.0000, CAST(N'2022-05-05T18:54:48.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1263, N'Grasil Inj 500Mg Pack Size: 1''s', N'medicine.png', 265.0000, CAST(N'2022-05-05T18:55:07.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1264, N'Grasil Inj 250Mg Pack Size: 1''s', N'medicine.png', 180.0000, CAST(N'2022-05-05T18:55:23.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1265, N'Grasil Inj 25mg 1Ampx1ml Pack Size: 1Ampx1ml', N'medicine.png', 31.0000, CAST(N'2022-05-05T18:55:43.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1266, N'Grasil Inj 50mg 1Ampx1ml Pack Size: 1Ampx1ml', N'medicine.png', 39.0000, CAST(N'2022-05-05T18:56:04.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1267, N'Zomacin Inj 100mg 1Vialx2ml Pack Size: 1Vialx2ml', N'medicine.png', 102.0000, CAST(N'2022-05-05T18:56:20.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1268, N'Zomacin Inj 500mg 1Vialx2ml Pack Size: 1Vialx2ml', N'medicine.png', 260.0000, CAST(N'2022-05-05T18:56:34.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1269, N'Zomacin Inj 250mg 1Vialx2ml Pack Size: 1Vialx2ml', N'medicine.png', 155.0000, CAST(N'2022-05-05T18:56:48.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1270, N'Mifate Im Iv Inj 250Mg Pack Size: 1', N'medicine.png', 66.0000, CAST(N'2022-05-05T18:57:07.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1271, N'Mifate Im Iv Inj 100Mg Pack Size: 1', N'medicine.png', 41.0000, CAST(N'2022-05-05T18:57:20.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1272, N'Mifate Im Iv Inj 500Mg Pack Size: 1', N'medicine.png', 125.0000, CAST(N'2022-05-05T18:57:39.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1273, N'Amikacin Inj 1Gm Pack Size: 1vial', N'medicine.png', 275.0000, CAST(N'2022-05-05T18:57:54.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1274, N'Amikacin Inj 250Mg Pack Size: 1vial', N'medicine.png', 78.0000, CAST(N'2022-05-05T18:58:06.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1275, N'Amikacin Inj 100Mg Pack Size: 1vial', N'medicine.png', 41.0000, CAST(N'2022-05-05T18:58:25.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1276, N'Amikacin Inj 500Mg Pack Size: 1vial', N'medicine.png', 151.0000, CAST(N'2022-05-05T18:58:40.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1277, N'Kanamycin Inj 500Mg Pack Size: 1vial', N'medicine.png', 65.0000, CAST(N'2022-05-05T18:58:53.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1278, N'Kanamycin Inj 1G Pack Size: 1vial', N'medicine.png', 91.0000, CAST(N'2022-05-05T18:59:22.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1279, N'Genticyn Inj 80Mg Pack Size: 2ampx2ml', N'medicine.png', 76.0000, CAST(N'2022-05-05T18:59:37.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1280, N'Genticyn Inj 80Mg 2Ml Pack Size: 2ml', N'medicine.png', 3815.0000, CAST(N'2022-05-05T18:59:53.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1281, N'Gentamicin Sulphate Inj 80Mg Pack Size: 100''s', N'medicine.png', 240.0000, CAST(N'2022-05-05T19:00:19.093' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1282, N'Gentamicin Sulphate Inj 80Mg Pack Size: 10''s', N'medicine.png', 24.0000, CAST(N'2022-05-05T19:00:32.853' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1283, N'Amifate Inj 100Mg Pack Size: 2ml', N'medicine.png', 41.0000, CAST(N'2022-05-05T19:00:45.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1284, N'Amifate Inj 250Mg Pack Size: 2ml', N'medicine.png', 66.0000, CAST(N'2022-05-05T19:01:01.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1285, N'Amifate Inj 500Mg Pack Size: 2ml', N'medicine.png', 125.0000, CAST(N'2022-05-05T19:01:19.097' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1286, N'Matneg Inj 80Mg Pack Size: 20''s', N'medicine.png', 80.0000, CAST(N'2022-05-05T19:01:33.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1287, N'Vastarel MR Tab 35mg 20''s Pack Size: 20''s', N'medicine.png', 396.0000, CAST(N'2022-05-05T19:04:24.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1288, N'Sivab Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 380.0000, CAST(N'2022-05-05T19:04:40.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1289, N'Herbesser Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 247.0000, CAST(N'2022-05-05T19:04:54.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1290, N'Loprin Tab 150mg 30''s Pack Size: 30''s', N'medicine.png', 60.0000, CAST(N'2022-05-05T19:05:11.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1291, N'Rancard-XR Tab 1000mg 14''s Pack Size: 14''s', N'medicine.png', 330.0000, CAST(N'2022-05-05T19:05:25.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1292, N'Nicoril Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 172.0000, CAST(N'2022-05-05T19:05:42.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1293, N'Nicoget Tab 10mg 20''s 96... Pack Size: 96.', N'medicine.png', 22891.0000, CAST(N'2022-05-05T19:06:06.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1294, N'Nicoget Tab 20mg 20''s 96... Pack Size: 96...', N'medicine.png', 3812.0000, CAST(N'2022-05-05T19:06:23.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1295, N'Sivab Tab 7.5mg 14''s 120... Pack Size: 120.', N'medicine.png', 31920.0000, CAST(N'2022-05-05T19:06:47.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1296, N'Sivab Tab 5mg 14''s 120... Pack Size: 120...', N'medicine.png', 31920.0000, CAST(N'2022-05-05T19:07:57.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1297, N'Sivab Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-05T19:08:10.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1298, N'Herbesser Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 143.0000, CAST(N'2022-05-05T19:08:24.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1299, N'Herbesser SR Cap 180mg 10''s Pack Size: 10''s', N'medicine.png', 330.0000, CAST(N'2022-05-05T19:08:39.963' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1300, N'Herbesser SR Cap 90mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-05T19:08:52.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1301, N'Ivaset Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 315.0000, CAST(N'2022-05-05T19:09:07.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1302, N'Ivaset Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-05T19:09:24.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1303, N'Ranola Tab 500mg 14''s Pack Size: 14''s', N'medicine.png', 293.0000, CAST(N'2022-05-05T19:09:37.757' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1304, N'Ranola Tab 1000mg 14''s Pack Size: 14''s', N'medicine.png', 365.0000, CAST(N'2022-05-05T19:09:49.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1305, N'Leradip Tab 10mg 14''s Pack Size: 14', N'medicine.png', 529.0000, CAST(N'2022-05-05T19:10:13.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1306, N'Etizem Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 159.0000, CAST(N'2022-05-05T19:10:26.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1307, N'Etizem SR Cap 90mg 20''s Pack Size: 20''s', N'medicine.png', 347168.0000, CAST(N'2022-05-05T19:10:39.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1308, N'Etizem Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 280896.0000, CAST(N'2022-05-05T19:10:58.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1309, N'Metazem 60 Tab 60mg 10x10''s Pack Size: 10x10''s', N'medicine.png', 638.0000, CAST(N'2022-05-05T19:11:12.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1310, N'Ivatab Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 486.0000, CAST(N'2022-05-05T19:11:25.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1311, N'Ivadin Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-05T19:11:46.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1312, N'Ivadin Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-05T19:12:00.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1313, N'Vastarel Tab 20mg 30''s Pack Size: 30''s', N'medicine.png', 184.0000, CAST(N'2022-05-05T19:12:14.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1314, N'Ranogin Tab ER 500mg 14''s Pack Size', N'medicine.png', 220.0000, CAST(N'2022-05-05T19:12:32.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1315, N'Dilcare Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 160.0000, CAST(N'2022-05-05T19:12:45.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1316, N'Dilcare Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 95.0000, CAST(N'2022-05-05T19:12:57.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1317, N'Dilcare Sr Cap 90mg 20''s Pack Size: 20''s', N'medicine.png', 185.0000, CAST(N'2022-05-05T19:13:13.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1318, N'Perlita SR Cap 90mg 2x5''s Pack Size: 10''s', N'medicine.png', 148.0000, CAST(N'2022-05-05T19:13:27.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1319, N'Diltiazaf Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 120.0000, CAST(N'2022-05-05T19:13:43.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1320, N'Diltiazaf Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 90.0000, CAST(N'2022-05-05T19:14:02.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1321, N'Diltiazaf SR Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 162.0000, CAST(N'2022-05-05T19:14:18.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1322, N'Sorbimon Tab 20mg 20''s Pack Size: 20''s', N'medicine.png', 124.0000, CAST(N'2022-05-05T19:14:33.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1323, N'Trikat MR Tab 35mg 20''s Pack Size: 20''s', N'medicine.png', 230.0000, CAST(N'2022-05-05T19:14:52.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1324, N'Ikodil Tab 10mg 10''s Pack Size: 400g', N'medicine.png', 165.0000, CAST(N'2022-05-05T19:15:06.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1325, N'Ikodil Tab 20mg 10''s Pack Size: 40gm', N'medicine.png', 275.0000, CAST(N'2022-05-05T19:15:20.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1326, N'Angiwell-XR Tab 500mg 2x7''s Pack Size:?ÿ2x7''s', N'medicine.png', 243.0000, CAST(N'2022-05-05T19:15:37.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1327, N'Angiwell-XR Tab 1000mg 2x7''s Pack Size:?ÿ2x7''s', N'medicine.png', 405.0000, CAST(N'2022-05-05T19:15:53.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1328, N'Calzem SR Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 190.0000, CAST(N'2022-05-05T19:16:10.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1329, N'Calzem Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 128.0000, CAST(N'2022-05-05T19:16:32.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1330, N'Ozac Inj 80Mg 1Vial Pack Size: 1vial', N'medicine.png', 642.0000, CAST(N'2022-05-05T19:16:47.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1331, N'Ozac Inj 20Mg 1Vial Pack Size: 30''s', N'medicine.png', 175.0000, CAST(N'2022-05-05T19:16:58.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1332, N'Ozac Inj 40Mg 1Vial Pack Size: 50''s', N'medicine.png', 290.0000, CAST(N'2022-05-05T19:17:13.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1333, N'Inderal Tab 10mg 50''s Pack Size: 50''s', N'medicine.png', 107.0000, CAST(N'2022-05-07T19:35:02.953' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1334, N'Concor Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 242.0000, CAST(N'2022-05-07T19:35:17.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1335, N'Concor Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 129.0000, CAST(N'2022-05-07T19:35:32.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1336, N'Betaloc-Zok Tab 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 711.0000, CAST(N'2022-05-07T19:35:52.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1337, N'Carveda Tab 12.5mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 350.0000, CAST(N'2022-05-07T19:36:05.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1338, N'Merol Tab 25mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 66.0000, CAST(N'2022-05-07T19:36:17.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1339, N'Tenormin Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 132.0000, CAST(N'2022-05-07T19:36:30.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1340, N'Labetalol Tab 100mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 149.0000, CAST(N'2022-05-07T19:36:43.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1341, N'Labetalol HCl Inj 50mg 1Vialx10ml Pack Size: 1vialx10ml', N'medicine.png', 36.0000, CAST(N'2022-05-07T19:36:56.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1342, N'Labetalol HCl Inj 50mg 1Vialx10ml Pack Size: 1vialx10ml', N'medicine.png', 150.0000, CAST(N'2022-05-07T19:37:13.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1343, N'Nebil Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 226.0000, CAST(N'2022-05-07T19:37:26.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1344, N'Safcor Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 105.0000, CAST(N'2022-05-07T19:37:40.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1345, N'Monitor Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T19:37:55.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1346, N'Atlin Tab 100mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 114.0000, CAST(N'2022-05-07T19:38:10.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1347, N'Sopral Plus Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 91.0000, CAST(N'2022-05-07T19:38:22.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1348, N'Atenorm Tab 50mg 2x7''s Pack Size: 14''s', N'medicine.png', 55.0000, CAST(N'2022-05-07T19:38:37.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1349, N'Carveda Tab 6.25mg 3x10''s Pack Size: 2x10''s', N'medicine.png', 238.0000, CAST(N'2022-05-07T19:38:50.803' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1350, N'Carveda Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 213.0000, CAST(N'2022-05-07T19:39:06.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1351, N'Nebil Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T19:39:21.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1352, N'Blokium DIU Tab 50mg/12.5mg 20''s Pack Size: 60ml', N'medicine.png', 170.0000, CAST(N'2022-05-07T19:39:35.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1353, N'Nebix Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 237.0000, CAST(N'2022-05-07T19:39:49.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1354, N'Tenormin Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 129.0000, CAST(N'2022-05-07T19:41:27.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1355, N'Tenormin Tab 25mg 14''s Pack Size: 14''s', N'medicine.png', 70.0000, CAST(N'2022-05-07T19:41:42.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1356, N'Hart Tab 12.5mg 10''s Pack Size: 30''s', N'medicine.png', 70.0000, CAST(N'2022-05-07T19:42:04.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1357, N'Blokium DIU Tab 100mg/25mg 20''s Pack Size: 7''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T19:42:42.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1358, N'Merol Tab 50mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 121.0000, CAST(N'2022-05-07T19:42:55.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1359, N'Merol IV Inj 5mg 5Ampx5ml Pack Size: 5ampx5ml', N'medicine.png', 283.0000, CAST(N'2022-05-07T19:43:07.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1360, N'Merol Tab 100mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 183.0000, CAST(N'2022-05-07T19:43:20.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1361, N'Vedicar Tab 12.5mg 10''s Pack Size: 10''s', N'medicine.png', 126.0000, CAST(N'2022-05-07T19:43:33.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1362, N'Vedicar Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 218.0000, CAST(N'2022-05-07T19:43:47.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1363, N'Vedicar Tab 6.25mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 237.0000, CAST(N'2022-05-07T19:44:01.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1364, N'Barilol Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 54.0000, CAST(N'2022-05-07T19:44:15.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1365, N'Barilol Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 237.0000, CAST(N'2022-05-07T19:44:30.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1366, N'Vedicar Tab 3.12mg 10''s Pack Size: 10''s', N'medicine.png', 62.0000, CAST(N'2022-05-07T19:44:43.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1367, N'Nebicare Tab 2.5mg 14''s Pack Size:', N'medicine.png', 117.0000, CAST(N'2022-05-07T19:44:55.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1368, N'Nebicare Tab 5mg 14''s Pack Size: 14sNebicare Tab 5mg 14''s Pack Size: 14s', N'medicine.png', 191.0000, CAST(N'2022-05-07T19:45:06.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1369, N'Nebicare Tab 10mg 14''s Pack Size: 14sManufacturer', N'medicine.png', 296.0000, CAST(N'2022-05-07T19:45:20.743' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1370, N'Atlin Tab 25mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 56.0000, CAST(N'2022-05-07T19:45:33.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1371, N'Caricard Tab 100mg 1x10''s Pack Size: 10''s', N'medicine.png', 65.0000, CAST(N'2022-05-07T19:45:47.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1372, N'Sopral Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 214.0000, CAST(N'2022-05-07T19:46:01.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1373, N'Sopral Plus Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 214.0000, CAST(N'2022-05-07T19:46:18.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1374, N'Sopral Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 36803.0000, CAST(N'2022-05-07T19:46:46.973' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1375, N'Sopral Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 133.0000, CAST(N'2022-05-07T19:47:00.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1376, N'Sopral Tab 2.5mg 2x10''s Pack Size: 20''s', N'medicine.png', 39.0000, CAST(N'2022-05-07T19:47:12.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1377, N'Tacar Tab 12.5mg 3x10''s Pack Size: 30''s', N'medicine.png', 180.0000, CAST(N'2022-05-07T19:47:24.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1378, N'Tacar Tab 25mg 1x10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T19:47:39.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1379, N'Tacar Tab 6.25mg 3x10''s Pack Size: 30''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T19:47:52.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1380, N'Corbis Tab 2.5mg 20''s Pack Size: 20''s', N'medicine.png', 62.0000, CAST(N'2022-05-07T19:48:06.923' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1381, N'Corbis Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 172.0000, CAST(N'2022-05-07T19:48:25.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1382, N'Corbis Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 320.0000, CAST(N'2022-05-07T19:49:07.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1383, N'Corbis-H Tab 10mg/6.25mg 20''s Pack Size: 20''s', N'medicine.png', 318.0000, CAST(N'2022-05-07T19:49:20.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1384, N'Corbis-H Tab 5mg/6.25mg 20''s Pack Size: 20''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T19:49:34.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1385, N'Cartac tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 56.0000, CAST(N'2022-05-07T19:49:46.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1386, N'Cartac Tab 50mg 20''s Pack Size: 20''s', N'medicine.png', 88.0000, CAST(N'2022-05-07T19:49:58.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1387, N'Cartac Tab 100mg 20''s Pack Size: 20''s', N'medicine.png', 153.0000, CAST(N'2022-05-07T19:50:13.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1388, N'Cartac Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 95.0000, CAST(N'2022-05-07T19:50:26.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1389, N'Atenorm Tab 100mg 2x10''s Pack Size: 20''s', N'medicine.png', 138.0000, CAST(N'2022-05-07T19:50:41.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1390, N'Carveda Tab 3.125mg 1x10''s Pack Size: 10''s', N'medicine.png', 88.0000, CAST(N'2022-05-07T19:50:55.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1391, N'Hypernol Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 123975.0000, CAST(N'2022-05-07T19:51:19.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1392, N'Hypernol Tab 50mg 2x10''s Pack Size: 20''s', N'medicine.png', 71.0000, CAST(N'2022-05-07T19:51:34.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1393, N'Nebil Tab 2.5mg 14''s 144... Pack Size: 144', N'medicine.png', 0.0000, CAST(N'2022-05-07T19:51:50.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1394, N'Nebil Tab 5mg 14''s 144... Pack Size: 144...', N'medicine.png', 155.0000, CAST(N'2022-05-07T19:52:03.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1395, N'Hidilol Tab 12.5mg 1x10''s Pack Size: 10''s', N'medicine.png', 60.0000, CAST(N'2022-05-07T19:52:18.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1396, N'Hidilol Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 137.0000, CAST(N'2022-05-07T19:52:32.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1397, N'Blokium DIU Tab 100mg/25mg 20''s Pack Size: 7''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T19:52:45.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1398, N'Blokium 100 Tab 100mg 20''s Pack Size: 200''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T19:52:56.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1399, N'Blokium 25 Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 113.0000, CAST(N'2022-05-07T19:53:08.057' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1400, N'Blokium 50 Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 210.0000, CAST(N'2022-05-07T19:53:20.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1401, N'Nebix Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 116.0000, CAST(N'2022-05-07T19:53:35.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1402, N'Nebix Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 394.0000, CAST(N'2022-05-07T19:53:51.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1403, N'Carlov Tab 6.25mg 30''s Pack Size: 30''s', N'medicine.png', 325.0000, CAST(N'2022-05-07T19:54:19.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1404, N'Carlov Tab 6.25mg 30''s Pack Size: 30''s', N'medicine.png', 235.0000, CAST(N'2022-05-07T19:54:32.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1405, N'Carlov Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 205.0000, CAST(N'2022-05-07T19:54:52.603' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1406, N'Carlov Tab 12.5mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T19:55:13.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1407, N'Carlov Tab 3.125mg 10''s Pack Size: 10''s', N'medicine.png', 70.0000, CAST(N'2022-05-07T19:55:26.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1408, N'Tenoret-50 Tab 14''s Pack Size: 14''s', N'medicine.png', 0.0000, CAST(N'2022-05-07T19:55:41.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1409, N'Safecard Blister Tab 50mg 2x10''s Pack Size: 20''s', N'medicine.png', 57.0000, CAST(N'2022-05-07T19:55:56.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1410, N'Safecard Blister Tab 50mg 2x10''s Pack Size: 20''s', N'medicine.png', 95.0000, CAST(N'2022-05-07T19:56:10.883' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1411, N'Hart Tab 6.25mg 30''s Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-07T19:56:22.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1412, N'Concor Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 411.0000, CAST(N'2022-05-07T19:56:38.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1413, N'Dilatrend Tab 6.25mg 10''s Pack Size: 10''s', N'medicine.png', 131.0000, CAST(N'2022-05-07T19:56:51.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1414, N'Dilatrend Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 1800.0000, CAST(N'2022-05-07T19:57:12.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1415, N'Probase Tab 5mg 2x10''s Pack Size: 20...', N'medicine.png', 200.0000, CAST(N'2022-05-07T19:57:24.807' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1416, N'Probase Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 240.0000, CAST(N'2022-05-07T19:57:36.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1417, N'Carpro Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T19:57:51.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1418, N'Normitab Tab 50mg 28''s Pack Size: 28''s', N'medicine.png', 154.0000, CAST(N'2022-05-07T19:58:05.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1419, N'Normitab Tab 50mg 28''s Pack Size: 28''s', N'medicine.png', 77.0000, CAST(N'2022-05-07T19:58:18.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1420, N'Normitab Tab 100mg 28''s Pack Size: 28''s', N'medicine.png', 164.0000, CAST(N'2022-05-07T19:58:32.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1421, N'Normitab Plus Tab 50mg/12.5mg 14''s Pack Size: 14''s', N'medicine.png', 113.0000, CAST(N'2022-05-07T19:58:45.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1422, N'Mepresor SR Tab 200mg 3x10''s Pack Size: 30''s', N'medicine.png', 479.0000, CAST(N'2022-05-07T19:59:00.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1423, N'Mepresor Tab 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 286.0000, CAST(N'2022-05-07T19:59:13.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1424, N'Valvozid Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 103.0000, CAST(N'2022-05-07T19:59:29.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1425, N'Valvizid Plus Tab 5mg 1x14''s Pack Size', N'medicine.png', 103.0000, CAST(N'2022-05-07T19:59:45.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1426, N'MINOCARD Tab 50mg 20''s Pack Size: 20''sMarketed...', N'medicine.png', 50.0000, CAST(N'2022-05-07T19:59:57.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1427, N'MINOCARD Tab 100mg 20''s Pack Size: 20''sMarketed..', N'medicine.png', 124.0000, CAST(N'2022-05-07T20:00:10.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1428, N'MINOCARD Tab 100mg 20''s Pack Size: 20''sMarketed..', N'medicine.png', 124.0000, CAST(N'2022-05-07T20:00:27.923' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1429, N'Byvas Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 206.0000, CAST(N'2022-05-07T20:00:45.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1430, N'Byvas Tab 10mg 14''s Pack Size: 14...', N'medicine.png', 342.0000, CAST(N'2022-05-07T20:02:36.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1431, N'Cardaxen Tab 100mg 2x10''s Pack Size: 20''s', N'medicine.png', 175.0000, CAST(N'2022-05-07T20:02:50.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1432, N'Cardaxen Tab 25mg 2x10''s Pack Size: 20''s', N'medicine.png', 85.0000, CAST(N'2022-05-07T20:03:03.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1433, N'Cardaxen Tab 50mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 115.0000, CAST(N'2022-05-07T20:03:17.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1434, N'Betanol Tab 10mg 50''s 540... Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-07T20:03:44.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1435, N'Betanol Tab 10mg 50''s 540... Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-07T20:04:00.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1436, N'Safcor Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 125.0000, CAST(N'2022-05-07T20:04:15.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1437, N'Safcor Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 34.0000, CAST(N'2022-05-07T20:04:31.663' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1438, N'Actim Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 210.0000, CAST(N'2022-05-07T20:04:43.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1439, N'Actim Tab 2.5mg 20''s Pack Size: 20''s', N'medicine.png', 61.0000, CAST(N'2022-05-07T20:04:56.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1440, N'Actim Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 128.0000, CAST(N'2022-05-07T20:05:08.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1441, N'Byscard Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 116.0000, CAST(N'2022-05-07T20:05:21.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1442, N'Byscard Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 215.0000, CAST(N'2022-05-07T20:05:39.593' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1443, N'Biscot Tab 2.5mg 14''s Pack Size: 1x14''S', N'medicine.png', 49.0000, CAST(N'2022-05-07T20:05:54.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1444, N'Biscot Tab 10mg 14''s Pack Size: 1x14''S', N'medicine.png', 156.0000, CAST(N'2022-05-07T20:06:12.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1445, N'Biscot Tab 5mg 14''s Pack Size: 1x14''S', N'medicine.png', 97.0000, CAST(N'2022-05-07T20:06:27.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1446, N'Nobu Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 148.0000, CAST(N'2022-05-07T20:06:41.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1447, N'Nobu Tab 2.5mg 10''s Pack Size: 10''s', N'medicine.png', 86.0000, CAST(N'2022-05-07T20:06:54.533' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1448, N'Jingle Tab 25mg 20''s Pack Size: 2x10sJingle Tab 25mg 20''s Pack Size: 2x10s', N'medicine.png', 35.0000, CAST(N'2022-05-07T20:07:08.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1449, N'Jingle Tab 100mg 20''s Pack Size: 2x10s', N'medicine.png', 120.0000, CAST(N'2022-05-07T20:07:21.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1450, N'Jingle Tab 50mg 20''s Pack Size: 2x10s', N'medicine.png', 65.0000, CAST(N'2022-05-07T20:07:34.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1451, N'Monocor Tab 10mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 182.0000, CAST(N'2022-05-07T20:07:51.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1452, N'Monocor Tab 5mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 109.0000, CAST(N'2022-05-07T20:08:03.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1453, N'Nebivol Tab 2.5mg 14''s Pack Size', N'medicine.png', 120.0000, CAST(N'2022-05-07T20:08:23.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1454, N'Nebivol Tab 10mg 14''s Pack Size', N'medicine.png', 290.0000, CAST(N'2022-05-07T20:32:04.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1455, N'Nebivol Tab 10mg 14''s Pack Size', N'medicine.png', 185.0000, CAST(N'2022-05-07T20:32:21.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1456, N'Monitor Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 64.0000, CAST(N'2022-05-07T20:32:33.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1457, N'Monitor Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 315.0000, CAST(N'2022-05-07T20:32:46.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1458, N'Pulse Tab 25mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 40.0000, CAST(N'2022-05-07T20:32:56.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1459, N'Pulse Tab 100mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 135.0000, CAST(N'2022-05-07T20:33:07.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1460, N'Pulse Tab 50mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 75.0000, CAST(N'2022-05-07T20:33:21.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1461, N'Betanorm Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-07T20:33:36.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1462, N'Betanorm Tab 2.5mg 10''s Pack Size: 10''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T20:33:49.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1463, N'Wilnormin Tab 50mg 2x10''s', N'medicine.png', 48.0000, CAST(N'2022-05-07T20:34:08.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1464, N'Wilnormin Tab 100mg 2x10''s Pack Size: 20''s', N'medicine.png', 81.0000, CAST(N'2022-05-07T20:35:21.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1465, N'Otello Tab 12.5mg 3x10''s Pack Size: 30''s', N'medicine.png', 352.0000, CAST(N'2022-05-07T20:35:37.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1466, N'Otello Tab 6.25mg 3x10''s Pack Size: 30''s', N'medicine.png', 225.0000, CAST(N'2022-05-07T20:35:51.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1467, N'Nib Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 130.0000, CAST(N'2022-05-07T20:36:03.093' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1468, N'Nib Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 218.0000, CAST(N'2022-05-07T20:36:15.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1469, N'Nib Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 266.0000, CAST(N'2022-05-07T20:36:28.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1470, N'Alt Tab 100mg 20''S Pack Size: 14''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T20:36:39.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1471, N'Alt Tab 50mg 20''S Pack Size: 14''s', N'medicine.png', 74.0000, CAST(N'2022-05-07T20:36:54.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1472, N'Atenolol Tab 100mg 20''s Pack Size: 20''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T20:37:10.433' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1473, N'Zafnol Tab 50mg 20''s Pack Size: 20''s', N'medicine.png', 50.0000, CAST(N'2022-05-07T20:37:23.567' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1474, N'Zafnol Tab 50mg 10''s Pack Size: 10''s', N'medicine.png', 31.0000, CAST(N'2022-05-07T20:37:36.337' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1475, N'Controbeat Tab 100mg 20''s Pack Size: 20''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T20:37:56.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1476, N'Controbeat Tab 25mg 20''s Pack Size: 20''s', N'medicine.png', 51.0000, CAST(N'2022-05-07T20:38:12.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1477, N'Controbeat Tab 50mg 20''s Pack Size: 20''s', N'medicine.png', 74.0000, CAST(N'2022-05-07T20:38:27.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1478, N'Ethinolol Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 43.0000, CAST(N'2022-05-07T20:38:49.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1479, N'Ethinolol Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 26.0000, CAST(N'2022-05-07T20:39:03.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1480, N'Anvol Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 119.0000, CAST(N'2022-05-07T20:41:13.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1481, N'Anvol Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 219.0000, CAST(N'2022-05-07T20:41:46.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1482, N'Anvol Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 328.0000, CAST(N'2022-05-07T20:42:04.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1483, N'Actiprolol Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 75.0000, CAST(N'2022-05-07T20:42:18.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1484, N'Actiprolol Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 75.0000, CAST(N'2022-05-07T20:47:58.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1485, N'Actiprolol Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 125.0000, CAST(N'2022-05-07T20:48:17.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1486, N'Cara-Prop Tab 10mg 5x10''s Pack Size: 50''s', N'medicine.png', 40.0000, CAST(N'2022-05-07T20:48:41.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1487, N'Cara-Prop Tab 10mg 5x10''s Pack Size: 50''s', N'medicine.png', 40.0000, CAST(N'2022-05-07T20:48:41.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1488, N'Cara-Prop Tab 40mg 50''s Pack Size: 51vialx2ml', N'medicine.png', 88.0000, CAST(N'2022-05-07T20:50:04.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1489, N'Slective Tab 50mg 2x10''s Pack Size: 30g', N'medicine.png', 74.0000, CAST(N'2022-05-07T20:50:23.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1490, N'Cardat 100mg 2x10''s Pack Size: 20''s', N'medicine.png', 127.0000, CAST(N'2022-05-07T20:50:46.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1491, N'Cardat 50mg 2x10''s Pack Size: 20''s', N'medicine.png', 94.0000, CAST(N'2022-05-07T20:50:58.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1492, N'Bispa Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 133.0000, CAST(N'2022-05-07T20:51:13.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1493, N'Bispa Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 34.0000, CAST(N'2022-05-07T20:51:27.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1494, N'Bispa Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 240.0000, CAST(N'2022-05-07T20:51:40.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1495, N'Sofvasc-V Tab 5mg/80mg 14''s Pack Size: 14''s', N'medicine.png', 312.0000, CAST(N'2022-05-07T20:54:27.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1496, N'Calan SR Tab 240mg 10''s Pack Size: 10...', N'medicine.png', 97.0000, CAST(N'2022-05-07T20:54:42.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1497, N'Extor Tab 5mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 412.0000, CAST(N'2022-05-07T20:54:56.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1498, N'Nifedil Cap 10mg 30''s Pack Size: 30''s', N'medicine.png', 71.0000, CAST(N'2022-05-07T20:55:10.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1499, N'Caprinza Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 86.0000, CAST(N'2022-05-07T20:55:23.767' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1500, N'AM Descol Tab 10mg/10mg 14''s Pack Size: 14''s', N'medicine.png', 265.0000, CAST(N'2022-05-07T20:55:37.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1501, N'Norvasc Tab 5mg 30''s Pack Size: 30''s', N'medicine.png', 461.0000, CAST(N'2022-05-07T20:55:52.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1502, N'Onato Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 135.0000, CAST(N'2022-05-07T20:56:06.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1503, N'Extor Tab 10mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 493.0000, CAST(N'2022-05-07T20:56:20.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1504, N'Sofvasc Tab 5mg 1x30''s Pack Size: 30''s', N'medicine.png', 276.0000, CAST(N'2022-05-07T20:56:35.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1505, N'Dioplus Tab 5mg/80mg 14''s Pack Size: 14''s', N'medicine.png', 322.0000, CAST(N'2022-05-07T20:56:48.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1506, N'Ampress Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 298.0000, CAST(N'2022-05-07T20:57:01.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1507, N'Nimotop Inf 10mg 1Vialx50ml Pack Size: 1vialx50ml', N'medicine.png', 965.0000, CAST(N'2022-05-07T20:57:20.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1508, N'Neopres Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 109.0000, CAST(N'2022-05-07T20:57:34.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1509, N'Covam Tab 10mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 552.0000, CAST(N'2022-05-07T20:57:48.767' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1510, N'Covam Tab 5mg/80mg 14''s Pack Size: 14''s', N'medicine.png', 343.0000, CAST(N'2022-05-07T20:58:05.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1511, N'Covam Tab 5mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 376.0000, CAST(N'2022-05-07T20:58:19.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1512, N'Herbesser Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 247.0000, CAST(N'2022-05-07T20:58:36.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1513, N'Nimoden Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 560.0000, CAST(N'2022-05-07T20:58:52.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1514, N'Dowter Tab 5mg/80mg 14''s Pack Size: 14..', N'medicine.png', 266.0000, CAST(N'2022-05-07T20:59:06.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1515, N'Dowter Tab 5mg/80mg 14''s Pack Size: 14..', N'medicine.png', 115.0000, CAST(N'2022-05-07T20:59:19.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1516, N'Caduet Tab 5mg/20mg 7''s Pack Size: 7''s', N'medicine.png', 780.0000, CAST(N'2022-05-07T20:59:35.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1517, N'Extor Tab 5mg/80mg 14''s Pack Size: 14''s', N'medicine.png', 313.0000, CAST(N'2022-05-07T20:59:49.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1518, N'Oscar Plus Tab 5mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T21:00:03.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1519, N'Caprinza Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T21:00:26.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1520, N'Sofvasc-V Tab 5mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 446.0000, CAST(N'2022-05-07T21:00:39.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1521, N'Nifedil SG-10 Cap 10mg 3x10''s Pack Size: 30''s', N'medicine.png', 70.0000, CAST(N'2022-05-07T21:00:54.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1522, N'Zamlo Tab 5mg 20''s Pack Size: 2x10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T21:01:10.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1523, N'Zodip Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 53.0000, CAST(N'2022-05-07T21:01:24.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1524, N'Zodip Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 95.0000, CAST(N'2022-05-07T21:01:39.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1525, N'Dioplus Tab 10mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 540.0000, CAST(N'2022-05-07T21:01:57.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1526, N'Dioplus Tab 5mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 461.0000, CAST(N'2022-05-07T21:02:10.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1527, N'Dioplus Tab 5mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T21:02:24.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1528, N'Vastor-Am Tab 5mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 193.0000, CAST(N'2022-05-07T21:02:38.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1529, N'Vastor-Am Tab 5mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T21:02:52.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1530, N'Neopres Tab 5mg 2x10''s Pack Size: 10''s', N'medicine.png', 62.0000, CAST(N'2022-05-07T21:03:08.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1531, N'Caloc Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 420.0000, CAST(N'2022-05-07T21:03:22.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1532, N'Caloc Tab 5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T21:03:36.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1533, N'Coram Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T21:03:54.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1534, N'Coram Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 75.0000, CAST(N'2022-05-07T21:04:12.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1535, N'Corsafe Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 228.0000, CAST(N'2022-05-07T21:04:27.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1536, N'Corsafe Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 124.0000, CAST(N'2022-05-07T21:04:44.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1537, N'Corsafe AT Tab 5mg/10mg 1x10''s Pack Size: 10''s', N'medicine.png', 133.0000, CAST(N'2022-05-07T21:04:59.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1538, N'Corsafe AT Tab 5mg/20mg 2x10''s Pack Size: 20''s', N'medicine.png', 285.0000, CAST(N'2022-05-07T21:05:14.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1539, N'Hypress Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 118.0000, CAST(N'2022-05-07T21:05:27.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1540, N'Hypress Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 208.0000, CAST(N'2022-05-07T21:05:43.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1541, N'Valcard Tablets 5/160Mg Pack Size: 28''s', N'medicine.png', 700.0000, CAST(N'2022-05-07T21:05:56.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1542, N'Valcard Tab 5/80mg 20''s Pack Size: 20''s', N'medicine.png', 360.0000, CAST(N'2022-05-07T21:06:11.083' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1543, N'Valcard Tablets 10/160mg 28''s Pack Size: 28''s', N'medicine.png', 840.0000, CAST(N'2022-05-07T21:06:35.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1544, N'840Endip Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 90.0000, CAST(N'2022-05-07T21:07:00.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1545, N'Endip Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T21:07:13.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1546, N'Combitrol Tab 10mg/20mg 10''s Pack Size: 10''s', N'medicine.png', 271.0000, CAST(N'2022-05-07T21:07:28.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1547, N'Covance Tab 10mg/160mg 14''s Pack Size: 1x14''s', N'medicine.png', 338.0000, CAST(N'2022-05-07T21:07:42.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1548, N'Covance Tab 5mg/160mg 14''s Pack Size: 1x14''s', N'medicine.png', 285.0000, CAST(N'2022-05-07T21:07:58.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1549, N'Covance Tab 5mg/80mg 14''s Pack Size: 1x14''s', N'medicine.png', 210.0000, CAST(N'2022-05-07T21:08:12.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1550, N'Cadwin Tab 10mg/10mg 14''s 160... Pack Size: 160...', N'medicine.png', 34238.0000, CAST(N'2022-05-07T21:08:31.433' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1551, N'Cadwin Tab 5mg/10mg 7''s 160... Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-07T21:09:05.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1552, N'Valsar-M Tab 10mg/160mg 2x7''s Pack Size: 14''s', N'medicine.png', 461.0000, CAST(N'2022-05-07T21:09:25.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1553, N'Valsar-M Tab 5mg/80mg 2x7''s Pack Size: 14''s', N'medicine.png', 278.0000, CAST(N'2022-05-07T21:09:42.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1554, N'Valsar-M Tab 5mg/160mg 2x7''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-07T21:09:58.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1555, N'Herbesser Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T21:10:15.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1556, N'Herbesser SR Cap 180mg 10''s Pack Size: 10''s', N'medicine.png', 330.0000, CAST(N'2022-05-07T21:10:30.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1557, N'Herbesser SR Cap 90mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-07T21:10:44.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1558, N'Amlo-Q Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 212.0000, CAST(N'2022-05-07T21:11:04.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1559, N'Cardiosil Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 254.0000, CAST(N'2022-05-07T21:11:22.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1560, N'Cardiosil Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 490.0000, CAST(N'2022-05-07T21:11:35.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1561, N'Cardiosil Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 265.0000, CAST(N'2022-05-07T21:11:50.567' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1562, N'Cardiosil Plus Tab 5mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 354.0000, CAST(N'2022-05-07T21:12:04.787' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1563, N'Cardiosil Plus Tab 10mg/160mg 14''s Pack Size', N'medicine.png', 443.0000, CAST(N'2022-05-07T21:12:18.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1564, N'Etizem Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T21:12:33.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1565, N'Etizem SR Cap 90mg 20''s Pack Size: 20''s', N'medicine.png', 347168.0000, CAST(N'2022-05-07T21:12:52.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1566, N'Etizem Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 280896.0000, CAST(N'2022-05-07T21:13:30.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1567, N'Valday Tab 5mg/80mg Pack Size: 14''s', N'medicine.png', 237.0000, CAST(N'2022-05-07T21:14:22.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1568, N'Valday Tab 5mg/160mg Pack Size: 14''s', N'medicine.png', 333.0000, CAST(N'2022-05-07T21:14:36.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1569, N'Valday Tab 10mg/160mg Pack Size: 14''s', N'medicine.png', 399.0000, CAST(N'2022-05-07T21:14:50.307' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1570, N'I-Vasc Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 86.0000, CAST(N'2022-05-07T21:15:04.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1571, N'I-Vasc Tab 10mg 2x10''s Pack Size: 20''sI-Vasc Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 138.0000, CAST(N'2022-05-07T21:15:21.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1572, N'Salome Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 163.0000, CAST(N'2022-05-07T21:15:37.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1573, N'Lodopin Tab 2.5mg 2x10''s Pack Size: 20''s', N'medicine.png', 118.0000, CAST(N'2022-05-07T21:15:51.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1574, N'Lodopin Tab 2.5mg 2x10''s Pack Size: 20''s', N'medicine.png', 180.0000, CAST(N'2022-05-07T21:16:08.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1575, N'Lodopin Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 134.0000, CAST(N'2022-05-07T21:16:23.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1576, N'Dowter Tab 5mg/160mg 14''s Pack Size', N'medicine.png', 378.0000, CAST(N'2022-05-07T21:16:39.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1577, N'Amodip Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 400.0000, CAST(N'2022-05-07T21:16:55.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1578, N'Metazem 60 Tab 60mg 10x10''s Pack Size: 10x10''s', N'medicine.png', 638.0000, CAST(N'2022-05-07T21:17:12.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1579, N'Amdipine Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 210.0000, CAST(N'2022-05-07T21:17:26.743' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1580, N'Amdipine Tab 5mg 30''s Pack Size: 30''s', N'medicine.png', 177.0000, CAST(N'2022-05-07T21:17:40.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1581, N'Quvasc Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 184.0000, CAST(N'2022-05-07T21:18:00.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1582, N'Quvasc Tab 2.5mg 20''s Pack Size: 20''s', N'medicine.png', 117.0000, CAST(N'2022-05-07T21:18:19.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1583, N'Quvasc Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 347.0000, CAST(N'2022-05-07T21:18:36.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1584, N'AMlOBEST Tab 5mg 20''s Pack Size: 20''sMarketed...', N'medicine.png', 80.0000, CAST(N'2022-05-07T21:18:49.933' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1585, N'AMlOBEST Tab 10mg 20''s Pack Size: 20''sMarketed...', N'medicine.png', 165.0000, CAST(N'2022-05-07T21:19:09.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1586, N'DURANIM Cap 30mg 30''s Pack Size: 30''s', N'medicine.png', 530.0000, CAST(N'2022-05-07T21:19:29.097' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1587, N'Norvasc Tab 10mg 20''s Pack Size', N'medicine.png', 467.0000, CAST(N'2022-05-07T21:19:47.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1588, N'Norvasc Tab 5mg 20''s Pack Size', N'medicine.png', 239.0000, CAST(N'2022-05-07T21:20:04.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1589, N'Norvasc Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 930.0000, CAST(N'2022-05-07T21:20:19.553' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1590, N'Vassodip Tab 5mg/10mg 1x10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T21:20:34.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1591, N'Vassodip Tab 5mg/20mg 1x10''s Pack Size: 10''s', N'medicine.png', 257.0000, CAST(N'2022-05-07T21:20:59.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1592, N'Amlocard 5 Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 184.0000, CAST(N'2022-05-07T21:21:14.177' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1593, N'Amlocard 10 Tab 10mg 20''s Pack Size', N'medicine.png', 360.0000, CAST(N'2022-05-07T21:21:36.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1594, N'Valmo Tab 5mg/80mg 14''s Pack Size: 5''s', N'medicine.png', 329.0000, CAST(N'2022-05-07T21:21:57.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1595, N'Valmo Tab 5mg/160mg 14''s Pack Size: 30ml', N'medicine.png', 455.0000, CAST(N'2022-05-07T21:22:26.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1596, N'Valmo Tab 10mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 502.0000, CAST(N'2022-05-07T21:22:42.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1597, N'Amlocard 2.5 Tab 2.5mg 20''s Pack Size: 20''s', N'medicine.png', 89.0000, CAST(N'2022-05-07T21:23:00.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1598, N'Telsarta A Tab 5/40mg 14''s Pack Size: 10''s', N'medicine.png', 318.0000, CAST(N'2022-05-07T21:23:13.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1599, N'Telsarta A Tab 10/40mg 10''s Pack Size: 10''s', N'medicine.png', 238.0000, CAST(N'2022-05-07T21:23:30.180' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1600, N'Telsarta A Tab 5/80mg 14''s Pack Size: 14''s', N'medicine.png', 476.0000, CAST(N'2022-05-07T22:09:16.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1601, N'Telsarta A Tab 10/80mg 10''s Pack Size: 10''s', N'medicine.png', 311.0000, CAST(N'2022-05-07T22:09:31.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1602, N'Cabok Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 207.0000, CAST(N'2022-05-07T22:09:47.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1603, N'Cabok Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 207.0000, CAST(N'2022-05-07T22:10:12.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1604, N'Cabok Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 138.0000, CAST(N'2022-05-07T22:10:28.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1605, N'Ravapine Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 39.0000, CAST(N'2022-05-07T22:10:45.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1606, N'Ravapine Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 102.0000, CAST(N'2022-05-07T22:10:58.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1607, N'Hypotin Tab 5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 109.0000, CAST(N'2022-05-07T22:11:14.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1608, N'Hypotin Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 145.0000, CAST(N'2022-05-07T22:11:30.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1609, N'Onato Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 141.0000, CAST(N'2022-05-07T22:11:49.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1610, N'Lodipin-5 Tab 5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 166.0000, CAST(N'2022-05-07T22:12:07.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1611, N'Calan Tab 40mg 50''s Pack Size: 50''s', N'medicine.png', 86.0000, CAST(N'2022-05-07T22:12:21.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1612, N'Calan Tab 80mg 50''s Pack Size: 50''s', N'medicine.png', 139.0000, CAST(N'2022-05-07T22:12:37.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1613, N'Address Tab 5/80mg 14''s Pack Size: 14''s', N'medicine.png', 231.0000, CAST(N'2022-05-07T22:12:55.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1614, N'Address Tab 5/160mg 14''s Pack Size: 14''s', N'medicine.png', 305.0000, CAST(N'2022-05-07T22:13:08.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1615, N'Address Tab 10/160mg 14''s Pack Size: 14''s', N'medicine.png', 335.0000, CAST(N'2022-05-07T22:13:23.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1616, N'Oscar Plus Tab 5/20mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-07T22:13:59.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1617, N'Leaf Tab 5mg 30''s Pack Size: 3x10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T22:14:12.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1618, N'Leaf Tab 10mg 30''s Pack Size: 3x10''s', N'medicine.png', 180.0000, CAST(N'2022-05-07T22:14:28.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1619, N'Amlopin Tab 5mg 20''s Pack Size: 20''s', N'medicine.png', 157.0000, CAST(N'2022-05-07T22:14:44.883' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1620, N'Corcont Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 75.0000, CAST(N'2022-05-07T22:14:59.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1621, N'Corcont Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T22:15:24.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1622, N'Valtec AM Tab 5mg/80mg 28''s Pack Size: 28''a', N'medicine.png', 490.0000, CAST(N'2022-05-07T22:15:40.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1623, N'Benzor AM Tab 40/5mg 20''s Pack Size', N'medicine.png', 260.0000, CAST(N'2022-05-07T22:15:57.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1624, N'Benzor AM Tab 20/5mg 20''s Pack Size', N'medicine.png', 160.0000, CAST(N'2022-05-07T22:16:12.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1625, N'Benzor AM Tab 20/10mg 20''s Pack Size', N'medicine.png', 180.0000, CAST(N'2022-05-07T22:16:38.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1626, N'Benzor AM Tab 40/10mg 20''s Pack Size', N'medicine.png', 280.0000, CAST(N'2022-05-07T22:16:52.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1627, N'Anam Tab 5mg 2x10''s Pack Size', N'medicine.png', 75.0000, CAST(N'2022-05-07T22:17:06.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1628, N'Anam Tab 10mg 2x10''s Pack Size', N'medicine.png', 140.0000, CAST(N'2022-05-07T22:17:20.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1629, N'Dilcare Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T22:17:34.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1630, N'Dilcare Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 95.0000, CAST(N'2022-05-07T22:17:50.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1631, N'Dilcare Sr Cap 90mg 20''s Pack Size: 20''s', N'medicine.png', 185.0000, CAST(N'2022-05-07T22:18:04.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1632, N'Cardiovasc Tab 5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 174.0000, CAST(N'2022-05-07T22:18:20.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1633, N'Cardiovasc Tab 2.5mg 2x10''s Pack Size: 20''s', N'medicine.png', 43.0000, CAST(N'2022-05-07T22:18:35.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1634, N'Cardiovasc Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 153.0000, CAST(N'2022-05-07T22:18:51.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1635, N'Caprisk Tab 10mg/20mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 570.0000, CAST(N'2022-05-07T22:19:05.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1636, N'Caprisk Tab 5mg/20mg 2x10''s Pack Size: 20''s', N'medicine.png', 380.0000, CAST(N'2022-05-07T22:19:20.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1637, N'Perlita SR Cap 90mg 2x5''s Pack Size: 10''s', N'medicine.png', 148.0000, CAST(N'2022-05-07T22:19:35.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1638, N'Sofvasc-V Tab 10mg/160mg 14''s Pack Size: 14''s', N'medicine.png', 469.0000, CAST(N'2022-05-07T22:19:59.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1639, N'Sofvasc Tab 10mg 1x30''s Pack Size: 30''s', N'medicine.png', 535.0000, CAST(N'2022-05-07T22:20:15.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1640, N'Diltiazaf Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 121.0000, CAST(N'2022-05-07T22:21:05.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1641, N'Diltiazaf Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 91.0000, CAST(N'2022-05-07T22:21:19.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1642, N'Diltiazaf SR Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 163.0000, CAST(N'2022-05-07T22:21:35.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1643, N'Zamlo H Tab 5mg/12.5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 46.0000, CAST(N'2022-05-07T22:21:58.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1644, N'Zavera Tab 40mg 40''s Pack Size: 40''s', N'medicine.png', 66.0000, CAST(N'2022-05-07T22:22:14.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1645, N'Amper Tab 5mg/4mg 10''s Pack Size: 10''s', N'medicine.png', 270.0000, CAST(N'2022-05-07T22:22:28.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1646, N'Amper Tab 10mg/4mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-07T22:22:43.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1647, N'Amostatin Tab 5mg/20mg 2x10''s Pack Size: 20''s', N'medicine.png', 475.0000, CAST(N'2022-05-07T22:22:57.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1648, N'Amostatin Tab 5mg/10mg 2x10''s Pack Size: 20''s', N'medicine.png', 314.0000, CAST(N'2022-05-07T22:23:12.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1649, N'Calzem SR Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T22:23:31.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1650, N'Calzem Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 129.0000, CAST(N'2022-05-07T22:23:45.953' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1651, N'Amstan Tab 5mg/80mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 308.0000, CAST(N'2022-05-07T22:24:00.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1652, N'M-Low Tab 5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T22:24:15.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1653, N'M-Low Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T22:24:30.337' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1654, N'M-Low Plus Tab 5mg/12.5mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 109.0000, CAST(N'2022-05-07T22:24:45.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1655, N'Cara-Pin Tab 5mg 10x10''s Pack Size: 12''s', N'medicine.png', 79.0000, CAST(N'2022-05-07T22:25:00.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1656, N'Cara-Pin Tab 5mg 2x10''s Pack Size: 5ampx1ml', N'medicine.png', 105.0000, CAST(N'2022-05-07T22:25:16.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1657, N'Veramil Tab 240mg 10''s Pack Size: 10''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T22:25:43.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1658, N'Veramil Tab 80mg 5x10''s Pack Size: 14''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T22:26:03.197' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1659, N'Cardiocare Tab 5mg 1x10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T22:26:17.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1660, N'Cardiocare Tab 10mg 2x10''s Pack Size: 20''s', N'medicine.png', 252.0000, CAST(N'2022-05-07T22:26:34.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1661, N'Lipirex Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T22:31:57.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1662, N'Rovista Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 166.0000, CAST(N'2022-05-07T22:32:16.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1663, N'Ruvastat Tab 5mg 1x10''s Pack Size: 1X10''s', N'medicine.png', 155.0000, CAST(N'2022-05-07T22:32:40.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1664, N'Lipiget Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 410.0000, CAST(N'2022-05-07T22:32:57.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1665, N'Loster Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 167.0000, CAST(N'2022-05-07T22:33:12.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1666, N'Lipiget Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 210.0000, CAST(N'2022-05-07T22:33:28.663' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1667, N'Rovista Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 276.0000, CAST(N'2022-05-07T22:33:44.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1668, N'Cougar Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 361.0000, CAST(N'2022-05-07T22:33:59.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1669, N'Pasage Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T22:34:16.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1670, N'Sensicon Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 191.0000, CAST(N'2022-05-07T22:34:31.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1671, N'Rolip Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T22:34:46.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1672, N'Tavist Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 124.0000, CAST(N'2022-05-07T22:35:03.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1673, N'Roswin Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T22:35:12.853' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1674, N'Simva Plus Tab 10mg/20mg 10''s Pack Size: 10''s', N'medicine.png', 160.0000, CAST(N'2022-05-07T22:35:29.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1675, N'Atorva-10 Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 260.0000, CAST(N'2022-05-07T22:35:44.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1676, N'X-Plended Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 229.0000, CAST(N'2022-05-07T22:35:59.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1677, N'X-Plended Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 41.0000, CAST(N'2022-05-07T22:36:13.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1678, N'X-Plended Tab 10X-Plended Tab 10mg 10''s Pack Size: 10''smg 10''s Pack Size: 10''s', N'medicine.png', 441.0000, CAST(N'2022-05-07T22:36:28.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1679, N'Myopro Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 299.0000, CAST(N'2022-05-07T22:36:43.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1680, N'Lipix Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 207.0000, CAST(N'2022-05-07T22:36:59.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1681, N'Lipistat Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 207.0000, CAST(N'2022-05-07T22:37:13.883' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1682, N'Lipidin Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 188.0000, CAST(N'2022-05-07T22:37:27.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1683, N'Oscar Plus Tab 5mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T22:37:45.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1684, N'Rast Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 402.0000, CAST(N'2022-05-07T22:38:00.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1685, N'Pasage Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-07T22:38:19.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1686, N'Survive Plus Tab 10mg/10mg 7''s Pack Size: 7''s', N'medicine.png', 119.0000, CAST(N'2022-05-07T22:38:51.177' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1687, N'Ruvastat Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 258.0000, CAST(N'2022-05-07T22:39:07.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1688, N'Trovas Tab 10mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 109.0000, CAST(N'2022-05-07T22:39:22.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1689, N'Trovas Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 207.0000, CAST(N'2022-05-07T22:39:38.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1690, N'Xovat Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 245.0000, CAST(N'2022-05-07T22:39:52.907' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1691, N'Xovat Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 177.0000, CAST(N'2022-05-07T22:40:07.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1692, N'Xovat Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 425.0000, CAST(N'2022-05-07T22:40:21.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1693, N'Rosuvax Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T22:40:37.603' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1694, N'Gempid Tab 600mg 20''s Pack Size: 20''s', N'medicine.png', 210.0000, CAST(N'2022-05-07T22:40:53.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1695, N'Rovator Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 390.0000, CAST(N'2022-05-07T22:41:10.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1696, N'Rovator Tab 10mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 289.0000, CAST(N'2022-05-07T22:41:26.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1697, N'Rovator Tab 5mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 175.0000, CAST(N'2022-05-07T22:41:41.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1698, N'Vastor-Am Tab 10mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T22:41:59.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1699, N'Vastor-Am Tab 5mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 193.0000, CAST(N'2022-05-07T22:42:15.000' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1700, N'Recol Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 358.0000, CAST(N'2022-05-07T22:42:31.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1701, N'Recol Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 227.0000, CAST(N'2022-05-07T22:42:46.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1702, N'Rosubar Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 413.0000, CAST(N'2022-05-07T22:43:01.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1703, N'Rosubar Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 241.0000, CAST(N'2022-05-07T22:43:16.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1704, N'Rosubar Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T22:43:33.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1705, N'Sensicon Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 345.0000, CAST(N'2022-05-07T22:43:49.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1706, N'Lipaxin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T22:44:06.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1707, N'Lipaxin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 114.0000, CAST(N'2022-05-07T22:44:25.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1708, N'Nuista Plus Tab 10mg/20mg 2x14''s Pack Size: 2x14''s', N'medicine.png', 399.0000, CAST(N'2022-05-07T22:44:42.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1709, N'Nuista Plus Tab 10mg/20mg 2x14''s Pack Size: 2x14''s', N'medicine.png', 213.0000, CAST(N'2022-05-07T22:44:58.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1710, N'Orva Tab 40mg 2x14''s Pack Size: 2x14''s', N'medicine.png', 665.0000, CAST(N'2022-05-07T22:45:31.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1711, N'Rova Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 235.0000, CAST(N'2022-05-07T22:45:48.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1712, N'Rova Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 400.0000, CAST(N'2022-05-07T22:46:02.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1713, N'Rova Tab 5mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 140.0000, CAST(N'2022-05-07T22:46:18.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1714, N'Rova Tab 5mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 310.0000, CAST(N'2022-05-07T22:46:33.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1715, N'Orva Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 172.0000, CAST(N'2022-05-07T22:46:57.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1716, N'Antichol Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T22:47:15.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1717, N'Antichol Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T22:47:29.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1718, N'Lokestrol Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T22:47:43.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1719, N'Lokestrol Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 238.0000, CAST(N'2022-05-07T22:48:04.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1720, N'Lokestrol Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-07T22:48:20.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1721, N'Etar Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 220.0000, CAST(N'2022-05-07T22:48:37.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1722, N'Aurora Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 236.0000, CAST(N'2022-05-07T22:48:53.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1723, N'Aurora Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 366.0000, CAST(N'2022-05-07T22:49:10.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1724, N'Aurora Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 128.0000, CAST(N'2022-05-07T22:49:26.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1725, N'Caliptrol Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 332.0000, CAST(N'2022-05-07T22:49:45.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1726, N'Combitrol Tab 10mg/20mg 10''s Pack Size: 10''s', N'medicine.png', 271.0000, CAST(N'2022-05-07T22:50:03.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1727, N'Atopitar Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 181.0000, CAST(N'2022-05-07T22:50:19.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1728, N'Simvastin Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T22:50:37.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1729, N'Atopitar Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 366.0000, CAST(N'2022-05-07T22:50:55.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1730, N'Atopitar Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 762.0000, CAST(N'2022-05-07T22:51:11.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1731, N'Fenoget Cap 200mg 10''s 76... Pack Size: 76...', N'medicine.png', 12274.0000, CAST(N'2022-05-07T22:51:30.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1732, N'Fenoget Cap 67mg 30''s 72... Pack Size: 72', N'medicine.png', 17442.0000, CAST(N'2022-05-07T22:51:48.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1733, N'Rovista Tab 5mg 10''s 150... Pack Size: 10''s', N'medicine.png', 14717.0000, CAST(N'2022-05-07T22:52:06.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1734, N'Rovista Tab 10mg 10''s 150... Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-07T22:53:09.337' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1735, N'Rovista Tab 20mg 10''s 150... Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-07T22:53:24.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1736, N'Lipiget Tab 40mg 10''s 160... Pack Size: 160', N'medicine.png', 0.0000, CAST(N'2022-05-07T22:53:40.307' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1737, N'Lipiget EZ Tab 10mg/10mg 10''s... Pack Size: 96', N'medicine.png', 0.0000, CAST(N'2022-05-07T22:53:55.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1738, N'Lipiget EZ Tab 10mg/10mg 10''s... Pack Size: 96', N'medicine.png', 380.0000, CAST(N'2022-05-07T22:54:14.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1739, N'Lipiget EZ Tab 10mg/10mg 10''s... Pack Size: 96', N'medicine.png', 256.0000, CAST(N'2022-05-07T22:54:31.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1740, N'Lipiget EZ Tab 10mg/10mg 10''s... Pack Size: 96', N'medicine.png', 423.0000, CAST(N'2022-05-07T22:54:50.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1741, N'Lipiget EZ Tab 10mg/10mg 10''s... Pack Size: 96', N'medicine.png', 494.0000, CAST(N'2022-05-07T22:55:08.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1742, N'Lipiget EZ Tab 10mg/10mg 10''s... Pack Size: 96', N'medicine.png', 247.0000, CAST(N'2022-05-07T22:55:25.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1743, N'Rovista Tab 20mg 10''s Pack Size: 10''sv', N'medicine.png', 447.0000, CAST(N'2022-05-07T22:55:42.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1744, N'Rovista Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 98.0000, CAST(N'2022-05-07T22:55:58.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1745, N'Loster Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 385.0000, CAST(N'2022-05-07T22:56:16.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1746, N'Lipirex Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 360.0000, CAST(N'2022-05-07T22:56:31.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1747, N'Lipirex Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 450.0000, CAST(N'2022-05-07T22:56:51.757' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1748, N'Rosulin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 255.0000, CAST(N'2022-05-07T22:59:13.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1749, N'Rosulin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 420.0000, CAST(N'2022-05-07T23:00:46.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1750, N'Rosulin Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 124.0000, CAST(N'2022-05-07T23:01:05.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1751, N'Stat-A Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-07T23:01:25.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1752, N'Stat-A Tab 20mg 14''s Pack Size: 14''s', N'medicine.png', 323.0000, CAST(N'2022-05-07T23:01:42.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1753, N'Rolip Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 415.0000, CAST(N'2022-05-07T23:02:00.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1754, N'Rolip Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 242.0000, CAST(N'2022-05-07T23:02:16.740' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1755, N'Rolip Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 355.0000, CAST(N'2022-05-07T23:02:33.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1756, N'Jezeta Tab 10mg 10''s Pack Size: 10...', N'medicine.png', 222.0000, CAST(N'2022-05-07T23:02:49.807' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1757, N'Jezeta Tab 10mg/40mg 10''s Pack Size: 10''s', N'medicine.png', 440.0000, CAST(N'2022-05-07T23:03:11.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1758, N'Eglocard Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 182.0000, CAST(N'2022-05-07T23:03:30.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1759, N'Eglocard Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 274.0000, CAST(N'2022-05-07T23:03:43.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1760, N'Atrocard Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 197.0000, CAST(N'2022-05-07T23:04:03.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1761, N'Atrocard Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 384.0000, CAST(N'2022-05-07T23:04:22.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1762, N'Atrocard Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 710.0000, CAST(N'2022-05-07T23:04:40.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1763, N'Rosocard Tab 5mg 10''s Pack Size', N'medicine.png', 125.0000, CAST(N'2022-05-07T23:04:56.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1764, N'Rosocard Tab 20mg 10''s Pack Size', N'medicine.png', 347.0000, CAST(N'2022-05-07T23:05:13.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1765, N'Rosocard Tab 20mg 10''s Pack Size', N'medicine.png', 211.0000, CAST(N'2022-05-07T23:05:30.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1766, N'Snolip Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 0.0000, CAST(N'2022-05-07T23:05:48.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1767, N'Rudra Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-07T23:06:08.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1768, N'Rudra Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 216.0000, CAST(N'2022-05-07T23:06:30.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1769, N'Rudra Tab 20mg 10''s Pack Size', N'medicine.png', 340.0000, CAST(N'2022-05-07T23:06:49.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1770, N'Dr.Vast Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 209.0000, CAST(N'2022-05-07T23:07:10.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1771, N'Dr.Vast Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 314.0000, CAST(N'2022-05-07T23:07:26.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1772, N'Dr.Vast Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 95.0000, CAST(N'2022-05-07T23:07:43.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1773, N'Omnitor Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 314.0000, CAST(N'2022-05-07T23:08:03.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1774, N'Omnitor Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 114.0000, CAST(N'2022-05-07T23:08:20.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1775, N'Tavist Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 0.0000, CAST(N'2022-05-07T23:08:35.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1776, N'Omnitor Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 380.0000, CAST(N'2022-05-07T23:08:53.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1777, N'Fopsec Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 132.0000, CAST(N'2022-05-07T23:09:08.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1778, N'Fopsec Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 224.0000, CAST(N'2022-05-07T23:09:24.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1779, N'Fopsec Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 371.0000, CAST(N'2022-05-07T23:09:40.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1780, N'Fatrid Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 280.0000, CAST(N'2022-05-07T23:09:56.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1781, N'Fatrid Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T23:10:13.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1782, N'Fatrid Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T23:10:36.497' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1783, N'Roswin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 235.0000, CAST(N'2022-05-07T23:10:56.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1784, N'Roswin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-07T23:11:12.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1785, N'Crescor Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T23:11:26.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1786, N'Lipivastin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T23:11:42.933' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1787, N'Lipivastin Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-07T23:12:00.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1788, N'Lipivastin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 297.0000, CAST(N'2022-05-07T23:12:16.023' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1789, N'Vesonor Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T23:12:31.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1790, N'Vesonor Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T23:12:52.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1791, N'Lipomed Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 262.0000, CAST(N'2022-05-07T23:13:08.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1792, N'Lipomed Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T23:13:24.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1793, N'Lipomed Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T23:13:41.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1794, N'Ridlip Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 238.0000, CAST(N'2022-05-07T23:13:58.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1795, N'Ridlip Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 318.0000, CAST(N'2022-05-07T23:14:14.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1796, N'Rostinox Tab 20mg 1x10’s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T23:14:28.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1797, N'Rostinox Tab 10mg 1x10’s Pack Size: 10''s', N'medicine.png', 114.0000, CAST(N'2022-05-07T23:14:42.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1798, N'Descol Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 135.0000, CAST(N'2022-05-07T23:14:58.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1799, N'Descol Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 319.0000, CAST(N'2022-05-07T23:15:13.257' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1800, N'Simva Tab 20mg 20''s Pack Size: 20''s', N'medicine.png', 246.0000, CAST(N'2022-05-07T23:15:29.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1801, N'Simva Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 165.0000, CAST(N'2022-05-07T23:15:45.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1802, N'Simva Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T23:15:59.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1803, N'Roviros Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 110.0000, CAST(N'2022-05-07T23:16:15.577' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1804, N'Simva Plus Tab 10mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 110.0000, CAST(N'2022-05-07T23:16:30.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1805, N'Simva Plus Tab 10mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 280.0000, CAST(N'2022-05-07T23:16:45.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1806, N'Roviros Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 235.0000, CAST(N'2022-05-07T23:17:02.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1807, N'Atorsan Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T23:17:17.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1808, N'Atorsan Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 220.0000, CAST(N'2022-05-07T23:17:31.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1809, N'Lescol XL Tab 80mg 28''s Pack Size: 28''s', N'medicine.png', 2243.0000, CAST(N'2022-05-07T23:17:50.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1810, N'ATORLIP Tab 10mg 10''s Pack Size: 10''sMarketed...', N'medicine.png', 140.0000, CAST(N'2022-05-07T23:18:04.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1811, N'ATORLIP Tab 20mg 10''s Pack Size: 10''sMarketed...', N'medicine.png', 240.0000, CAST(N'2022-05-07T23:18:31.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1812, N'Atorva-20 Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 399.0000, CAST(N'2022-05-07T23:18:51.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1813, N'Easetec-20 Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 304.0000, CAST(N'2022-05-07T23:19:10.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1814, N'Easetec-10 Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 109.0000, CAST(N'2022-05-07T23:19:26.180' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1815, N'Easetec-10 Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T23:19:37.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1816, N'Atorva Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 552.0000, CAST(N'2022-05-07T23:19:59.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1817, N'X-Plended Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 162.0000, CAST(N'2022-05-07T23:20:15.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1818, N'Lipix Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 345.0000, CAST(N'2022-05-07T23:20:33.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1819, N'Statin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T23:20:50.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1820, N'Statin Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 460.0000, CAST(N'2022-05-07T23:21:06.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1821, N'Statin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 253.0000, CAST(N'2022-05-07T23:21:35.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1822, N'Rostat Tab 5mg 10''s Pack Size: 10''sRostat Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 115.0000, CAST(N'2022-05-07T23:21:55.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1823, N'Rostat Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 322.0000, CAST(N'2022-05-07T23:22:21.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1824, N'Rostat Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 207.0000, CAST(N'2022-05-07T23:22:38.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1825, N'Rostat Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 132.0000, CAST(N'2022-05-07T23:22:56.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1826, N'Reduse Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 85.0000, CAST(N'2022-05-07T23:23:13.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1827, N'Reduse Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 332.0000, CAST(N'2022-05-07T23:23:38.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1828, N'Reduse Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T23:23:55.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1829, N'Atastan Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T23:24:10.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1830, N'Rostor Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 223.0000, CAST(N'2022-05-07T23:24:28.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1831, N'Rostor Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 104.0000, CAST(N'2022-05-07T23:26:08.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1832, N'Rostor Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 280.0000, CAST(N'2022-05-07T23:26:26.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1833, N'ROSERA Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-07T23:26:50.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1834, N'ROSERA Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 380.0000, CAST(N'2022-05-07T23:27:14.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1835, N'ROSERA Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 215.0000, CAST(N'2022-05-07T23:27:35.533' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1836, N'Winstor Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 168.0000, CAST(N'2022-05-07T23:27:52.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1837, N'Winstor Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 283.0000, CAST(N'2022-05-07T23:28:09.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1838, N'Winstor Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 517.0000, CAST(N'2022-05-07T23:28:27.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1839, N'Winstor Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 380.0000, CAST(N'2022-05-07T23:28:49.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1840, N'Winstor Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 421.0000, CAST(N'2022-05-07T23:29:08.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1841, N'Zetab Plus Tab 10mg/10mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 404.0000, CAST(N'2022-05-07T23:29:24.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1842, N'Lipilow Tab 2Lipilow Tab 20mg 10''s Pack Size: 10''s0mg 10''s Pack Size: 10''s', N'medicine.png', 171.0000, CAST(N'2022-05-07T23:29:44.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1843, N'Oscar Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 570.0000, CAST(N'2022-05-07T23:33:50.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1844, N'Oscar Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T23:34:10.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1845, N'Cougar Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 215.0000, CAST(N'2022-05-07T23:34:37.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1846, N'Oscar Plus Tab 5/20mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-07T23:34:54.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1847, N'Rast Tab 5mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 139.0000, CAST(N'2022-05-07T23:35:10.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1848, N'Rast Tab 10mg 1x10''s Pack Size: 10', N'medicine.png', 235.0000, CAST(N'2022-05-07T23:35:25.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1849, N'Saman Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 220.0000, CAST(N'2022-05-07T23:35:44.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1850, N'Saman Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T23:36:01.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1851, N'Xetrol Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 230.0000, CAST(N'2022-05-07T23:36:17.200' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1852, N'Pasage Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 80.0000, CAST(N'2022-05-07T23:36:31.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1853, N'Survive Tab 10mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T23:36:46.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1854, N'Survive Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 415.0000, CAST(N'2022-05-07T23:37:04.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1855, N'Survive Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 320.0000, CAST(N'2022-05-07T23:37:21.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1856, N'Survive Plus Tab 20mg/10mg 7''s Pack Size: 7''s', N'medicine.png', 224.0000, CAST(N'2022-05-07T23:37:38.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1857, N'Survive-AT Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-07T23:37:54.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1858, N'Survive-AT Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T23:38:10.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1859, N'Survive Plus Tab 40mg/10mg 1x7''s Pack Size: 7''s', N'medicine.png', 291.0000, CAST(N'2022-05-07T23:38:26.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1860, N'Survive-AT Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-07T23:38:41.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1861, N'Pasage Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 400.0000, CAST(N'2022-05-07T23:38:58.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1862, N'Qazzo Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 230.0000, CAST(N'2022-05-07T23:39:14.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1863, N'Lastolip EZ Tab 20mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 285.0000, CAST(N'2022-05-07T23:39:39.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1864, N'Lastolip EZ Tab 10mg/10mg 2x10''s Pack Size: 20''s', N'medicine.png', 361.0000, CAST(N'2022-05-07T23:39:55.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1865, N'Lastolip Tab 20mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 600.0000, CAST(N'2022-05-07T23:40:12.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1866, N'Lastolip Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 360.0000, CAST(N'2022-05-07T23:40:28.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1867, N'Lastolip Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 450.0000, CAST(N'2022-05-07T23:40:42.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1868, N'Modlip Z Tab 20mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T23:41:00.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1869, N'Qazzo Tab 10mg 20''s Pack Size: 20''s', N'medicine.png', 460.0000, CAST(N'2022-05-07T23:41:27.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1870, N'Modlip Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 238.0000, CAST(N'2022-05-07T23:41:44.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1871, N'Modlip Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-07T23:41:59.303' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1872, N'Modlip Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 95.0000, CAST(N'2022-05-07T23:42:23.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1873, N'Rosuva Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 506.0000, CAST(N'2022-05-07T23:42:37.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1874, N'Rosuva Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 253.0000, CAST(N'2022-05-07T23:42:53.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1875, N'Save Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 656.0000, CAST(N'2022-05-07T23:43:10.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1876, N'Save Tab 40mg 1x10''s Pack Size: 10''s', N'medicine.png', 199.0000, CAST(N'2022-05-07T23:43:28.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1877, N'Save Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 397.0000, CAST(N'2022-05-07T23:43:48.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1878, N'Rosuva Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 163.0000, CAST(N'2022-05-07T23:44:10.593' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1879, N'Zepitor Tab 20mg 10''s Pack Size: 144''s', N'medicine.png', 390.0000, CAST(N'2022-05-07T23:44:29.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1880, N'Zepitor Tab 10mg 10’S Pack Size: 72''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T23:44:53.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1881, N'Zepitor Tab 10mg 10’S Pack Size: 72''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T23:45:18.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1882, N'Colezaf Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 142.0000, CAST(N'2022-05-07T23:45:36.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1883, N'Colezaf Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 124.0000, CAST(N'2022-05-07T23:45:54.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1884, N'Simvazaf Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 221.0000, CAST(N'2022-05-07T23:46:10.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1885, N'Zodip Plus 10 Tab 5mg/10mg... Pack Size: 20''s', N'medicine.png', 476.0000, CAST(N'2022-05-07T23:46:58.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1886, N'Zodip Plus 20 Tab 5mg/10mg... Pack Size: 20s', N'medicine.png', 721.0000, CAST(N'2022-05-07T23:47:21.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1887, N'Rosunext Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T23:47:44.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1888, N'Rosunext Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-07T23:48:12.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1889, N'Rosunext Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 360.0000, CAST(N'2022-05-07T23:48:29.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1890, N'Zocor Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 337.0000, CAST(N'2022-05-07T23:48:50.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1891, N'Zocor Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 569.0000, CAST(N'2022-05-07T23:49:07.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1892, N'Amro Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 470.0000, CAST(N'2022-05-07T23:49:29.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1893, N'Etortin Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-07T23:50:01.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1894, N'Crestat Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 258.0000, CAST(N'2022-05-07T23:50:20.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1895, N'Crestat Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 158.0000, CAST(N'2022-05-07T23:50:42.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1896, N'Crestat Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 470.0000, CAST(N'2022-05-07T23:51:04.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1897, N'Pro-Statin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-07T23:51:22.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1898, N'Pro-Statin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-07T23:51:38.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1899, N'Pro-Statin Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 475.0000, CAST(N'2022-05-07T23:52:00.733' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1900, N'Pit-Stat Tab 1mg 10''s Pack Size: 10''s', N'medicine.png', 125.0000, CAST(N'2022-05-07T23:52:30.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1901, N'Pit-Stat Tab 2mg 10''s Pack Size: 10''s', N'medicine.png', 195.0000, CAST(N'2022-05-07T23:52:51.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1902, N'Pit-Stat Tab 4mg 10''s Pack Size: 10''s', N'medicine.png', 255.0000, CAST(N'2022-05-07T23:53:09.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1903, N'Lipotrim Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 266.0000, CAST(N'2022-05-07T23:53:26.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1904, N'Lipotrim Tab 40mg 10''s Pack Size: 10''s', N'medicine.png', 333.0000, CAST(N'2022-05-07T23:53:53.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1905, N'Lipotrim Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 167.0000, CAST(N'2022-05-07T23:54:16.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1906, N'Lipotrim-EZ Tab 10mg/10mg 10''s Pack Size: 10''s', N'medicine.png', 181.0000, CAST(N'2022-05-07T23:54:40.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1907, N'Rostatin Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-07T23:55:01.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1908, N'Rostatin Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 304.0000, CAST(N'2022-05-07T23:55:26.757' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1909, N'Rostatin Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 114.0000, CAST(N'2022-05-07T23:55:51.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1910, N'Kestore Tab 5mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 100.0000, CAST(N'2022-05-07T23:56:10.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1911, N'Kestore Tab 10mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T23:56:28.993' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1912, N'Kestore Tab 20mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 200.0000, CAST(N'2022-05-07T23:56:47.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1913, N'Rosugen Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-07T23:57:04.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1914, N'Rosugen Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 320.0000, CAST(N'2022-05-07T23:57:29.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1915, N'Rosugen Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 240.0000, CAST(N'2022-05-07T23:57:49.907' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1916, N'Cara-Statin Tab 20mg 10''s Pack Size: 15ml', N'medicine.png', 400.0000, CAST(N'2022-05-07T23:58:07.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1917, N'Pitalo Tab 2mg 10''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-07T23:59:06.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1918, N'Pitalo Tab 1mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-07T23:59:24.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1919, N'Pitalo Tab 4mg 10''s Pack Size: 60ml', N'medicine.png', 350.0000, CAST(N'2022-05-07T23:59:44.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1920, N'Cholein Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 220.0000, CAST(N'2022-05-08T00:00:03.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1921, N'Cholein Tab 10mg 1x10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-08T00:00:19.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1922, N'Atopitar Tab 10.5mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T00:00:42.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1923, N'Atopitar Tab 20mg 10''s (Avant... Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T00:01:05.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1924, N'Rusiam Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-08T00:01:21.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1925, N'Rusiam Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 493.0000, CAST(N'2022-05-08T00:01:45.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1926, N'Carveda Tab 12.5mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 350.0000, CAST(N'2022-05-08T00:16:37.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1927, N'Synephrine Inj 10Mg Pack Size: 5ampx1ml', N'medicine.png', 282.0000, CAST(N'2022-05-08T00:16:47.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1928, N'Sacvin Tab 49/51mg 30''s Pack Size: 30...', N'medicine.png', 1133.0000, CAST(N'2022-05-08T00:17:12.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1929, N'Vastarel MR Tab 35mg 20''s Pack Size: 20''s', N'medicine.png', 397.0000, CAST(N'2022-05-08T00:17:30.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1930, N'Sivab Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 380.0000, CAST(N'2022-05-08T00:17:47.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1931, N'Lanoxin Tab 250mcg 25''s Pack Size: 25''s', N'medicine.png', 56.0000, CAST(N'2022-05-08T00:18:01.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1932, N'Epler Tab 50Mg Pack Size: 10...', N'medicine.png', 774.0000, CAST(N'2022-05-08T00:18:22.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1933, N'Carveda Tab 6.25mg 3x10''s Pack Size: 2x10''sCarveda Tab 6.25mg 3x10''s Pack Size: 2x10''s', N'medicine.png', 238.0000, CAST(N'2022-05-08T00:18:39.303' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1934, N'Carveda Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 213.0000, CAST(N'2022-05-08T00:18:56.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1935, N'Herbesser Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 247.0000, CAST(N'2022-05-08T00:19:13.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1936, N'Loprin Tab 150mg 30''s Pack Size: 30''s', N'medicine.png', 61.0000, CAST(N'2022-05-08T00:19:30.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1937, N'Cardioplegia Inj 200mg 10Ampx10ml Pack Size: 10...', N'medicine.png', 843.0000, CAST(N'2022-05-08T00:19:51.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1938, N'Dopamine Inj 200mg 1Ampx5ml Pack Size: 1Ampx5ml', N'medicine.png', 123.0000, CAST(N'2022-05-08T00:20:14.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1939, N'Hart Tab 12.5mg 10''s Pack Size: 30''s', N'medicine.png', 70.0000, CAST(N'2022-05-08T00:20:29.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1940, N'Deplat Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 148.0000, CAST(N'2022-05-08T00:20:45.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1941, N'Rancard-XR Tab 1000mg 14''s Pack Size: 14''s', N'medicine.png', 330.0000, CAST(N'2022-05-08T00:21:01.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1942, N'Vadil Tab 6.25mg 3x10''s Pack Size: 30''s', N'medicine.png', 255.0000, CAST(N'2022-05-08T00:21:20.743' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1943, N'Ogrel Plus-81 Tab 75mg/81mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T00:21:36.293' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1944, N'Doxium Cap 500mg 30''s Pack Size: 30''s', N'medicine.png', 1300.0000, CAST(N'2022-05-08T00:21:52.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1945, N'Milron Inj 10mg 1Vialx10ml Pack Size: 1vialx10ml', N'medicine.png', 1694.0000, CAST(N'2022-05-08T00:22:11.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1946, N'Noradrin Inj 4mg 5Ampx4ml Pack Size: 5ampx4ml', N'medicine.png', 1889.0000, CAST(N'2022-05-08T00:22:30.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1947, N'Aggrastat Inj 12.5mg 1Vialx50ml Pack Size: 1', N'medicine.png', 24690.0000, CAST(N'2022-05-08T00:22:49.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1948, N'Clotnil Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 185.0000, CAST(N'2022-05-08T00:23:04.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1949, N'Clotnil Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T00:23:24.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1950, N'Strovix Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 124.0000, CAST(N'2022-05-08T00:23:40.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1951, N'Ogrel Plus-162 Tab 2x14''s Pack Size: 28''s', N'medicine.png', 293.0000, CAST(N'2022-05-08T00:23:55.497' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1952, N'Ogrel Plus-81 Tab 75mg/81mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T00:24:13.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1953, N'OGREL Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-08T00:24:29.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1954, N'Delaware Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T00:24:45.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1955, N'Buta Inj 250mg 10Ampx5ml Pack Size: 10Ampx5ml', N'medicine.png', 2300.0000, CAST(N'2022-05-08T00:25:10.577' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1956, N'Clopid ASP Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 147.0000, CAST(N'2022-05-08T00:25:29.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1957, N'Clopid Tab 75mg 10''s Pack Size: 10Clopid Tab 75mg 10''s Pack Size: 10', N'medicine.png', 180.0000, CAST(N'2022-05-08T00:25:46.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1958, N'Nicoril Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 173.0000, CAST(N'2022-05-08T00:26:09.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1959, N'Carveda Tab 3.125mg 1x10''s Pack Size: 10''s', N'medicine.png', 88.0000, CAST(N'2022-05-08T00:26:27.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1960, N'Nicoget Tab 10mg 20''s 96... Pack Size: 96...', N'medicine.png', 22891.0000, CAST(N'2022-05-08T00:26:46.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1961, N'Nicoget Tab 20mg 20''s 96... Pack Size: 96', N'medicine.png', 38121.0000, CAST(N'2022-05-08T00:27:07.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1962, N'Sivab Tab 7.5mg 14''s 120... Pack Size: 120', N'medicine.png', 31920.0000, CAST(N'2022-05-08T00:27:28.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1963, N'Sivab Tab 5mg 14''s 120... Pack Size: 120.', N'medicine.png', 31920.0000, CAST(N'2022-05-08T00:27:49.497' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1964, N'Sivab Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T00:28:07.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1965, N'Savesto 50 Tab 24mg/26mg 14''s Pack Size: 14''s', N'medicine.png', 528.0000, CAST(N'2022-05-08T00:28:22.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1966, N'Savesto 100 Tab 49mg/51mg 14''s Pack Size: 14''s', N'medicine.png', 747.0000, CAST(N'2022-05-08T00:28:40.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1967, N'Savesto 200 Tab 97mg/103mg 14''s Pack Size: 14...', N'medicine.png', 980.0000, CAST(N'2022-05-08T00:28:57.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1968, N'Digitek Tab 0.25mg 25''s Pack Size: 25''s', N'medicine.png', 35.0000, CAST(N'2022-05-08T00:29:22.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1969, N'Hidilol Tab 12.5mg 1x10''s Pack Size: 10''s', N'medicine.png', 60.0000, CAST(N'2022-05-08T00:29:38.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1970, N'Hidilol Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 137.0000, CAST(N'2022-05-08T00:29:55.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1971, N'Herbesser Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 143.0000, CAST(N'2022-05-08T00:30:12.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1972, N'Herbesser SR Cap 180mg 10''s Pack Size: 10''s', N'medicine.png', 330.0000, CAST(N'2022-05-08T00:30:42.567' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1973, N'Herbesser SR Cap 90mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T00:31:00.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1974, N'Pidogrel-AP Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 180.0000, CAST(N'2022-05-08T00:31:20.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1975, N'Pidogrel-AP Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 171.0000, CAST(N'2022-05-08T00:31:38.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1976, N'Pidogrel Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 160.0000, CAST(N'2022-05-08T00:31:55.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1977, N'Ivaset Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 315.0000, CAST(N'2022-05-08T00:32:15.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1978, N'Ivaset Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T00:32:32.157' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1979, N'Ranola Tab 500mg 14''s Pack Size: 14''s', N'medicine.png', 294.0000, CAST(N'2022-05-08T00:32:49.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1980, N'Ranola Tab 500mg 14''s Pack Size: 14''s', N'medicine.png', 294.0000, CAST(N'2022-05-08T00:33:11.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1981, N'Ranola Tab 1000mg 14''s Pack Size: 14''s', N'medicine.png', 365.0000, CAST(N'2022-05-08T00:33:29.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1982, N'Epliron Tab 25mg 14''s Pack Size: 14''sMarketed...', N'medicine.png', 350.0000, CAST(N'2022-05-08T00:33:46.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1983, N'Epliron Tab 50mg 14''s Pack Size: 14''sMarketed.', N'medicine.png', 518.0000, CAST(N'2022-05-08T00:34:06.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1984, N'Carlov Tab 6.25mg 30''s Pack Size: 30''s', N'medicine.png', 235.0000, CAST(N'2022-05-08T00:34:29.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1985, N'Carlov Tab 25mg 10''s Pack Size: 10''s', N'medicine.png', 205.0000, CAST(N'2022-05-08T00:34:45.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1986, N'Carlov Tab 12.5mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T00:35:03.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1987, N'Carlov Tab 3.125mg 10''s Pack Size: 10''s', N'medicine.png', 70.0000, CAST(N'2022-05-08T00:35:21.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1988, N'Carlov Tab 3.125mg 10''s Pack Size: 10''s', N'medicine.png', 530.0000, CAST(N'2022-05-08T00:35:38.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1989, N'Etizem Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 160.0000, CAST(N'2022-05-08T00:35:54.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1990, N'Etizem SR Cap 90mg 20''s Pack Size: 20''s', N'medicine.png', 347168.0000, CAST(N'2022-05-08T00:36:17.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1991, N'Etizem Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 280896.0000, CAST(N'2022-05-08T00:36:37.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1992, N'Explat Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 164958.0000, CAST(N'2022-05-08T00:37:00.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1993, N'Hart Tab 6.25mg 30''s Pack Size', N'medicine.png', 151905.0000, CAST(N'2022-05-08T00:37:25.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1994, N'Dilatrend Tab 6.25mg 10''s Pack Size: 10''s', N'medicine.png', 131.0000, CAST(N'2022-05-08T00:37:41.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1995, N'Dilatrend Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 1800.0000, CAST(N'2022-05-08T00:37:58.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1996, N'Riplan Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-08T00:38:21.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1997, N'Riplan Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-08T00:38:40.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1998, N'Metazem 60 Tab 60mg 10x10''s Pack Size: 10x10''s', N'medicine.png', 638.0000, CAST(N'2022-05-08T00:38:58.177' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (1999, N'Duvig Inj 250mg 1Vial Pack Size: 1vial', N'medicine.png', 386.0000, CAST(N'2022-05-08T00:39:42.800' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2000, N'Ivatab Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 486.0000, CAST(N'2022-05-08T00:40:17.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2001, N'Uperio Tab 100mg 28''s Pack Size: 28''s', N'medicine.png', 2823.0000, CAST(N'2022-05-08T00:40:43.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2002, N'Uperio Tab 200mg 28''s Pack Size: 28''s', N'medicine.png', 2940.0000, CAST(N'2022-05-08T00:41:04.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2003, N'En-Clot Plus Tab 75mg/75mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 132.0000, CAST(N'2022-05-08T00:41:21.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2004, N'Enclot Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 110.0000, CAST(N'2022-05-08T00:41:44.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2005, N'Lowplat Plus Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 196.0000, CAST(N'2022-05-08T00:42:02.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2006, N'Lowplat Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 209.0000, CAST(N'2022-05-08T00:42:45.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2007, N'Sacvin Tab 97/103mg 30''s Pack Size: 30''s', N'medicine.png', 2400.0000, CAST(N'2022-05-08T00:43:00.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2008, N'Ivadin Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T00:43:16.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2009, N'Ivadin Tab 7.5mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T00:43:34.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2010, N'Previx Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 133.0000, CAST(N'2022-05-08T00:44:04.973' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2011, N'Plagril Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 196.0000, CAST(N'2022-05-08T00:44:24.703' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2012, N'Cordarone Tab 100mg 2x14''s Pack Size: 28...', N'medicine.png', 306.0000, CAST(N'2022-05-08T00:44:43.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2013, N'Cordarone Tab 200mg 3x10''s Pack Size: 30''s', N'medicine.png', 697.0000, CAST(N'2022-05-08T00:45:05.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2014, N'Cordarone Inj 150mg 6Ampx3ml Pack Size: 6Ampx3ml', N'medicine.png', 728.0000, CAST(N'2022-05-08T00:45:30.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2015, N'Valbit Tab 49mg/51mg 14''s Pack Size: 14''s', N'medicine.png', 747.0000, CAST(N'2022-05-08T00:45:48.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2016, N'Valbit Tab 24mg/26mg 14''s Pack Size: 14''s', N'medicine.png', 448.0000, CAST(N'2022-05-08T00:46:06.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2017, N'Vastarel Tab 20mg 30''s Pack Size: 30''s', N'medicine.png', 185.0000, CAST(N'2022-05-08T00:46:27.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2018, N'Cordion Inj 250mg/5ml 10Amp Pack Size: 10ampx5ml', N'medicine.png', 2300.0000, CAST(N'2022-05-08T00:46:46.740' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2019, N'Vadil Tab 3.125mg 3x10''s Pack Size: 30...', N'medicine.png', 182.0000, CAST(N'2022-05-08T00:47:08.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2020, N'Vadil Tab 12.5mg 3x10''s Pack Size: 30''s', N'medicine.png', 331.0000, CAST(N'2022-05-08T00:47:25.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2021, N'Vadil Tab 12.5mg 3x10''s Pack Size: 30''s', N'medicine.png', 193.0000, CAST(N'2022-05-08T00:47:44.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2022, N'Creato SR Tab 35mg 20''s Pack Size: 20''s', N'medicine.png', 209.0000, CAST(N'2022-05-08T00:48:09.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2023, N'Progrel AP Tab 75mg/75mg 30''s Pack Size: 30''s', N'medicine.png', 433.0000, CAST(N'2022-05-08T00:48:35.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2024, N'Progrel Tab 75mg 3x10''s Pack Size: 3x10''S', N'medicine.png', 417.0000, CAST(N'2022-05-08T00:48:52.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2025, N'Ranogin Tab ER 500mg 14''s Pack Size', N'medicine.png', 220.0000, CAST(N'2022-05-08T00:49:09.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2026, N'Doxin Syp 50mcg/ml 120ml Pack Size: 10''s', N'medicine.png', 77.0000, CAST(N'2022-05-08T01:06:04.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2027, N'Doxin Syp 50mcg/ml 60ml Pack Size: 60ml', N'medicine.png', 55.0000, CAST(N'2022-05-08T01:06:21.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2028, N'Diltiazaf Tab 60mg 30''s Pack Size: 30''s', N'medicine.png', 121.0000, CAST(N'2022-05-08T01:06:39.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2029, N'Diltiazaf Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 91.0000, CAST(N'2022-05-08T01:06:55.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2030, N'Diltiazaf SR Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 163.0000, CAST(N'2022-05-08T01:07:13.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2031, N'Sorbimon Tab 20mg 20''s Pack Size: 20''s', N'medicine.png', 125.0000, CAST(N'2022-05-08T01:07:31.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2032, N'Trikat MR Tab 35mg 20''s Pack Size: 20''s.', N'medicine.png', 230.0000, CAST(N'2022-05-08T01:07:51.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2033, N'Isteblix Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 140.0000, CAST(N'2022-05-08T01:08:09.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2034, N'Obsagrel Tab 75mg/75mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 173.0000, CAST(N'2022-05-08T01:08:27.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2035, N'Ikodil Tab 10mg 10''s Pack Size: 400g', N'medicine.png', 166.0000, CAST(N'2022-05-08T01:08:43.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2036, N'Ikodil Tab 20mg 10''s Pack Size: 40gm', N'medicine.png', 276.0000, CAST(N'2022-05-08T01:09:02.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2037, N'Angiwell-XR Tab 500mg 2x7''s Pack Size:?ÿ2x7''s', N'medicine.png', 244.0000, CAST(N'2022-05-08T01:09:18.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2038, N'Angiwell-XR Tab 1000mg 2x7''s Pack Size:?ÿ2x7''s', N'medicine.png', 406.0000, CAST(N'2022-05-08T01:09:38.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2039, N'Calzem SR Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T01:09:53.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2040, N'Calzem Tab 30mg 30''s Pack Size: 30''s', N'medicine.png', 129.0000, CAST(N'2022-05-08T01:10:11.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2041, N'Actiprolol Tab 2.5mg 14''s Pack Size: 14''s', N'medicine.png', 30.0000, CAST(N'2022-05-08T01:10:28.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2042, N'Cara-Doba Inj 250mg 1Vialx5ml Pack Size: 5ml', N'medicine.png', 386.0000, CAST(N'2022-05-08T01:10:52.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2043, N'Cara-Doba Inj 250mg 10Vialx5ml Pack Size: 5ml', N'medicine.png', 2300.0000, CAST(N'2022-05-08T01:11:08.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2044, N'Carapamin Inj 200mg 10Vialx5ml Pack Size: 20''s', N'medicine.png', 700.0000, CAST(N'2022-05-08T01:11:24.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2045, N'Carapamin Inj 200mg 50Vialx5ml Pack Size: 10vialx5ml', N'medicine.png', 2850.0000, CAST(N'2022-05-08T01:11:41.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2046, N'Carapamin Inj 200mg 1Vialx5ml Pack Size: 30''s', N'medicine.png', 70.0000, CAST(N'2022-05-08T01:11:57.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2047, N'Ozac Inj 80Mg 1Vial Pack Size: 1vial', N'medicine.png', 643.0000, CAST(N'2022-05-08T01:12:15.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2048, N'Ozac Inj 20Mg 1Vial Pack Size: 30''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T01:12:33.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2049, N'Ozac Inj 40Mg 1Vial Pack Size: 50''s', N'medicine.png', 290.0000, CAST(N'2022-05-08T01:12:50.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2050, N'Nitrop Inj 50mg 1Vial Pack Size: 1vial', N'medicine.png', 773.0000, CAST(N'2022-05-08T01:13:08.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2051, N'Norepine Inj 8mg 10Ampx4ml Pack Size: 10Ampx4ml', N'medicine.png', 3000.0000, CAST(N'2022-05-08T01:13:26.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2052, N'Coralan Tab 7.5mg 56''s Pack Size: 56''s', N'medicine.png', 1400.0000, CAST(N'2022-05-08T01:13:42.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2053, N'Coralan Tab 5mg 56''s Pack Size: 56''s', N'medicine.png', 1960.0000, CAST(N'2022-05-08T01:13:58.593' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2054, N'Dobamin Inj 250mg/5ml 10Amp Pack Size: 10ampx5ml', N'medicine.png', 2750.0000, CAST(N'2022-05-08T01:14:16.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2055, N'Epitoin Susp 30mg/5ml 120ml Pack Size: 120mi', N'medicine.png', 96.0000, CAST(N'2022-05-08T02:01:49.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2056, N'Magura Tab 2mg 30''s Pack Size: 30''s', N'medicine.png', 187.0000, CAST(N'2022-05-08T02:02:16.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2057, N'Trioptal 600 Tab 600mg 50''s Pack Size: 50''s', N'medicine.png', 1973.0000, CAST(N'2022-05-08T02:02:42.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2058, N'Magura Tab 0.5mg 50''s Pack Size: 50''s', N'medicine.png', 156.0000, CAST(N'2022-05-08T02:02:59.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2059, N'Zonas Tab 100mg 2x7''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T02:03:18.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2060, N'Epival CR Tab 500mg 5x10''s Pack Size: 50''sEpival CR Tab 500mg 5x10''s Pack Size: 50''s', N'medicine.png', 937.0000, CAST(N'2022-05-08T02:03:36.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2061, N'Baliptic Cap 75mg 14''s Pack Size: 14''s', N'medicine.png', 257.0000, CAST(N'2022-05-08T02:04:36.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2062, N'Hitop Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 1210.0000, CAST(N'2022-05-08T02:06:26.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2063, N'Lumark Tab 500mg 30''s Pack Size: 30''s', N'medicine.png', 1765.0000, CAST(N'2022-05-08T02:06:46.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2064, N'Epival Tab 500mg 1x10''s Pack Size: 10''s', N'medicine.png', 244.0000, CAST(N'2022-05-08T02:07:04.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2065, N'Keppra Tab 500mg 30''s Pack Size: 30''s', N'medicine.png', 1827.0000, CAST(N'2022-05-08T02:07:23.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2066, N'Frisium Tab 10mg 2x50''s Pack Size: 2x50''s', N'medicine.png', 689.0000, CAST(N'2022-05-08T02:07:40.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2067, N'Frisium Tab 10mg 2x50''s Pack Size: 2x50''s', N'medicine.png', 689.0000, CAST(N'2022-05-08T02:17:21.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2068, N'Vetrawin Tab 250mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 301.0000, CAST(N'2022-05-08T02:17:41.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2069, N'Abapen Cap 400mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-08T02:18:03.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2070, N'Leptil Tab 500mg 100''s Pack Size: 100''s', N'medicine.png', 694.0000, CAST(N'2022-05-08T02:18:22.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2071, N'Gabica Cap 300mg 14''s Pack Size: 14''s', N'medicine.png', 1010.0000, CAST(N'2022-05-08T02:18:39.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2072, N'Gabica Cap 50mg 14''s Pack Size: 14''s', N'medicine.png', 309.0000, CAST(N'2022-05-08T02:18:59.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2073, N'Keppra Tab 250mg 30''s Pack Size: 30''s', N'medicine.png', 1103.0000, CAST(N'2022-05-08T02:19:18.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2074, N'Eplipsa Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T02:19:36.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2075, N'Epitab XR Tab 400mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 108.0000, CAST(N'2022-05-08T02:19:53.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2076, N'Devenda Tab 250mg 30''s Pack Size: 30''s', N'medicine.png', 750.0000, CAST(N'2022-05-08T02:20:11.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2077, N'Devenda Tab 250mg 30''s Pack Size: 30''s', N'medicine.png', 382.0000, CAST(N'2022-05-08T02:20:29.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2078, N'Lalik Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 560.0000, CAST(N'2022-05-08T02:20:47.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2079, N'Abapen Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-08T02:21:06.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2080, N'Abapen Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 48.0000, CAST(N'2022-05-08T02:21:23.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2081, N'Leptil Tab 200mg 100''s Pack Size: 100''s', N'medicine.png', 394.0000, CAST(N'2022-05-08T02:21:44.303' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2082, N'Gabica Cap 150mg 14''s Pack Size: 14''s', N'medicine.png', 426.0000, CAST(N'2022-05-08T02:22:04.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2083, N'Gabica Cap 75mg 14''s Pack Size: 14''s', N'medicine.png', 370.0000, CAST(N'2022-05-08T02:22:22.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2084, N'Lamictal Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 1116.0000, CAST(N'2022-05-08T02:22:41.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2085, N'Eplipsa Tab 250mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 600.0000, CAST(N'2022-05-08T02:22:58.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2086, N'Lacolep Tab 150mg 14''s Pack Size: 14''s', N'medicine.png', 600.0000, CAST(N'2022-05-08T02:23:35.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2087, N'Tegral Tab 200mg 5x10''s Pack Size: 50''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T02:23:53.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2088, N'Klevra Oral Sol 500mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 394.0000, CAST(N'2022-05-08T02:24:10.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2089, N'Dapakan Tab 500mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 145.0000, CAST(N'2022-05-08T02:24:28.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2090, N'Seizunil Susp 100mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 93.0000, CAST(N'2022-05-08T02:24:49.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2091, N'Telox Oral Susp 300mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 283.0000, CAST(N'2022-05-08T02:26:00.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2092, N'Telox Tab 300mg 5x10''s Pack Size: 50''s', N'medicine.png', 502.0000, CAST(N'2022-05-08T02:26:18.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2093, N'Lumark Sol 100mg/ml 60ml Pack Size: 60ml', N'medicine.png', 380.0000, CAST(N'2022-05-08T02:26:36.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2094, N'Lumark Sol 100mg/ml 60ml Pack Size: 60ml', N'medicine.png', 146.0000, CAST(N'2022-05-08T02:26:56.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2095, N'Epizep Drops 2.5mg/ml 10ml Pack Size: 10ml', N'medicine.png', 152.0000, CAST(N'2022-05-08T02:27:16.177' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2096, N'Epizep Tab 0.5mg 50''s Pack Size: 50''s', N'medicine.png', 135.0000, CAST(N'2022-05-08T02:27:37.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2097, N'Zitrigine Tab 100mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 623.0000, CAST(N'2022-05-08T02:28:53.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2098, N'Oxalepsy Tab 600mg 50''s Pack Size: 50''s', N'medicine.png', 873.0000, CAST(N'2022-05-08T02:29:17.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2099, N'Limgit Tab 50mg 3x10''s Pack Size: 30''s', N'medicine.png', 531.0000, CAST(N'2022-05-08T02:29:36.377' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2100, N'Epicetam Tab 250mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T02:29:54.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2101, N'Epicetam Syp 100mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 457.0000, CAST(N'2022-05-08T02:30:14.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2102, N'Lamitor Tab 100mg 30`s Pack Size: 30`s', N'medicine.png', 600.0000, CAST(N'2022-05-08T02:30:34.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2103, N'Lamitor Tab 25mg 30`s Pack Size: 30''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T02:30:57.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2104, N'Caragin Tab 50mg 3x10''s Pack Size: 30''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T02:31:15.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2105, N'Levetram Tab 500mg 30''s Pack Size: 30', N'medicine.png', 1290.0000, CAST(N'2022-05-08T02:31:34.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2106, N'Lamitor Tab 200mg Pack Size: 30''s', N'medicine.png', 700.0000, CAST(N'2022-05-08T02:31:54.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2107, N'Lamitor Tab 25mg 30`s Pack Size: 30''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T02:32:15.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2108, N'Epival Syp 250mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 192.0000, CAST(N'2022-05-08T02:32:36.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2109, N'Epicar Susp 100mg/5ml 120ml Pack Size: 120mi', N'medicine.png', 92.0000, CAST(N'2022-05-08T02:32:54.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2110, N'Topiro Tab 25mg 6x10''s Pack Size: 6x10''s', N'medicine.png', 900.0000, CAST(N'2022-05-08T02:33:13.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2111, N'Topiro Tab 50mg 6x10''s Pack Size: 6x10''s', N'medicine.png', 1334.0000, CAST(N'2022-05-08T02:33:31.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2112, N'Topiro Tab 100mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 970.0000, CAST(N'2022-05-08T02:33:49.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2113, N'Albotram Tab 250mg 3x10''s Pack Size: 30''s', N'medicine.png', 892.0000, CAST(N'2022-05-08T02:34:19.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2114, N'Albotram Tab 500mg 3x10''s Pack Size: 30''s', N'medicine.png', 1479.0000, CAST(N'2022-05-08T02:34:37.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2115, N'Epigran Inj 250mg 10Ampx5ml Pack Size: 10ampx5ml', N'medicine.png', 2064.0000, CAST(N'2022-05-08T02:34:56.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2116, N'Atcomid Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 330.0000, CAST(N'2022-05-08T02:35:13.850' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2117, N'Atcomid Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 528.0000, CAST(N'2022-05-08T02:35:30.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2118, N'Atcomid Tab 150mg 14''s Pack Size: 14''s', N'medicine.png', 518.0000, CAST(N'2022-05-08T02:35:47.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2119, N'Atcomid Inj 1Vial Pack Size: 1Vial', N'medicine.png', 412.0000, CAST(N'2022-05-08T02:36:06.877' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2120, N'Lacosbar Tab 50mg 14''s Pack Size: 14s', N'medicine.png', 325.0000, CAST(N'2022-05-08T02:36:25.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2121, N'Lacosbar Tab 100mg 14''s Pack Size: 14s', N'medicine.png', 485.0000, CAST(N'2022-05-08T02:36:43.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2122, N'Lacosbar Tab 150mg 14''s Pack Size: 14s', N'medicine.png', 602.0000, CAST(N'2022-05-08T02:37:01.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2123, N'Leptil Syp 150ml 1''s Pack Size: 150ml', N'medicine.png', 120.0000, CAST(N'2022-05-08T02:37:17.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2124, N'Engaba Tab 100mg 1x10''s Pack Size: 10''s', N'medicine.png', 50.0000, CAST(N'2022-05-08T02:37:35.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2125, N'Engrax Tab 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 751.0000, CAST(N'2022-05-08T02:39:11.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2126, N'Engrax Tab 200mg 3x10''s Pack Size: 30''s', N'medicine.png', 1000.0000, CAST(N'2022-05-08T02:39:37.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2127, N'Zopiramate Tab 25mg 6x10''s Pack Size: 60''s', N'medicine.png', 900.0000, CAST(N'2022-05-08T02:39:55.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2128, N'Engaba Cap 300mg 1x10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T02:40:13.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2129, N'Fentin Inj 50mg/ml 5Ampx1ml Pack Size: 5', N'medicine.png', 250.0000, CAST(N'2022-05-08T02:40:29.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2130, N'Gabica Cap 100mg 14''s 94... Pack Size: 94', N'medicine.png', 0.0000, CAST(N'2022-05-08T02:41:05.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2131, N'Gabica Cap 50mg 14''s 94... Pack Size: 94', N'medicine.png', 17534.0000, CAST(N'2022-05-08T02:41:26.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2132, N'Gabica Cap 300mg 14''s 40... Pack Size: 40', N'medicine.png', 566.0000, CAST(N'2022-05-08T02:41:49.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2133, N'Gabix Cap 100mg 10''s 114... Pack Size:144 Packs', N'medicine.png', 4603.0000, CAST(N'2022-05-08T02:42:11.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2134, N'Gabix Cap 300mg 10''s 124... Pack Size: 124Gabix Cap 300mg 10''s 124... Pack Size: 124', N'medicine.png', 15020.0000, CAST(N'2022-05-08T02:42:32.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2135, N'Gabica Cap 100mg 14''s Pack Size: 14''s', N'medicine.png', 414.0000, CAST(N'2022-05-08T02:42:51.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2136, N'Gabix Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 68.0000, CAST(N'2022-05-08T02:43:11.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2137, N'Gabix Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 223.0000, CAST(N'2022-05-08T02:43:30.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2138, N'Xeticam Tab 750mg 10''s Pack Size: 10''s', N'medicine.png', 595.0000, CAST(N'2022-05-08T02:43:48.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2139, N'Xeticam Tab 250mg 10''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T02:44:08.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2140, N'Xeticam IV 500mg/5ml 1''s Pack Size: 1''sXeticam IV 500mg/5ml 1''s Pack Size: 1''s', N'medicine.png', 325.0000, CAST(N'2022-05-08T02:44:26.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2141, N'Lamictal Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 669.0000, CAST(N'2022-05-08T02:44:43.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2142, N'Lamictal Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 1897.0000, CAST(N'2022-05-08T02:45:05.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2143, N'Eplipsa IV Inj 500mg 1Ampx5ml Pack Size: 1', N'medicine.png', 283.0000, CAST(N'2022-05-08T02:45:24.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2144, N'Hitop Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 640.0000, CAST(N'2022-05-08T02:45:43.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2145, N'Hitop Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 895.0000, CAST(N'2022-05-08T02:46:03.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2146, N'Lerace Oral Sol 100mg/ml 30ml Pack Size: 30ml', N'medicine.png', 245.0000, CAST(N'2022-05-08T02:46:27.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2147, N'Lerace Inj 500mg 1Vial Pack Size: 1''s', N'medicine.png', 347.0000, CAST(N'2022-05-08T02:46:44.067' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2148, N'Lerace Tab 250mg 10''s Pack Size: 10''s', N'medicine.png', 295.0000, CAST(N'2022-05-08T02:47:00.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2149, N'Lerace Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 490.0000, CAST(N'2022-05-08T02:47:19.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2150, N'Lerace Tab 750mg 10''s Pack Size: 10''s', N'medicine.png', 645.0000, CAST(N'2022-05-08T02:47:36.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2151, N'Lojin Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 680.0000, CAST(N'2022-05-08T02:47:54.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2152, N'Lojin Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 550.0000, CAST(N'2022-05-08T02:48:15.603' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2153, N'Lojin Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 425.0000, CAST(N'2022-05-08T02:48:32.977' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2154, N'Neogab Cap 100mg 30''s Pack Size: 30''s', N'medicine.png', 431.0000, CAST(N'2022-05-08T02:48:50.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2155, N'Neogab Cap 300mg 30''s Pack Size: 30''s', N'medicine.png', 886.0000, CAST(N'2022-05-08T02:49:11.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2156, N'Neogab Cap 400mg 10''s Pack Size: 10''s', N'medicine.png', 380.0000, CAST(N'2022-05-08T02:49:41.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2157, N'Lerace XR Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 530.0000, CAST(N'2022-05-08T02:50:13.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2158, N'Lacolep Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 370.0000, CAST(N'2022-05-08T02:50:34.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2159, N'Lacolep Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 539.0000, CAST(N'2022-05-08T02:50:52.850' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2160, N'Lacolep I.V Injection 1Ampx20ml Pack Size: 20ml', N'medicine.png', 450.0000, CAST(N'2022-05-08T02:51:14.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2161, N'Lerace Oral Sol 60ml Pack Size: 60ml', N'medicine.png', 475.0000, CAST(N'2022-05-08T02:51:34.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2162, N'Indiga Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 48.0000, CAST(N'2022-05-08T02:51:55.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2163, N'Indiga Cap 400mg 10''s Pack Size: 10''s', N'medicine.png', 161.0000, CAST(N'2022-05-08T02:52:13.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2164, N'Indiga Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 133.0000, CAST(N'2022-05-08T02:52:31.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2165, N'Neurogabin-M Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T02:52:50.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2166, N'Neurogabin-M Cap 400mg 10''s Pack Size: 10''s', N'medicine.png', 219.0000, CAST(N'2022-05-08T02:53:11.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2167, N'Neurogabin-M Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 63.0000, CAST(N'2022-05-08T02:53:31.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2168, N'Teril Tab 200mg 5x10''s Pack Size: 5X10''s', N'medicine.png', 228.0000, CAST(N'2022-05-08T02:53:48.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2169, N'Vicet Tab 250mg 3x10''s Pack Size: 30''s', N'medicine.png', 674.0000, CAST(N'2022-05-08T02:54:08.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2170, N'Vicet Tab 500mg 3x10''s Pack Size: 30''s', N'medicine.png', 1179.0000, CAST(N'2022-05-08T02:54:31.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2171, N'Nervaid Cap 100mg 1x10''s Pack Size: 10''s', N'medicine.png', 48.0000, CAST(N'2022-05-08T02:54:50.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2172, N'Nervaid Cap 300mg 1x10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-08T02:55:10.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2173, N'Gaba Cap 300mg 20''s Pack Size: 20''s', N'medicine.png', 334.0000, CAST(N'2022-05-08T02:55:29.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2174, N'Gaba Cap 100mg 20''s Pack Size: 20''s', N'medicine.png', 119.0000, CAST(N'2022-05-08T02:55:49.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2175, N'Topadix Tab 50mg 60''s Pack Size: 30''s', N'medicine.png', 1200.0000, CAST(N'2022-05-08T02:56:08.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2176, N'Topadix Tab 100mg 30''s Pack Size: 100''s', N'medicine.png', 750.0000, CAST(N'2022-05-08T02:56:34.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2177, N'Pentidix Cap 400mg 10''s Pack Size: 10''sPentidix Cap 400mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-08T02:56:53.823' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2178, N'Pentidix Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 50.0000, CAST(N'2022-05-08T02:57:14.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2179, N'Pentidix Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T02:57:33.807' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2180, N'Trioptal 300 Tab 300mg 50''s Pack Size: 50''s', N'medicine.png', 988.0000, CAST(N'2022-05-08T02:57:56.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2181, N'Tegral Susp 100mg /5ml 100ml Pack Size: 100ml', N'medicine.png', 94.0000, CAST(N'2022-05-08T02:58:17.180' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2182, N'Parketin Cap 400mg 30''s Pack Size: 30''s', N'medicine.png', 724.0000, CAST(N'2022-05-08T02:58:37.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2183, N'Parketin Cap 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 276.0000, CAST(N'2022-05-08T02:58:55.057' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2184, N'Parketin Cap 300mg 30''s Pack Size: 30''s', N'medicine.png', 563.0000, CAST(N'2022-05-08T02:59:13.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2185, N'Xamogine Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 390.0000, CAST(N'2022-05-08T02:59:31.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2186, N'Klevra Tab 250mg 30''s Pack Size: 30''s', N'medicine.png', 790.0000, CAST(N'2022-05-08T02:59:52.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2187, N'Klevra Tab 500mg 30''s Pack Size: 30''s', N'medicine.png', 1611.0000, CAST(N'2022-05-08T03:00:15.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2188, N'Klevra XR Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 391.0000, CAST(N'2022-05-08T03:00:32.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2189, N'Dapakan Tab 250mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 104.0000, CAST(N'2022-05-08T03:00:50.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2190, N'Gaba Plus Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 63.0000, CAST(N'2022-05-08T03:01:07.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2191, N'Gaba Plus Cap 300mg 1x10''s Pack Size: 10''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T03:01:25.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2192, N'Lamonil Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 628.0000, CAST(N'2022-05-08T03:01:43.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2193, N'Lamonil Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 502.0000, CAST(N'2022-05-08T03:02:03.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2194, N'Lamonil Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 377.0000, CAST(N'2022-05-08T03:02:22.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2195, N'Telox Tab 150mg 5x10''s Pack Size: 50''s', N'medicine.png', 283.0000, CAST(N'2022-05-08T03:02:40.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2196, N'Topirama Tab 50mg 2x10''s Pack Size: 20''s', N'medicine.png', 426.0000, CAST(N'2022-05-08T03:02:59.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2197, N'Topirama Tab 100mg 1x10''s Pack Size: 10''s', N'medicine.png', 314.0000, CAST(N'2022-05-08T03:03:18.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2198, N'Topirama Tab 25mg 2x10''s Pack Size: 20''s', N'medicine.png', 311.0000, CAST(N'2022-05-08T03:03:37.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2199, N'Telox Tab 600mg 5x10''s Pack Size: 50''s', N'medicine.png', 941.0000, CAST(N'2022-05-08T03:03:55.080' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2200, N'Levotam Tab 250mg 3x10''s Pack Size: 30''s', N'medicine.png', 748.0000, CAST(N'2022-05-08T03:04:14.753' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2201, N'Levotam Oral Sol 100mg/ml 60ml Pack Size: 60ml', N'medicine.png', 403.0000, CAST(N'2022-05-08T03:04:32.697' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2202, N'Levotam Tab 500mg 1x10''s Pack Size: 10''s', N'medicine.png', 460.0000, CAST(N'2022-05-08T03:04:51.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2203, N'Valpro Tab 200mg 10x10''s Pack Size: 100''s', N'medicine.png', 258.0000, CAST(N'2022-05-08T03:05:13.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2204, N'Hi-Gab Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 50.0000, CAST(N'2022-05-08T03:05:32.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2205, N'Valpro Tab 500mg 10x10''s Pack Size: 100''s', N'medicine.png', 508.0000, CAST(N'2022-05-08T03:05:50.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2206, N'Valpro Liq 250mg 120ml Pack Size: 120ml', N'medicine.png', 97.0000, CAST(N'2022-05-08T03:06:09.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2207, N'Winurina Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T03:06:27.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2208, N'Lamprene Tab 100mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 500.0000, CAST(N'2022-05-08T03:06:49.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2209, N'Lamprene Tab 25mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T03:07:07.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2210, N'Lamprene Tab 50mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T03:07:26.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2211, N'Tomax Tab 50mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T03:07:44.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2212, N'Lamnet Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 380.0000, CAST(N'2022-05-08T03:08:08.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2213, N'Lamnet Tab 100mg 30''s Pack Size: 30', N'medicine.png', 640.0000, CAST(N'2022-05-08T03:08:26.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2214, N'Lamnet Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 492.0000, CAST(N'2022-05-08T03:08:45.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2215, N'Lumark Tab 250mg 30''s Pack Size: 30''s', N'medicine.png', 1017.0000, CAST(N'2022-05-08T03:09:06.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2216, N'Lamnet Tab 5mg 30''s Pack Size: 30''s', N'medicine.png', 76.0000, CAST(N'2022-05-08T03:09:25.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2217, N'Lumark Inj 500mg 1Ampx5ml Pack Size: 1', N'medicine.png', 275.0000, CAST(N'2022-05-08T03:09:43.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2218, N'Emscot Tab 250mg 10''s Pack Size: 10''s', N'medicine.png', 255.0000, CAST(N'2022-05-08T03:10:02.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2219, N'Emscot Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 370.0000, CAST(N'2022-05-08T03:10:21.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2220, N'Emscot Tab 750mg 10''s Pack Size: 10''s', N'medicine.png', 550.0000, CAST(N'2022-05-08T03:10:39.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2221, N'Lomogin Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 325.0000, CAST(N'2022-05-08T03:10:58.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2222, N'Lomogin Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 595.0000, CAST(N'2022-05-08T03:11:19.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2223, N'Lomogin Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 470.0000, CAST(N'2022-05-08T03:11:39.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2224, N'Nervex Tab 300mg 10''s Pack Size: 10''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T03:11:59.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2225, N'Nervex Tab 100mg 10''s Pack Size: 10''s', N'medicine.png', 70.0000, CAST(N'2022-05-08T03:12:22.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2226, N'Nervex Tab 400mg 10''s Pack Size: 10''s', N'medicine.png', 248.0000, CAST(N'2022-05-08T03:12:42.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2227, N'Keptiron Tab 500mg 30''s Pack Size: 30''s', N'medicine.png', 1350.0000, CAST(N'2022-05-08T03:13:01.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2228, N'Neurol-EP Tab 250mg 10x10''s Pack Size: 100''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T03:13:19.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2229, N'Neurol-EP Tab 250mg 2x10''s Pack Size: 20''s', N'medicine.png', 70.0000, CAST(N'2022-05-08T03:13:43.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2230, N'Neurol-EP Tab 500mg 10x10''s Pack Size: 100''s', N'medicine.png', 322.0000, CAST(N'2022-05-08T03:14:03.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2231, N'Valprosim Tab 500mg 10x10''s Pack Size: 100''s', N'medicine.png', 322.0000, CAST(N'2022-05-08T03:14:22.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2232, N'Valprosim Tab 250mg 10x10''s Pack Size: 100''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T03:14:40.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2233, N'Valprosim Tab 500mg 2x10''s Pack Size: 20''s', N'medicine.png', 70.0000, CAST(N'2022-05-08T03:15:00.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2234, N'Vaniqa Cap 300mg 2x5''s Pack Size: 2x5''s', N'medicine.png', 180.0000, CAST(N'2022-05-08T03:15:21.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2235, N'Vaniqa Tab 600mg 2x5''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-08T03:15:43.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2236, N'Xegaba Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T03:16:03.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2237, N'Epizep Tab 2mg 30''s Pack Size: 30''s', N'medicine.png', 162.0000, CAST(N'2022-05-08T03:16:21.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2238, N'Magnesium Sulphate Inj 500mg 5Ampx2ml Pack Size: 5Ampx2ml', N'medicine.png', 58.0000, CAST(N'2022-05-08T03:16:40.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2239, N'Magnesium Sulphate Inj 500mg 1Ampx10ml Pack Size: 1Ampx10ml', N'medicine.png', 22.0000, CAST(N'2022-05-08T03:16:58.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2240, N'Gabatin Cap 100mg 3x10''s (Zaka... Pack Size: 30''s', N'medicine.png', 360.0000, CAST(N'2022-05-08T03:18:21.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2241, N'Gabatin Cap 300mg 3x10''s (Zaka... Pack Size: 30''s', N'medicine.png', 690.0000, CAST(N'2022-05-08T03:18:40.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2242, N'Lamogine Tab 200mg 3x10''s Pack Size: 30''s', N'medicine.png', 700.0000, CAST(N'2022-05-08T03:18:57.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2243, N'Lamogine Tab 100mg 3Lamogine Tab 100mg 3Lamogine Tab 100mg 3x10''s Pack Size: 10''sx10''s Pack Size: 10''sx10''s Pack Size: 10''s', N'medicine.png', 500.0000, CAST(N'2022-05-08T03:19:14.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2244, N'Lamogine Tab 100mg 3x10''s Pack Size: 10''s', N'medicine.png', 500.0000, CAST(N'2022-05-08T03:19:29.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2245, N'Lamogine Tab 25mg 3x10''s Pack Size: 1vial', N'medicine.png', 300.0000, CAST(N'2022-05-08T03:19:49.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2246, N'Zitrigine Tab 50mg 3x10''s 160... Pack Size: 160', N'medicine.png', 53312.0000, CAST(N'2022-05-08T03:20:11.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2247, N'Zonas Tab 100mg 2x7''s 200... Pack Size: 200', N'medicine.png', 34896.0000, CAST(N'2022-05-08T03:20:32.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2248, N'Zeetam Tab 500mg 1x10''s 150', N'medicine.png', 33736.0000, CAST(N'2022-05-08T03:21:03.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2249, N'Zopiramate Tab 50mg 6x10''s 71... Pack Size: 71', N'medicine.png', 57936.0000, CAST(N'2022-05-08T03:22:41.997' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2250, N'Zopiramate Tab 50mg 6x10''s 150... Pack Size: 150', N'medicine.png', 122400.0000, CAST(N'2022-05-08T03:23:00.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2251, N'Zopiramate Tab 50mg 6x10''s 44... Pack Size: 44', N'medicine.png', 35904.0000, CAST(N'2022-05-08T03:23:27.503' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2252, N'Zopiramate Tab 50mg 6x10''s Pack Size: 6x10''s', N'medicine.png', 1400.0000, CAST(N'2022-05-08T03:23:43.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2253, N'Zitrigine Tab 50mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 524.0000, CAST(N'2022-05-08T03:23:59.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2254, N'Zeetam Tab 500mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T03:24:16.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2255, N'Fitzloc Tab 500mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 500.0000, CAST(N'2022-05-08T03:24:33.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2256, N'Fitzloc Tab 250mg 1x10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T03:24:50.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2257, N'Fitzloc Tab 750mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 580.0000, CAST(N'2022-05-08T03:25:07.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2258, N'Oxalepsy Tab 150mg 30''s Pack Size: 30''s', N'medicine.png', 135.0000, CAST(N'2022-05-08T03:25:23.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2259, N'Oxalepsy Tab 300mg 50''s Pack Size: 50''s', N'medicine.png', 466.0000, CAST(N'2022-05-08T03:25:40.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2260, N'Gabafix Cap 400mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-08T03:25:58.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2261, N'Gabafix Cap 300mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T03:26:16.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2262, N'Gabafix Cap 100mg 30''s Pack Size: 30''s', N'medicine.png', 186.0000, CAST(N'2022-05-08T03:26:34.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2263, N'Legent Tab 100mg 5x6''s Pack Size: 5x6''s', N'medicine.png', 750.0000, CAST(N'2022-05-08T03:26:52.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2264, N'Dipodium Syp 250mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 60.0000, CAST(N'2022-05-08T03:27:10.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2265, N'Dipodium Syp 500mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 113.0000, CAST(N'2022-05-08T03:27:28.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2266, N'Dipodium Tab 500mg 3x10''s Pack Size: 30''s', N'medicine.png', 202.0000, CAST(N'2022-05-08T03:27:47.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2267, N'Legent Tab 25mg 6x10''s Pack Size: 6x10''s', N'medicine.png', 900.0000, CAST(N'2022-05-08T03:28:05.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2268, N'Limgit Tab 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 664.0000, CAST(N'2022-05-08T03:28:28.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2269, N'Legent Tab 50mg 6x10''s Pack Size: 6x10''s', N'medicine.png', 1645.0000, CAST(N'2022-05-08T03:28:49.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2270, N'Limgit Tab 25mg 3x10''s Pack Size: 30''s', N'medicine.png', 399.0000, CAST(N'2022-05-08T03:29:08.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2271, N'Vetrawin Oral Sol 100mg/ml 30ml', N'medicine.png', 260.0000, CAST(N'2022-05-08T03:29:34.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2272, N'Vetrawin Tab 500mg 1x10''s Pack Size: 10''s', N'medicine.png', 596.0000, CAST(N'2022-05-08T03:29:55.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2273, N'Epicetam Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 475.0000, CAST(N'2022-05-08T04:24:41.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2274, N'Torate Tab 50mg 30''s Pack Size: 30''s', N'medicine.png', 889.0000, CAST(N'2022-05-08T04:24:54.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2275, N'Torate Tab 25mg 30''s Pack Size: 30''s', N'medicine.png', 606.0000, CAST(N'2022-05-08T04:25:05.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2276, N'Epicetam Inj 500mg/5ml 1Vial Pack Size: 1Vial', N'medicine.png', 381.0000, CAST(N'2022-05-08T04:25:34.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2277, N'Epicetam Tab 750mg 10''s Pack Size: 10''s', N'medicine.png', 580.0000, CAST(N'2022-05-08T04:25:53.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2278, N'Bapen Cap 100mg 20''s Pack Size: 20''s', N'medicine.png', 122.0000, CAST(N'2022-05-08T04:26:10.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2279, N'Bapen Cap 300mg 20''s Pack Size: 20''s', N'medicine.png', 337.0000, CAST(N'2022-05-08T04:26:28.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2280, N'Bapen Cap 400mg 20''s Pack Size: 20''s', N'medicine.png', 446.0000, CAST(N'2022-05-08T04:26:45.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2281, N'Bapen Cap 400mg 20''s Pack Size: 20''s', N'medicine.png', 1150.0000, CAST(N'2022-05-08T04:27:03.863' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2282, N'Lepsi Oral Sol 100mg/ml 60ml Pack Size: 60ml', N'medicine.png', 450.0000, CAST(N'2022-05-08T04:27:21.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2283, N'Revalp Tab 500mg 100''s Pack Size: 100''s', N'medicine.png', 757.0000, CAST(N'2022-05-08T04:27:52.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2284, N'Revalp Syp 250mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 135.0000, CAST(N'2022-05-08T04:28:26.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2285, N'Revalp Tab 250mg 100''s Pack Size: 100''s', N'medicine.png', 456.0000, CAST(N'2022-05-08T04:29:02.307' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2286, N'Revalp Tab 250mg 100''s Pack Size: 100''s', N'medicine.png', 900.0000, CAST(N'2022-05-08T04:29:27.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2287, N'Topagen Tab 50mg 60''s Pack Size: 60''s', N'medicine.png', 1200.0000, CAST(N'2022-05-08T04:29:58.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2288, N'Topagen Tab 100mg 30''s Pack Size: 30''s', N'medicine.png', 992.0000, CAST(N'2022-05-08T04:30:16.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2289, N'Lamitor Tab 200mg 30`s Pack Size: 30''s', N'medicine.png', 700.0000, CAST(N'2022-05-08T04:30:34.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2290, N'Lamitor Tab 50mg 30`s Pack Size: 30`s', N'medicine.png', 400.0000, CAST(N'2022-05-08T04:30:51.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2291, N'Lamitor Tab 50mg 30`s Pack Size: 30`s', N'medicine.png', 400.0000, CAST(N'2022-05-08T04:32:53.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2292, N'Lingab Cap 25mg 14''s Pack Size: 14''s', N'medicine.png', 160.0000, CAST(N'2022-05-08T04:33:12.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2293, N'Lingab Cap 50mg 20''s Pack Size: 14`s', N'medicine.png', 360.0000, CAST(N'2022-05-08T04:33:30.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2294, N'Lingab Cap 75mg 20''s Pack Size: 20`s', N'medicine.png', 304.0000, CAST(N'2022-05-08T04:33:49.337' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2295, N'Lingab Cap 150mg 20''s Pack Size: 20s', N'medicine.png', 500.0000, CAST(N'2022-05-08T04:34:07.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2296, N'Lingab Cap 300mg 14''s Pack Size: 14''s', N'medicine.png', 700.0000, CAST(N'2022-05-08T04:34:27.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2297, N'Branon Tab 300mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T04:34:47.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2298, N'Branon Tab 600mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T04:35:05.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2299, N'Caragin Tab 25mg 3x10''s Pack Size: 30''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T04:35:26.830' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2300, N'Caralium Tab 500mg 10x10''s Pack Size: 100''s', N'medicine.png', 500.0000, CAST(N'2022-05-08T04:35:44.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2301, N'Levezine Tab 250mg 10''s Pack Size: 30''s', N'medicine.png', 262.0000, CAST(N'2022-05-08T04:36:01.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2302, N'Levezine Tab 250mg 30''s Pack Size: 10''s', N'medicine.png', 787.0000, CAST(N'2022-05-08T04:38:02.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2303, N'Levezine Tab 500mg 30''s Pack Size: 30''s', N'medicine.png', 1305.0000, CAST(N'2022-05-08T04:38:20.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2304, N'Levezine Tab 500mg 10''s Pack Size: 10''s', N'medicine.png', 435.0000, CAST(N'2022-05-08T04:38:38.307' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2305, N'Topcal Tab 100mg 6x10''s Pack Size: 28''s', N'medicine.png', 1500.0000, CAST(N'2022-05-08T04:38:57.097' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2306, N'Topcal Tab 100mg 3x10''s Pack Size: 10''s', N'medicine.png', 750.0000, CAST(N'2022-05-08T04:39:16.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2307, N'Topcal Tab 50mg 6x10''s Pack Size: 30''s', N'medicine.png', 1200.0000, CAST(N'2022-05-08T04:39:34.273' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2308, N'Lalap Tab 100mg 14''s Pack Size: 14''s', N'medicine.png', 703.0000, CAST(N'2022-05-08T04:39:53.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2309, N'Lalap?Ã¿Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 422.0000, CAST(N'2022-05-08T04:40:13.993' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2310, N'Lalap Tab 200mg 14''s Pack Size: 14''s', N'medicine.png', 1171.0000, CAST(N'2022-05-08T04:40:32.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2311, N'Gepent Tab 300mg 1x10''s Pack Size: 10''s', N'medicine.png', 172.0000, CAST(N'2022-05-08T04:40:51.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2312, N'Gepent Tab 100mg 1x10''s Pack Size: 10''s', N'medicine.png', 57.0000, CAST(N'2022-05-08T04:41:08.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2313, N'Gepent Tab 400mg 2x5''s Pack Size: 10''s', N'medicine.png', 230.0000, CAST(N'2022-05-08T04:41:26.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2314, N'G-Tin Cap 1x10''s Pack Size: 10''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T04:41:44.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2315, N'Lekra Tab 250mg 10''s Pack Size: 40g', N'medicine.png', 220.0000, CAST(N'2022-05-08T04:42:03.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2316, N'Lekra Tab 500mg 10''s Pack Size: 200ml', N'medicine.png', 450.0000, CAST(N'2022-05-08T04:42:22.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2317, N'Gabavant Cap 100mg 10''s Pack Size: 10''s', N'medicine.png', 64.0000, CAST(N'2022-05-08T04:42:41.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2318, N'Topamid Tab 50mg 60''s Pack Size: 60''s', N'medicine.png', 1200.0000, CAST(N'2022-05-08T04:43:01.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2319, N'Topilep Tab 25mg 60''s Pack Size: 60''s', N'medicine.png', 720.0000, CAST(N'2022-05-08T04:43:20.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2320, N'Topilep Tab 50mg 60''s Pack Size: 60''s', N'medicine.png', 1550.0000, CAST(N'2022-05-08T04:43:46.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2321, N'Baliptic Cap 50mg 14''s Pack Size: 14''s', N'medicine.png', 198.0000, CAST(N'2022-05-08T04:44:06.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2322, N'Baliptic Cap 150mg 14''s Pack Size: 14''s', N'medicine.png', 395.0000, CAST(N'2022-05-08T04:44:26.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2323, N'Baliptic Cap 100mg 14''s Pack Size: 14''s', N'medicine.png', 295.0000, CAST(N'2022-05-08T04:45:21.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2324, N'Lalik Tab 50mg 14''s Pack Size: 14''s', N'medicine.png', 336.0000, CAST(N'2022-05-08T04:45:48.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2325, N'Levetram Tab 250mg 30''s Pack Size: 30''s', N'medicine.png', 650.0000, CAST(N'2022-05-08T04:46:10.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2326, N'Clotles SS Inj 40mg/ml 2''s Pack Size: 2''s', N'medicine.png', 890.0000, CAST(N'2022-05-08T04:46:58.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2327, N'Clexane Inj 60mg 2PFSx0.6ml', N'medicine.png', 1200.0000, CAST(N'2022-05-08T04:47:17.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2328, N'Plavix Tab 75mg 28''s Pack Size: 28''s', N'medicine.png', 867.0000, CAST(N'2022-05-08T04:47:41.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2329, N'Locril Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 110.0000, CAST(N'2022-05-08T04:47:58.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2330, N'Deplat Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 148.0000, CAST(N'2022-05-08T04:48:20.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2331, N'Lowplat Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 174.0000, CAST(N'2022-05-08T04:48:38.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2332, N'Warfin Tab 5mg Pack Size: 100''s', N'medicine.png', 900.0000, CAST(N'2022-05-08T04:48:56.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2333, N'Warfin Tab 2.5mg 100â€™s Pack Size: 100''s', N'medicine.png', 452.0000, CAST(N'2022-05-08T04:49:13.823' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2334, N'Ogrel Plus-81 Tab 75mg/81mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T04:49:32.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2335, N'Kumplat Tab 75mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 111.0000, CAST(N'2022-05-08T04:49:48.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2336, N'Ascard Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 185.0000, CAST(N'2022-05-08T04:50:07.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2337, N'Aggrastat Inj 12.5mg 1Vialx50ml Pack Size: 1', N'medicine.png', 24691.0000, CAST(N'2022-05-08T04:50:29.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2338, N'Ascard Plus Forte Tab 10''s Pack Size: 10''s', N'medicine.png', 130.0000, CAST(N'2022-05-08T04:50:47.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2339, N'Clotnil Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 185.0000, CAST(N'2022-05-08T04:51:07.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2340, N'Clotnil Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T04:51:25.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2341, N'Rivaclot Tab 2.5mg 10''s Pack Size: 10''s', N'medicine.png', 95.0000, CAST(N'2022-05-08T04:51:45.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2342, N'Rivaclot Tab 15mg 14''s Pack Size: 14s', N'medicine.png', 560.0000, CAST(N'2022-05-08T04:52:02.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2343, N'Rivaclot Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T04:52:24.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2344, N'Rivaclot Tab 20mg 14''s Pack Size: 14s', N'medicine.png', 700.0000, CAST(N'2022-05-08T04:52:42.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2345, N'Xarelto Tab 10mg 5''s Pack Size: 5''s', N'medicine.png', 1525.0000, CAST(N'2022-05-08T04:53:02.337' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2346, N'Xarelto Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 4270.0000, CAST(N'2022-05-08T04:53:22.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2347, N'Xarelto Tab 20mg 14''s Pack Size: 20''s', N'medicine.png', 4270.0000, CAST(N'2022-05-08T04:53:41.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2348, N'Strovix Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 124.0000, CAST(N'2022-05-08T04:53:59.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2349, N'Multiparin Inj 5000 IU/ml 10vial Pack Size: 10Vials', N'medicine.png', 5500.0000, CAST(N'2022-05-08T04:54:18.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2350, N'Ogrel Plus-162 Tab 2x14''s Pack Size: 28''s', N'medicine.png', 293.0000, CAST(N'2022-05-08T04:56:41.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2351, N'Ogrel Plus-81 Tab 75mg/81mg 10''s Pack Size: 10''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T04:57:00.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2352, N'OGREL Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 170.0000, CAST(N'2022-05-08T04:57:18.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2353, N'Loprid Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T04:57:35.897' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2354, N'Clopid ASP Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 147.0000, CAST(N'2022-05-08T04:57:56.163' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2355, N'Clopid Tab 75mg 10''s Pack Size: 10', N'medicine.png', 180.0000, CAST(N'2022-05-08T04:58:14.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2356, N'Geopidogrel Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 140.0000, CAST(N'2022-05-08T04:58:39.723' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2357, N'Prisa Tab 5mg 14''s 160... Pack Size: 160...', N'medicine.png', 17936.0000, CAST(N'2022-05-08T04:59:01.767' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2358, N'Rivaxo Tab 15mg 10''s Pack Size: 10''s', N'medicine.png', 450.0000, CAST(N'2022-05-08T04:59:21.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2359, N'Rivaxo Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 350.0000, CAST(N'2022-05-08T04:59:39.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2360, N'Rivaxo Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 499.0000, CAST(N'2022-05-08T04:59:57.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2361, N'Cocard Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 98.0000, CAST(N'2022-05-08T05:00:15.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2362, N'Pidogrel-AP Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 180.0000, CAST(N'2022-05-08T05:00:32.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2363, N'Pidogrel-AP Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 171.0000, CAST(N'2022-05-08T05:00:49.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2364, N'Pidogrel Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 160.0000, CAST(N'2022-05-08T05:01:08.663' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2365, N'Platlo Tab 75mg 14''s Pack Size: 14''s', N'medicine.png', 252.0000, CAST(N'2022-05-08T05:01:26.217' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2366, N'Clotles Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 137.0000, CAST(N'2022-05-08T05:01:48.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2367, N'Clotles SS Inj 20mg/ml 2''s Pack Size', N'medicine.png', 478.0000, CAST(N'2022-05-08T05:02:10.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2368, N'Clotles SS Inj 80mg/ml 1''s Pack Size', N'medicine.png', 591.0000, CAST(N'2022-05-08T05:02:29.577' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2369, N'Clotles SS Inj 60mg/ml 2''s Pack Size: 2''s', N'medicine.png', 1155.0000, CAST(N'2022-05-08T05:02:49.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2370, N'Fleet Tab 75mg 30''s Pack Size: 30''s', N'medicine.png', 510.0000, CAST(N'2022-05-08T05:03:08.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2371, N'Fleet Plus Tab 30''s Pack Size: 30''s', N'medicine.png', 510.0000, CAST(N'2022-05-08T05:03:26.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2372, N'Explat Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 164958.0000, CAST(N'2022-05-08T05:03:50.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2373, N'Deplat-AP Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T05:07:51.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2374, N'Deplat-AP Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 120.0000, CAST(N'2022-05-08T05:08:13.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2375, N'Pletaal Tab 50mg 10x10''s Pack Size: 100''s', N'medicine.png', 3713.0000, CAST(N'2022-05-08T05:08:37.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2376, N'Pletaal Tab 100mg 10x10''s Pack Size: 100''s', N'medicine.png', 6118.0000, CAST(N'2022-05-08T05:09:03.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2377, N'Valvprin Plus Tab 1x10''s Pack Size', N'medicine.png', 187.0000, CAST(N'2022-05-08T05:09:22.493' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2378, N'Valvprin Tab 1x10''s Pack Size', N'medicine.png', 180.0000, CAST(N'2022-05-08T05:10:02.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2379, N'En-Clot Plus Tab 75mg/75mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 132.0000, CAST(N'2022-05-08T05:10:22.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2380, N'Enclot Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 110.0000, CAST(N'2022-05-08T05:10:40.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2381, N'Lowplat Plus Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 196.0000, CAST(N'2022-05-08T05:10:59.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2382, N'Lowplat Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 209.0000, CAST(N'2022-05-08T05:11:18.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2383, N'Xcept Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 332.0000, CAST(N'2022-05-08T05:11:37.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2384, N'Xcept Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 332.0000, CAST(N'2022-05-08T05:12:01.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2385, N'Xcept Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 610.0000, CAST(N'2022-05-08T05:12:18.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2386, N'Lowplat Tab 300mg 2''s Pack Size: 2''s', N'medicine.png', 68.0000, CAST(N'2022-05-08T05:12:35.963' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2387, N'Xcept Tab 20mg 14''s Pack Size: 14''s', N'medicine.png', 756.0000, CAST(N'2022-05-08T05:12:53.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2388, N'Anplag Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 1249.0000, CAST(N'2022-05-08T05:13:15.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2389, N'Xcept Tab 2.5mg 10''s Pack Size: 10''s', N'medicine.png', 230.0000, CAST(N'2022-05-08T05:13:35.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2390, N'Clopido Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 161.0000, CAST(N'2022-05-08T05:13:54.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2391, N'Previx Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 133.0000, CAST(N'2022-05-08T05:14:16.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2392, N'Plagril Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 196.0000, CAST(N'2022-05-08T05:14:36.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2393, N'Plagril Tab 75mg 1x10''s Pack Size: 1X10''s', N'medicine.png', 140.0000, CAST(N'2022-05-08T05:26:50.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2394, N'Clexane Inj 40mg 2PFSx0.4ml Pack Size: 2PFS', N'medicine.png', 937.0000, CAST(N'2022-05-08T05:27:09.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2395, N'Clexane Inj 80mg 2PFSx0.8ml Pack Size: 0.8ml', N'medicine.png', 1505.0000, CAST(N'2022-05-08T05:27:35.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2396, N'Co-Plavix Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 333.0000, CAST(N'2022-05-08T05:27:53.303' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2397, N'Plavix Tab 300mg 4''s Pack Size: 4''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T05:28:12.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2398, N'Dogrel Tab 75mg 2x6''s Pack Size: 2x6''s', N'medicine.png', 209.0000, CAST(N'2022-05-08T05:28:31.163' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2399, N'Seaclop Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 133.0000, CAST(N'2022-05-08T05:28:48.510' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2400, N'Seaclop-Ap Tab 75mg/150mg 10''s Pack Size: 10''s', N'medicine.png', 143.0000, CAST(N'2022-05-08T05:29:05.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2401, N'Seaclop-Ap Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 145.0000, CAST(N'2022-05-08T05:29:24.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2402, N'Xaroban Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 494.0000, CAST(N'2022-05-08T05:29:45.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2403, N'Revive Plus Tab 75mg/75mg 20''s Pack Size: 20''s', N'medicine.png', 320.0000, CAST(N'2022-05-08T05:30:02.677' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2404, N'Revive Plus Tab 75mg/75mg 20''s Pack Size: 20''s', N'medicine.png', 320.0000, CAST(N'2022-05-08T05:30:24.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2405, N'Revive Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 152.0000, CAST(N'2022-05-08T05:30:43.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2406, N'Rivascot Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T05:31:04.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2407, N'Rivascot Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 450.0000, CAST(N'2022-05-08T05:31:25.503' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2408, N'Rivascot Tab 15mg 10''s Pack Size: 10''s', N'medicine.png', 360.0000, CAST(N'2022-05-08T05:31:43.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2409, N'Warfin Tab 2.5mg Pack Size: 100''s', N'medicine.png', 452.0000, CAST(N'2022-05-08T05:32:20.317' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2410, N'Warfin Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 75.0000, CAST(N'2022-05-08T05:32:39.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2411, N'Progrel AP Tab 75mg/75mg 30''s Pack Size: 30''s', N'medicine.png', 433.0000, CAST(N'2022-05-08T05:32:57.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2412, N'Progrel Tab 75mg 3x10''s Pack Size: 3x10''S', N'medicine.png', 417.0000, CAST(N'2022-05-08T05:33:15.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2413, N'Hemolyte Tab 5mg 100''s Pack Size: 100''s', N'medicine.png', 630.0000, CAST(N'2022-05-08T05:33:33.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2414, N'Hemolyte Tab 10mg 100''s Pack Size: 100''s', N'medicine.png', 819.0000, CAST(N'2022-05-08T05:33:51.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2415, N'Disclot Plus Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 145.0000, CAST(N'2022-05-08T05:34:10.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2416, N'Disclot Tab 75mg 10’s Pack Size: 10''s', N'medicine.png', 139.0000, CAST(N'2022-05-08T05:34:53.220' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2417, N'Walk-Aid Tab 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 530.0000, CAST(N'2022-05-08T05:35:11.593' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2418, N'Walk-Aid Tab 50mg 3x10''s Pack Size: 30''s', N'medicine.png', 270.0000, CAST(N'2022-05-08T05:35:30.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2419, N'Flexi Plus Tab 75mg/75mg 2x10''s Pack Size: 20''s', N'medicine.png', 370.0000, CAST(N'2022-05-08T05:35:49.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2420, N'Flexiflow Tab 75mg 14''s Pack Size: 14''s', N'medicine.png', 232.0000, CAST(N'2022-05-08T05:36:05.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2421, N'Labista Tab 100mg 2x15''s Pack Size: 30''s', N'medicine.png', 713.0000, CAST(N'2022-05-08T05:36:24.193' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2422, N'Oxban Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 330.0000, CAST(N'2022-05-08T05:36:42.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2423, N'Oxban Tab 15mg 10''s Pack Size: 10''s', N'medicine.png', 440.0000, CAST(N'2022-05-08T05:37:00.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2424, N'Oxban Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 550.0000, CAST(N'2022-05-08T05:37:19.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2425, N'Pletwil Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 182.0000, CAST(N'2022-05-08T05:37:38.297' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2426, N'Platagg-I Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 15.0000, CAST(N'2022-05-08T05:37:58.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2427, N'Platagg-I Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T05:38:17.713' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2428, N'Ziclodin Tab 250mg 20''s Pack Size: 20''s', N'medicine.png', 208.0000, CAST(N'2022-05-08T05:38:47.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2429, N'Isteblix Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 140.0000, CAST(N'2022-05-08T05:39:05.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2430, N'Clopivax Tab 75mg 28''s Pack Size: 28''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T05:39:27.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2431, N'Obsagrel Tab 75mg/75mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 173.0000, CAST(N'2022-05-08T05:39:48.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2432, N'Obsagrel Tab 75mg/75mg 1x10''s Pack Size: 1x10''s', N'medicine.png', 173.0000, CAST(N'2022-05-08T05:40:08.467' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2433, N'Cilosta Tab 100mg 3x10''s Pack Size: 30''s', N'medicine.png', 862.0000, CAST(N'2022-05-08T05:40:28.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2434, N'Clopilet Tab 75mg 10''s Pack Size: 30''s', N'medicine.png', 140.0000, CAST(N'2022-05-08T05:40:58.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2435, N'Noclot Tab 75mg 20''s Pack Size: 10''s', N'medicine.png', 366.0000, CAST(N'2022-05-08T05:41:41.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2436, N'Noclot-EA Tab 75mg/75mg 10''s Pack Size: 10''s', N'medicine.png', 195.0000, CAST(N'2022-05-08T05:42:05.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2437, N'Noclot-LD Tab 300mg 1''s Pack Size: 10''s', N'medicine.png', 48.0000, CAST(N'2022-05-08T05:42:24.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2438, N'Noclot Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 183.0000, CAST(N'2022-05-08T05:42:53.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2439, N'Virata Tab 90mg 20''s Pack Size: 20''s', N'medicine.png', 1248.0000, CAST(N'2022-05-08T05:43:16.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2440, N'Xalia Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 300.0000, CAST(N'2022-05-08T05:43:36.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2441, N'Xalia Tab 15mg 10''s Pack Size: 10''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T05:43:53.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2442, N'Xalia Tab 15mg 10''s Pack Size: 10''s', N'medicine.png', 400.0000, CAST(N'2022-05-08T05:44:45.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2443, N'Xalia Tab 20mg 10''s Pack Size: 10''s', N'medicine.png', 500.0000, CAST(N'2022-05-08T05:45:12.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2444, N'Norplat Tab 75mg 2x14''s Pack Size: 2x14''s', N'medicine.png', 479.0000, CAST(N'2022-05-08T05:45:31.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2445, N'Norplat-S Tab 75mg/75mg 1x10''s', N'medicine.png', 201.0000, CAST(N'2022-05-08T05:45:53.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2446, N'Roxaban Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T05:46:11.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2447, N'Roxaban Tab 20mg 14''s Pack Size: 14''s', N'medicine.png', 630.0000, CAST(N'2022-05-08T05:46:39.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2448, N'Roxaban Tab 15mg 14''s Pack Size: 14''s', N'medicine.png', 490.0000, CAST(N'2022-05-08T05:46:56.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2449, N'Actiplat Tab 75mg 10''s Pack Size: 10''s', N'medicine.png', 140.0000, CAST(N'2022-05-08T05:47:18.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2450, N'Superplat Tab 10mg 28''s Pack Size: 10''s', N'medicine.png', 392.0000, CAST(N'2022-05-08T05:47:39.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2451, N'Bremax Tab 1mg 10x10''s Pack Size: 10x10''s', N'medicine.png', 154.0000, CAST(N'2022-05-08T05:49:03.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2452, N'Bremax Tab 2mg 10x10''s Pack Size: 100''s', N'medicine.png', 288.0000, CAST(N'2022-05-08T05:49:23.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2453, N'Ventolin Tab 2mg 100''s Pack Size: 100''s', N'medicine.png', 146.0000, CAST(N'2022-05-08T05:49:48.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2454, N'Ipneb Inhalation Sol 0.025% 20ml Pack Size: 20ml', N'medicine.png', 130.0000, CAST(N'2022-05-08T05:50:10.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2455, N'Package of Onbrez Breezhaler Cap.', N'medicine.png', 4025.0000, CAST(N'2022-05-08T05:50:33.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2456, N'Ventolin Tab 4mg 120''s Pack Size: 120''s', N'medicine.png', 210.0000, CAST(N'2022-05-08T05:50:54.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2457, N'Mucolator Granule Sachet 200mg 30''s Pack Size: 30''s', N'medicine.png', 477.0000, CAST(N'2022-05-08T05:51:20.630' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2458, N'Ventolin SR Tab 4mg 100''s Pack Size: 100''s', N'medicine.png', 169.0000, CAST(N'2022-05-08T05:51:42.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2459, N'Onbrez Breezhaler Cap 300mcg 30''s Pack Size: 30...', N'medicine.png', 3623.0000, CAST(N'2022-05-08T05:52:06.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2460, N'Ventolin SR Tab 4mg 100''s Pack Size: 100''s', N'medicine.png', 169.0000, CAST(N'2022-05-08T05:52:29.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2461, N'Combivair 200 Rotacap Cap 30''s Pack Size: 30''s', N'medicine.png', 372.0000, CAST(N'2022-05-08T05:52:51.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2462, N'Lucast Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 224.0000, CAST(N'2022-05-08T05:53:10.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2463, N'Budeform 200 Hfa Inh 1''s Pack Size: 1''s', N'medicine.png', 653.0000, CAST(N'2022-05-08T05:53:32.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2464, N'Venex 2 Tab 2mg 20''s Pack Size: 20''s', N'medicine.png', 28.0000, CAST(N'2022-05-08T05:53:54.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2465, N'Montaza Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T05:54:14.420' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2466, N'Lucast Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 295.0000, CAST(N'2022-05-08T05:54:34.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2467, N'Britanyl Syp 0.3mg/ml 60ml Pack Size: 60ml...', N'medicine.png', 53.0000, CAST(N'2022-05-08T05:54:55.083' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2468, N'Ventolin Resp Sol 100mcg 20ml Pack Size: 20ml', N'medicine.png', 49.0000, CAST(N'2022-05-08T05:55:17.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2469, N'Ventolin Resp Sol 100mcg 20ml Pack Size: 20ml', N'medicine.png', 230.0000, CAST(N'2022-05-08T05:55:39.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2470, N'Xofyl Syp 100mg/5ml 60ml Pack Size: 5ml', N'medicine.png', 85.0000, CAST(N'2022-05-08T05:56:00.840' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2471, N'Salinase Drops 30ml Pack Size: 30ml', N'medicine.png', 46.0000, CAST(N'2022-05-08T05:56:26.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2472, N'Fluimucil Powder Sachet 200mg 30''s Pack Size: 30''s', N'medicine.png', 446.0000, CAST(N'2022-05-08T05:56:52.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2473, N'Montika Film Coated Tab 10mg... Pack Size: 14''s', N'medicine.png', 360.0000, CAST(N'2022-05-08T05:57:07.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2474, N'Ventolin SR Tab 8mg 20''s Pack Size: 20''s', N'medicine.png', 45.0000, CAST(N'2022-05-08T05:57:17.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2475, N'Floaid Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T05:57:34.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2476, N'Lucast Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 320.0000, CAST(N'2022-05-08T05:57:54.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2477, N'Airflo Chewable Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 199.0000, CAST(N'2022-05-08T05:58:05.343' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2478, N'Solo Powder Sachet 4mg 1x14''s Pack Size: 14''s', N'medicine.png', 326.0000, CAST(N'2022-05-08T05:58:16.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2479, N'Aerokast Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 357.0000, CAST(N'2022-05-08T05:58:44.587' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2480, N'Clenil Compositum Aerosol Nebuliser Susp... Pack Size: 5''s', N'medicine.png', 480.0000, CAST(N'2022-05-08T05:59:05.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2481, N'Clenil Compositum Aerosol Nebuliser Susp... Pack Size: 5''s', N'medicine.png', 399.0000, CAST(N'2022-05-08T05:59:26.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2482, N'Xaltide HFA Inh 100mcg/50mcg 1''s Pack Size: 1''s', N'medicine.png', 380.0000, CAST(N'2022-05-08T05:59:49.197' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2483, N'Seretide MDI Inh 25mcg/250mcg 1''s Pack Size: 1''s', N'medicine.png', 1254.0000, CAST(N'2022-05-08T06:00:12.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2484, N'Seretide Diskus 50mg/250mg 60Doses Pack Size: 60''s', N'medicine.png', 845.0000, CAST(N'2022-05-08T06:00:33.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2485, N'Breavent Rotacaps 200mcg 30''s Pack Size: 30''s', N'medicine.png', 91.0000, CAST(N'2022-05-08T06:00:55.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2486, N'Myteka Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 330.0000, CAST(N'2022-05-08T06:01:14.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2487, N'Myteka Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 380.0000, CAST(N'2022-05-08T06:01:44.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2488, N'Jantolin Tab 2mg 5x20''s Pack Size: 100''s', N'medicine.png', 67.0000, CAST(N'2022-05-08T06:02:07.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2489, N'Jantolin Tab 4mg 5x20''s Pack Size: 100''s', N'medicine.png', 95.0000, CAST(N'2022-05-08T06:02:29.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2490, N'Whizix Tab 5mg 1x14''s Pack Size: 14''s', N'medicine.png', 228.0000, CAST(N'2022-05-08T06:02:48.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2491, N'Pulmitac Oral Sol 5mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 99.0000, CAST(N'2022-05-08T06:03:08.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2492, N'Montika Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 278.0000, CAST(N'2022-05-08T06:03:26.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2493, N'Zaftolin Tab 4mg 10x10''s Pack Size: 100''s', N'medicine.png', 152.0000, CAST(N'2022-05-08T06:27:48.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2494, N'Britanyl Tab 2.5mg 10x10s Pack Size: 100''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T06:28:18.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2495, N'Lucast Tab 5mg 10''s Pack Size: 10''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T06:28:41.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2496, N'Albokast Tab 10mg 1x14''s Pack Size: 14''s', N'medicine.png', 311.0000, CAST(N'2022-05-08T06:29:07.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2497, N'Albokast Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T06:29:34.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2498, N'Albokast Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 46.0000, CAST(N'2022-05-08T06:29:56.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2499, N'Bronkal Syp 2mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 37.0000, CAST(N'2022-05-08T06:30:44.520' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2500, N'Norsaline-P Nasal Drops 30ml Pack Size: 30ml', N'medicine.png', 49.0000, CAST(N'2022-05-08T06:31:01.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2501, N'Solo Chewable Tab 5mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 309.0000, CAST(N'2022-05-08T06:31:18.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2502, N'Solo Chewable Tab 5mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 309.0000, CAST(N'2022-05-08T06:31:19.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2503, N'Solo Tab 10mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 361.0000, CAST(N'2022-05-08T06:31:42.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2504, N'Solo Tab 10mg 1x14''s Pack Size: 1x14''s', N'medicine.png', 221.0000, CAST(N'2022-05-08T06:32:03.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2505, N'Aerokast Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T06:32:23.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2506, N'Aerokast Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 278.0000, CAST(N'2022-05-08T06:32:44.043' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2507, N'Aerokast Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 278.0000, CAST(N'2022-05-08T06:32:44.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2508, N'Bambec Tab 20mg 30''s Pack Size: 30''s', N'medicine.png', 1040.0000, CAST(N'2022-05-08T06:33:21.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2509, N'Bambec Tab 10mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 635.0000, CAST(N'2022-05-08T06:34:00.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2510, N'Britanyl Inj 0.5mg 5Ampx1ml Pack Size: 5Ampx1ml...', N'medicine.png', 88.0000, CAST(N'2022-05-08T06:34:21.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2511, N'Beasy Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 358.0000, CAST(N'2022-05-08T06:34:42.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2512, N'Beasy Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 207.0000, CAST(N'2022-05-08T06:35:00.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2513, N'Beasy Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T06:35:20.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2514, N'Beasy Powder Sachets 4mg 14''s Pack Size: 14''s', N'medicine.png', 255.0000, CAST(N'2022-05-08T06:35:40.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2515, N'Terbulin Syp 0.3Mg/Ml 60Ml Pack Size: 60ml', N'medicine.png', 23.0000, CAST(N'2022-05-08T06:36:02.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2516, N'Terbulin Tab 2.5Mg Pack Size: 100''s', N'medicine.png', 122.0000, CAST(N'2022-05-08T06:36:20.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2517, N'Atem Nebuliser Sol 0.025% 5Vialx2ml Pack Size: 51vialx2ml', N'medicine.png', 463.0000, CAST(N'2022-05-08T06:36:38.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2518, N'Foster Inhalation Sol 100mcg/6mcg 1''s Pack Size: 1''s', N'medicine.png', 1238.0000, CAST(N'2022-05-08T06:36:58.287' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2519, N'Pulmikast Chewable Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T06:37:20.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2520, N'Curosurf Inj 120mg 1Vialx1.5ml Pack Size: 1...', N'medicine.png', 20000.0000, CAST(N'2022-05-08T06:37:47.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2521, N'Ofylin Syp 100mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 65.0000, CAST(N'2022-05-08T06:38:05.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2522, N'Ofylin Tab 400mg 10''s Pack Size: 10''s', N'medicine.png', 186.0000, CAST(N'2022-05-08T06:38:23.110' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2523, N'Bronast Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 228.0000, CAST(N'2022-05-08T06:38:47.973' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2524, N'Ipratec Nebulization Sol 250mcg 5Vialx', N'medicine.png', 322.0000, CAST(N'2022-05-08T06:39:06.143' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2525, N'Broncolin Inj 0.5mg/ml 5Ampx1ml Pack Size: 5', N'medicine.png', 84.0000, CAST(N'2022-05-08T06:39:24.813' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2526, N'Broncolin Syrup 2mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 24.0000, CAST(N'2022-05-08T06:39:47.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2527, N'Broncolin Tab 2mg 5x20''s Pack Size: 100''s', N'medicine.png', 65.0000, CAST(N'2022-05-08T06:40:16.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2528, N'Broncolin Tab 4mg 5x20''s Pack Size: 100''s', N'medicine.png', 84.0000, CAST(N'2022-05-08T06:40:34.933' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2529, N'Broncolin Tab 4mg 5x20''s Pack Size: 100''s', N'medicine.png', 3505.0000, CAST(N'2022-05-08T06:40:49.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2530, N'Montiget Tab 5mg 2x7''s 196... Pack Size: 196...', N'medicine.png', 45246.0000, CAST(N'2022-05-08T06:41:15.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2531, N'Montiget Tab 4mg 14''s 196... Pack Size: 196...', N'medicine.png', 33750.0000, CAST(N'2022-05-08T06:41:39.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2532, N'Optra HFA Aerosol Inh 20mcg... Pack Size: 300...', N'medicine.png', 106875.0000, CAST(N'2022-05-08T06:42:00.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2533, N'Xaltide HFA Inh 100mcg/50mcg 1''s... Pack Size: 300..', N'medicine.png', 89775.0000, CAST(N'2022-05-08T06:42:19.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2534, N'Salbo Sol 5mg/ml 20ml 189... Pack Size: 189...', N'medicine.png', 6285.0000, CAST(N'2022-05-08T06:42:40.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2535, N'Salbo HFA Inh 100mcg 1''s... Pack Size: 300...', N'medicine.png', 57000.0000, CAST(N'2022-05-08T06:43:02.753' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2536, N'Montiget Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 330.0000, CAST(N'2022-05-08T06:43:25.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2537, N'Montiget Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 321.0000, CAST(N'2022-05-08T06:43:46.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2538, N'Salbo HFA Inh 100mcg 1''s Pack Size: 1''s', N'medicine.png', 272.0000, CAST(N'2022-05-08T06:44:05.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2539, N'Optra HFA Aerosol Inh 20mcg... Pack Size: 200''s', N'medicine.png', 515.0000, CAST(N'2022-05-08T06:44:24.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2540, N'Survanta Inj 1Vialx4ml Pack Size: 120ml', N'medicine.png', 17632.0000, CAST(N'2022-05-08T06:44:46.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2541, N'Saltra MDI Hfa Inh 25mcg/125mcg... Pack Size: 1''s', N'medicine.png', 660.0000, CAST(N'2022-05-08T06:45:05.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2542, N'Saltra MDI Hfa Inh 25mcg/250mcg... Pack Size: 1''s', N'medicine.png', 815.0000, CAST(N'2022-05-08T06:45:24.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2543, N'Tioget Cap 18mcg 30''s Pack Size: 30''s', N'medicine.png', 595.0000, CAST(N'2022-05-08T06:45:44.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2544, N'Salbo HFA 100mcg MDI 1''s Pack Size: 1''s', N'medicine.png', 224.0000, CAST(N'2022-05-08T06:46:08.393' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2545, N'Seretide MDI Inh 25mcg/125mcg 1''s Pack Size: 1''s', N'medicine.png', 974.0000, CAST(N'2022-05-08T06:46:28.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2546, N'Ventolin Expectorant SF 120ml Pack Size: 120ml', N'medicine.png', 53.0000, CAST(N'2022-05-08T06:47:15.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2547, N'Ventolin Syp SF 120ml Pack Size: 120ml...', N'medicine.png', 78.0000, CAST(N'2022-05-08T06:47:36.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2548, N'Seretide Diskus 50mg/100mg 60Doses Pack Size: 60''s', N'medicine.png', 695.0000, CAST(N'2022-05-08T06:48:03.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2549, N'Seretide Diskus 50mg/500mg 60Doses Pack Size: 60''s', N'medicine.png', 940.0000, CAST(N'2022-05-08T06:48:23.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2550, N'Monokast Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 228.0000, CAST(N'2022-05-08T06:48:40.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2551, N'Monokast Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 295.0000, CAST(N'2022-05-08T06:49:00.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2552, N'Dilair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 264.0000, CAST(N'2022-05-08T06:49:19.563' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2553, N'Dilair Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 200.0000, CAST(N'2022-05-08T06:49:39.003' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2554, N'Combivair 400 Rotacap Cap 30''s Pack Size: 30''s', N'medicine.png', 425.0000, CAST(N'2022-05-08T06:50:05.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2555, N'Ipratec-S Rotacap Cap 40mcg/200mcg 30''s Pack Size: 30''s', N'medicine.png', 156.0000, CAST(N'2022-05-08T06:50:27.457' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2556, N'Tiovair F Rotacaps Cap 18mcg/12mcg... Pack Size: 15''s', N'medicine.png', 763.0000, CAST(N'2022-05-08T06:50:50.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2557, N'Foracort Inh 6mcg/100mcg 1''s Pack Size: 1''s', N'medicine.png', 488.0000, CAST(N'2022-05-08T06:51:10.767' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2558, N'Foracort Inh 6mcg/200mcg 1''s Pack Size: 1''s', N'medicine.png', 739.0000, CAST(N'2022-05-08T06:51:30.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2559, N'Tiovair Rotacaps Cap 18mcg 30''s Pack Size: 30...', N'medicine.png', 650.0000, CAST(N'2022-05-08T06:51:49.640' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2560, N'Asthavent Hfa Inh 1''s Pack Size: 1''s', N'medicine.png', 245.0000, CAST(N'2022-05-08T06:52:10.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2561, N'Breavent - B Rotacaps 30''s Pack Size: 30''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T06:52:29.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2562, N'Sprahaler 20 Hfa Inh 1''s Pack Size: 1''s', N'medicine.png', 365.0000, CAST(N'2022-05-08T06:53:17.337' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2563, N'Freehale Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 360.0000, CAST(N'2022-05-08T06:53:37.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2564, N'Freehale Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 266.0000, CAST(N'2022-05-08T06:53:57.970' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2565, N'Freehale Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 256.0000, CAST(N'2022-05-08T06:54:16.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2566, N'Myteka Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 232.0000, CAST(N'2022-05-08T06:54:33.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2567, N'Myteka Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 335.0000, CAST(N'2022-05-08T06:54:46.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2568, N'Montelair Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 321.0000, CAST(N'2022-05-08T06:55:04.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2569, N'Montelair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 249.0000, CAST(N'2022-05-08T06:55:18.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2570, N'Indokast Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 271529.0000, CAST(N'2022-05-08T06:55:33.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2571, N'Indokast Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 237.0000, CAST(N'2022-05-08T06:55:50.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2572, N'Indokast Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 233.0000, CAST(N'2022-05-08T06:56:24.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2573, N'Jantolin Tab 2mg 1x250''s Pack Size: 250''s', N'medicine.png', 64.0000, CAST(N'2022-05-08T06:56:54.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2574, N'Jantolin Tab 4mg 1x200''s Pack Size: 200''s', N'medicine.png', 79.0000, CAST(N'2022-05-08T06:57:31.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2575, N'Monstk Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 295.0000, CAST(N'2022-05-08T06:57:45.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2576, N'Jantolin Syp 2mg/5ml 450ml Pack Size: 450ml', N'medicine.png', 56.0000, CAST(N'2022-05-08T06:58:08.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2577, N'Inspirol Inh 100mcg 1''s Pack Size: 1''s', N'medicine.png', 175.0000, CAST(N'2022-05-08T06:58:22.400' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2578, N'Mntk Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 107.0000, CAST(N'2022-05-08T06:58:39.137' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2579, N'Salmicort Inh 25mcg/125mcg 1''s Pack Size: 1''s', N'medicine.png', 566.0000, CAST(N'2022-05-08T06:58:57.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2580, N'Salnon Inh 100mcg/50mcg 1''s Pack Size: 1''s', N'medicine.png', 347.0000, CAST(N'2022-05-08T06:59:18.620' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2581, N'Salmicort Inh 25mcg/250mcg 1''s Pack Size: 1''s', N'medicine.png', 714.0000, CAST(N'2022-05-08T06:59:37.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2582, N'Mntk Tab 10mg 28''s Pack Size: 28''s', N'medicine.png', 495.0000, CAST(N'2022-05-08T07:00:01.263' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2583, N'Tio-Veez DPI Cap 18mcg 20''s Pack Size: 20''s', N'medicine.png', 307.0000, CAST(N'2022-05-08T07:00:21.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2584, N'Whizix Tab 4mg 1x14''s Pack Size: 14''s', N'medicine.png', 168.0000, CAST(N'2022-05-08T07:00:38.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2585, N'Whizix Tab 10mg 1x14''s Pack Size: 14''s', N'medicine.png', 280.0000, CAST(N'2022-05-08T07:00:58.793' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2586, N'Inspra Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T07:01:12.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2587, N'Inspra Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 310.0000, CAST(N'2022-05-08T07:01:27.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2588, N'Inspra Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T07:01:47.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2589, N'Inspra Powder Sachet 4mg 14''s Pack Size: 1x30''s', N'medicine.png', 182.0000, CAST(N'2022-05-08T07:02:07.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2590, N'Bronokast Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 225.0000, CAST(N'2022-05-08T07:02:23.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2591, N'Bronokast Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 252.0000, CAST(N'2022-05-08T07:02:42.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2592, N'Astharid Tab 10mg 2x7''s Pack Size: 14''s', N'medicine.png', 197.0000, CAST(N'2022-05-08T07:03:03.580' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2593, N'Ventomed Syp 2Mg/5Ml 60Ml Pack Size: 60ml', N'medicine.png', 18.0000, CAST(N'2022-05-08T07:03:40.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2594, N'Ventomed Tab 2Mg Pack Size: 100''s', N'medicine.png', 67.0000, CAST(N'2022-05-08T07:04:23.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2595, N'Ventomed Tab 4Mg Pack Size: 100''s', N'medicine.png', 76.0000, CAST(N'2022-05-08T07:04:43.657' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2596, N'Ventomed-G Syp 2mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 19.0000, CAST(N'2022-05-08T07:05:01.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2597, N'Ventulair Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 187.0000, CAST(N'2022-05-08T07:05:13.823' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2598, N'Ventulair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 133.0000, CAST(N'2022-05-08T07:05:33.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2599, N'Lungair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T07:05:52.180' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2600, N'Lungair Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 238.0000, CAST(N'2022-05-08T07:06:20.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2601, N'Lungair Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 154.0000, CAST(N'2022-05-08T07:06:40.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2602, N'Bretheez E Syp 60ml Pack Size: 60ml', N'medicine.png', 20.0000, CAST(N'2022-05-08T07:07:00.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2603, N'Monekast Drops 4mg /ml 28ml Pack Size: 28ml', N'medicine.png', 380.0000, CAST(N'2022-05-08T07:07:22.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2604, N'Monekast Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 310.0000, CAST(N'2022-05-08T07:07:36.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2605, N'Monekast Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T07:07:55.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2606, N'Montelo Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 220.0000, CAST(N'2022-05-08T07:08:19.747' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2607, N'Montelo Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T07:08:34.577' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2608, N'Xolair Inj 150mg 1Vial Pack Size: 1vial', N'medicine.png', 38000.0000, CAST(N'2022-05-08T07:08:57.503' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2609, N'Doxolin 100mg/5ml Syrup 60ml Pack Size: 60mi', N'medicine.png', 66.0000, CAST(N'2022-05-08T07:09:14.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2610, N'Doxolin 400mg Tab 10''s Pack Size: 10''s', N'medicine.png', 141.0000, CAST(N'2022-05-08T07:09:30.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2611, N'Onbrez Breezhaler Cap 150mcg 30''s Pack Size: 30''s...', N'medicine.png', 2725.0000, CAST(N'2022-05-08T07:09:52.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2612, N'Asthiven Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 119.0000, CAST(N'2022-05-08T07:10:10.833' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2613, N'Asthiven Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 219.0000, CAST(N'2022-05-08T07:10:26.283' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2614, N'Montec Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 340.0000, CAST(N'2022-05-08T07:10:46.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2615, N'Montec Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 399.0000, CAST(N'2022-05-08T07:11:06.077' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2616, N'Venex Syp 2mg/5ml 120ml Pack Size: 120ml', N'medicine.png', 78.0000, CAST(N'2022-05-08T07:11:29.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2617, N'Aireez Tab 10mg 30''s Pack Size: 30''s', N'medicine.png', 748.0000, CAST(N'2022-05-08T07:11:55.053' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2618, N'Aireez Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T07:12:13.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2619, N'Aireez Tab 5mg 30''s Pack Size: 30''s', N'medicine.png', 540.0000, CAST(N'2022-05-08T07:12:34.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2620, N'Brethin Syp 1.5Mg/5Ml Pack Size: 60ml', N'medicine.png', 230.0000, CAST(N'2022-05-08T07:12:48.753' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2621, N'Brethin Syp 1.5Mg/5Ml Pack Size: 60ml', N'medicine.png', 30.0000, CAST(N'2022-05-08T07:13:01.827' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2622, N'Pulmitac Tab 20mg 1x10''s Pack Size: 10''s', N'medicine.png', 265.0000, CAST(N'2022-05-08T07:13:22.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2623, N'Pulmitac Tab 10mg 10''s Pack Size: 10''s', N'medicine.png', 135.0000, CAST(N'2022-05-08T07:13:42.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2624, N'Easair Tab 80mcg 10''s Pack Size: 10''s', N'medicine.png', 188.0000, CAST(N'2022-05-08T07:13:59.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2625, N'Lukomon Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 245.0000, CAST(N'2022-05-08T07:14:17.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2626, N'Lukomon Chewable Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 207.0000, CAST(N'2022-05-08T07:14:36.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2627, N'Unifyline Syp 100mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 88.0000, CAST(N'2022-05-08T07:14:54.880' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2628, N'Unifyline Tab 400mg 10''s Pack Size: 10''s', N'medicine.png', 173.0000, CAST(N'2022-05-08T07:15:11.300' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2629, N'Lukomon Powder Sachets 4mg 14''s Pack Size: 14''s...', N'medicine.png', 194.0000, CAST(N'2022-05-08T07:15:30.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2630, N'Salnafot Inh 25mcg/250mcg 1''s Pack Size: 1''s', N'medicine.png', 575.0000, CAST(N'2022-05-08T07:15:50.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2631, N'Mingair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 241.0000, CAST(N'2022-05-08T07:16:02.740' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2632, N'Mingair Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 311.0000, CAST(N'2022-05-08T07:16:22.303' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2633, N'Montekarl Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T07:16:40.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2634, N'Montekarl Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 151.0000, CAST(N'2022-05-08T07:16:58.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2635, N'Texcol E Syp 60ml Pack Size: 60ml', N'medicine.png', 17.0000, CAST(N'2022-05-08T07:17:15.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2636, N'Texcol E Syp 120ml Pack Size: 120ml', N'medicine.png', 29.0000, CAST(N'2022-05-08T07:17:34.223' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2637, N'Sokast Powder Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 197.0000, CAST(N'2022-05-08T07:17:54.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2638, N'Sokast Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 250.0000, CAST(N'2022-05-08T07:18:12.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2639, N'Sokast Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 168.0000, CAST(N'2022-05-08T07:18:32.243' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2640, N'Montika Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 215.0000, CAST(N'2022-05-08T07:43:18.823' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2641, N'Montika Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 215.0000, CAST(N'2022-05-08T07:43:19.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2642, N'Montika Chewable Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 275.0000, CAST(N'2022-05-08T07:43:34.853' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2643, N'Tarisin Nasal Spray 0.025% 15ml Pack Size: 15ml', N'medicine.png', 198.0000, CAST(N'2022-05-08T07:44:01.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2644, N'Bamtel Tab 10mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 371.0000, CAST(N'2022-05-08T07:44:21.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2645, N'Bamtel Tab 20mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 428.0000, CAST(N'2022-05-08T07:44:40.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2646, N'Sontel Tab 10mg 3x10''s Pack Size: 3x10''s', N'medicine.png', 711.0000, CAST(N'2022-05-08T07:45:01.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2647, N'Sontel Chewable Tab 5mg 6x5''s Pack Size: 6x5''s', N'medicine.png', 709.0000, CAST(N'2022-05-08T07:45:29.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2648, N'Nasarin Nasal Spray 55mcg 17.5ml Pack Size: 17.5ml', N'medicine.png', 253.0000, CAST(N'2022-05-08T07:45:42.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2649, N'Ventek Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 181.0000, CAST(N'2022-05-08T07:46:09.020' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2650, N'Ventek Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 379.0000, CAST(N'2022-05-08T07:46:22.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2651, N'Ventek Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 228.0000, CAST(N'2022-05-08T07:46:45.000' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2652, N'Dune Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 210.0000, CAST(N'2022-05-08T07:47:09.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2653, N'Dune Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 265.0000, CAST(N'2022-05-08T07:47:33.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2654, N'Dune Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 165.0000, CAST(N'2022-05-08T07:47:54.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2655, N'Mexair Tab 2.5Mg Pack Size: 100''s', N'medicine.png', 100.0000, CAST(N'2022-05-08T07:48:11.017' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2656, N'Mexair Syp 0.3Mg/Ml 60Ml Pack Size: 60ml', N'medicine.png', 25.0000, CAST(N'2022-05-08T07:48:31.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2657, N'Mexair Expectorant Syp 1.5Mg/5Ml 60Ml Pack Size: 60ml', N'medicine.png', 29.0000, CAST(N'2022-05-08T07:48:51.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2658, N'Bronkeez Tab 10mg 2x7''s Pack Size: 2x7''s', N'medicine.png', 345.0000, CAST(N'2022-05-08T07:49:06.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2659, N'Xofyl Tab 400mg 10''s Pack Size: 10''s', N'medicine.png', 275.0000, CAST(N'2022-05-08T07:49:22.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2660, N'Xofyl Tab 400mg 10''s Pack Size: 10''s', N'medicine.png', 150.0000, CAST(N'2022-05-08T07:49:41.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2661, N'Tangulair Tab 10mg 2x7''s Pack Size: 14''s', N'medicine.png', 295.0000, CAST(N'2022-05-08T07:50:01.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2662, N'Tangulair Tab 4mg 2x7''s Pack Size: 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T07:50:19.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2663, N'Tangulair Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 195.0000, CAST(N'2022-05-08T07:50:49.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2664, N'Wel-Dilate Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T07:51:12.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2665, N'Inhalerin Syp 2mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 25.0000, CAST(N'2022-05-08T07:51:31.010' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2666, N'Inhalerin SR Tab 4mg 10x10''s Pack Size: 100''s', N'medicine.png', 130.0000, CAST(N'2022-05-08T07:51:43.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2667, N'Inhalerin Tab 2mg 10x10''s Pack Size: 100''s', N'medicine.png', 80.0000, CAST(N'2022-05-08T07:52:03.133' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2668, N'Inhalerin SR Tab 8mg 10x10''s Pack Size: 100''s', N'medicine.png', 170.0000, CAST(N'2022-05-08T07:52:22.217' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2669, N'Regulair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 120.0000, CAST(N'2022-05-08T07:52:42.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2670, N'Regulair Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 235.0000, CAST(N'2022-05-08T07:53:02.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2671, N'Tair Tab 10mg 2x10''s Pack Size: 2x10''s', N'medicine.png', 510.0000, CAST(N'2022-05-08T07:53:17.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2672, N'Tair Tab 4mg 3x10''s Pack Size: 30''s', N'medicine.png', 470.0000, CAST(N'2022-05-08T07:53:30.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2673, N'Tair Tab 5mg 2x10''s Pack Size: 20''s', N'medicine.png', 326.0000, CAST(N'2022-05-08T07:53:52.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2674, N'Season Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 413.0000, CAST(N'2022-05-08T07:54:11.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2675, N'Season Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 253.0000, CAST(N'2022-05-08T07:54:30.463' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2676, N'Respirate Syp 2mg/5ml 60ml Pack Size: 14''s', N'medicine.png', 23.0000, CAST(N'2022-05-08T07:54:48.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2677, N'Respirate Sol 5mg/ml 20ml Pack Size: 14''s', N'medicine.png', 35.0000, CAST(N'2022-05-08T07:55:05.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2678, N'Monxe Tab 5mg 14''S Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T07:55:23.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2679, N'Bambuzaf Tab 10mg 3x10''s Pack Size: 30''s', N'medicine.png', 489.0000, CAST(N'2022-05-08T07:55:43.903' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2680, N'Bambuzaf Syp 1mg/ml 60ml Pack Size: 60ml', N'medicine.png', 118.0000, CAST(N'2022-05-08T07:56:03.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2681, N'Beclo-Sal Inh 1''s Pack Size: 1''s', N'medicine.png', 262.0000, CAST(N'2022-05-08T07:56:22.533' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2682, N'Montaza Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 225.0000, CAST(N'2022-05-08T07:56:41.450' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2683, N'Tesmic Syp 0.3mg/ml 60ml Pack Size: 60ml', N'medicine.png', 31.0000, CAST(N'2022-05-08T07:57:01.427' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2684, N'Tesmic Tab 2.5mg 10x10''s Pack Size: 100''s', N'medicine.png', 152.0000, CAST(N'2022-05-08T07:57:21.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2685, N'Tropum Nebuliser Sol 0.025% 5x2ml Pack Size: 5x2ml', N'medicine.png', 427.0000, CAST(N'2022-05-08T07:57:35.407' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2686, N'Zaftolin Aerosol Inh 100mcg 1''s Pack Size: 1''s', N'medicine.png', 189.0000, CAST(N'2022-05-08T07:57:56.847' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2687, N'Zaftolin Tab 2mg 10x10''s Pack Size: 100''s', N'medicine.png', 126.0000, CAST(N'2022-05-08T07:58:20.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2688, N'Zaftolin Syp 2mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 35.0000, CAST(N'2022-05-08T07:58:37.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2689, N'Zaftolin Sol 5mg/ml 20ml Pack Size: 20ml..', N'medicine.png', 49.0000, CAST(N'2022-05-08T07:58:55.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2690, N'Airmont Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 413.0000, CAST(N'2022-05-08T07:59:15.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2691, N'Bronsecure Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 285.0000, CAST(N'2022-05-08T07:59:34.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2692, N'Bronsecure Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T07:59:52.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2693, N'Bronsecure Chewable Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 190.0000, CAST(N'2022-05-08T08:00:09.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2694, N'Pelbim Tab 5mg 2x7''s Pack Size: 2x7''s', N'medicine.png', 180.0000, CAST(N'2022-05-08T08:00:23.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2695, N'Pelbim Tab 10mg 2x7''s Pack Size: 14''s', N'medicine.png', 287.0000, CAST(N'2022-05-08T08:00:44.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2696, N'Montair Tab 4mg 14''s Pack Size: 14''s', N'medicine.png', 183.0000, CAST(N'2022-05-08T08:01:07.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2697, N'Montair Tab 10mg 14''s Pack Size: 14''s', N'medicine.png', 337.0000, CAST(N'2022-05-08T08:01:21.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2698, N'Montair Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 238.0000, CAST(N'2022-05-08T08:01:40.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2699, N'Bronchilate Syp 2mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 35.0000, CAST(N'2022-05-08T08:01:59.857' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2700, N'Sodium Chloride Inhalation Sol 3%... Pack Size: 10ml', N'medicine.png', 50.0000, CAST(N'2022-05-08T08:02:17.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2701, N'Caramont Tab 5mg 14''s Pack Size:', N'medicine.png', 240.0000, CAST(N'2022-05-08T08:02:38.990' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2702, N'Caramont Tab 10mg 14''s Pack Size:', N'medicine.png', 310.0000, CAST(N'2022-05-08T08:02:56.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2703, N'Salbital Tab 2mg 10x10''s Pack Size: 1vial', N'medicine.png', 70.0000, CAST(N'2022-05-08T08:03:15.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2704, N'Astamol Syp 60ml Pack Size: 60''s', N'medicine.png', 40.0000, CAST(N'2022-05-08T08:03:30.213' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2705, N'Amacure Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 393.0000, CAST(N'2022-05-08T08:03:45.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2706, N'Amacure Tab 5mg 2x7''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T08:03:58.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2707, N'Agolix Syp 100mg/5ml 60ml Pack Size: 20''s', N'medicine.png', 97.0000, CAST(N'2022-05-08T08:04:12.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2708, N'Buterol Oral Solution 5mg /5ml... Pack Size: 12''s', N'medicine.png', 118.0000, CAST(N'2022-05-08T08:04:32.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2709, N'Buterol Tab 10mg 30''s Pack Size: 15ml', N'medicine.png', 375.0000, CAST(N'2022-05-08T08:04:51.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2710, N'Procarol Syp 25mcg 120ml Pack Size: 7''s', N'medicine.png', 77.0000, CAST(N'2022-05-08T08:05:13.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2711, N'Purgo Tab 5mg 14''s Pack Size: 20''s', N'medicine.png', 210.0000, CAST(N'2022-05-08T08:05:37.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2712, N'Purgo Tab 10mg 14''s Pack Size: 120ml', N'medicine.png', 275.0000, CAST(N'2022-05-08T08:05:51.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2713, N'Monty Tab 5mg 14''s Pack Size: 14''s', N'medicine.png', 240.0000, CAST(N'2022-05-08T08:06:17.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2714, N'Monty Tab 10mg 14''s Pack Size: 10''s', N'medicine.png', 310.0000, CAST(N'2022-05-08T08:06:37.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2715, N'EziNoze Saline Drops 30ml Pack Size: 30ml', N'medicine.png', 40.0000, CAST(N'2022-05-08T08:06:56.073' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2716, N'Ardis Tab 10mg 2x7''s Pack Size: 2x7''s', N'medicine.png', 310.0000, CAST(N'2022-05-08T08:07:14.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2717, N'Airows Tab 10mg 14''s Pack Size: 2×7''s', N'medicine.png', 270.0000, CAST(N'2022-05-08T08:07:33.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2718, N'Airows Sachet 4mg 14''s Pack Size: 14''s', N'medicine.png', 238.0000, CAST(N'2022-05-08T08:08:02.470' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2719, N'Cell Kast Tab 14''s Pack Size: 14''s', N'medicine.png', 383.0000, CAST(N'2022-05-08T08:08:25.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2720, N'Deltacortril Enteric Coated Tab 5mg... Pack Size: 100''', N'medicine.png', 319.0000, CAST(N'2022-05-08T08:10:17.123' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2721, N'Clobevate Cream 0.05% 20gm Pack Size: 20g', N'medicine.png', 228.0000, CAST(N'2022-05-08T08:10:33.107' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2722, N'Clobevate Cream 0.05% 20gm Pack Size: 20g', N'medicine.png', 95.0000, CAST(N'2022-05-08T08:10:52.377' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2723, N'Hydrocortisone Enema 100mg 60ml Pack Size: 60ml', N'medicine.png', 261.0000, CAST(N'2022-05-08T08:11:11.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2724, N'Fortide MDI Hfa Inh 6mcg/200mcg... Pack Size: 1''s', N'medicine.png', 111.0000, CAST(N'2022-05-08T08:11:26.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2725, N'Fortide MDI Hfa Inh 6mcg/200mcg... Pack Size: 1''s', N'medicine.png', 722.0000, CAST(N'2022-05-08T08:11:41.183' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2726, N'Dermovate Cream 0.05% 20gm Pack Size: 20gm', N'medicine.png', 90.0000, CAST(N'2022-05-08T08:12:03.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2727, N'Deca Abolon Inj 50mg 1Ampx1ml Pack Size: 1Ampx1ml', N'medicine.png', 146.0000, CAST(N'2022-05-08T08:12:24.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2728, N'Betnovate Cream 0.1% 20g Pack Size: 20gm', N'medicine.png', 73.0000, CAST(N'2022-05-08T08:13:10.790' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2729, N'Betnovate Lotion 0.1% 60ml Pack Size: 60ml', N'medicine.png', 211.0000, CAST(N'2022-05-08T08:13:28.700' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2730, N'Eyfem Eye Drops 0.1% 5ml Pack Size: 5ml', N'medicine.png', 74.0000, CAST(N'2022-05-08T08:13:47.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2731, N'Travocort Cream 10gm Pack Size: 10gm', N'medicine.png', 175.0000, CAST(N'2022-05-08T08:14:06.820' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2732, N'Deltacortril Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 2333.0000, CAST(N'2022-05-08T08:14:26.947' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2733, N'Fuskin - B Cream 15gm Pack Size: 1...', N'medicine.png', 250.0000, CAST(N'2022-05-08T08:14:45.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2734, N'Fml Ophthalmic Susp 0.1% 5ml Pack Size: 1''s', N'medicine.png', 79.0000, CAST(N'2022-05-08T08:15:06.637' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2735, N'Bekson Forte HFA Inh 250mcg... Pack Size: 1''s', N'medicine.png', 485.0000, CAST(N'2022-05-08T08:15:27.387' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2736, N'Betnovate-N Lotion 60ml Pack Size: 60ml', N'medicine.png', 190.0000, CAST(N'2022-05-08T08:15:45.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2737, N'Betnovate N Cream 20gm Pack Size: 1...`', N'medicine.png', 87.0000, CAST(N'2022-05-08T08:16:06.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2738, N'Synalar Cream 0.025% 30gm Pack Size: 30gm', N'medicine.png', 118.0000, CAST(N'2022-05-08T08:16:25.027' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2739, N'Rapicort 5mg Tab 100''s Pack Size: 100''s', N'medicine.png', 298.0000, CAST(N'2022-05-08T08:16:38.707' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2740, N'Mometaderm Cream 0.1% 15g Pack Size: 15g', N'medicine.png', 272.0000, CAST(N'2022-05-08T08:16:58.610' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2741, N'Betnesol Inj 4mg 5Ampx1ml Pack Size: 5ampx1ml', N'medicine.png', 94.0000, CAST(N'2022-05-08T08:17:20.670' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2742, N'Betagenic Oint 15gm Pack Size: 15gm', N'medicine.png', 69.0000, CAST(N'2022-05-08T08:17:47.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2743, N'Clobederm Lotion 0.5mg 20ml Pack Size: 20ml...', N'medicine.png', 52.0000, CAST(N'2022-05-08T08:18:01.220' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2744, N'Clobederm NN Oint 15g Pack Size: 15g', N'medicine.png', 71.0000, CAST(N'2022-05-08T08:18:19.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2745, N'Advantan Oint 0.1% 10gm Pack Size: 1...', N'medicine.png', 98.0000, CAST(N'2022-05-08T08:18:34.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2746, N'Advantan Oint 0.1% 10gm Pack Size: 1...', N'medicine.png', 255.0000, CAST(N'2022-05-08T08:18:49.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2747, N'Clenil Aerosol Nebulising Sol 800mcg... Pack Size: 5''s', N'medicine.png', 433.0000, CAST(N'2022-05-08T08:19:13.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2748, N'Betnelan Tab 0.5mg 500''s Pack Size: 20''s', N'medicine.png', 638.0000, CAST(N'2022-05-08T08:19:28.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2749, N'Clobevate Oint 0.05% 20gm Pack Size: 5gm', N'medicine.png', 87.0000, CAST(N'2022-05-08T08:19:42.660' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2750, N'Dermovate-NN Oint 20gm Pack Size: 20gm', N'medicine.png', 101.0000, CAST(N'2022-05-08T08:20:05.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2751, N'Eyfem Ophthalmic Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 74.0000, CAST(N'2022-05-08T08:20:26.390' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2752, N'Abolon Inj 25mg 3Ampx1ml Pack Size: 3Ampx1ml', N'medicine.png', 99.0000, CAST(N'2022-05-08T08:20:45.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2753, N'Novasalic Lotion 25ml Pack Size: 25ml', N'medicine.png', 95.0000, CAST(N'2022-05-08T08:21:04.070' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2754, N'Synalar Gel 0.025% 30gm Pack Size: 30gm', N'medicine.png', 152.0000, CAST(N'2022-05-08T08:21:48.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2755, N'Provate-G Cream 15g Pack Size: 15g', N'medicine.png', 92.0000, CAST(N'2022-05-08T08:22:08.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2756, N'Provate G Oint 15g Pack Size: 15g', N'medicine.png', 85.0000, CAST(N'2022-05-08T08:22:27.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2757, N'Hivate Lotion 0.1% 30ml Pack Size: 30ml', N'medicine.png', 202.0000, CAST(N'2022-05-08T08:22:55.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2758, N'Provate-S Lotion 30ml Pack Size: 30ml', N'medicine.png', 123.0000, CAST(N'2022-05-08T08:23:12.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2759, N'Predheal Cream 0.1% 10gm Pack Size', N'medicine.png', 160.0000, CAST(N'2022-05-08T08:23:31.103' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2760, N'Pro-One Gel 30g Pack Size: 30g', N'medicine.png', 116.0000, CAST(N'2022-05-08T08:23:48.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2761, N'Decadron Inj 4mg 1Vialx5ml Pack Size: 1vialx5ml', N'medicine.png', 87.0000, CAST(N'2022-05-08T08:24:07.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2762, N'Mometaderm Oint 0.1% 15g Pack Size: 15g', N'medicine.png', 272.0000, CAST(N'2022-05-08T08:24:25.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2763, N'Kanadex-N Cream 15g Pack Size: 15g', N'medicine.png', 35.0000, CAST(N'2022-05-08T08:24:44.763' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2764, N'Betnesol Eye Oint 5gm Pack Size: 5gm', N'medicine.png', 22.0000, CAST(N'2022-05-08T08:25:01.613' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2765, N'Clobederm Oint 0.05% 15gm Pack Size: 15gm', N'medicine.png', 63.0000, CAST(N'2022-05-08T08:25:24.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2766, N'Betaderm-N Oint 5gm Pack Size: 5gm', N'medicine.png', 23.0000, CAST(N'2022-05-08T08:25:42.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2767, N'Betaderm Oint 0.1% 5gm Pack Size: 5gm', N'medicine.png', 13.0000, CAST(N'2022-05-08T08:26:00.690' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2768, N'Betaderm-NM Cream 10gm Pack Size: 10gm', N'medicine.png', 97.0000, CAST(N'2022-05-08T08:26:21.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2769, N'Betaderm-N Cream 15gm Pack Size: 15gm', N'medicine.png', 54.0000, CAST(N'2022-05-08T08:26:39.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2770, N'Betaderm-N Cream 5gm Pack Size: 5gm', N'medicine.png', 23.0000, CAST(N'2022-05-08T08:27:00.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2771, N'Lotricort Cream 15gm Pack Size: 15gm', N'medicine.png', 112.0000, CAST(N'2022-05-08T08:27:23.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2772, N'Tricort Inj 40mg 1Amp Pack Size: 1...', N'medicine.png', 39615.0000, CAST(N'2022-05-08T08:27:44.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2773, N'Maxidex Ophthalmic Susp 0.1% 10ml Pack Size: 10ml', N'medicine.png', 177.0000, CAST(N'2022-05-08T08:28:04.810' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2774, N'Hyzonate Inj 250mg 1Vial Pack Size: 1vial', N'medicine.png', 167.0000, CAST(N'2022-05-08T08:28:23.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2775, N'Hyzonate Inj 500mg 1Vial Pack Size: 1vial', N'medicine.png', 366.0000, CAST(N'2022-05-08T08:28:46.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2776, N'Hyzonate Inj 100mg 1Vial Pack Size: 1vial', N'medicine.png', 84.0000, CAST(N'2022-05-08T08:29:05.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2777, N'Betaderm Cream 5gm Pack Size: 5gm', N'medicine.png', 16.0000, CAST(N'2022-05-08T08:29:23.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2778, N'Betaderm Cream 15gm Pack Size: 15gm', N'medicine.png', 48.0000, CAST(N'2022-05-08T08:29:46.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2779, N'Betaderm Lotion 0.05% 60ml Pack Size: 60ml', N'medicine.png', 107.0000, CAST(N'2022-05-08T08:30:04.807' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2780, N'Betaderm Oint 15gm Pack Size: 15gm', N'medicine.png', 48.0000, CAST(N'2022-05-08T08:30:27.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2781, N'Betaderm-N Oint 15gm Pack Size: 15gm', N'medicine.png', 54.0000, CAST(N'2022-05-08T08:30:44.460' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2782, N'Betagenic Cream 15gm Pack Size: 15gm', N'medicine.png', 66.0000, CAST(N'2022-05-08T08:31:01.537' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2783, N'Betasalic Oint 15gm Pack Size: 15g..', N'medicine.png', 72.0000, CAST(N'2022-05-08T08:31:21.240' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2784, N'Clobederm Oint 0.05% 5gm Pack Size: 5gm', N'medicine.png', 18.0000, CAST(N'2022-05-08T08:31:39.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2785, N'Clobederm Cream 0.05% 10gm Pack Size: 10gm', N'medicine.png', 39.0000, CAST(N'2022-05-08T08:31:59.843' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2786, N'Clobederm NN Oint 5gm Pack Size: 5gm', N'medicine.png', 18.0000, CAST(N'2022-05-08T08:32:18.987' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2787, N'Clobederm-S Lotion 20ml Pack Size: 20ml', N'medicine.png', 61.0000, CAST(N'2022-05-08T08:32:38.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2788, N'Advacort Cream 0.1% 10gm Pack Size: 10gm', N'medicine.png', 201.0000, CAST(N'2022-05-08T08:32:58.320' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2789, N'Betasalic Lotion 20ml Pack Size: 20ml', N'medicine.png', 94.0000, CAST(N'2022-05-08T08:33:17.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2790, N'Pred Forte Ophthalmic Susp 5ml Pack Size: 5', N'medicine.png', 98.0000, CAST(N'2022-05-09T01:00:41.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2791, N'Advantan Cream 0.1.10Gm Pack Size: 1', N'medicine.png', 143.0000, CAST(N'2022-05-09T01:00:57.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2792, N'Advantan Cream 0.1.10Gm Pack Size: 1', N'medicine.png', 255.0000, CAST(N'2022-05-09T01:01:21.993' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2793, N'Advantan Fatty Oint 0.1.10Gm Pack Size: 1.', N'medicine.png', 255.0000, CAST(N'2022-05-09T01:01:42.760' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2794, N'Nerisone Forte Fatty Oint 0.3%... Pack Size: 10gm', N'medicine.png', 288.0000, CAST(N'2022-05-09T01:02:04.443' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2795, N'Nerisone Forte Oint 0.3% 10gm Pack Size: 10gm', N'medicine.png', 288.0000, CAST(N'2022-05-09T01:02:23.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2796, N'Nerisone Cream 0.1% 10g Pack Size: 10g', N'medicine.png', 80.0000, CAST(N'2022-05-09T01:02:38.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2797, N'Nerisone Cream 0.1% 10g Pack Size: 10g', N'medicine.png', 80.0000, CAST(N'2022-05-09T01:02:38.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2798, N'Nerisone-C Cream 10g Pack Size: 10g', N'medicine.png', 149.0000, CAST(N'2022-05-09T01:02:56.773' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2799, N'Dexamex Inj 4mg 25Ampx1ml Pack Size: 4mg', N'medicine.png', 352.0000, CAST(N'2022-05-09T01:03:10.930' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2800, N'D-Cort Inj 25Ampx1ml Pack Size: 1ml', N'medicine.png', 405.0000, CAST(N'2022-05-09T01:03:33.060' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2801, N'Fluticort Cream 0.05% 5g Pack Size: 5g', N'medicine.png', 58.0000, CAST(N'2022-05-09T01:03:48.473' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2802, N'Rinoclenil Inh 500mcg 1 ''s Pack Size: 1''s', N'medicine.png', 285.0000, CAST(N'2022-05-09T01:04:05.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2803, N'Rinoclenil Inh 500mcg 1 ''s Pack Size: 1''s', N'medicine.png', 285.0000, CAST(N'2022-05-09T01:04:05.633' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2804, N'Rinoclenil 100 Inh 100mcg 1''s Pack Size: 30ml', N'medicine.png', 756.0000, CAST(N'2022-05-09T01:04:24.023' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2805, N'Rinoclenil 100 Inh 100mcg 1''s Pack Size: 30ml', N'medicine.png', 756.0000, CAST(N'2022-05-09T01:04:24.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2806, N'Clenil Jet Inh 250mcg 1''s Pack Size: 1''s', N'medicine.png', 409.0000, CAST(N'2022-05-09T01:04:40.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2807, N'Clenil Jet Inh 250mcg 1''s Pack Size: 1''s', N'medicine.png', 409.0000, CAST(N'2022-05-09T01:05:50.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2808, N'Hy-Cortisone Inj 500mg 1Vial Pack Size: 1VialMarketed', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:06:06.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2809, N'Hy-Cortisone Inj 500mg 1Vial Pack Size: 1VialMarketed', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:06:07.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2810, N'Hy-Cortisone Inj 100mg 1Vial Pack Size: 1...', N'medicine.png', 142.0000, CAST(N'2022-05-09T01:06:23.957' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2811, N'Hy-Cortisone Inj 100mg 1Vial Pack Size: 1...', N'medicine.png', 142.0000, CAST(N'2022-05-09T01:06:24.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2812, N'Hy-Cortisone Inj 100mg 1Vial Pack Size: 1...', N'medicine.png', 142.0000, CAST(N'2022-05-09T01:06:24.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2813, N'Hy-Cortisone Inj 100mg 1Vial Pack Size: 1...', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:06:49.567' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2814, N'Dexafort Inj 40mg 1Ampx1ml Pack Size: 1', N'medicine.png', 44.0000, CAST(N'2022-05-09T01:07:02.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2815, N'Atneson Inj 4mg 25Ampx1ml Pack Size: 25Ampx1ml', N'medicine.png', 250.0000, CAST(N'2022-05-09T01:07:23.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2816, N'Betacin Cream 0.1% 10g Pack Size: 10g', N'medicine.png', 26.0000, CAST(N'2022-05-09T01:07:45.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2817, N'Betacin Cream 0.1% 5g Pack Size: 5g', N'medicine.png', 14.0000, CAST(N'2022-05-09T01:08:07.577' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2818, N'Betacin Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 14.0000, CAST(N'2022-05-09T01:08:26.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2819, N'Dexamedron Inj 4mg 25Ampx1ml Pack Size', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:08:46.483' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2820, N'Presolone Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:09:04.363' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2821, N'Betacin Oint 0.1% 10g Pack Size: 10gm', N'medicine.png', 27.0000, CAST(N'2022-05-09T01:09:33.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2822, N'Betamethasone Tab 0.5mg 500'' Pack Size: 500''s', N'medicine.png', 254.0000, CAST(N'2022-05-09T01:09:48.980' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2823, N'Betacin-N Cream 10g Pack Size: 10gm', N'medicine.png', 27.0000, CAST(N'2022-05-09T01:10:11.837' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2824, N'Dexamedron Inj 4mg 1Ampx5ml Pack Size: 1', N'medicine.png', 57.0000, CAST(N'2022-05-09T01:10:31.380' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2825, N'Dexamin-N Cream 5g Pack Size: 5gm', N'medicine.png', 15.0000, CAST(N'2022-05-09T01:10:50.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2826, N'Bekson Forte HFA Inh 250mcg... Pack Size: 300...', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:11:17.063' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2827, N'Bekson HFA Inh 50mcg 1''s... Pack Size: 300.', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:11:38.873' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2828, N'Bekson Inh 50mcg 1''s 300... Pack Size: 300', N'medicine.png', 0.0000, CAST(N'2022-05-09T01:11:57.397' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2829, N'Betnesol-N Drops 7.5ml Pack Size: 7.5ml', N'medicine.png', 49.0000, CAST(N'2022-05-09T01:12:18.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2830, N'Cortisporin Eye Oint 3gm Pack Size: 3g', N'medicine.png', 30.0000, CAST(N'2022-05-09T01:12:40.360' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2831, N'Avamys Nasal Spray 27.5mcg 1''s Pack Size: 1''s', N'medicine.png', 683.0000, CAST(N'2022-05-09T01:13:00.353' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2832, N'Cutivate Oint 10gm Pack Size: 10gm', N'medicine.png', 115.0000, CAST(N'2022-05-09T01:13:49.750' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2833, N'Cutivate Cream 0.05% 10g Pack Size: 10g', N'medicine.png', 178.0000, CAST(N'2022-05-09T01:14:19.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2834, N'Dermovate Oint 0.05% 20gm Pack Size: 20gm', N'medicine.png', 67.0000, CAST(N'2022-05-09T01:14:44.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2835, N'Betnovate Oint 0.1% 20g Pack Size', N'medicine.png', 80.0000, CAST(N'2022-05-09T01:15:04.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2836, N'Betnovate N Oint 20gm Pack Size: 1', N'medicine.png', 80.0000, CAST(N'2022-05-09T01:15:25.560' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2837, N'Dexonil Inj 4mg 25Ampx1ml Pack Size: 1ml', N'medicine.png', 162.0000, CAST(N'2022-05-09T01:15:46.730' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2838, N'Dexonil Inj 4mg 5Ampx5ml Pack Size: 25''s', N'medicine.png', 250.0000, CAST(N'2022-05-09T01:16:07.993' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2839, N'Metavate Cream 5g Pack Size: 5g', N'medicine.png', 80.0000, CAST(N'2022-05-09T01:16:29.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2840, N'Religent-B Oint 15gm Pack Size: 15gmMarketed...', N'medicine.png', 50.0000, CAST(N'2022-05-09T01:16:48.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2841, N'Beone Plus Cream 15gm Pack Size: 15gm\', N'medicine.png', 34.0000, CAST(N'2022-05-09T01:17:10.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2842, N'Tobracin-D Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 89.0000, CAST(N'2022-05-09T01:17:32.370' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2843, N'Irzalone Tab 0.5mg 50x10''s Pack Size: 500''s', N'medicine.png', 197.0000, CAST(N'2022-05-09T01:18:18.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2844, N'Betatec 200 Rotacap Cap 200mcg... Pack Siz', N'medicine.png', 186.0000, CAST(N'2022-05-09T01:18:36.687' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2845, N'Irzalone Tab 0.5mg 20''s Pack Size: 20''s', N'medicine.png', 760.0000, CAST(N'2022-05-09T01:20:52.887' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2846, N'Irzalone Tab 0.5mg 250''s Pack Size: 250''s', N'medicine.png', 92.0000, CAST(N'2022-05-09T01:21:17.477' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2847, N'I-Cort Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 1140.0000, CAST(N'2022-05-09T01:21:38.667' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2848, N'I-Cort Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 1140.0000, CAST(N'2022-05-09T01:32:12.890' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2849, N'I-Cort Tab 5mg 3x10''s Pack Size: 30''s', N'medicine.png', 57.0000, CAST(N'2022-05-09T01:33:21.590' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2850, N'Irzalone Tab 0.5mg 500''s Pack Size: 100''s', N'medicine.png', 388.0000, CAST(N'2022-05-09T01:33:43.923' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2851, N'Irzalone Tab 0.5mg 20x25''s Pack Size: 500''s', N'medicine.png', 338.0000, CAST(N'2022-05-09T01:34:08.717' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2852, N'Eyfem Forte Eye Drops 0.25%... Pack Size: 5ml', N'medicine.png', 140.0000, CAST(N'2022-05-09T01:34:33.500' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2853, N'Prednisolone Tab 5mg 1000''s Pack Size: 1000''s', N'medicine.png', 2004.0000, CAST(N'2022-05-09T01:35:00.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2854, N'Macticort Inh 250mcg 1''s Pack Size: 1''s', N'medicine.png', 259.0000, CAST(N'2022-05-09T01:35:21.347' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2855, N'Depo Medrol Inj 40mg 1Vialx1ml Pack Size: 1vialx1ml', N'medicine.png', 158.0000, CAST(N'2022-05-09T01:35:42.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2856, N'Solu Cortef Inj 100mg 1Vial Pack Size: 1''s', N'medicine.png', 151.0000, CAST(N'2022-05-09T01:38:28.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2857, N'Depo Medrol Inj 40mg 1Vialx1ml Pack Size: 1vialx1ml', N'medicine.png', 158.0000, CAST(N'2022-05-09T01:38:54.557' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2858, N'Solu Medrol Inj 1000mg 1Vial Pack Size: 1Vial', N'medicine.png', 4211.0000, CAST(N'2022-05-09T01:39:19.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2859, N'Solu Medrol Inj 500mg 1Vial Pack Size: 1''s', N'medicine.png', 2307.0000, CAST(N'2022-05-09T01:39:43.373' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2860, N'Depo Medrol Inj 40mg 1Vialx2ml Pack Size: 1', N'medicine.png', 235.0000, CAST(N'2022-05-09T01:40:06.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2861, N'Dipgen Cream 15gm Pack Size: 15gm', N'medicine.png', 80.0000, CAST(N'2022-05-09T01:40:47.917' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2862, N'Effidex Cream 0.05% 15gm Pack Size: 15gm', N'medicine.png', 93.0000, CAST(N'2022-05-09T01:46:17.130' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2863, N'Effidex Cream 0.05% 15gm Pack Size: 15gm', N'medicine.png', 93.0000, CAST(N'2022-05-09T01:54:19.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2864, N'Dipsal Oint 15gm Pack Size: 15gm', N'medicine.png', 74.0000, CAST(N'2022-05-09T01:55:43.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2865, N'Effigenta Oint 15gm Pack Size: 15g', N'medicine.png', 102.0000, CAST(N'2022-05-09T01:56:04.967' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2866, N'Effidex Oint 0.05% 15gm Pack Size: 15gm', N'medicine.png', 93.0000, CAST(N'2022-05-09T01:56:23.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2867, N'Effigenta Cream 15gm Pack Size: 15g', N'medicine.png', 91.0000, CAST(N'2022-05-09T01:56:41.940' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2868, N'Effidex Lotion 0.05% 20ml Pack Size: 20ml...', N'medicine.png', 33.0000, CAST(N'2022-05-09T01:57:00.127' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2869, N'Fuskin - B Cream 5gm Pack Size: 5gm', N'medicine.png', 57.0000, CAST(N'2022-05-09T01:57:19.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2870, N'Fuskin - H Cream 15gm Pack Size: 15gm', N'medicine.png', 181.0000, CAST(N'2022-05-09T01:57:35.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2871, N'Novasalic Oint 15gm Pack Size: 1''s', N'medicine.png', 120.0000, CAST(N'2022-05-09T01:57:54.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2872, N'Precarbat Lotion 20gm Pack Size: 20gm', N'medicine.png', 177.0000, CAST(N'2022-05-09T01:58:17.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2873, N'Synalar Cream 0.025% 15gm Pack Size: 15gm', N'medicine.png', 57.0000, CAST(N'2022-05-09T01:58:38.277' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2874, N'Synalar Gel 0.025% 15gm Pack Size: 15gm', N'medicine.png', 57.0000, CAST(N'2022-05-09T01:58:58.080' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2875, N'Synalar Oint 0.025% 30gm Pack Size: 30g', N'medicine.png', 199.0000, CAST(N'2022-05-09T01:59:21.743' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2876, N'Triton Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 31.0000, CAST(N'2022-05-09T01:59:41.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2877, N'Triton Inj 40mTriton Inj 40mg 1Ampx1ml Pack Size: 1''sg 1Ampx1ml Pack Size: 1''s', N'medicine.png', 53.0000, CAST(N'2022-05-09T02:00:00.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2878, N'Effidex Lotion 0.05% 60ml Pack Size: 60ml', N'medicine.png', 105.0000, CAST(N'2022-05-09T02:00:19.737' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2879, N'Triton Oint 0.1% 15g Pack Size: 15g', N'medicine.png', 76.0000, CAST(N'2022-05-09T02:03:09.260' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2880, N'Dipcort Cream 15g Pack Size: 15g', N'medicine.png', 85.0000, CAST(N'2022-05-09T02:03:28.553' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2881, N'Triton Inj 1ml 5''s Pack Size: 5''s', N'medicine.png', 277.0000, CAST(N'2022-05-09T02:03:47.680' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2882, N'Futixon Cream 5gm Pack Size: 5gm...', N'medicine.png', 69.0000, CAST(N'2022-05-09T02:04:07.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2883, N'Salbeclo Inh 100mcg/50mcg 1''s Pack Size: 200', N'medicine.png', 238.0000, CAST(N'2022-05-09T02:04:27.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2884, N'Rekabson Inj 4mg 5Ampx1ml Pack Size: 5', N'medicine.png', 48.0000, CAST(N'2022-05-09T02:04:54.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2885, N'Rekabson N Drops 5ml Pack Size: 5ml', N'medicine.png', 23.0000, CAST(N'2022-05-09T02:05:15.310' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2886, N'Encore Cream 0.05% 10G Pack Size: 10g', N'medicine.png', 38.0000, CAST(N'2022-05-09T02:05:38.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2887, N'Encore G Cream 10G Pack Size: 10g', N'medicine.png', 43.0000, CAST(N'2022-05-09T02:05:57.150' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2888, N'Encore Lotion 0.05% 25Ml Pack Size: 25ml', N'medicine.png', 48.0000, CAST(N'2022-05-09T02:06:17.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2889, N'Encore Oint 0.05% 20G Pack Size: 20g', N'medicine.png', 57.0000, CAST(N'2022-05-09T02:06:42.893' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2890, N'Encore S Oint 10G Pack Size: 10g', N'medicine.png', 46.0000, CAST(N'2022-05-09T02:07:04.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2891, N'BetaDrop-N Drops 7.5ml Pack Size: 7.5ml', N'medicine.png', 32.0000, CAST(N'2022-05-09T02:07:30.547' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2892, N'Fortipred Eye Drops 1% 5ml Pack Size: 5ml', N'medicine.png', 65.0000, CAST(N'2022-05-09T02:07:50.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2893, N'Femicon Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 94.0000, CAST(N'2022-05-09T02:08:14.140' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2894, N'Mildopred Eye Drops 0.12% 5ml Pack Size: 5ml...', N'medicine.png', 49.0000, CAST(N'2022-05-09T02:08:37.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2895, N'Methachlor Eye Oint 3g Pack Size: 3g', N'medicine.png', 21.0000, CAST(N'2022-05-09T02:08:56.817' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2896, N'Optadex Eye Drops 0.1% 5ml Pack Size: 5ml', N'medicine.png', 22.0000, CAST(N'2022-05-09T02:09:16.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2897, N'Optadex-N Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 23.0000, CAST(N'2022-05-09T02:09:34.583' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2898, N'Polydex Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 90.0000, CAST(N'2022-05-09T02:09:53.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2899, N'Steribiol Eye Susp 5ml Pack Size: 5ml', N'medicine.png', 70.0000, CAST(N'2022-05-09T02:10:14.740' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2900, N'Lotenol Forte Ophthalmic Susp 0.5%... Pack Size: 5', N'medicine.png', 133.0000, CAST(N'2022-05-09T02:10:35.237' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2901, N'Provate Cream 0.5mg 15gm Pack Size: 15g', N'medicine.png', 83.0000, CAST(N'2022-05-09T02:10:55.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2902, N'Provate Oint 0.05% 10g Pack Size: 10g', N'medicine.png', 83.0000, CAST(N'2022-05-09T02:11:26.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2903, N'Provate-S Oint 15gm Pack Size: 15g', N'medicine.png', 79.0000, CAST(N'2022-05-09T02:11:46.550' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2904, N'Ticovate Nasal Spray 50mcg 1''s Pack Size: 50mcg', N'medicine.png', 284.0000, CAST(N'2022-05-09T02:12:06.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2905, N'Clobeta Oint 0.05% 10g Pack Size: 10gm', N'medicine.png', 31.0000, CAST(N'2022-05-09T02:12:27.530' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2906, N'Hivate Oint 0.1% 5gm Pack Size: 5gm', N'medicine.png', 84.0000, CAST(N'2022-05-09T02:12:48.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2907, N'Hivate Nasal Spray 50mcg 120Spray Pack Size: 1''s', N'medicine.png', 409.0000, CAST(N'2022-05-09T02:13:12.250' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2908, N'Ticovate Lotion 0.05% 20ml Pack Size: 20ml', N'medicine.png', 264.0000, CAST(N'2022-05-09T02:13:34.910' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2909, N'Ticovate Cream 0.05% 10gm Pack Size: 10gm', N'medicine.png', 153.0000, CAST(N'2022-05-09T02:13:54.607' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2910, N'Ticovate Oint 10mg 1''s Pack Size: 1''s', N'medicine.png', 139.0000, CAST(N'2022-05-09T02:14:18.280' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2911, N'Hivate Nasal Spray 50mcg 60Spray Pack Size: 50mcg', N'medicine.png', 250.0000, CAST(N'2022-05-09T02:14:37.510' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2912, N'Provate Lotion 0.05% 30ml Pack Size: 30ml', N'medicine.png', 76.0000, CAST(N'2022-05-09T02:15:03.203' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2913, N'Hivate Cream 10gm Pack Size: 10gm', N'medicine.png', 200.0000, CAST(N'2022-05-09T02:15:23.570' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2914, N'Nasacort AQ Nasal Spray 55mcg/dose', N'medicine.png', 880.0000, CAST(N'2022-05-09T02:15:45.617' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2915, N'Ocuflur Ophthalmic Susp 1.0% 5ml Pack Size:', N'medicine.png', 61.0000, CAST(N'2022-05-09T02:16:04.783' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2916, N'Ocuflur Forte Ophthalmic Susp 0.25%', N'medicine.png', 111.0000, CAST(N'2022-05-09T02:16:24.643' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2917, N'Diprosan Cream 0.05% 10g Pack Size: 10g', N'medicine.png', 65.0000, CAST(N'2022-05-09T02:16:44.323' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2918, N'Vislat Ophthalmic Sol 2.5ml Pack Size: 10ml', N'medicine.png', 551.0000, CAST(N'2022-05-09T02:17:03.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2919, N'Dexoptic Ophthalmic Susp 0.1% 5ml', N'medicine.png', 36.0000, CAST(N'2022-05-09T02:17:28.860' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2920, N'Dexoptic Ophthalmic Oint 0.1% 3.5g', N'medicine.png', 30.0000, CAST(N'2022-05-09T02:17:49.040' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2921, N'Optopred Ophthalmic Susp 1.0% 5ml', N'medicine.png', 62.0000, CAST(N'2022-05-09T02:18:07.937' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2922, N'Santomet Lotion 0.1% 20ml Pack Size: 20ml', N'medicine.png', 133.0000, CAST(N'2022-05-09T02:18:28.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2923, N'Santomet Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 104.0000, CAST(N'2022-05-09T02:18:53.267' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2924, N'Santomet Cream 0.1% 5g Pack Size: 5g', N'medicine.png', 104.0000, CAST(N'2022-05-09T02:19:13.350' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2925, N'Flexosone Nasal Spray 50mcg 7.5ml Pack Size: 7.5ml', N'medicine.png', 363.0000, CAST(N'2022-05-09T02:19:41.513' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2926, N'Clozox H Cream 10gm Pack Size: 10g', N'medicine.png', 86.0000, CAST(N'2022-05-09T02:20:03.593' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2927, N'Lamcy Ophthalmic Sol 0.1% 5ml Pack Size: 5ml', N'medicine.png', 81.0000, CAST(N'2022-05-09T02:20:23.313' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2928, N'Lamcy Ophthalmic Sol 0.1% 5ml Pack Size: 5ml', N'medicine.png', 81.0000, CAST(N'2022-05-09T02:20:23.647' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2929, N'Lamcy-T Ophthalmic Susp 1mg/0.25mg 5ml', N'medicine.png', 76.0000, CAST(N'2022-05-09T02:20:45.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2930, N'Lamcy-T Ophthalmic Susp 1mg/0.25mg 5ml', N'medicine.png', 76.0000, CAST(N'2022-05-09T02:20:46.597' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2931, N'Neupred Susp 15mg/5ml 60ml Pack Size: 60ml', N'medicine.png', 92.0000, CAST(N'2022-05-09T02:21:06.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2932, N'Beltapro Oint 0.05% 5g Pack Size: 5''s', N'medicine.png', 15.0000, CAST(N'2022-05-09T02:21:22.490' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2933, N'Beltapro Cream 0.05% 5g Pack Size: 14''s', N'medicine.png', 16.0000, CAST(N'2022-05-09T02:21:41.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2934, N'Beltapro Oint 0.05% 30g Pack Size: 30g', N'medicine.png', 114.0000, CAST(N'2022-05-09T02:21:56.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2935, N'Beltapro Oint 0.05% 10g Pack Size: 5g', N'medicine.png', 29.0000, CAST(N'2022-05-09T02:22:16.170' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2936, N'Beltapro Lotion 0.05% 20ml Pack Size: 5g', N'medicine.png', 59.0000, CAST(N'2022-05-09T02:22:47.867' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2937, N'Betasaly Oint 0.064%/0.003g Pack Size: 15g', N'medicine.png', 160.0000, CAST(N'2022-05-09T02:23:05.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2938, N'Betasaly Oint 0.064%/0.003g Pack Size: 15g', N'medicine.png', 160.0000, CAST(N'2022-05-09T02:23:06.160' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2939, N'Betasaly Oint 0.064%/0.003g Pack Size: 15g', N'medicine.png', 75.0000, CAST(N'2022-05-09T02:23:31.517' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2940, N'Betaval Cream 0.1% 5g Pack Size: 5g', N'medicine.png', 12.0000, CAST(N'2022-05-09T02:23:53.120' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2941, N'Betaval Cream 0.1% 15g Pack Size: 15g', N'medicine.png', 28.0000, CAST(N'2022-05-09T02:24:23.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2942, N'Betaval-N Cream 5g Pack Size: 5g', N'medicine.png', 11.0000, CAST(N'2022-05-09T02:24:44.357' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2943, N'Betenate Cream 0.05% 15g Pack Size: 15g', N'medicine.png', 64.0000, CAST(N'2022-05-09T02:25:06.437' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2944, N'Cortival Cream 1% 10g Pack Size: 1', N'medicine.png', 39.0000, CAST(N'2022-05-09T02:25:29.333' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (2945, N'Top MCA Gel 30g Pack Size: 30g', N'medicine.png', 88.0000, CAST(N'2022-05-09T02:25:45.740' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3002, N'Betagent Cream 0.05%/1% 15g Pack Size: 15g', N'medicine.png', 74.0000, CAST(N'2022-05-09T18:12:03.733' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3003, N'Betasaly Lotion 0.05%/3% 25ml Pack Size: 25ml', N'medicine.png', 70.0000, CAST(N'2022-05-09T18:12:24.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3004, N'Dexoptic Ophthalmic Oint 0.1% 3.5g Pack Size: 3.5gm', N'medicine.png', 30.0000, CAST(N'2022-05-09T18:15:26.683' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3005, N'Optopred Ophthalmic Susp 1.0% 5ml', N'medicine.png', 62.0000, CAST(N'2022-05-09T18:15:41.403' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3006, N'Optopred Ophthalmic Susp 1.0% 5ml', N'medicine.png', 62.0000, CAST(N'2022-05-09T18:15:43.423' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3007, N'Santomet Lotion 0.1% 20ml Pack Size: 20ml', N'medicine.png', 133.0000, CAST(N'2022-05-09T18:16:02.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3008, N'Santomet Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 104.0000, CAST(N'2022-05-09T18:16:28.113' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3009, N'Santomet Cream 0.1% 5g Pack Size: 5g', N'medicine.png', 104.0000, CAST(N'2022-05-09T18:16:47.627' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3010, N'Flexosone Nasal Spray 50mcg 7.5ml Pack Size: 7.5ml...', N'medicine.png', 363.0000, CAST(N'2022-05-09T18:17:10.367' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3011, N'Clozox H Cream 10gm Pack Size: 10g', N'medicine.png', 86.0000, CAST(N'2022-05-09T18:17:32.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3012, N'Lamcy Ophthalmic Sol 0.1% 5ml Pack Size: 5ml', N'medicine.png', 81.0000, CAST(N'2022-05-09T18:17:52.770' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3013, N'Lamcy-T Ophthalmic Susp 1mg/0.25mg 5ml', N'medicine.png', 76.0000, CAST(N'2022-05-09T18:18:34.340' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3014, N'Neupred Susp 15mg/5ml 60ml Pack Size: 60m', N'medicine.png', 92.0000, CAST(N'2022-05-09T18:18:54.413' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3015, N'Beltapro Oint 0.05% 5g Pack Size: 5''s', N'medicine.png', 15.0000, CAST(N'2022-05-09T18:19:13.930' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3016, N'Beltapro Cream 0.05% 5g Pack Size: 14''s', N'medicine.png', 16.0000, CAST(N'2022-05-09T18:19:34.727' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3017, N'Beltapro Oint 0.05% 30g Pack Size: 30g', N'medicine.png', 114.0000, CAST(N'2022-05-09T18:19:55.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3018, N'Beltapro Oint 0.05% 10g Pack Size: 5g', N'medicine.png', 29.0000, CAST(N'2022-05-09T18:20:17.383' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3019, N'Beltapro Lotion 0.05% 20ml Pack Size: 5g', N'medicine.png', 54.0000, CAST(N'2022-05-09T18:20:37.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3020, N'Beltapro Cream 0.05% 15g Pack Size', N'medicine.png', 59.0000, CAST(N'2022-05-09T18:20:59.037' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3021, N'Predheal Oint 0.1% 10gm Pack Size', N'medicine.png', 160.0000, CAST(N'2022-05-09T18:21:20.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3022, N'Betasaly Oint 0.064%/0.003g Pack Size: 15g', N'medicine.png', 75.0000, CAST(N'2022-05-09T18:21:47.900' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3023, N'Betaval Cream 0.1% 5g Pack Size: 5g', N'medicine.png', 12.0000, CAST(N'2022-05-09T18:22:01.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3024, N'Betaval Cream 0.1% 15g Pack Size: 15g', N'medicine.png', 28.0000, CAST(N'2022-05-09T18:22:23.447' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3025, N'Betaval-N Cream 5g Pack Size: 5g', N'medicine.png', 11.0000, CAST(N'2022-05-09T18:22:47.520' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3026, N'Betenate Cream 0.05% 15g Pack Size: 15g', N'medicine.png', 64.0000, CAST(N'2022-05-09T18:23:05.180' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3027, N'Top MCA Gel 30g Pack Size: 30g', N'medicine.png', 39.0000, CAST(N'2022-05-09T18:23:21.247' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3028, N'Top MCA Gel 30g Pack Size: 30g', N'medicine.png', 39.0000, CAST(N'2022-05-09T18:23:21.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3029, N'Top MCA Gel 30g Pack Size: 30g', N'medicine.png', 88.0000, CAST(N'2022-05-09T18:23:44.720' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3030, N'Betagent Cream 0.05%/1% 15g Pack Size: 15g', N'medicine.png', 74.0000, CAST(N'2022-05-09T18:24:03.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3031, N'Betasaly Lotion 0.05%/3% 25ml Pack Size: 25ml', N'medicine.png', 70.0000, CAST(N'2022-05-09T18:24:24.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3032, N'Betasaly Lotion 0.05%/3% 25ml Pack Size: 25ml', N'medicine.png', 50.0000, CAST(N'2022-05-09T18:24:42.480' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3033, N'Betaval Oint 0.1% 15gm Pack Size: 15g', N'medicine.png', 27.0000, CAST(N'2022-05-09T18:25:00.173' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3034, N'Clobetol Cream 0.05% 5g Pack Size: 5g', N'medicine.png', 16.0000, CAST(N'2022-05-09T18:25:20.623' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3035, N'Clobetol Oint 0.05% 5g Pack Size: 5g', N'medicine.png', 13.0000, CAST(N'2022-05-09T18:25:40.147' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3036, N'Flutinate Oint 0.05% 10g Pack Size: 10g', N'medicine.png', 105.0000, CAST(N'2022-05-09T18:26:23.523' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3037, N'Flutinate Cream 0.5% 5g Pack Size: 5g', N'medicine.png', 55.0000, CAST(N'2022-05-09T18:26:44.960' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3038, N'Flutinate Oint 0.05% 5gm Pack Size: 5gm', N'medicine.png', 55.0000, CAST(N'2022-05-09T18:27:03.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3039, N'Mycona GB Cream 0.1%/0.1%/2% 10g Pack Size: 10g', N'medicine.png', 61.0000, CAST(N'2022-05-09T18:27:23.780' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3040, N'Top-Gel Plus 30g Pack Size: 1', N'medicine.png', 120.0000, CAST(N'2022-05-09T18:27:35.830' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3041, N'Udic-B Cream 0.01%/0.002% 15g Pack Size: 15g', N'medicine.png', 145.0000, CAST(N'2022-05-09T18:28:09.440' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3042, N'Betagent Cream 0.05%/1% 10g Pack Size: 10g', N'medicine.png', 45.0000, CAST(N'2022-05-09T18:28:28.330' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3043, N'Betasaly Lotion 0.05%/3% 60ml Pack Size: 60ml', N'medicine.png', 155.0000, CAST(N'2022-05-09T18:28:48.673' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3044, N'Betaval Lotion 0.1% 60ml Pack Size: 60ml', N'medicine.png', 75.0000, CAST(N'2022-05-09T18:29:07.230' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3045, N'Betaval-N Lotion 0.1%/0.5% 60ml Pack Size: 60ml', N'medicine.png', 75.0000, CAST(N'2022-05-09T18:29:26.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3046, N'Betaval Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 12.0000, CAST(N'2022-05-09T18:29:40.527' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3047, N'Betaval-N Oint 0.1%/0.5% 5g Pack Size: 5g', N'medicine.png', 12.0000, CAST(N'2022-05-09T18:30:01.167' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3048, N'Betaval-N Oint 0.1%/0.5% 15g Pack Size: 15g', N'medicine.png', 34.0000, CAST(N'2022-05-09T18:30:21.797' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3049, N'Clobetol Cream 0.5% 10g Pack Size: 10g', N'medicine.png', 24.0000, CAST(N'2022-05-09T18:30:42.927' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3050, N'Clobetol Oint 0.05% 15g Pack Size: 15g', N'medicine.png', 33.0000, CAST(N'2022-05-09T18:31:01.710' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3051, N'Loteflam Eye Drops 0.5% 5ml Pack Size: 5ml', N'medicine.png', 133.0000, CAST(N'2022-05-09T18:31:12.650' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3052, N'Fluni Nasal Spray 15ml Pack Size: 15ml', N'medicine.png', 190.0000, CAST(N'2022-05-09T18:31:34.410' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3053, N'Floroptic Eye Drops 0.1% 5ml Pack Size: 5ml', N'medicine.png', 48.0000, CAST(N'2022-05-09T18:31:45.693' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3054, N'Floroptic Eye Oint 0.1% 3.5g Pack Size: 3.5g', N'medicine.png', 40.0000, CAST(N'2022-05-09T18:31:57.030' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3055, N'Gen-B Cream 0.1%/0.1% 15g Pack Size: 5ml', N'medicine.png', 25.0000, CAST(N'2022-05-09T18:32:20.957' AS DateTime), 1)
GO
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3056, N'Gen-B Oint 0.1%/0.1% 15g Pack Size: 7.5ml', N'medicine.png', 25.0000, CAST(N'2022-05-09T18:32:31.573' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3057, N'Difzole Cream 10mg/1mg 10g Pack Size: 15g', N'medicine.png', 54.0000, CAST(N'2022-05-09T18:32:40.227' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3058, N'Prens Eye Drops 1% 5ml Pack Size: 5ml', N'medicine.png', 50.0000, CAST(N'2022-05-09T18:32:54.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3059, N'Beva-N Cream 5g Pack Size: 15ml', N'medicine.png', 12.0000, CAST(N'2022-05-09T18:33:02.100' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3060, N'Beva-N Oint 5g Pack Size: 5gBeva-N Oint 5g Pack Size: 5g', N'medicine.png', 12.0000, CAST(N'2022-05-09T18:33:10.007' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3061, N'Beva-N Cream 15g Pack Size: 3.5g', N'medicine.png', 33.0000, CAST(N'2022-05-09T18:33:21.047' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3062, N'Beva-N Cream 15g Pack Size: 3.5g', N'medicine.png', 33.0000, CAST(N'2022-05-09T18:33:31.487' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3063, N'Beva-N Oint 15g Pack Size: 15g', N'medicine.png', 33.0000, CAST(N'2022-05-09T18:34:06.453' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3064, N'Dermolone Cream 15g Pack Size: 5g', N'medicine.png', 37.0000, CAST(N'2022-05-09T18:34:24.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3065, N'Dermolone Oint 15g Pack Size: 15g', N'medicine.png', 37.0000, CAST(N'2022-05-09T18:34:50.190' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3066, N'Dermolone Gel 15g Pack Size: 15g', N'medicine.png', 37.0000, CAST(N'2022-05-09T18:35:11.033' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3067, N'V-Derm Cream 0.05% 5g Pack Size: 3.5g', N'medicine.png', 13.0000, CAST(N'2022-05-09T18:35:20.653' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3068, N'V-Derm Oint 0.05% 5g Pack Size: 5g', N'medicine.png', 13.0000, CAST(N'2022-05-09T18:35:32.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3069, N'V-Derm Cream 0.05% 10g Pack Size: 30g', N'medicine.png', 25.0000, CAST(N'2022-05-09T18:35:40.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3070, N'V-Derm Oint 0.05% 10g Pack Size: 5g', N'medicine.png', 23.0000, CAST(N'2022-05-09T18:35:50.257' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3071, N'Vegacin Vaginal Cream 2% 40g Pack Size: 10g', N'medicine.png', 200.0000, CAST(N'2022-05-09T18:36:02.117' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3072, N'VegaDex Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 24.0000, CAST(N'2022-05-09T18:36:11.207' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3073, N'Valigent Cream 1mg/1mg 15gm Pack Size: 1''s', N'medicine.png', 72.0000, CAST(N'2022-05-09T18:36:19.913' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3074, N'Beclo-Sal Inh 1''s Pack Size: 1''s', N'medicine.png', 262.0000, CAST(N'2022-05-09T18:36:34.090' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3075, N'Betadip Cream 0.05% 15g Pack Size: 15g', N'medicine.png', 79.0000, CAST(N'2022-05-09T18:36:51.543' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3076, N'Betadip Cream 0.05% 15g Pack Size: 15g', N'medicine.png', 79.0000, CAST(N'2022-05-09T18:36:52.430' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3077, N'Betadip Oint 0.05% 15g Pack Size: 15g', N'medicine.png', 79.0000, CAST(N'2022-05-09T18:37:12.290' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3078, N'Hydrocortisone Cream 1% 10gm Pack Size: 10gm', N'medicine.png', 43.0000, CAST(N'2022-05-09T18:37:32.943' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3079, N'Hydro Sod Suc Inj 100mg... Pack Size: 1''s', N'medicine.png', 102.0000, CAST(N'2022-05-09T18:37:57.920' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3080, N'Hydro Sod Suc Inj 250mg... Pack Size: 1''s', N'medicine.png', 176.0000, CAST(N'2022-05-09T18:38:19.807' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3081, N'Lonacort Oint 0.1% 5g Pack Size: 5g', N'medicine.png', 48.0000, CAST(N'2022-05-09T18:38:41.087' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3082, N'Orbafluor Eye Drops 0.1% 5ml Pack Size: 5ml', N'medicine.png', 69.0000, CAST(N'2022-05-09T18:38:56.210' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3083, N'Orbafluor Eye Drops 0.1% 5ml Pack Size: 5ml', N'medicine.png', 57.0000, CAST(N'2022-05-09T18:39:04.013' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3084, N'Orbetam Drops 0.1% 10ml Pack Size: 10ml', N'medicine.png', 41.0000, CAST(N'2022-05-09T18:39:17.757' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3085, N'Orbetam-N Drops 10ml Pack Size: 10ml', N'medicine.png', 53.0000, CAST(N'2022-05-09T18:39:38.540' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3086, N'Safloid Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 93.0000, CAST(N'2022-05-09T18:39:48.153' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3087, N'Safloid-M Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 48.0000, CAST(N'2022-05-09T18:40:09.743' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3088, N'Safloid-M Eye Drops 5ml Pack Size: 5ml', N'medicine.png', 48.0000, CAST(N'2022-05-09T18:40:10.600' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3089, N'Decadron Inj 4mg 25Vialx1ml Pack Size: 251vialx1ml', N'medicine.png', 547.0000, CAST(N'2022-05-09T18:40:30.417' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3090, N'Decadron Inj 4mg 1Vialx1ml Pack Size: 1vial', N'medicine.png', 22.0000, CAST(N'2022-05-09T18:40:50.950' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3091, N'Hydrocortisone Oint 1% in Petroleum... Pack Size: 6', N'medicine.png', 250.0000, CAST(N'2022-05-09T18:41:12.270' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3092, N'Betawis - S Cream 15g Pack Size: 15g', N'medicine.png', 50.0000, CAST(N'2022-05-09T18:41:34.327' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3093, N'Betasol lotion 0.5mg 20ml Pack Size: 20ml', N'medicine.png', 38.0000, CAST(N'2022-05-09T18:41:43.703' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3094, N'Betawis G Cream 10g Pack Size: 10g', N'medicine.png', 44.0000, CAST(N'2022-05-09T18:41:56.187' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3095, N'Betawis Cream 0.05% 15g Pack Size: 15g', N'medicine.png', 30.0000, CAST(N'2022-05-09T18:42:04.777' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3096, N'Betawis lotion 0.1% 60ml Pack Size: 60ml', N'medicine.png', 75.0000, CAST(N'2022-05-09T18:42:26.507' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3097, N'Carabeta Cream 5g Pack Size: 5g', N'medicine.png', 13.0000, CAST(N'2022-05-09T18:42:47.800' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3098, N'Caracort Cream 10g Pack Size: 10g', N'medicine.png', 52.0000, CAST(N'2022-05-09T18:43:07.983' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3099, N'Fusiway-H Cream 15g Pack Size: 15g', N'medicine.png', 210.0000, CAST(N'2022-05-09T18:43:18.050' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3100, N'Tan Cream 1mg 10g Pack Size: 10g', N'medicine.png', 150.0000, CAST(N'2022-05-09T18:43:39.857' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3101, N'Triway Inj 40mg 1Vial Pack Size: 1vailx125ml', N'medicine.png', 30.0000, CAST(N'2022-05-09T18:43:59.233' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3102, N'Husicort H Cream 15gm Pack Size: 15gm', N'medicine.png', 210.0000, CAST(N'2022-05-09T18:44:08.870' AS DateTime), 1)
INSERT [dbo].[Medicines] ([MedicineID], [MedicineTitle], [DisplayPicture], [Price], [AddedDateTime], [Status]) VALUES (3103, N'Permivate Lotion 20ml Pack Size: 20ml', N'medicine.png', 230.0000, CAST(N'2022-05-09T18:44:30.217' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Medicines] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Appointments] ON 

INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (1, 20043, 2, 1500.0000, NULL, CAST(N'2022-04-04' AS Date), CAST(N'13:01:53' AS Time), 1, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-01T01:02:05.843' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (2, 20047, 2, 1500.0000, NULL, CAST(N'2022-04-04' AS Date), CAST(N'21:27:00' AS Time), 1, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-01T01:13:34.840' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (3, 20048, 3, 1500.0000, NULL, CAST(N'2022-04-04' AS Date), CAST(N'10:10:00' AS Time), 4, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-01T01:14:29.027' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (4, 20049, 2, 1500.0000, NULL, CAST(N'2022-04-04' AS Date), CAST(N'21:27:00' AS Time), 1, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-01T01:17:45.420' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (5, 20010, 2, 1500.0000, NULL, CAST(N'2022-05-30' AS Date), CAST(N'21:27:00' AS Time), 1, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-01T02:40:25.057' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (6, 20050, 2, 1500.0000, NULL, CAST(N'2022-05-02' AS Date), CAST(N'21:27:00' AS Time), 1, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-01T02:46:21.967' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (7, 20051, 2, 1500.0000, NULL, CAST(N'2022-05-02' AS Date), CAST(N'21:27:00' AS Time), 1, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-02T08:52:08.367' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (8, 20051, 4, 1500.0000, NULL, CAST(N'2022-05-03' AS Date), CAST(N'19:01:00' AS Time), 16, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-02T10:44:01.010' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (9, 20045, 4, 1500.0000, N'2022051016131113110.jpg', CAST(N'2022-05-09' AS Date), CAST(N'00:00:00' AS Time), 25, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-10T16:13:13.323' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (10, 1, 4, 1500.0000, N'2022051101353135310.jpg', CAST(N'2022-05-09' AS Date), CAST(N'21:00:00' AS Time), 29, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-11T01:35:33.653' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (11, 20051, 4, 1500.0000, N'2022051102313731370.png', CAST(N'2022-05-09' AS Date), CAST(N'21:00:00' AS Time), 29, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-11T02:31:44.870' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (12, 20051, 1004, 1900.0000, N'202205140007497490.PNG', CAST(N'2022-05-16' AS Date), CAST(N'16:00:00' AS Time), 10016, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-14T00:07:52.680' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (13, 20051, 4, 1500.0000, N'202205140009539530.png', CAST(N'2022-05-16' AS Date), CAST(N'00:00:00' AS Time), 28, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-14T00:09:55.723' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (14, 1, 4, 1500.0000, N'2022051816104310430.jpg', CAST(N'2022-05-16' AS Date), CAST(N'00:00:00' AS Time), 25, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-18T16:10:45.637' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (15, 1, 4, 1500.0000, N'202205181612031230.jpg', CAST(N'2022-05-30' AS Date), CAST(N'00:00:00' AS Time), 28, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-18T16:12:04.900' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (16, 20051, 4, 1500.0000, N'2022052218144814480.jpg', CAST(N'2022-05-30' AS Date), CAST(N'21:00:00' AS Time), 29, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-22T18:14:49.630' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (17, 20051, 4, 1500.0000, N'2022052218165116510.jpg', CAST(N'2022-07-04' AS Date), CAST(N'21:00:00' AS Time), 29, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-22T18:16:53.413' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (18, 20051, 4, 1500.0000, N'2022052218481948190.jpg', CAST(N'2022-05-22' AS Date), CAST(N'18:30:00' AS Time), 10030, NULL, NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-05-22T18:48:20.060' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (19, 30046, 1006, 1999.0000, N'202206031941034130.png', CAST(N'2022-06-03' AS Date), CAST(N'20:00:00' AS Time), 10132, N'ewfwef wef wef wfefWE F WE FWe fwef eravg frg  eargag aerg eargearg egeragera gerag', NULL, NULL, NULL, N'0', 0, 0.0000, NULL, CAST(N'2022-06-03T19:41:05.127' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (20, 30044, 4, 1500.0000, N'2022061619401440140.png', CAST(N'2022-06-17' AS Date), CAST(N'18:30:00' AS Time), 10028, N'cxcxc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-16T19:40:16.253' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (21, 30044, 1005, 1999.0000, N'2022061619462246220.png', CAST(N'2022-06-24' AS Date), CAST(N'16:30:00' AS Time), 10049, N'ssss', NULL, NULL, 2, N'1111', 0, 200.0000, NULL, CAST(N'2022-06-16T19:46:26.703' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (22, 30044, 4, 1500.0000, N'2022061619551155110.png', CAST(N'2022-06-17' AS Date), CAST(N'18:00:00' AS Time), 10021, N'wadwaed ad', NULL, NULL, 2, N'1111', 0, 200.0000, NULL, CAST(N'2022-06-16T19:55:32.357' AS DateTime), 1)
INSERT [dbo].[Patient_Appointments] ([AppointmentID], [UserID], [TeamID], [SessionCharges], [PaymentImage], [SessionStartDate], [SessionStartTime], [TeamTimeSlotID], [BillingAddress], [IsSessionEnded], [SessionEndDatetime], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [FinalAmount], [AddedDateTime], [Status]) VALUES (23, 30044, 1006, 1999.0000, N'202206162009359350.png', CAST(N'2022-06-16' AS Date), CAST(N'21:00:00' AS Time), 10126, N' ddgdfgd', NULL, NULL, 1, N'123', 25, 0.0000, NULL, CAST(N'2022-06-16T20:09:41.263' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Patient_Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_LabTests] ON 

INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (1, 1003, 5, 20010, 0, 20, 480.0000, 480.0000, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-04-29T21:12:28.487' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (2, 1003, 5, 20049, 0, 20, 480.0000, 480.0000, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-01T01:49:05.687' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (3, 1003, 5, 20051, 0, 20, 480.0000, 480.0000, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-02T08:57:30.740' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (4, 1003, 5, 20045, 0, 20, 480.0000, 480.0000, N'2022051016113911390.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-10T16:11:41.093' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (5, 1003, 5, 1, 0, 20, 480.0000, 480.0000, N'2022051101503750370.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:50:42.350' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (6, 1003, 5, 1, 0, 20, 480.0000, 3276.0000, N'2022051101531053100.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:53:14.727' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (7, 1003, 6, 1, 0, 20, 2376.0000, 3276.0000, N'2022051101531053100.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:53:14.730' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (8, 1003, 7, 1, 0, 20, 420.0000, 3276.0000, N'2022051101531053100.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:53:14.733' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (9, 1003, 9, 20052, 0, 20, 300.0000, 3696.0000, N'202205110155065560.png', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:55:11.933' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (10, 1003, 10, 20052, 0, 20, 600.0000, 3696.0000, N'202205110155065560.png', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:55:11.937' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (11, 1003, 7, 20052, 0, 20, 420.0000, 3696.0000, N'202205110155065560.png', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:55:11.940' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (12, 1003, 6, 20052, 0, 20, 2376.0000, 3696.0000, N'202205110155065560.png', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:55:11.940' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (13, 1003, 6, 20051, 0, 20, 2376.0000, 2466.4000, N'202205140008228220.PNG', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-14T00:08:26.430' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (14, 1003, 8, 20051, 0, 20, 90.4000, 2466.4000, N'202205140008228220.PNG', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-14T00:08:26.433' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (15, 1003, 6, 20051, 0, 20, 2376.0000, 2886.4000, N'2022052218232723270.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-22T18:23:28.437' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (16, 1003, 7, 20051, 0, 20, 420.0000, 2886.4000, N'2022052218232723270.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-22T18:23:28.443' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (17, 1003, 8, 20051, 0, 20, 90.4000, 2886.4000, N'2022052218232723270.jpg', NULL, NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-22T18:23:28.443' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (18, 1003, 5, 30046, 0, 10, 540.0000, 540.0000, N'202206031701391390.png', NULL, N'ewfwef wef wef wfefWE F WE FWe fwef eravg frg  eargag aerg eargearg egeragera gerag', NULL, NULL, 0, 0.0000, CAST(N'2022-06-03T17:01:44.180' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (19, 1003, 5, 30044, 0, 10, 600.0000, 540.0000, NULL, NULL, N'vbvbvb', NULL, NULL, NULL, NULL, CAST(N'2022-06-16T19:32:30.750' AS DateTime), 1)
INSERT [dbo].[Patient_LabTests] ([PatientLabTestID], [LabID], [LabTestID], [UserID], [AppointmentID], [DiscountPercentage], [LabTestPrice], [FinalAmount], [PaymentImage], [LabResultFileAttachment], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (20, 1004, 7, 30044, 0, 15, 525.0000, 446.2500, NULL, NULL, N'vbvbvb', NULL, NULL, NULL, NULL, CAST(N'2022-06-16T19:32:30.753' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Patient_LabTests] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_MedicineOrder] ON 

INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (1, N'SAP', NULL, 20030, NULL, 2416.0000, NULL, NULL, NULL, CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-04-30T13:21:15.350' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (2, N'SAP', NULL, 20032, NULL, 1208.0000, NULL, NULL, NULL, CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-04-30T17:34:14.063' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (3, N'SAP', NULL, 20050, NULL, 604.0000, NULL, NULL, NULL, CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-01T02:44:46.920' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (4, N'SAP', NULL, 20051, NULL, 604.0000, NULL, NULL, NULL, CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-02T08:58:56.640' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (5, N'SAP', N'2022051101313131310.jpg', 1, NULL, 604.0000, N'2022051101314431440.jpg', 1, CAST(N'2022-05-11T01:33:02.820' AS DateTime), CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:31:53.043' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (6, N'SAP', N'2022051101491549150.jpg', 1, NULL, 220.0000, N'2022051101492149210.jpg', 1, CAST(N'2022-05-11T02:00:18.780' AS DateTime), CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T01:49:25.660' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (7, N'SAP', N'2022051102215721570.jpg', 20051, NULL, 964.0000, N'2022051102221322130.jpg', 1, CAST(N'2022-05-11T02:29:04.077' AS DateTime), CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T02:22:16.133' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (8, N'SAP', N'2022051102264526450.png', 20051, NULL, 580.0000, N'2022051102265026500.jpg', 1, CAST(N'2022-05-11T02:28:32.410' AS DateTime), CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-11T02:26:54.070' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (9, N'SAP', N'202205140006386380.PNG', 20051, NULL, 964.0000, N'202205140006516510.PNG', NULL, NULL, CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-14T00:06:54.443' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (10, N'SAP', N'2022052218224422440.jpg', 20051, NULL, 1184.0000, N'2022052218225322530.jpg', 1, CAST(N'2022-05-22T18:42:58.683' AS DateTime), CAST(N'2022-06-03' AS Date), NULL, NULL, NULL, 0, 0.0000, CAST(N'2022-05-22T18:22:54.617' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (11, N'SAP', NULL, 30046, NULL, 55.0000, N'2022060317523052300.png', NULL, NULL, CAST(N'2022-06-03' AS Date), N'2', NULL, NULL, 0, 0.0000, CAST(N'2022-06-03T17:52:37.443' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (13, N'SAP', NULL, 30046, NULL, 55.0000, N'2022060318385938590.png', NULL, NULL, CAST(N'2022-06-03' AS Date), N'ewfwef wef wef wfefWE F WE FWe fwef eravg frg  eargag aerg eargearg egeragera gerag', NULL, NULL, 0, 0.0000, CAST(N'2022-06-03T18:39:00.757' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (14, N'SAP', NULL, 30044, NULL, 90.0000, NULL, NULL, NULL, CAST(N'2022-06-16' AS Date), N'111', NULL, NULL, NULL, NULL, CAST(N'2022-06-16T19:29:50.410' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (15, N'SAP', NULL, 30044, NULL, 143.0000, NULL, NULL, NULL, CAST(N'2022-06-16' AS Date), N'wewe', 1, N'123', 25, 0.0000, CAST(N'2022-06-16T19:30:58.437' AS DateTime), 1)
INSERT [dbo].[Patient_MedicineOrder] ([PatientMedicineOrderID], [OrderNumber], [PrescriptionImage], [UserID], [AppointmentID], [FinalAmount], [PaymentImage], [IsDelivered], [IsDeliveredDateTime], [OrderDate], [BillingAddress], [DiscountVoucherID], [VoucherTitle], [DiscountVoucherPercentage], [DiscountVoucherAmount], [AddedDateTime], [Status]) VALUES (16, N'SAP', NULL, 30044, NULL, 329.0000, NULL, NULL, NULL, CAST(N'2022-06-16' AS Date), N'dfgdfg', 1, N'123', 25, 0.0000, CAST(N'2022-06-16T20:06:14.440' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Patient_MedicineOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Medicines] ON 

INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (1, 1, 1, 4, 604.0000, 2416.0000, CAST(N'2022-04-30T13:21:15.363' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (2, 2, 1, 2, 604.0000, 1208.0000, CAST(N'2022-04-30T17:34:14.077' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (3, 3, 1, 1, 604.0000, 604.0000, CAST(N'2022-05-01T02:44:46.927' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (4, 4, 1, 1, 604.0000, 604.0000, CAST(N'2022-05-02T08:58:56.650' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10002, 5, 1, 1, 604.0000, 604.0000, CAST(N'2022-05-11T01:31:53.113' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10003, 6, 3, 1, 220.0000, 220.0000, CAST(N'2022-05-11T01:49:25.660' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10004, 7, 2, 1, 360.0000, 360.0000, CAST(N'2022-05-11T02:22:16.137' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10005, 7, 1, 1, 604.0000, 604.0000, CAST(N'2022-05-11T02:22:16.140' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10006, 8, 2, 1, 360.0000, 360.0000, CAST(N'2022-05-11T02:26:54.070' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10007, 8, 3, 1, 220.0000, 220.0000, CAST(N'2022-05-11T02:26:54.073' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10008, 9, 1, 1, 604.0000, 604.0000, CAST(N'2022-05-14T00:06:54.457' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10009, 9, 2, 1, 360.0000, 360.0000, CAST(N'2022-05-14T00:06:54.460' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10010, 10, 1, 1, 604.0000, 604.0000, CAST(N'2022-05-22T18:22:54.627' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10011, 10, 2, 1, 360.0000, 360.0000, CAST(N'2022-05-22T18:22:54.630' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10012, 10, 3, 1, 220.0000, 220.0000, CAST(N'2022-05-22T18:22:54.633' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10013, 11, 559, 1, 55.0000, 55.0000, CAST(N'2022-06-03T17:52:37.470' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10014, 13, 559, 1, 55.0000, 55.0000, CAST(N'2022-06-03T18:39:00.777' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10015, 14, 1544, 1, 90.0000, 90.0000, CAST(N'2022-06-16T19:29:51.243' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10016, 15, 2079, 1, 143.0000, 143.0000, CAST(N'2022-06-16T19:30:58.440' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10017, 16, 2080, 1, 48.0000, 48.0000, CAST(N'2022-06-16T20:06:14.443' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10018, 16, 1544, 1, 90.0000, 90.0000, CAST(N'2022-06-16T20:06:14.447' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10019, 16, 2080, 1, 48.0000, 48.0000, CAST(N'2022-06-16T20:06:14.450' AS DateTime), 1)
INSERT [dbo].[Patient_Medicines] ([PatientMedicineID], [PatientMedicineOrderID], [MedicineID], [Quantity], [UnitPrice], [TotalPrice], [AddedDateTime], [Status]) VALUES (10020, 16, 2079, 1, 143.0000, 143.0000, CAST(N'2022-06-16T20:06:14.450' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Patient_Medicines] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialities] ON 

INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (1, N'Physiotherapist', N'bone.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (2, N'Cardiology', N'heart.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (3, N'Urology', N'urology.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (4, N'Neurology', N'brain.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (5, N'Dental', N'dental.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (9, N'Diabetologist', N'specialty.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (10, N'Pulmonologist', N'specialty.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (11, N'Nephrologist', N'specialty.png', 1)
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityTitle], [DisplayPicture], [Status]) VALUES (12, N'Nutritionist', N'specialty.png', 1)
SET IDENTITY_INSERT [dbo].[Specialities] OFF
GO
SET IDENTITY_INSERT [dbo].[Team_TimeSlots] ON 

INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10017, 4, 1, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.497' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10018, 4, 2, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.497' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10019, 4, 3, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.500' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10020, 4, 4, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.503' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10021, 4, 5, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.507' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10022, 4, 6, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.510' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10023, 4, 0, CAST(N'18:00:00' AS Time), CAST(N'2022-05-22T18:46:02.510' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10024, 4, 1, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.513' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10025, 4, 2, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.517' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10026, 4, 3, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.517' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10027, 4, 4, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.520' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10028, 4, 5, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.523' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10029, 4, 6, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.527' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10030, 4, 0, CAST(N'18:30:00' AS Time), CAST(N'2022-05-22T18:46:02.533' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10038, 1005, 1, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.553' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10039, 1005, 2, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.557' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10040, 1005, 3, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.560' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10041, 1005, 4, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.560' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10042, 1005, 5, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.563' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10043, 1005, 6, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.567' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10044, 1005, 0, CAST(N'16:00:00' AS Time), CAST(N'2022-05-23T04:49:00.570' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10045, 1005, 1, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.570' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10046, 1005, 2, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.573' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10047, 1005, 3, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.577' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10048, 1005, 4, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.580' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10049, 1005, 5, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.580' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10050, 1005, 6, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.583' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10051, 1005, 0, CAST(N'16:30:00' AS Time), CAST(N'2022-05-23T04:49:00.587' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10052, 1005, 1, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.590' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10053, 1005, 2, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.593' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10054, 1005, 3, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.597' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10055, 1005, 4, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.600' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10056, 1005, 5, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.603' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10057, 1005, 6, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.607' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10058, 1005, 0, CAST(N'17:00:00' AS Time), CAST(N'2022-05-23T04:49:00.610' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10059, 1005, 1, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.613' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10060, 1005, 1, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.617' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10061, 1005, 1, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.620' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10062, 1005, 1, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.627' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10063, 1005, 1, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.630' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10064, 1005, 1, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.630' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10065, 1005, 2, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.633' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10066, 1005, 2, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.640' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10067, 1005, 2, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.640' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10068, 1005, 2, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.643' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10069, 1005, 2, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.647' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10070, 1005, 3, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.650' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10071, 1005, 3, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.657' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10072, 1005, 3, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.660' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10073, 1005, 3, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.663' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10074, 1005, 3, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.667' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10075, 1005, 4, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.670' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10076, 1005, 4, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.670' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10077, 1005, 4, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.673' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10078, 1005, 4, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.677' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10079, 1005, 4, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.677' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10080, 1005, 5, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.680' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10081, 1005, 5, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.680' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10082, 1005, 5, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.683' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10083, 1005, 5, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.687' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10084, 1005, 5, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.687' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10085, 1005, 6, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.690' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10086, 1005, 6, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.690' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10087, 1005, 6, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.693' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10088, 1005, 6, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.697' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10089, 1005, 6, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.700' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10090, 1005, 0, CAST(N'17:30:00' AS Time), CAST(N'2022-05-23T04:49:00.700' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10091, 1005, 0, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:49:00.703' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10092, 1005, 0, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:49:00.707' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10093, 1005, 0, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.707' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10094, 1005, 0, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:49:00.710' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10095, 1005, 0, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:49:00.713' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10096, 1006, 1, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.423' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10097, 1006, 1, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.423' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10098, 1006, 1, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.427' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10099, 1006, 1, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.430' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10100, 1006, 1, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.430' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10101, 1006, 1, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.430' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10102, 1006, 1, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.433' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10103, 1006, 1, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.437' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10104, 1006, 2, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.437' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10105, 1006, 2, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.440' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10106, 1006, 2, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.440' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10107, 1006, 2, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.440' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10108, 1006, 2, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.443' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10109, 1006, 2, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.447' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10110, 1006, 2, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.447' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10111, 1006, 2, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.450' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10112, 1006, 3, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.450' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10113, 1006, 3, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.453' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10114, 1006, 3, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.457' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10115, 1006, 3, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.457' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10116, 1006, 3, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.460' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10117, 1006, 3, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.463' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10118, 1006, 3, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.463' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10119, 1006, 3, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.467' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10120, 1006, 4, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.470' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10121, 1006, 4, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.473' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10122, 1006, 4, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.477' AS DateTime), 1)
GO
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10123, 1006, 4, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.477' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10124, 1006, 4, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.480' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10125, 1006, 4, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.483' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10126, 1006, 4, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.487' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10127, 1006, 4, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.487' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10128, 1006, 5, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.490' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10129, 1006, 5, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.490' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10130, 1006, 5, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.493' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10131, 1006, 5, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.497' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10132, 1006, 5, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.503' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10133, 1006, 5, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.507' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10134, 1006, 5, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.510' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10135, 1006, 5, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.513' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10136, 1006, 6, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.517' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10137, 1006, 6, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.520' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10138, 1006, 6, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.523' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10139, 1006, 6, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.527' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10140, 1006, 6, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.530' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10141, 1006, 6, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.533' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10142, 1006, 6, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.537' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10143, 1006, 6, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.540' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10144, 1006, 0, CAST(N'18:00:00' AS Time), CAST(N'2022-05-23T04:55:32.543' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10145, 1006, 0, CAST(N'18:30:00' AS Time), CAST(N'2022-05-23T04:55:32.550' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10146, 1006, 0, CAST(N'19:00:00' AS Time), CAST(N'2022-05-23T04:55:32.553' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10147, 1006, 0, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T04:55:32.557' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10148, 1006, 0, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T04:55:32.560' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10149, 1006, 0, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T04:55:32.563' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10150, 1006, 0, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T04:55:32.567' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10151, 1006, 0, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T04:55:32.570' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10152, 1007, 1, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.790' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10153, 1007, 1, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.790' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10154, 1007, 1, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.793' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10155, 1007, 1, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.797' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10156, 1007, 1, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.800' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10157, 1007, 1, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.800' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10158, 1007, 1, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.807' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10159, 1007, 2, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.810' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10160, 1007, 2, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.813' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10161, 1007, 2, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.817' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10162, 1007, 2, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.820' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10163, 1007, 2, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.823' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10164, 1007, 2, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.827' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10165, 1007, 2, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.830' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10166, 1007, 3, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.830' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10167, 1007, 3, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.833' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10168, 1007, 3, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.837' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10169, 1007, 3, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.837' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10170, 1007, 3, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.840' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10171, 1007, 3, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.840' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10172, 1007, 3, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.843' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10173, 1007, 4, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.843' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10174, 1007, 4, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.847' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10175, 1007, 4, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.850' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10176, 1007, 4, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.850' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10177, 1007, 4, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.853' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10178, 1007, 4, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.853' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10179, 1007, 4, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.857' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10180, 1007, 5, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.857' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10181, 1007, 5, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.860' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10182, 1007, 5, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.860' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10183, 1007, 5, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.860' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10184, 1007, 5, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.863' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10185, 1007, 5, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.863' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10186, 1007, 5, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.867' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10187, 1007, 6, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.870' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10188, 1007, 6, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.870' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10189, 1007, 6, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.870' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10190, 1007, 6, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.873' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10191, 1007, 6, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.873' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10192, 1007, 6, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.880' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10193, 1007, 6, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.883' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10194, 1007, 0, CAST(N'19:30:00' AS Time), CAST(N'2022-05-23T05:02:20.887' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10195, 1007, 0, CAST(N'20:00:00' AS Time), CAST(N'2022-05-23T05:02:20.890' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10196, 1007, 0, CAST(N'20:30:00' AS Time), CAST(N'2022-05-23T05:02:20.893' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10197, 1007, 0, CAST(N'21:00:00' AS Time), CAST(N'2022-05-23T05:02:20.893' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10198, 1007, 0, CAST(N'21:30:00' AS Time), CAST(N'2022-05-23T05:02:20.897' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10199, 1007, 0, CAST(N'22:00:00' AS Time), CAST(N'2022-05-23T05:02:20.900' AS DateTime), 1)
INSERT [dbo].[Team_TimeSlots] ([TeamTimeSlotID], [TeamID], [DayNumber], [TimeSlot], [AddedDateTime], [Status]) VALUES (10200, 1007, 0, CAST(N'22:30:00' AS Time), CAST(N'2022-05-23T05:02:20.903' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Team_TimeSlots] OFF
GO
SET IDENTITY_INSERT [dbo].[TeamMembers] ON 

INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (1, 1, 2, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (2, 1, 3, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (3, 1, 10002, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (4, 2, 20011, CAST(N'2022-04-30T14:21:13.453' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (5, 2, 20021, CAST(N'2022-04-30T14:21:13.457' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (6, 2, 20027, CAST(N'2022-04-30T14:21:13.460' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10, 4, 20052, CAST(N'2022-05-02T10:41:55.863' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (11, 4, 20053, CAST(N'2022-05-02T10:41:55.867' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (12, 4, 20054, CAST(N'2022-05-02T10:41:55.870' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10013, 1005, 30043, CAST(N'2022-05-23T04:49:00.717' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10014, 1005, 30039, CAST(N'2022-05-23T04:49:00.720' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10015, 1005, 30040, CAST(N'2022-05-23T04:49:00.723' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10016, 1006, 30044, CAST(N'2022-05-23T04:55:32.573' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10017, 1006, 30037, CAST(N'2022-05-23T04:55:32.580' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10018, 1006, 30040, CAST(N'2022-05-23T04:55:32.580' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10019, 1007, 30042, CAST(N'2022-05-23T05:02:20.903' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10020, 1007, 30045, CAST(N'2022-05-23T05:02:20.907' AS DateTime), 1)
INSERT [dbo].[TeamMembers] ([TeamMemberID], [TeamID], [UserID], [AddedDateTime], [Status]) VALUES (10021, 1007, 30040, CAST(N'2022-05-23T05:02:20.910' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TeamMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([TeamID], [TeamTitle], [SpecialityID], [SessionCharges], [AddedDateTime], [Status]) VALUES (2, N'', 2, 1500.0000, CAST(N'2022-04-30T14:21:13.433' AS DateTime), 1)
INSERT [dbo].[Teams] ([TeamID], [TeamTitle], [SpecialityID], [SessionCharges], [AddedDateTime], [Status]) VALUES (4, N'', 2, 1500.0000, CAST(N'2022-05-02T10:41:55.810' AS DateTime), 1)
INSERT [dbo].[Teams] ([TeamID], [TeamTitle], [SpecialityID], [SessionCharges], [AddedDateTime], [Status]) VALUES (1005, N'', 2, 1999.0000, CAST(N'2022-05-23T04:49:00.530' AS DateTime), 1)
INSERT [dbo].[Teams] ([TeamID], [TeamTitle], [SpecialityID], [SessionCharges], [AddedDateTime], [Status]) VALUES (1006, N'', 2, 1999.0000, CAST(N'2022-05-23T04:55:32.420' AS DateTime), 1)
INSERT [dbo].[Teams] ([TeamID], [TeamTitle], [SpecialityID], [SessionCharges], [AddedDateTime], [Status]) VALUES (1007, N'', 9, 1999.0000, CAST(N'2022-05-23T05:02:20.787' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (1, N'Super Admin', 1, NULL, NULL, NULL, N'DefaultPicture.jpg', N'03354461507', N'husnain', NULL, NULL, CAST(N'2022-04-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20010, N'M. Raas Masood', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'03153194477', N'123', NULL, NULL, CAST(N'2022-04-29T21:12:28.123' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20030, N'HUSNAIN ALI TARIQ', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'03001234567', N'husnain', NULL, NULL, CAST(N'2022-04-30T13:21:14.950' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20031, N'husnain', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', NULL, N'husnain', NULL, NULL, CAST(N'2022-04-30T14:22:39.227' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20032, N'M. Raas Masood', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'4444', N'4444', NULL, NULL, CAST(N'2022-04-30T17:34:12.273' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20033, N'Imran', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'Imran', N'123', NULL, NULL, CAST(N'2022-05-01T00:23:36.943' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20034, N'AAAAA', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'BBBBB', N'123', NULL, NULL, CAST(N'2022-05-01T00:27:52.247' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20035, N'GGGGG', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'GGGG', N'123', NULL, NULL, CAST(N'2022-05-01T00:35:15.290' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20036, N'HHHH', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'3333', N'123', NULL, NULL, CAST(N'2022-05-01T00:38:02.200' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20037, N'OOOO', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'23232', N'123', NULL, NULL, CAST(N'2022-05-01T00:39:27.410' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20038, N'www', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'111', N'11', NULL, NULL, CAST(N'2022-05-01T00:41:12.110' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20039, N'qqq', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'222', N'222', NULL, NULL, CAST(N'2022-05-01T00:44:19.957' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20040, N'd', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'd', N'3', NULL, NULL, CAST(N'2022-05-01T00:49:25.870' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20041, N'aa', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'12', N'12', NULL, NULL, CAST(N'2022-05-01T00:54:33.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20042, N'q', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'1', N'1', NULL, NULL, CAST(N'2022-05-01T00:58:26.477' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20043, N'j', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'3', N'j', NULL, NULL, CAST(N'2022-05-01T01:01:54.183' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20044, N'PPP', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'11111', N'111', NULL, NULL, CAST(N'2022-05-01T01:05:48.680' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20045, N'sdsd', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'123', N'123', NULL, NULL, CAST(N'2022-05-01T01:07:44.440' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20046, N'abc', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'123123', N'123', NULL, NULL, CAST(N'2022-05-01T01:10:07.833' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20047, N'a123', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'121212122', N'12121212', NULL, NULL, CAST(N'2022-05-01T01:13:34.360' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20048, N'Usama', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'1212121', N'123', NULL, NULL, CAST(N'2022-05-01T01:14:28.677' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20049, N'usman123', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'1234', N'1234', NULL, NULL, CAST(N'2022-05-01T01:17:45.167' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20050, N'Husnain', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'03246228527', N'1234567', NULL, NULL, CAST(N'2022-05-01T02:44:46.583' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20051, N'ahmad nawaz', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'03061234567', N'password', NULL, NULL, CAST(N'2022-05-02T08:52:07.563' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20052, N'Dr.Allen', 2, 2, N'12', NULL, N'2022050210305030500.jpg', N'3064461507', N'Allen009', NULL, NULL, CAST(N'2022-05-02T10:30:50.967' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20053, N'Pharmacist Mehak', 4, 2, N'09', NULL, N'2022050210341034100.jpg', N'3091234567', N'Mehak009', NULL, NULL, CAST(N'2022-05-02T10:34:10.587' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (20054, N'Nutritionist Natalie', 3, 2, N'07', NULL, N'202205021038033830.jpg', N'3004461507', N'julie', NULL, NULL, CAST(N'2022-05-02T10:38:03.570' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30033, N'Dr. Mary', 2, 9, N'10', NULL, N'DefaultPicture.jpg', N'3350987654', N'mary009', NULL, NULL, CAST(N'2022-05-13T23:55:39.800' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30035, N'Julia', 3, 9, N'15', NULL, N'DefaultPicture.jpg', N'3081234567', N'julia009', N'null', N'edu2', CAST(N'2022-05-13T23:56:49.793' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30037, N'Pharmacist Nabeel Akhtar', 4, 2, N'Hospital Pharmacist at Major Shabir Shareef Hospit', NULL, N'2022052301351935190.jpg', N'090909', N'090909', NULL, NULL, CAST(N'2022-05-23T01:35:26.837' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30039, N'Pharmacist Anam Sadaqat', 4, 2, N'Diabetes Educator, Hospital Pharmacist Internee at', NULL, N'2022052301414141410.jpg', N'3239052765', N'Dr201614', NULL, NULL, CAST(N'2022-05-23T01:41:42.080' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30040, N'Nutritionist Rimsha Shahid', 3, 2, N'Chronic Disease Management of Diabetes Mellitus, H', NULL, N'202205230216061660.jpg', N'3263230473', N'RIMSHA@1234', N'null', N'edu', CAST(N'2022-05-23T02:16:07.030' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30042, N'Diabetologist Erfan Aslam', 2, 9, N'Family Medicine', NULL, N'2022052302293829380.jpeg', N'3007575391', N'ERFAN123@@', NULL, NULL, CAST(N'2022-05-23T02:29:39.250' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30043, N'Cardiologist Bilal Ahmad', 2, 2, N'Cardiologist at Mayo Hospital', NULL, N'2022052302315831580.jpg', N'3350422966', N'anything123', NULL, NULL, CAST(N'2022-05-23T02:31:58.567' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30044, N'Cardiologist Ahsen Gilani', 2, 2, N'REGISTRAR CARDIOLOGIST in FAMILY CARE TERTIARY HOS', NULL, N'2022052304504850480.jpg', N'121212', N'121212', NULL, NULL, CAST(N'2022-05-23T04:50:49.560' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30045, N'Pharmacist Ansa Abdul Razaq', 4, 9, N'Community Pharmacist at Servaid Pharmacy, Patient ', NULL, N'2022052304571757170.jpg', N'3002731476', N'AnsaRph@2910', N'null', N'ph4', CAST(N'2022-05-23T04:57:20.160' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30046, N'2', 5, NULL, N'null', NULL, N'DefaultPicture.jpg', N'2', N'2', N'ewfwef wef wef wfefWE F WE FWe fwef eravg frg  eargag aerg eargearg egeragera gerag', N'null', CAST(N'2022-06-03T15:56:31.387' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30047, N'TTT', 2, 1, N'2323', NULL, N'DefaultPicture.jpg', N'2323232', N'0987654321', N'null', N'EDDD', CAST(N'2022-06-03T17:04:52.327' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30048, N'fgfgfg', 2, 1, N'234234', NULL, N'DefaultPicture.jpg', N'234234', N'sdfsfsdf', N'null', N'ED', CAST(N'2022-06-03T17:05:22.770' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30049, N'vvvv', 2, 2, N'234', NULL, N'DefaultPicture.jpg', N'2334234', N'234234234', N'null', N'hhhhhh', CAST(N'2022-06-03T17:06:08.583' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30050, N'11', 3, 1, N'11', NULL, N'DefaultPicture.jpg', N'11', N'1111', N'null', N'edu55', CAST(N'2022-06-03T17:26:22.293' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Name], [UserTypeID], [SpecialityID], [Experience], [SatisfactionPercentage], [DisplayPicture], [MobileNumber], [Password], [ResidentialAddress], [Education], [AddedDateTime], [Status]) VALUES (30051, N'212', 5, NULL, N'null', NULL, N'2022061018191619160.png', N'212', N'212', N'212', N'null', CAST(N'2022-06-10T18:01:32.817' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeID], [UserType], [Status]) VALUES (1, N'Super Admin', 1)
INSERT [dbo].[UserTypes] ([UserTypeID], [UserType], [Status]) VALUES (2, N'Doctor', 1)
INSERT [dbo].[UserTypes] ([UserTypeID], [UserType], [Status]) VALUES (3, N'Nutritionist', 1)
INSERT [dbo].[UserTypes] ([UserTypeID], [UserType], [Status]) VALUES (4, N'Pharmacist', 1)
INSERT [dbo].[UserTypes] ([UserTypeID], [UserType], [Status]) VALUES (5, N'Patient', 1)
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[DiscountVouchers] ADD  CONSTRAINT [DF_DiscountVouchers_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[DiscountVouchers] ADD  CONSTRAINT [DF_DiscountVouchers_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[DiscountVouchers] ADD  CONSTRAINT [DF_DiscountVouchers_IsLabApplicable]  DEFAULT ((0)) FOR [IsLabApplicable]
GO
ALTER TABLE [dbo].[DiscountVouchers] ADD  CONSTRAINT [DF_Table_1_IsLabApplicable1]  DEFAULT ((0)) FOR [IsMedicineApplicable]
GO
ALTER TABLE [dbo].[DiscountVouchers] ADD  CONSTRAINT [DF_Table_1_IsMedicineApplicable1]  DEFAULT ((0)) FOR [IsAppointmentApplicable]
GO
ALTER TABLE [dbo].[DiscountVouchers] ADD  CONSTRAINT [DF_DiscountVouchers_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[Patient_Appointments] ADD  CONSTRAINT [DF_Patient_Appointments_DiscountVoucherPercentage1]  DEFAULT ((0)) FOR [VoucherTitle]
GO
ALTER TABLE [dbo].[Patient_Appointments] ADD  CONSTRAINT [DF_Patient_Appointments_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountVoucherPercentage]
GO
ALTER TABLE [dbo].[Patient_Appointments] ADD  CONSTRAINT [DF_Patient_Appointments_DiscountAmount]  DEFAULT ((0)) FOR [DiscountVoucherAmount]
GO
ALTER TABLE [dbo].[Patient_LabTests] ADD  CONSTRAINT [DF_Patient_LabTests_DiscountPercentage1]  DEFAULT ((0)) FOR [DiscountVoucherPercentage]
GO
ALTER TABLE [dbo].[Patient_LabTests] ADD  CONSTRAINT [DF_Patient_LabTests_DiscountAmount]  DEFAULT ((0)) FOR [DiscountVoucherAmount]
GO
ALTER TABLE [dbo].[Patient_MedicineOrder] ADD  CONSTRAINT [DF_Patient_MedicineOrder_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountVoucherPercentage]
GO
ALTER TABLE [dbo].[Patient_MedicineOrder] ADD  CONSTRAINT [DF_Patient_MedicineOrder_DiscountAmount]  DEFAULT ((0)) FOR [DiscountVoucherAmount]
GO
ALTER TABLE [dbo].[RatingAndReviews] ADD  CONSTRAINT [DF_RatingAndReviews_Rating]  DEFAULT ((0)) FOR [Rating]
GO
/****** Object:  StoredProcedure [dbo].[_HELPER_PROCEDURE_CLEAN_DB]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[_HELPER_PROCEDURE_CLEAN_DB]

AS

DELETE FROM Appointment_Proceedings
DELETE FROM DiscountVouchers
DELETE FROM Patient_Appointments
DELETE FROM Patient_LabTests
DELETE FROM Patient_MedicineOrder
DELETE FROM Patient_Medicines
DELETE FROM RatingAndReviews
DELETE FROM Team_TimeSlots
DELETE FROM Teams
DELETE FROM Users


--Reset Primary Keys

DBCC CHECKIDENT ('Appointment_Proceedings', RESEED, 1)
DBCC CHECKIDENT ('DiscountVouchers', RESEED, 1)
DBCC CHECKIDENT ('Patient_Appointments', RESEED, 1)
DBCC CHECKIDENT ('Patient_LabTests', RESEED, 1)
DBCC CHECKIDENT ('Patient_MedicineOrder', RESEED, 1)
DBCC CHECKIDENT ('Patient_Medicines', RESEED, 1)
DBCC CHECKIDENT ('RatingAndReviews', RESEED, 1)
DBCC CHECKIDENT ('Team_TimeSlots', RESEED, 1)
DBCC CHECKIDENT ('Teams', RESEED, 1)
DBCC CHECKIDENT ('Users', RESEED, 1)

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_DISCOUNT_VOUCHERS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_DISCOUNT_VOUCHERS]

@DiscountVoucherID	int,
@VoucherTitle	varchar(100),
@VoucherCode	varchar(50),
@VoucherDecription	nvarchar(MAX),
@VoucherImage	nvarchar(MAX),
@DiscountPercentage	float,
@DiscountAmount	money,
@IsLabApplicable	bit,
@IsMedicineApplicable	bit,
@IsAppointmentApplicable	bit,
@IsEnabled	bit,
@Status	bit

AS

IF(@VoucherImage = '' OR @VoucherImage = 'null' OR @VoucherImage = 'undefined')
BEGIN
	SET @VoucherImage = 'voucher.png'
END

IF(@VoucherDecription = '' OR @VoucherDecription = 'null' OR @VoucherDecription = 'undefined')
BEGIN
	SET @VoucherDecription = NULL
END

IF(@DiscountVoucherID IS NULL OR @DiscountVoucherID = 0)
BEGIN
	INSERT INTO DiscountVouchers(VoucherTitle, VoucherCode, VoucherDecription, VoucherImage, DiscountPercentage, DiscountAmount, IsLabApplicable, IsMedicineApplicable, 
									IsAppointmentApplicable, IsEnabled, AddedDateTime, Status)
	VALUES(@VoucherTitle, @VoucherCode, @VoucherDecription, @VoucherImage, @DiscountPercentage, @DiscountAmount, @IsLabApplicable, @IsMedicineApplicable, 
									@IsAppointmentApplicable, @IsEnabled, GETDATE(), 1)

	SET @DiscountVoucherID = CAST(SCOPE_IDENTITY() AS INT) 
END
ELSE
BEGIN
	UPDATE DiscountVouchers 

	SET VoucherTitle			= @VoucherTitle,
		VoucherCode				= @VoucherCode,
		VoucherDecription		= @VoucherDecription,
		VoucherImage			= @VoucherImage,
		DiscountPercentage		= @DiscountPercentage,
		DiscountAmount			= @DiscountAmount,
		IsLabApplicable			= @IsLabApplicable,
		IsMedicineApplicable	= @IsMedicineApplicable,
		IsAppointmentApplicable	= @IsAppointmentApplicable,
		IsEnabled				= @IsEnabled,
		Status					= @Status					

	WHERE DiscountVoucherID = @DiscountVoucherID
END

SELECT @DiscountVoucherID AS DiscountVoucherID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_LAB_TESTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_LAB_TESTS]

@LabTestID	int,
@LabTestTitle	nvarchar(500),
@LabTestPrice	money,
@Status	bit

AS

IF(@LabTestID IS NULL OR @LabTestID = 0)
BEGIN
	INSERT INTO LabTests(LabTestTitle, LabTestPrice, AddedDateTime, Status)
	VALUES(@LabTestTitle, @LabTestPrice, GETDATE(), 1)

	SET @LabTestID = CAST(SCOPE_IDENTITY() AS INT) 
END
ELSE
BEGIN
	UPDATE LabTests 

	SET LabTestTitle = @LabTestTitle,
		LabTestPrice = @LabTestPrice,
		Status = @Status

	WHERE LabTestID = @LabTestID
END

SELECT @LabTestID AS LabTestID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_LABS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_LABS]

@LabID	int,
@LabTitle	varchar(200),
@DisplayPicture	nvarchar(MAX),
@DiscountPercentage	float,
@Status	bit

AS

IF (@DisplayPicture = '' OR @DisplayPicture IS NULL OR @DisplayPicture = 'null' OR @DisplayPicture = 'undefined')
BEGIN
	SET @DisplayPicture = 'labs.jpg'
END

IF(@LabID IS NULL OR @LabID = 0)
BEGIN
	INSERT INTO Labs(LabTitle, DisplayPicture, DiscountPercentage, AddedDateTime, Status)
	VALUES(@LabTitle, @DisplayPicture, @DiscountPercentage, GETDATE(), 1)

	SET @LabID = CAST(SCOPE_IDENTITY() AS INT) 
END
ELSE
BEGIN
	UPDATE Labs 

	SET LabTitle = @LabTitle,
		DisplayPicture = @DisplayPicture,
		DiscountPercentage = @DiscountPercentage,
		Status = @Status

	WHERE LabID = @LabID
END

SELECT @LabID AS LabID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_MEDICINES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_MEDICINES]

@MedicineID	int,
@MedicineTitle	nvarchar(200),
@DisplayPicture	nvarchar(MAX),
@Price	money,
@Status	bit

AS

IF (@DisplayPicture = '' OR @DisplayPicture IS NULL OR @DisplayPicture = 'null' OR @DisplayPicture = 'undefined')
BEGIN
	SET @DisplayPicture = 'medicine.png'
END

IF(@MedicineID IS NULL OR @MedicineID = 0)
BEGIN
	INSERT INTO Medicines(MedicineTitle, DisplayPicture, Price, AddedDateTime, Status)
	VALUES(@MedicineTitle, @DisplayPicture, @Price, GETDATE(), 1)

	SET @MedicineID = CAST(SCOPE_IDENTITY() AS INT) 
END
ELSE
BEGIN
	UPDATE Medicines 

	SET MedicineTitle = @MedicineTitle,
		DisplayPicture = @DisplayPicture,
		Price = @Price,
		Status = @Status

	WHERE MedicineID = @MedicineID
END

SELECT @MedicineID AS MedicineID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_PATIENT_APPOINTMENT_PROCEEDINGS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_PATIENT_APPOINTMENT_PROCEEDINGS]

@AppointmentProceedingID	bigint,
@AppointmentID	bigint,
@UserID	bigint,
@SenderUserTypeID	int,
@ReceiverUserTypeID	int,
@AttachmentFileName	nvarchar(MAX),
@Comment	nvarchar(MAX),
@Status	bit

AS

IF(@AttachmentFileName = '' OR @AttachmentFileName = 'null' OR @AttachmentFileName = 'undefined')
BEGIN
	SET @AttachmentFileName = NULL
END

IF(@Comment = '' OR @Comment = 'null' OR @Comment = 'undefined')
BEGIN
	SET @Comment = NULL
END

IF(@AppointmentProceedingID IS NULL OR @AppointmentProceedingID = 0)
BEGIN
	INSERT INTO Appointment_Proceedings(AppointmentID, UserID, SenderUserTypeID, ReceiverUserTypeID, AttachmentFileName, Comment, AddedDateTime, Status)
	VALUES(@AppointmentID, @UserID, @SenderUserTypeID, @ReceiverUserTypeID, @AttachmentFileName, @Comment, GETDATE(), 1)

	SET @AppointmentProceedingID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE Appointment_Proceedings 

	SET Comment = @Comment,
		Status = @Status

	WHERE AppointmentProceedingID = @AppointmentProceedingID
END

SELECT @AppointmentProceedingID AS AppointmentProceedingID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_PATIENT_APPOINTMENTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_PATIENT_APPOINTMENTS]

@AppointmentID	bigint,
@UserID	bigint,
@TeamID	int,
@SessionCharges	money,
@SessionStartDate	date,
@SessionStartTime	time(7),
@TeamTimeSlotID	int,
@IsSessionEnded	bit,
@SessionEndDatetime	datetime,
@PaymentImage	nvarchar(MAX),
@BillingAddress	nvarchar(MAX),
@DiscountVoucherID	int,
@VoucherTitle	varchar(100),
@DiscountVoucherPercentage	float,
@DiscountVoucherAmount	money,
@FinalAmount	money,
@Status	bit

AS

IF (@PaymentImage = '' OR @PaymentImage IS NULL OR @PaymentImage = 'null' OR @PaymentImage = 'undefined')
BEGIN
	SET @PaymentImage = NULL
END

IF(@AppointmentID IS NULL OR @AppointmentID = 0)
BEGIN
	INSERT INTO Patient_Appointments(UserID, TeamID, SessionCharges, SessionStartDate, SessionStartTime, TeamTimeSlotID, PaymentImage, BillingAddress, DiscountVoucherID,
									VoucherTitle, DiscountVoucherPercentage, DiscountVoucherAmount, FinalAmount, AddedDateTime, Status)
	VALUES(@UserID, @TeamID, @SessionCharges, @SessionStartDate, @SessionStartTime, @TeamTimeSlotID, @PaymentImage, @BillingAddress, @DiscountVoucherID,
									@VoucherTitle, @DiscountVoucherPercentage, @DiscountVoucherAmount, @FinalAmount, GETDATE(), 1)

	SET @AppointmentID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE Patient_Appointments 

	SET SessionCharges = @SessionCharges,
		SessionStartDate = @SessionStartDate,
		SessionStartTime = @SessionStartTime,
		IsSessionEnded = @IsSessionEnded,
		SessionEndDatetime = @SessionEndDatetime,
		TeamTimeSlotID = @TeamTimeSlotID,
		PaymentImage = @PaymentImage,
		FinalAmount = @FinalAmount,
		Status = @Status

	WHERE AppointmentID = @AppointmentID

	IF(@Status = 0)
	BEGIN
		UPDATE Appointment_Proceedings

		SET Status = @Status

		WHERE AppointmentID = @AppointmentID
	END
END

SELECT @AppointmentID AS AppointmentID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_PATIENT_LAB_TESTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_PATIENT_LAB_TESTS]

@PatientLabTestID	bigint,
@LabID	int,
@LabTestID	int,
@UserID	bigint,
@AppointmentID	bigint,
@DiscountPercentage	float,
@LabTestPrice	money,
@FinalAmount	money,
@LabResultFileAttachment	nvarchar(MAX),
@PaymentImage	nvarchar(MAX),
@BillingAddress	nvarchar(MAX),
@DiscountVoucherID	int,
@VoucherTitle	varchar(100),
@DiscountVoucherPercentage	float,
@DiscountVoucherAmount	money,
@Status	bit

AS

IF (@PaymentImage = '' OR @PaymentImage IS NULL OR @PaymentImage = 'null' OR @PaymentImage = 'undefined')
BEGIN
	SET @PaymentImage = NULL
END

IF(@PatientLabTestID IS NULL OR @PatientLabTestID = 0)
BEGIN
	INSERT INTO Patient_LabTests(LabID, LabTestID, UserID, AppointmentID, DiscountPercentage, LabTestPrice, FinalAmount, PaymentImage, BillingAddress, DiscountVoucherID,
									VoucherTitle, DiscountVoucherPercentage, DiscountVoucherAmount, AddedDateTime, Status)
	VALUES(@LabID, @LabTestID, @UserID, @AppointmentID, @DiscountPercentage, @LabTestPrice, @FinalAmount, @PaymentImage, @BillingAddress, @DiscountVoucherID,
									@VoucherTitle, @DiscountVoucherPercentage, @DiscountVoucherAmount, GETDATE(), 1)

	SET @PatientLabTestID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE Patient_LabTests 

	SET LabResultFileAttachment = @LabResultFileAttachment,
		Status = @Status

	WHERE PatientLabTestID = @PatientLabTestID
END

SELECT @PatientLabTestID AS PatientLabTestID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_PATIENT_MEDICINE_ORDER]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_PATIENT_MEDICINE_ORDER]

@PatientMedicineOrderID	bigint,
@OrderNumber	varchar(50),
@PrescriptionImage	nvarchar(MAX),
@UserID	bigint,
@AppointmentID	bigint,
@FinalAmount	money,
@PaymentImage	nvarchar(MAX),
@BillingAddress	nvarchar(MAX),
@OrderDate date,
@DiscountVoucherID	int,
@VoucherTitle	varchar(100),
@DiscountVoucherPercentage	float,
@DiscountVoucherAmount	money,
@Status	bit

AS

IF (@PrescriptionImage = '' OR @PrescriptionImage IS NULL OR @PrescriptionImage = 'null' OR @PrescriptionImage = 'undefined')
BEGIN
	SET @PrescriptionImage = NULL
END

IF (@PaymentImage = '' OR @PaymentImage IS NULL OR @PaymentImage = 'null' OR @PaymentImage = 'undefined')
BEGIN
	SET @PaymentImage = NULL
END

IF(@PatientMedicineOrderID IS NULL OR @PatientMedicineOrderID = 0)
BEGIN
	INSERT INTO Patient_MedicineOrder(OrderNumber, UserID, AppointmentID, FinalAmount, PrescriptionImage, PaymentImage, BillingAddress, OrderDate, DiscountVoucherID,
									VoucherTitle, DiscountVoucherPercentage, DiscountVoucherAmount, AddedDateTime, Status)
	VALUES(@OrderNumber, @UserID, @AppointmentID, @FinalAmount, @PrescriptionImage, @PaymentImage, @BillingAddress, @OrderDate, @DiscountVoucherID,
									@VoucherTitle, @DiscountVoucherPercentage, @DiscountVoucherAmount, GETDATE(), 1)

	SET @PatientMedicineOrderID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE Patient_MedicineOrder 

	SET FinalAmount = @FinalAmount,
		Status = @Status

	WHERE PatientMedicineOrderID = @PatientMedicineOrderID

	IF(@Status = 0)
	BEGIN
		UPDATE Patient_Medicines

		SET Status = @Status

		WHERE PatientMedicineOrderID = @PatientMedicineOrderID
	END
END

SELECT @PatientMedicineOrderID AS PatientMedicineOrderID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_PATIENT_MEDICINE_ORDER_DETAILS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_PATIENT_MEDICINE_ORDER_DETAILS]

@PatientMedicineID	bigint,
@PatientMedicineOrderID	bigint,
@MedicineID	int,
@Quantity	int,
@UnitPrice	money,
@TotalPrice	money,
@Status	bit

AS

IF(@PatientMedicineID IS NULL OR @PatientMedicineID = 0)
BEGIN
	INSERT INTO Patient_Medicines(PatientMedicineOrderID, MedicineID, Quantity, UnitPrice, TotalPrice, AddedDateTime, Status)
	VALUES(@PatientMedicineOrderID, @MedicineID, @Quantity, @UnitPrice, @TotalPrice, GETDATE(), 1)

	SET @PatientMedicineID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE Patient_Medicines

	SET UnitPrice = @UnitPrice,
		TotalPrice = @TotalPrice,
		Quantity = @Quantity,
		Status = @Status

	WHERE PatientMedicineID = @PatientMedicineID


	UPDATE Patient_MedicineOrder 

	SET OrderNumber = CONCAT('SAP-', @PatientMedicineOrderID)

	WHERE PatientMedicineOrderID = @PatientMedicineOrderID
END

SELECT @PatientMedicineID AS PatientMedicineID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_RATING_AND_REVIEW]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_RATING_AND_REVIEW]

@RatingReviewID	bigint,
@Rating	int,
@ReviewStatement	nvarchar(1000),
@UserID	bigint,
@TeamID	int,
@Status	bit
	
AS

IF (@ReviewStatement = '' OR @ReviewStatement IS NULL OR @ReviewStatement = 'null' OR @ReviewStatement = 'undefined')
BEGIN
	SET @ReviewStatement = null
END

IF(@RatingReviewID IS NULL OR @RatingReviewID = 0)
BEGIN
	INSERT INTO RatingAndReviews(Rating, ReviewStatement, UserID, TeamID, AddedDateTime, Status)
	VALUES(@Rating, @ReviewStatement, @UserID, @TeamID, GETDATE(), 1)

	SET @RatingReviewID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE RatingAndReviews 

	SET Rating = @Rating,
		ReviewStatement = @ReviewStatement,
		Status = @Status

	WHERE RatingReviewID = @RatingReviewID
END

SELECT @RatingReviewID AS RatingReviewID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_SPECIALITIES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ADD_OR_UPDATE_SPECIALITIES]

@SpecialityID	int,
@SpecialityTitle	varchar(500),
@DisplayPicture	nvarchar(MAX),
@Status	bit

AS

IF (@DisplayPicture = '' OR @DisplayPicture IS NULL OR @DisplayPicture = 'null' OR @DisplayPicture = 'undefined')
BEGIN
	SET @DisplayPicture = 'specialty.png'
END

IF(@SpecialityID IS NULL OR @SpecialityID = 0)
BEGIN
	INSERT INTO Specialities(SpecialityTitle, DisplayPicture, Status)
	VALUES(@SpecialityTitle, @DisplayPicture, 1)

	SET @SpecialityID = CAST(SCOPE_IDENTITY() AS INT) 
END
ELSE
BEGIN
	UPDATE Specialities 

	SET SpecialityTitle = @SpecialityTitle,
		DisplayPicture = @DisplayPicture,
		Status = @Status

	WHERE SpecialityID = @SpecialityID
END

SELECT @SpecialityID AS SpecialityID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_TEAM_MEMBERS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_TEAM_MEMBERS]

@TeamMemberID	bigint,
@TeamID	int,
@UserID	bigint,
@Status	bit

AS

IF(@TeamMemberID IS NULL OR @TeamMemberID = 0)
BEGIN
	INSERT INTO TeamMembers(TeamID, UserID, AddedDateTime, Status)
	VALUES(@TeamID, @UserID, GETDATE(), 1)

	SET @TeamMemberID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE TeamMembers 

	SET Status = @Status

	WHERE TeamMemberID = @TeamMemberID
END

SELECT @TeamMemberID AS TeamMemberID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_TEAM_TIME_SLOTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_TEAM_TIME_SLOTS]

@TeamTimeSlotID	bigint,
@TeamID	int,
@DayNumber	int,
@TimeSlot	time(7),
@Status	bit

AS

IF(@TeamTimeSlotID IS NULL OR @TeamTimeSlotID = 0)
BEGIN
	INSERT INTO Team_TimeSlots(TeamID, DayNumber, TimeSlot, AddedDateTime, Status)
	VALUES(@TeamID, @DayNumber, @TimeSlot, GETDATE(), 1)

	SET @TeamTimeSlotID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE
BEGIN
	UPDATE Team_TimeSlots 

	SET TimeSlot = @TimeSlot,
		DayNumber = @DayNumber,
		Status = @Status

	WHERE TeamTimeSlotID = @TeamTimeSlotID
END

SELECT @TeamTimeSlotID AS TeamTimeSlotID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_TEAMS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_TEAMS]

@TeamID	int,
@TeamTitle varchar(100),
@SpecialityID	int,
@SessionCharges	money,
@Status	bit

AS

IF(@TeamID IS NULL OR @TeamID = 0)
BEGIN
	INSERT INTO Teams(SpecialityID, TeamTitle, SessionCharges, AddedDateTime, Status)
	VALUES(@SpecialityID, @TeamTitle, @SessionCharges, GETDATE(), 1)

	SET @TeamID = CAST(SCOPE_IDENTITY() AS INT) 
END
ELSE
BEGIN
	UPDATE Teams 

	SET SpecialityID = @SpecialityID,
		TeamTitle = @TeamTitle,
		SessionCharges = @SessionCharges,
		Status = @Status

	WHERE TeamID = @TeamID

	IF(@Status = 0)
	BEGIN
		UPDATE TeamMembers

		SET Status = @Status

		WHERE TeamID = @TeamID


		UPDATE Team_TimeSlots

		SET Status = @Status

		WHERE TeamID = @TeamID
	END
END

SELECT @TeamID AS TeamID

GO
/****** Object:  StoredProcedure [dbo].[ADD_OR_UPDATE_USERS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_OR_UPDATE_USERS]

@UserID	bigint,
@Name	varchar(200),
@UserTypeID	int,
@SpecialityID	int,
@Experience	varchar(50),
@SatisfactionPercentage	float,
@DisplayPicture	nvarchar(MAX),
@MobileNumber	varchar(50),
@Password	varchar(50),
@Status	bit,
@ResidentialAddress	nvarchar(MAX),
@Education	nvarchar(MAX)

AS

IF (@DisplayPicture = '' OR @DisplayPicture IS NULL OR @DisplayPicture = 'null' OR @DisplayPicture = 'undefined')
BEGIN
	SET @DisplayPicture = 'DefaultPicture.jpg'
END

DECLARE @UserCount int
SET @UserCount = (SELECT COUNT(u.UserID) FROM Users u WHERE u.MobileNumber = @MobileNumber AND u.Status = 1)

IF(@UserCount = 0 AND (@UserID IS NULL OR @UserID = 0))
BEGIN
	INSERT INTO Users(Name, UserTypeID, SpecialityID, Experience, SatisfactionPercentage, DisplayPicture, MobileNumber, Password, ResidentialAddress, Education, AddedDateTime, Status)
	VALUES(@Name, @UserTypeID, @SpecialityID, @Experience, @SatisfactionPercentage, @DisplayPicture, @MobileNumber, @Password, @ResidentialAddress, @Education, GETDATE(), 1)

	SET @UserID = CAST(SCOPE_IDENTITY() AS BIGINT) 
END
ELSE IF(@UserCount > 0 AND @UserID IS NOT NULL)
BEGIN
	UPDATE Users 

	SET SpecialityID = @SpecialityID,
		Name = @Name,
		Experience = @Experience,
		SatisfactionPercentage = @SatisfactionPercentage,
		DisplayPicture = @DisplayPicture,
		MobileNumber = @MobileNumber,
		Password = @Password,
		ResidentialAddress = @ResidentialAddress,
		Education = @Education,
		Status = @Status

	WHERE UserID = @UserID
END
ELSE --Duplicate Mob Number
BEGIN
	SET @UserID = CAST(-9 AS BIGINT)
END

SELECT @UserID AS UserID

GO
/****** Object:  StoredProcedure [dbo].[CHECK_MOBILE_NUMBER_FOR_ACCOUNT_CREATION]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[CHECK_MOBILE_NUMBER_FOR_ACCOUNT_CREATION]

@MobileNumber varchar(50)

AS

SELECT COUNT(u.UserID) 

FROM Users u 

WHERE u.MobileNumber = @MobileNumber 
AND u.Status = 1
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_LAB_TESTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_ALL_LAB_TESTS]

@SearchQuery varchar(50)

AS

IF(@SearchQuery IS NOT NULL AND @SearchQuery != '' AND @SearchQuery != 'null' AND @SearchQuery != 'undefined')
BEGIN
	SELECT * FROM LabTests

	WHERE LabTestTitle like '%'+@SearchQuery+'%'
	AND Status = 1
END
ELSE
BEGIN
	SELECT * FROM LabTests

	WHERE Status = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_LABS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_ALL_LABS]

AS

SELECT * FROM Labs

WHERE Status = 1

GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_MEDICINES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_ALL_MEDICINES]

@SearchQuery varchar(50),
@PageNumber int,
@PageSize int

AS

DECLARE @StartRow INT
DECLARE @EndRow INT

SET @StartRow = ((@PageNumber - 1) * @PageSize) + 1;
SET @EndRow = @PageNumber * @PageSize;

IF(@SearchQuery IS NOT NULL AND @SearchQuery != '' AND @SearchQuery != 'null' AND @SearchQuery != 'undefined')
BEGIN
	WITH RESULT AS
	(
		SELECT *,ROW_NUMBER() OVER (ORDER BY MedicineTitle ASC) AS RowNumber FROM Medicines

		WHERE MedicineTitle like '%'+@SearchQuery+'%'
		AND Status = 1
	)

	SELECT * FROM Result r
	WHERE r.RowNumber BETWEEN @StartRow AND @EndRow
END
ELSE
BEGIN
	WITH RESULT AS
	(
		SELECT *,ROW_NUMBER() OVER (ORDER BY MedicineTitle ASC) AS RowNumber FROM Medicines

		WHERE Status = 1
	)

	SELECT * FROM Result r
	WHERE r.RowNumber BETWEEN @StartRow AND @EndRow
END


GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_SPECIALITIES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_ALL_SPECIALITIES]

AS

SELECT * FROM Specialities

WHERE Status = 1

GO
/****** Object:  StoredProcedure [dbo].[GET_APPOINTMENT_PROCEEDINGS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPOINTMENT_PROCEEDINGS]

@AppointmentID bigint,
@UserTypeID int

AS

SELECT ap.*, u.Name, u.DisplayPicture, ut.UserType 

FROM Appointment_Proceedings ap

INNER JOIN Users u
ON u.UserID = ap.UserID
AND u.Status = 1

INNER JOIN UserTypes ut
ON ut.UserTypeID = u.UserTypeID
AND ut.Status = 1

WHERE ap.AppointmentID = @AppointmentID
AND ap.Status = 1
--AND (SenderUserTypeID = @UserTypeID
--OR ReceiverUserTypeID = @UserTypeID)

ORDER BY ap.AddedDateTime

GO
/****** Object:  StoredProcedure [dbo].[GET_APPOINTMENTS_FOR_DOCTOR_PROFILE]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPOINTMENTS_FOR_DOCTOR_PROFILE]

@UserID bigint

AS

SELECT pa.AppointmentID, pa.UserID, pa.TeamID, pa.SessionCharges, pa.SessionStartDate, FORMAT(CAST(pa.SessionStartTime AS DATETIME), 'hh:mm tt') AS SessionStartTime, pa.TeamTimeSlotID, 
		pa.IsSessionEnded, pa.SessionEndDatetime, pa.AddedDateTime, pa.Status, s.SpecialityTitle, s.DisplayPicture, u.Name AS PatientName, u.DisplayPicture AS PatientImage, pa.FinalAmount, 
		u.MobileNumber AS PatientMobileNumber, u.ResidentialAddress, pa.BillingAddress, pa.DiscountVoucherID, pa.VoucherTitle, pa.DiscountVoucherAmount, pa.DiscountVoucherPercentage

FROM Patient_Appointments pa

INNER JOIN Users u
ON u.UserID = pa.UserID
AND u.Status = 1

INNER JOIN Teams t
ON t.TeamID = pa.TeamID
AND t.Status = 1

INNER JOIN Specialities s
ON s.SpecialityID = t.SpecialityID
AND s.Status = 1

INNER JOIN TeamMembers tm
ON tm.TeamID = pa.TeamID
AND tm.UserID = @UserID
AND tm.Status = 1

ORDER BY pa.AddedDateTime DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_APPOINTMENTS_FOR_PATIENT_PROFILE]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPOINTMENTS_FOR_PATIENT_PROFILE]

@UserID bigint

AS

SELECT pa.AppointmentID, pa.UserID, pa.TeamID, pa.SessionCharges, pa.SessionStartDate, FORMAT(CAST(pa.SessionStartTime AS DATETIME), 'hh:mm tt') AS SessionStartTime, pa.TeamTimeSlotID, 
		pa.IsSessionEnded, pa.SessionEndDatetime, pa.AddedDateTime, pa.Status, s.SpecialityTitle, s.DisplayPicture, u.Name AS PatientName, u.DisplayPicture AS PatientImage, pa.FinalAmount, 
		u.MobileNumber AS PatientMobileNumber, pa.PaymentImage, u.ResidentialAddress, pa.BillingAddress, pa.DiscountVoucherID, pa.VoucherTitle, pa.DiscountVoucherAmount, pa.DiscountVoucherPercentage
		
FROM Patient_Appointments pa

INNER JOIN Users u
ON u.UserID = pa.UserID
AND u.Status = 1

INNER JOIN Teams t
ON t.TeamID = pa.TeamID
AND t.Status = 1

INNER JOIN Specialities s
ON s.SpecialityID = t.SpecialityID
AND s.Status = 1

WHERE pa.Status = 1
AND pa.UserID = @UserID

ORDER BY pa.AddedDateTime DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_APPOINTMENTS_REPORT]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPOINTMENTS_REPORT]

@UserID bigint,
@StartDate date,
@EndDate date,
@SpecialityID varchar(250),
@TeamID varchar(250)

AS

SELECT pa.AppointmentID, pa.UserID, pa.TeamID, pa.SessionCharges, pa.SessionStartDate, FORMAT(CAST(pa.SessionStartTime AS DATETIME), 'hh:mm tt') AS SessionStartTime, pa.TeamTimeSlotID, 
		pa.IsSessionEnded, pa.SessionEndDatetime, pa.AddedDateTime, pa.Status, s.SpecialityTitle, s.DisplayPicture, u.Name AS PatientName, u.DisplayPicture AS PatientImage, pa.FinalAmount, 
		u.MobileNumber AS PatientMobileNumber, pa.PaymentImage, u.ResidentialAddress, pa.BillingAddress, pa.DiscountVoucherID, pa.VoucherTitle, pa.DiscountVoucherAmount, pa.DiscountVoucherPercentage
		
FROM Patient_Appointments pa

INNER JOIN Users u
ON u.UserID = pa.UserID
AND u.Status = 1

INNER JOIN Teams t
ON t.TeamID = pa.TeamID
AND (CASE WHEN @TeamID IS NULL OR @TeamID = '' OR @TeamID = 'null' THEN '%;'+ CAST(t.TeamID AS VARCHAR(10)) +';%' ELSE @TeamID END) LIKE '%;'+ CAST(t.TeamID AS VARCHAR(10)) +';%'
AND t.Status = 1

INNER JOIN Specialities s
ON s.SpecialityID = t.SpecialityID
AND (CASE WHEN @SpecialityID IS NULL OR @SpecialityID = '' OR @SpecialityID = 'null' THEN '%;'+ CAST(s.SpecialityID AS VARCHAR(10)) +';%' ELSE @SpecialityID END) LIKE '%;'+ CAST(s.SpecialityID AS VARCHAR(10)) +';%'
AND s.Status = 1

WHERE pa.Status = 1
AND pa.UserID = COALESCE(@UserID, pa.UserID)
AND CAST(pa.SessionStartDate AS DATE) BETWEEN CAST(@StartDate AS DATE) AND CAST(@EndDate AS DATE)

ORDER BY pa.AddedDateTime DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_AVAILABLE_TIME_SLOTS_BY_TEAM_ID_AND_DATE]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[GET_AVAILABLE_TIME_SLOTS_BY_TEAM_ID_AND_DATE]

@TeamID int,
@Date date

AS

IF(CAST(@Date AS DATE) = CAST(GETDATE() AS DATE))
BEGIN
	SELECT * FROM Team_TimeSlots

	WHERE TeamID = @TeamID
	AND DayNumber = (((@@datefirst-1) + datepart(weekday, @Date)) % 7) --Returns Day of Week according to C# DateTime DayOfWeek
	AND Status = 1
	AND TeamTimeSlotID NOT IN (SELECT p.TeamTimeSlotID FROM Patient_Appointments p
							   WHERE p.Status = 1
							   AND p.TeamID = @TeamID
							   AND CAST(p.SessionStartDate AS DATE) = CAST(@Date AS DATE))

	AND CAST(TimeSlot AS TIME(7)) > CAST(GETDATE() AS TIME(7))

	ORDER BY TimeSlot
END
ELSE
BEGIN
	SELECT * FROM Team_TimeSlots

	WHERE TeamID = @TeamID
	AND DayNumber = (((@@datefirst-1) + datepart(weekday, @Date)) % 7) --Returns Day of Week according to C# DateTime DayOfWeek
	AND Status = 1
	AND TeamTimeSlotID NOT IN (SELECT p.TeamTimeSlotID FROM Patient_Appointments p
							   WHERE p.Status = 1
							   AND p.TeamID = @TeamID
							   AND CAST(p.SessionStartDate AS DATE) = CAST(@Date AS DATE))

	--AND CAST(TimeSlot AS TIME(7)) > CAST(GETDATE() AS TIME(7))

	ORDER BY TimeSlot
END
GO
/****** Object:  StoredProcedure [dbo].[GET_DISCOUNT_VOUCHERS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_DISCOUNT_VOUCHERS]

@VoucherCode varchar(50)

AS

IF(@VoucherCode = '' OR @VoucherCode = 'null' OR @VoucherCode = 'undefined' OR @VoucherCode IS NULL)
BEGIN
	SET @VoucherCode = null
END


SELECT * FROM DiscountVouchers

WHERE Status = 1
AND VoucherCode = COALESCE(@VoucherCode, VoucherCode)

ORDER BY VoucherTitle

GO
/****** Object:  StoredProcedure [dbo].[GET_LATEST_APPOINTMENT_PROCEEDINGS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_LATEST_APPOINTMENT_PROCEEDINGS]

@AppointmentID bigint,
@UserTypeID int,
@AppointmentProceedingID bigint

AS

SELECT ap.*, u.Name, u.DisplayPicture, ut.UserType 

FROM Appointment_Proceedings ap

INNER JOIN Users u
ON u.UserID = ap.UserID
AND u.Status = 1

INNER JOIN UserTypes ut
ON ut.UserTypeID = u.UserTypeID
AND ut.Status = 1

WHERE ap.AppointmentID = @AppointmentID
AND ap.Status = 1
--AND (SenderUserTypeID = @UserTypeID
--OR ReceiverUserTypeID = @UserTypeID)
AND ap.AppointmentProceedingID > @AppointmentProceedingID

ORDER BY ap.AddedDateTime

GO
/****** Object:  StoredProcedure [dbo].[GET_PATIENT_LAB_TEST_REPORT]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_PATIENT_LAB_TEST_REPORT]

@UserID bigint,
@StartDate date,
@EndDate date,
@LabID varchar(250),
@LabTestID varchar(350)

AS

SELECT pl.*, l.LabTitle, l.DisplayPicture AS LabLogo, lt.LabTestTitle, u.Name AS PatientName, u.DisplayPicture AS PatientImage, 
		u.MobileNumber AS PatientMobileNumber, u.ResidentialAddress

FROM Patient_LabTests pl

INNER JOIN Users u
ON u.UserID = pl.UserID
AND u.Status = 1

INNER JOIN Labs l
ON l.LabID = pl.LabID
AND (CASE WHEN @LabID IS NULL OR @LabID = '' OR @LabID = 'null' THEN '%;'+ CAST(l.LabID AS VARCHAR(10)) +';%' ELSE @LabID END) LIKE '%;'+ CAST(l.LabID AS VARCHAR(10)) +';%'
AND l.Status = 1

INNER JOIN LabTests lt
ON lt.LabTestID = pl.LabTestID
AND (CASE WHEN @LabTestID IS NULL OR @LabTestID = '' OR @LabTestID = 'null' THEN '%;'+ CAST(lt.LabTestID AS VARCHAR(10)) +';%' ELSE @LabTestID END) LIKE '%;'+ CAST(lt.LabTestID AS VARCHAR(10)) +';%'
AND lt.Status = 1

WHERE pl.UserID = COALESCE(@UserID, pl.UserID)
AND CAST(pl.AddedDateTime AS DATE) BETWEEN CAST(@StartDate AS DATE) AND CAST(@EndDate AS DATE)
AND pl.Status = 1

ORDER BY pl.AddedDateTime DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_PATIENT_LAB_TESTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_PATIENT_LAB_TESTS]

@UserID	bigint

AS

SELECT pl.*, l.LabTitle, l.DisplayPicture AS LabLogo, lt.LabTestTitle, u.Name AS PatientName, u.DisplayPicture AS PatientImage, 
		u.MobileNumber AS PatientMobileNumber

FROM Patient_LabTests pl

INNER JOIN Users u
ON u.UserID = pl.UserID
AND u.Status = 1

INNER JOIN Labs l
ON l.LabID = pl.LabID

INNER JOIN LabTests lt
ON lt.LabTestID = pl.LabTestID

WHERE pl.UserID = @UserID
AND pl.Status = 1

ORDER BY pl.AddedDateTime DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_PATIENT_MEDICINE_DETAILS_BY_ORDER_ID]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_PATIENT_MEDICINE_DETAILS_BY_ORDER_ID]

@PatientMedicineOrderID	bigint

AS

SELECT pm.*, m.DisplayPicture AS MedicineImage, m.MedicineTitle 

FROM Patient_Medicines pm

INNER JOIN Medicines m
ON m.MedicineID = pm.MedicineID
AND m.Status = 1

WHERE pm.PatientMedicineOrderID = @PatientMedicineOrderID

GO
/****** Object:  StoredProcedure [dbo].[GET_PATIENT_MEDICINE_ORDER_REPORT]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_PATIENT_MEDICINE_ORDER_REPORT]

@UserID	bigint,
@StartDate date,
@EndDate date

AS

SELECT po.PatientMedicineOrderID, MAX(po.OrderNumber) AS OrderNumber, MAX(po.FinalAmount) AS FinalAmount, MAX(po.AddedDateTime) AS AddedDateTime, COUNT(pm.PatientMedicineID) AS TotalItems,
		MAX(u.Name) AS PatientName, MAX(u.DisplayPicture) AS PatientImage, MAX(u.MobileNumber) AS PatientMobileNumber, MAX(po.PaymentImage) AS PaymentImage, MAX(po.OrderDate) AS OrderDate, 
		CAST(MAX(CAST(COALESCE(po.IsDelivered, 0) AS char(1))) AS BIT) AS IsDelivered, MAX(po.IsDeliveredDateTime) AS IsDeliveredDateTime, MAX(po.PrescriptionImage) AS PrescriptionImage,
		MAX(u.ResidentialAddress) AS ResidentialAddress, MAX(po.BillingAddress) AS BillingAddress, MAX(po.DiscountVoucherID) AS DiscountVoucherID, MAX(po.VoucherTitle) AS VoucherTitle, 
		MAX(po.DiscountVoucherAmount) AS DiscountVoucherAmount, MAX(po.DiscountVoucherPercentage) AS DiscountVoucherPercentage

FROM Patient_MedicineOrder po

INNER JOIN Users u
ON u.UserID = po.UserID
AND u.Status = 1

INNER JOIN Patient_Medicines pm
ON pm.PatientMedicineOrderID = po.PatientMedicineOrderID
AND pm.Status = 1

WHERE po.UserID = COALESCE(@UserID, po.UserID)
AND CAST(po.OrderDate AS DATE) BETWEEN CAST(@StartDate AS DATE) AND CAST(@EndDate AS DATE)
AND po.Status = 1

GROUP BY po.PatientMedicineOrderID

ORDER BY po.PatientMedicineOrderID DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_PATIENT_MEDICINE_ORDERS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_PATIENT_MEDICINE_ORDERS]

@UserID	bigint

AS

SELECT po.PatientMedicineOrderID, MAX(po.OrderNumber) AS OrderNumber, MAX(po.FinalAmount) AS FinalAmount, MAX(po.AddedDateTime) AS AddedDateTime, COUNT(pm.PatientMedicineID) AS TotalItems,
		MAX(u.Name) AS PatientName, MAX(u.DisplayPicture) AS PatientImage, MAX(u.MobileNumber) AS PatientMobileNumber, MAX(po.PaymentImage) AS PaymentImage, MAX(po.OrderDate) AS OrderDate, 
		CAST(MAX(CAST(COALESCE(po.IsDelivered, 0) AS char(1))) AS BIT) AS IsDelivered, MAX(po.IsDeliveredDateTime) AS IsDeliveredDateTime,  MAX(po.PrescriptionImage) AS PrescriptionImage,
		MAX(u.ResidentialAddress) AS ResidentialAddress, MAX(po.BillingAddress) AS BillingAddress, MAX(po.DiscountVoucherID) AS DiscountVoucherID, MAX(po.VoucherTitle) AS VoucherTitle, 
		MAX(po.DiscountVoucherAmount) AS DiscountVoucherAmount, MAX(po.DiscountVoucherPercentage) AS DiscountVoucherPercentage

FROM Patient_MedicineOrder po

INNER JOIN Users u
ON u.UserID = po.UserID
AND u.Status = 1

INNER JOIN Patient_Medicines pm
ON pm.PatientMedicineOrderID = po.PatientMedicineOrderID
AND pm.Status = 1

WHERE po.UserID = @UserID
AND po.Status = 1

GROUP BY po.PatientMedicineOrderID

ORDER BY po.PatientMedicineOrderID DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_REV_EWS_AND_RATINGS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_REV_EWS_AND_RATINGS]

@UserID	bigint,
@TeamID	int

AS

SELECT r.*, u.Name, u.DisplayPicture 

FROM RatingAndReviews r

INNER JOIN Users u
ON u.UserID = r.UserID
AND u.UserTypeID = 5 --Patient
AND u.Status = 1

WHERE r.Status = 1 
AND r.UserID = COALESCE(@UserID, r.UserID)
AND r.TeamID = COALESCE(@TeamID, r.TeamID)

ORDER BY r.AddedDateTime DESC

GO
/****** Object:  StoredProcedure [dbo].[GET_STATISTICS_FOR_PATIENT_PROFILE]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_STATISTICS_FOR_PATIENT_PROFILE]

@UserID bigint

AS

DECLARE @TotalAppointments int
DECLARE @TodayAppointments int
DECLARE @TotalMedicineOrders int
DECLARE @PendingDeliveryMedicineOrders int
DECLARE @TotalLabTests int
DECLARE @PendingLabTestResults int


SELECT @TotalAppointments = COUNT(pa.AppointmentID),
	   @TodayAppointments = SUM(CASE WHEN CAST(pa.SessionStartDate AS DATE) = CAST(GETDATE() AS DATE) THEN 1 ELSE 0 END)

FROM Patient_Appointments pa

WHERE pa.UserID = @UserID
AND pa.Status = 1


SELECT @TotalMedicineOrders = COUNT(pa.PatientMedicineOrderID),
	   @PendingDeliveryMedicineOrders = SUM(CASE WHEN pa.IsDelivered = 1 THEN 1 ELSE 0 END)

FROM Patient_MedicineOrder pa

WHERE pa.UserID = @UserID
AND pa.Status = 1


SELECT @TotalLabTests = COUNT(pa.PatientLabTestID),
	   @PendingLabTestResults = SUM(CASE WHEN pa.LabResultFileAttachment IS NULL THEN 1 ELSE 0 END)

FROM Patient_LabTests pa

WHERE pa.UserID = @UserID
AND pa.Status = 1

SELECT @TotalAppointments AS TotalAppointments, @TodayAppointments AS TodayAppointments, @TotalMedicineOrders AS TotalMedicineOrders, 
@PendingDeliveryMedicineOrders AS PendingDeliveryMedicineOrders, @TotalLabTests AS TotalLabTests, @PendingLabTestResults AS PendingLabTestResults

GO
/****** Object:  StoredProcedure [dbo].[GET_TEAMS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GET_TEAMS]

@TeamID int,
@SpecialityID varchar(250),
@SearchQuery varchar(50)

AS

IF(@SearchQuery = '' OR @SearchQuery = 'null' OR @SearchQuery = 'undefined' OR @SearchQuery IS NULL)
BEGIN
	SET @SearchQuery = null
END

IF(@SpecialityID = '' OR @SpecialityID = 'null' OR @SpecialityID = 'undefined' OR @SpecialityID  IS NULL)
BEGIN
	SET @SpecialityID = null
END


SELECT t.*, s.SpecialityTitle, s.DisplayPicture AS SpecialityLogo, u.Name, u.DisplayPicture, u.Experience, u.MobileNumber, u.SatisfactionPercentage, u.UserTypeID, ut.UserType,
	   tm.TeamMemberID, tm.UserID, u.Education, u.ResidentialAddress, 
	   
	   (SELECT COUNT(rr.RatingReviewID) FROM RatingAndReviews rr
	    WHERE rr.Status = 1
		AND rr.TeamID = t.TeamID) AS ReviewsCount, 
	   
	   (SELECT AVG(rr.Rating) FROM RatingAndReviews rr
	    WHERE rr.Status = 1
		AND rr.TeamID = t.TeamID) AS AverageRating

FROM Teams t

INNER JOIN Specialities s
ON s.SpecialityID = t.SpecialityID
AND COALESCE(@SpecialityID, '%;'+ CAST(s.SpecialityID AS VARCHAR(10)) +';%') LIKE '%;'+ CAST(s.SpecialityID AS VARCHAR(10)) +';%'
AND s.Status = 1

INNER JOIN TeamMembers tm
ON tm.TeamID = t.TeamID
AND tm.TeamID = COALESCE(@TeamID, tm.TeamID)
AND tm.Status = 1

INNER JOIN Users u
ON u.UserID = tm.UserID
AND u.Status = 1
AND u.UserTypeID NOT IN (1,5)

INNER JOIN UserTypes ut
ON ut.UserTypeID = u.UserTypeID
AND ut.Status = 1

WHERE CONCAT(s.SpecialityTitle, ' ', ut.UserType, ' ', u.Name) like '%'+ COALESCE(@SearchQuery, CONCAT(s.SpecialityTitle, ' ', ut.UserType, ' ', u.Name)) +'%'
AND t.Status = 1

GO
/****** Object:  StoredProcedure [dbo].[GET_TIME_SLOTS_BY_TEAM_ID]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GET_TIME_SLOTS_BY_TEAM_ID]

@TeamID bigint

AS

SELECT * FROM Team_TimeSlots

WHERE TeamID = @TeamID
AND Status = 1

ORDER BY DayNumber, TimeSlot
GO
/****** Object:  StoredProcedure [dbo].[GET_USER_TYPES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GET_USER_TYPES]

AS

SELECT * FROM UserTypes

WHERE Status = 1

GO
/****** Object:  StoredProcedure [dbo].[GET_USERS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[GET_USERS]

@UserTypeID int

AS

SELECT u.*, s.SpecialityTitle, ut.UserType AS UserTypeTitle FROM Users u

INNER JOIN UserTypes ut
ON ut.UserTypeID = u.UserTypeID
AND ut.UserTypeID NOT IN (1, 5)
AND ut.UserTypeID = COALESCE(@UserTypeID, ut.UserTypeID)

INNER JOIN Specialities s 
ON s.SpecialityID = u.SpecialityID
AND s.Status = 1

WHERE u.Status = 1
GO
/****** Object:  StoredProcedure [dbo].[LOGIN_USER]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[LOGIN_USER]

@MobileNumber	varchar(50),
@Password	varchar(50),
@UserID bigint

AS

SELECT u.*, s.SpecialityTitle, s.DisplayPicture AS SpecialityPicture, ut.UserType

FROM Users u

INNER JOIN UserTypes ut
ON ut.UserTypeID = u.UserTypeID

LEFT OUTER JOIN Specialities s
ON s.SpecialityID = u.SpecialityID
AND s.Status = 1

WHERE u.MobileNumber = COALESCE(@MobileNumber, u.MobileNumber)
AND u.Password = COALESCE(@Password, u.Password)
AND u.UserID = COALESCE(@UserID, u.UserID)
AND u.Status = 1
GO
/****** Object:  StoredProcedure [dbo].[MARK_PATIENT_MEDICINE_ORDER_AS_DELIVERED]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[MARK_PATIENT_MEDICINE_ORDER_AS_DELIVERED]

@PatientMedicineOrderID	bigint

AS

UPDATE Patient_MedicineOrder 

SET IsDelivered = 1,
	IsDeliveredDateTime = GETDATE()

WHERE PatientMedicineOrderID = @PatientMedicineOrderID

GO
/****** Object:  StoredProcedure [dbo].[SEARCH_LAB_TESTS]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SEARCH_LAB_TESTS]

@SearchQuery varchar(50)

AS

SELECT TOP(7) lt.LabTestID AS ObjectID, 'lt.png' AS SearchIcon, 2 AS ModuleID, CONCAT(lt.LabTestTitle, ' - Rs.', lt.LabTestPrice) AS SearchResult, lt.LabTestTitle AS SearchQuery

FROM LabTests lt

WHERE lt.LabTestTitle like '%'+@SearchQuery+'%'
AND lt.Status = 1

GO
/****** Object:  StoredProcedure [dbo].[SEARCH_MEDICINES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SEARCH_MEDICINES]

@SearchQuery varchar(50)

AS

SELECT TOP(7) lt.MedicineID AS ObjectID, lt.DisplayPicture AS SearchIcon, 3 AS ModuleID, CONCAT(lt.MedicineTitle, ' - Rs.', lt.Price) AS SearchResult, lt.MedicineTitle AS SearchQuery

FROM Medicines lt

WHERE lt.MedicineTitle like '%'+@SearchQuery+'%'
AND lt.Status = 1

ORDER BY lt.MedicineTitle

GO
/****** Object:  StoredProcedure [dbo].[SEARCH_TEAMS_DOCTORS_SPECIALITIES]    Script Date: 6/27/2022 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SEARCH_TEAMS_DOCTORS_SPECIALITIES]

@SearchQuery varchar(50)

AS

SELECT TOP(7) t.TeamID AS ObjectID, s.DisplayPicture AS SearchIcon, 1 AS ModuleID, CONCAT(u.Name, ', ', ut.UserType, ' in ', s.SpecialityTitle, ' team') AS SearchResult, u.Name AS SearchQuery

FROM Specialities s

LEFT OUTER JOIN Teams t
ON t.SpecialityID = s.SpecialityID
AND t.Status = 1

LEFT OUTER JOIN Users u
ON u.SpecialityID = s.SpecialityID
AND u.Status = 1
AND u.UserTypeID NOT IN (1,5)

LEFT OUTER JOIN UserTypes ut
ON ut.UserTypeID = u.UserTypeID

WHERE CONCAT(s.SpecialityTitle, ' ', ut.UserType, ' ', u.Name) like '%'+@SearchQuery+'%'
AND s.Status = 1

GO
USE [master]
GO
ALTER DATABASE [SapiensIn] SET  READ_WRITE 
GO
