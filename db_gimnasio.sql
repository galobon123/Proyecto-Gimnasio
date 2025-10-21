USE [master]
GO
/****** Object:  Database [db_gimnasio]    Script Date: 20/10/2025 11:44:52 ******/
CREATE DATABASE [db_gimnasio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_gimnasio', FILENAME = N'C:\SQLdata\db_gimnasio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_gimnasio_log', FILENAME = N'C:\SQLdata\db_gimnasio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_gimnasio] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_gimnasio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_gimnasio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_gimnasio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_gimnasio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_gimnasio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_gimnasio] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_gimnasio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_gimnasio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_gimnasio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_gimnasio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_gimnasio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_gimnasio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_gimnasio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_gimnasio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_gimnasio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_gimnasio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_gimnasio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_gimnasio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_gimnasio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_gimnasio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_gimnasio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_gimnasio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_gimnasio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_gimnasio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_gimnasio] SET  MULTI_USER 
GO
ALTER DATABASE [db_gimnasio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_gimnasio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_gimnasio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_gimnasio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_gimnasio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_gimnasio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_gimnasio] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_gimnasio] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_gimnasio]
GO
/****** Object:  Table [dbo].[Barrios]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barrios](
	[id_barrio] [int] IDENTITY(1,1) NOT NULL,
	[id_localidad] [int] NOT NULL,
	[nom_barrio] [varchar](30) NOT NULL,
 CONSTRAINT [pk_barrios] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clases]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clases](
	[id_clase] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [text] NULL,
	[cupo_max] [int] NOT NULL,
	[horario] [time](7) NULL,
	[id_entrenador] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[dia] [varchar](10) NULL,
 CONSTRAINT [pk_clases] PRIMARY KEY CLUSTERED 
(
	[id_clase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clases_Clientes]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clases_Clientes](
	[id_clase] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha_inscripcion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_clase] ASC,
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nom_cl] [varchar](50) NOT NULL,
	[ape_cl] [varchar](50) NOT NULL,
	[dni] [varchar](8) NOT NULL,
	[id_barrio] [int] NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[genero] [char](2) NULL,
	[fecha_nac] [date] NOT NULL,
	[id_plan] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nom_empl] [varchar](50) NOT NULL,
	[ape_empl] [varchar](50) NOT NULL,
	[dni] [varchar](8) NOT NULL,
	[id_barrio] [int] NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[genero] [char](2) NULL,
	[fecha_nac] [date] NOT NULL,
	[id_rol] [int] NOT NULL,
	[sueldo] [money] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [pk_empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Identificacion_Usuarios]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Identificacion_Usuarios](
	[id_usuario] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[id_empleado] [int] NULL,
 CONSTRAINT [pk_identificacion] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[nom_localidad] [varchar](30) NOT NULL,
 CONSTRAINT [pk_localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metodos_Pago]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metodos_Pago](
	[id_metodo] [int] IDENTITY(1,1) NOT NULL,
	[nom_metodo] [varchar](30) NOT NULL,
	[descuento] [int] NULL,
 CONSTRAINT [pk_metodosp] PRIMARY KEY CLUSTERED 
(
	[id_metodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_plan] [int] NOT NULL,
	[fec_pago] [datetime] NOT NULL,
	[monto] [int] NOT NULL,
	[id_metodo_pago] [int] NOT NULL,
 CONSTRAINT [pk_pagos] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[id_plan] [int] IDENTITY(1,1) NOT NULL,
	[nom_plan] [varchar](30) NOT NULL,
	[descripcion] [text] NULL,
	[duracion_meses] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [pk_planes] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nom_rol] [varchar](30) NOT NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [pk_roles] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](30) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[contraseña] [varchar](25) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [pk_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clases_Clientes] ADD  DEFAULT (getdate()) FOR [fecha_inscripcion]
GO
ALTER TABLE [dbo].[Barrios]  WITH CHECK ADD  CONSTRAINT [fk_localidades_barrios] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[Localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[Barrios] CHECK CONSTRAINT [fk_localidades_barrios]
GO
ALTER TABLE [dbo].[Clases]  WITH CHECK ADD  CONSTRAINT [fk_empleados_clases] FOREIGN KEY([id_entrenador])
REFERENCES [dbo].[Empleados] ([id_empleado])
GO
ALTER TABLE [dbo].[Clases] CHECK CONSTRAINT [fk_empleados_clases]
GO
ALTER TABLE [dbo].[Clases_Clientes]  WITH CHECK ADD FOREIGN KEY([id_clase])
REFERENCES [dbo].[Clases] ([id_clase])
GO
ALTER TABLE [dbo].[Clases_Clientes]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fk_barrios_clientes] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[Barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fk_barrios_clientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fk_planes_clientes] FOREIGN KEY([id_plan])
REFERENCES [dbo].[Planes] ([id_plan])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fk_planes_clientes]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fk_barrios_empleados] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[Barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fk_barrios_empleados]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fk_roles_empleados] FOREIGN KEY([id_rol])
REFERENCES [dbo].[Roles] ([id_rol])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fk_roles_empleados]
GO
ALTER TABLE [dbo].[Identificacion_Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_clientes_identificacion] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Identificacion_Usuarios] CHECK CONSTRAINT [fk_clientes_identificacion]
GO
ALTER TABLE [dbo].[Identificacion_Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_empleados_identificacion] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleados] ([id_empleado])
GO
ALTER TABLE [dbo].[Identificacion_Usuarios] CHECK CONSTRAINT [fk_empleados_identificacion]
GO
ALTER TABLE [dbo].[Identificacion_Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_usuarios_identificacion] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Identificacion_Usuarios] CHECK CONSTRAINT [fk_usuarios_identificacion]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [fk_clientes_pagos] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [fk_clientes_pagos]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [fk_metodosp_pagos] FOREIGN KEY([id_metodo_pago])
REFERENCES [dbo].[Metodos_Pago] ([id_metodo])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [fk_metodosp_pagos]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [fk_planes_pagos] FOREIGN KEY([id_plan])
REFERENCES [dbo].[Planes] ([id_plan])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [fk_planes_pagos]
GO
ALTER TABLE [dbo].[Clases]  WITH CHECK ADD  CONSTRAINT [chk_cupo_clases] CHECK  (([cupo_max]>(0)))
GO
ALTER TABLE [dbo].[Clases] CHECK CONSTRAINT [chk_cupo_clases]
GO
ALTER TABLE [dbo].[Clases]  WITH CHECK ADD  CONSTRAINT [chk_dia_clases] CHECK  (([dia]='Sabado' OR [dia]='Viernes' OR [dia]='Jueves' OR [dia]='Miercoles' OR [dia]='Martes' OR [dia]='Lunes'))
GO
ALTER TABLE [dbo].[Clases] CHECK CONSTRAINT [chk_dia_clases]
GO
ALTER TABLE [dbo].[Clases_Clientes]  WITH CHECK ADD  CONSTRAINT [chk_fec_clases_clientes] CHECK  (([fecha_inscripcion]<=getdate()))
GO
ALTER TABLE [dbo].[Clases_Clientes] CHECK CONSTRAINT [chk_fec_clases_clientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [chk_genero_clientes] CHECK  (([genero]='NB' OR [genero]='M' OR [genero]='H'))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [chk_genero_clientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [chk_nac_clientes] CHECK  (([fecha_nac]<=dateadd(year,(-15),getdate())))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [chk_nac_clientes]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [chk_genero_empleados] CHECK  (([genero]='NB' OR [genero]='M' OR [genero]='H'))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [chk_genero_empleados]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [chk_nacimiento_empleados] CHECK  (([fecha_nac]<=dateadd(year,(-18),getdate())))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [chk_nacimiento_empleados]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [chk_sueldo_empleados] CHECK  (([sueldo]>(0)))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [chk_sueldo_empleados]
GO
ALTER TABLE [dbo].[Metodos_Pago]  WITH CHECK ADD  CONSTRAINT [chk_descuento_metodos] CHECK  (([descuento]>=(0) AND [descuento]<=(100)))
GO
ALTER TABLE [dbo].[Metodos_Pago] CHECK CONSTRAINT [chk_descuento_metodos]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [chk_fec_pagos] CHECK  (([fec_pago]<=getdate()))
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [chk_fec_pagos]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [chk_monto_pagos] CHECK  (([monto]>(0)))
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [chk_monto_pagos]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [chk_duracion_planes] CHECK  (([duracion_meses]>(0)))
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [chk_duracion_planes]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [chk_precio_planes] CHECK  (([precio]>(0)))
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [chk_precio_planes]
GO
/****** Object:  Trigger [dbo].[dis_cupos_max]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[dis_cupos_max]
on [dbo].[Clases_Clientes]
for insert
as
begin
  SET NOCOUNT ON

  declare @cupos_ocupados int
  declare @max_cupos int
  declare @id_clase int

  SELECT @id_clase = i.id_clase
    FROM inserted i

  select @cupos_ocupados = count(*)
  from clases_clientes
  where id_clase=@id_clase

  select @max_cupos = cupo_max
  from Clases
  where @id_clase=id_clase
  
  if @cupos_ocupados > @max_cupos
	begin
		raiserror('La clase ya llego al maximo de cupos', 16, 1)
		rollback transaction
	end
end
GO
ALTER TABLE [dbo].[Clases_Clientes] ENABLE TRIGGER [dis_cupos_max]
GO
/****** Object:  Trigger [dbo].[dis_empl_clases]    Script Date: 20/10/2025 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[dis_empl_clases]
on [dbo].[Empleados]
for update
as
begin
  if exists(
	select 1
	FROM Clases c
	JOIN inserted i ON i.id_empleado = c.id_entrenador
        WHERE i.estado = 0 AND c.estado = 1
  )
  begin
	raiserror('No se puede dar de baja a un entrenador que esta asignado a alguna clase...', 16, 1)
  end
end
GO
ALTER TABLE [dbo].[Empleados] ENABLE TRIGGER [dis_empl_clases]
GO
USE [master]
GO
ALTER DATABASE [db_gimnasio] SET  READ_WRITE 
GO
