/****** Object:  Table [dbo].[usuario]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](100) NOT NULL,
	[clave] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[email] [varchar](255) NOT NULL,
 CONSTRAINT [pk_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uq_usuario_nombreUsuario] UNIQUE NONCLUSTERED 
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ubicacionStock]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ubicacionStock](
	[idUbicacionStock] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_ubicacionStock] PRIMARY KEY CLUSTERED 
(
	[idUbicacionStock] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipoTarjeta]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoTarjeta](
	[idTipoTarjeta] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipoTarjeta] PRIMARY KEY CLUSTERED 
(
	[idTipoTarjeta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipoOrden]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoOrden](
	[idTipoOrden] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipoOrden] PRIMARY KEY CLUSTERED 
(
	[idTipoOrden] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipoMovimiento]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoMovimiento](
	[idTipoMovimiento] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[idTarjeta] [int] NOT NULL,
	[numero] [varchar](20) NULL,
	[idTipoTarjeta] [int] NULL,
	[nombre] [varchar](100) NULL,
	[codigoSeguridad] [smallint] NULL,
	[fechaVencimiento] [date] NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[idTarjeta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vendedor]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendedor](
	[idVendedor] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_vendedor] PRIMARY KEY CLUSTERED 
(
	[idVendedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[provincia](
	[idProvincia] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_provincia] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[origenCheque]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[origenCheque](
	[idOrigenCheque] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_origenCheque] PRIMARY KEY CLUSTERED 
(
	[idOrigenCheque] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pantalla]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[pantalla](
	[idPantalla] [int] NOT NULL,
	[url] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
 CONSTRAINT [PK_pantalla] PRIMARY KEY CLUSTERED 
(
	[idPantalla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kitProducto]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitProducto](
	[idKit] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantdad] [int] NULL,
 CONSTRAINT [PK_kitProducto] PRIMARY KEY CLUSTERED 
(
	[idKit] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kit]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kit](
	[idKit] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[idProductoPrincipal] [int] NOT NULL,
 CONSTRAINT [PK_kit] PRIMARY KEY CLUSTERED 
(
	[idKit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[familia]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[familia](
	[idFamilia] [int] NOT NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_familia] PRIMARY KEY CLUSTERED 
(
	[idFamilia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[factura]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[factura](
	[idFactura] [int] NOT NULL,
	[fecha] [date] NULL,
	[observaciones] [varchar](100) NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estadoPedido]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[estadoPedido](
	[idEstadoPedido] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_estadoPedido] PRIMARY KEY CLUSTERED 
(
	[idEstadoPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[descripcionMovCaja]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[descripcionMovCaja](
	[idDescripcionMovCaja] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_descripcionMovCaja] PRIMARY KEY CLUSTERED 
(
	[idDescripcionMovCaja] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medioPago]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medioPago](
	[idMedioPago] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_medioPago] PRIMARY KEY CLUSTERED 
(
	[idMedioPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[condicionIva]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[condicionIva](
	[idCondicionIva] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[letra] [char](1) NOT NULL,
 CONSTRAINT [pk_condicionIva] PRIMARY KEY CLUSTERED 
(
	[idCondicionIva] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[banco]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[banco](
	[idBanco] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_banco] PRIMARY KEY CLUSTERED 
(
	[idBanco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[alicuotaIva]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[alicuotaIva](
	[idAlicuotaIva] [int] NOT NULL,
	[valor] [float] NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_alicuotaIva] PRIMARY KEY CLUSTERED 
(
	[idAlicuotaIva] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] NOT NULL,
	[cuit] [bigint] NULL,
	[razonSocial] [varchar](100) NULL,
	[idLocalidad] [int] NULL,
	[domicilio] [varchar](100) NULL,
	[codigoPostal] [char](10) NULL,
	[idCondicionIva] [int] NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[observaciones] [varchar](250) NULL,
 CONSTRAINT [PK_cliente_1] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cheque]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cheque](
	[idCheque] [int] NOT NULL,
	[idBanco] [int] NULL,
	[numero] [varchar](50) NULL,
	[fechaEmision] [datetime] NULL,
	[fechaVencimiento] [datetime] NULL,
	[importe] [float] NULL,
	[idOrigenCheque] [int] NULL,
	[enCartera] [bit] NULL,
	[cobrado] [bit] NULL,
 CONSTRAINT [PK_cheque] PRIMARY KEY CLUSTERED 
(
	[idCheque] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cobro]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cobro](
	[idCobro] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[idMedioPago] [int] NULL,
	[importe] [float] NULL,
	[observaciones] [varchar](150) NULL,
 CONSTRAINT [PK_cobro] PRIMARY KEY CLUSTERED 
(
	[idCobro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[localidad](
	[idLocalidad] [int] NOT NULL,
	[idProvincia] [int] NULL,
	[descripcion] [varchar](150) NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[movimientoCaja]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[movimientoCaja](
	[idMovimientoCaja] [int] NOT NULL,
	[idTipoMovimiento] [int] NULL,
	[fecha] [datetime] NULL,
	[idMedioPago] [int] NULL,
	[monto] [float] NULL,
	[idDescripcionMovCaja] [int] NULL,
	[descripcionMovimiento] [varchar](100) NULL,
 CONSTRAINT [PK_movimientoCaja] PRIMARY KEY CLUSTERED 
(
	[idMovimientoCaja] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pedidoCabe]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pedidoCabe](
	[idPedidoCabe] [int] NOT NULL,
	[idCliente] [int] NULL,
	[fechaPedido] [datetime] NULL,
	[idEstadoPedido] [int] NULL,
	[observaciones] [varchar](250) NULL,
	[idTipoOrden] [int] NULL,
 CONSTRAINT [PK_pedidoCabe] PRIMARY KEY CLUSTERED 
(
	[idPedidoCabe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pago]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pago](
	[idPago] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[idMedioPago] [int] NULL,
	[importe] [float] NULL,
	[observaciones] [varchar](150) NULL,
 CONSTRAINT [PK_pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [int] NOT NULL,
	[idFamilia] [int] NULL,
	[idAlicuotaIva] [int] NULL,
	[descripcion] [varchar](150) NULL,
	[codProducto] [varchar](50) NULL,
	[activo] [bit] NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarioPantalla]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarioPantalla](
	[idUsuario] [int] NOT NULL,
	[idPantalla] [int] NOT NULL,
	[esPantallaPrincipal] [int] NULL,
 CONSTRAINT [PK_usuarioPantalla] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idPantalla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagoCheque]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagoCheque](
	[idPago] [int] NOT NULL,
	[idCheque] [int] NOT NULL,
 CONSTRAINT [PK_pagoCheque] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idCheque] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[remito]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[remito](
	[idRemito] [int] NOT NULL,
	[idPedido] [int] NULL,
	[idFactura] [int] NULL,
 CONSTRAINT [PK_remito] PRIMARY KEY CLUSTERED 
(
	[idRemito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedor](
	[cuit] [bigint] NULL,
	[razonSocial] [varchar](100) NULL,
	[idLocalidad] [int] NULL,
	[domicilio] [varchar](100) NULL,
	[codigoPostal] [char](10) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[observaciones] [varchar](250) NULL,
	[idProveedor] [int] NOT NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pedidoItem]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[pedidoItem](
	[idPedidoItem] [int] NOT NULL,
	[idPedido] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precioUnitario] [float] NULL,
	[observaciones] [varchar](100) NULL,
	[idVendedor] [int] NULL,
 CONSTRAINT [PK_pedidoItem] PRIMARY KEY CLUSTERED 
(
	[idPedidoItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[movimientoStock]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientoStock](
	[idMovimientoStock] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[idTipoMovimiento] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [float] NULL,
	[idUbicacionStock] [int] NULL,
	[idUbicacionStockOrigen] [int] NULL,
	[idUbicacionStockDestino] [int] NULL,
 CONSTRAINT [PK_movimientoStock] PRIMARY KEY CLUSTERED 
(
	[idMovimientoStock] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimientoCajaCheque]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientoCajaCheque](
	[idMovimientoCaja] [int] NOT NULL,
	[idCheque] [int] NOT NULL,
 CONSTRAINT [PK_movimientoCajaCheque] PRIMARY KEY CLUSTERED 
(
	[idMovimientoCaja] ASC,
	[idCheque] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CobroTarjeta]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CobroTarjeta](
	[idCobro] [int] NOT NULL,
	[idTarjeta] [int] NOT NULL,
 CONSTRAINT [PK_CobroTarjeta] PRIMARY KEY CLUSTERED 
(
	[idCobro] ASC,
	[idTarjeta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cobroPedido]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cobroPedido](
	[idCobro] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[montoCancelado] [float] NULL,
 CONSTRAINT [PK_cobroPedido] PRIMARY KEY CLUSTERED 
(
	[idCobro] ASC,
	[idPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cobroCheque]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cobroCheque](
	[idCobro] [int] NOT NULL,
	[idCheque] [int] NOT NULL,
 CONSTRAINT [PK_cobroCheque] PRIMARY KEY CLUSTERED 
(
	[idCobro] ASC,
	[idCheque] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deposito]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deposito](
	[idDeposito] [int] NOT NULL,
	[idCheque] [int] NULL,
	[idBanco] [int] NULL,
	[numeroTransaccion] [varchar](20) NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_deposito] PRIMARY KEY CLUSTERED 
(
	[idDeposito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compraItem]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[compraItem](
	[idCompraItem] [int] NOT NULL,
	[idCompra] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precioUnitario] [float] NULL,
	[observaciones] [varchar](250) NULL,
 CONSTRAINT [PK_compraItem] PRIMARY KEY CLUSTERED 
(
	[idCompraItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compraCabe]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compraCabe](
	[idCompraCabe] [int] NOT NULL,
	[fechaCompra] [datetime] NULL,
	[idEstado] [int] NULL,
	[observaciones] [varchar](250) NULL,
	[idTipoOrden] [int] NULL,
	[idUbicacionStock] [int] NULL,
	[idProveedor] [int] NULL,
 CONSTRAINT [PK_compraCabe] PRIMARY KEY CLUSTERED 
(
	[idCompraCabe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pagoCompra]    Script Date: 10/30/2014 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagoCompra](
	[idPago] [int] NOT NULL,
	[idCompra] [int] NOT NULL,
	[montoCancelado] [float] NULL,
 CONSTRAINT [PK_pagoCompra] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idCompra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_cheque_banco]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[cheque]  WITH CHECK ADD  CONSTRAINT [FK_cheque_banco] FOREIGN KEY([idBanco])
REFERENCES [dbo].[banco] ([idBanco])
GO
ALTER TABLE [dbo].[cheque] CHECK CONSTRAINT [FK_cheque_banco]
GO
/****** Object:  ForeignKey [FK_cliente_cliente]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_cliente]
GO
/****** Object:  ForeignKey [FK_cobro_medioPago]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[cobro]  WITH CHECK ADD  CONSTRAINT [FK_cobro_medioPago] FOREIGN KEY([idMedioPago])
REFERENCES [dbo].[medioPago] ([idMedioPago])
GO
ALTER TABLE [dbo].[cobro] CHECK CONSTRAINT [FK_cobro_medioPago]
GO
/****** Object:  ForeignKey [FK_cobroCheque_cheque]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[cobroCheque]  WITH CHECK ADD  CONSTRAINT [FK_cobroCheque_cheque] FOREIGN KEY([idCheque])
REFERENCES [dbo].[cheque] ([idCheque])
GO
ALTER TABLE [dbo].[cobroCheque] CHECK CONSTRAINT [FK_cobroCheque_cheque]
GO
/****** Object:  ForeignKey [FK_cobroCheque_cobro]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[cobroCheque]  WITH CHECK ADD  CONSTRAINT [FK_cobroCheque_cobro] FOREIGN KEY([idCobro])
REFERENCES [dbo].[cobro] ([idCobro])
GO
ALTER TABLE [dbo].[cobroCheque] CHECK CONSTRAINT [FK_cobroCheque_cobro]
GO
/****** Object:  ForeignKey [FK_cobroPedido_cobro]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[cobroPedido]  WITH CHECK ADD  CONSTRAINT [FK_cobroPedido_cobro] FOREIGN KEY([idCobro])
REFERENCES [dbo].[cobro] ([idCobro])
GO
ALTER TABLE [dbo].[cobroPedido] CHECK CONSTRAINT [FK_cobroPedido_cobro]
GO
/****** Object:  ForeignKey [FK_CobroTarjeta_cobro]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[CobroTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_CobroTarjeta_cobro] FOREIGN KEY([idCobro])
REFERENCES [dbo].[cobro] ([idCobro])
GO
ALTER TABLE [dbo].[CobroTarjeta] CHECK CONSTRAINT [FK_CobroTarjeta_cobro]
GO
/****** Object:  ForeignKey [FK_CobroTarjeta_Tarjeta]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[CobroTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_CobroTarjeta_Tarjeta] FOREIGN KEY([idTarjeta])
REFERENCES [dbo].[Tarjeta] ([idTarjeta])
GO
ALTER TABLE [dbo].[CobroTarjeta] CHECK CONSTRAINT [FK_CobroTarjeta_Tarjeta]
GO
/****** Object:  ForeignKey [FK_compraCabe_estadoPedido]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[compraCabe]  WITH CHECK ADD  CONSTRAINT [FK_compraCabe_estadoPedido] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estadoPedido] ([idEstadoPedido])
GO
ALTER TABLE [dbo].[compraCabe] CHECK CONSTRAINT [FK_compraCabe_estadoPedido]
GO
/****** Object:  ForeignKey [FK_compraCabe_proveedor]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[compraCabe]  WITH CHECK ADD  CONSTRAINT [FK_compraCabe_proveedor] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[compraCabe] CHECK CONSTRAINT [FK_compraCabe_proveedor]
GO
/****** Object:  ForeignKey [FK_compraCabe_tipoOrden]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[compraCabe]  WITH CHECK ADD  CONSTRAINT [FK_compraCabe_tipoOrden] FOREIGN KEY([idTipoOrden])
REFERENCES [dbo].[tipoOrden] ([idTipoOrden])
GO
ALTER TABLE [dbo].[compraCabe] CHECK CONSTRAINT [FK_compraCabe_tipoOrden]
GO
/****** Object:  ForeignKey [FK_compraCabe_ubicacionStock]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[compraCabe]  WITH CHECK ADD  CONSTRAINT [FK_compraCabe_ubicacionStock] FOREIGN KEY([idUbicacionStock])
REFERENCES [dbo].[ubicacionStock] ([idUbicacionStock])
GO
ALTER TABLE [dbo].[compraCabe] CHECK CONSTRAINT [FK_compraCabe_ubicacionStock]
GO
/****** Object:  ForeignKey [FK_compraItem_producto]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[compraItem]  WITH CHECK ADD  CONSTRAINT [FK_compraItem_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[compraItem] CHECK CONSTRAINT [FK_compraItem_producto]
GO
/****** Object:  ForeignKey [FK_deposito_banco]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[deposito]  WITH CHECK ADD  CONSTRAINT [FK_deposito_banco] FOREIGN KEY([idBanco])
REFERENCES [dbo].[banco] ([idBanco])
GO
ALTER TABLE [dbo].[deposito] CHECK CONSTRAINT [FK_deposito_banco]
GO
/****** Object:  ForeignKey [FK_deposito_cheque]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[deposito]  WITH CHECK ADD  CONSTRAINT [FK_deposito_cheque] FOREIGN KEY([idCheque])
REFERENCES [dbo].[cheque] ([idCheque])
GO
ALTER TABLE [dbo].[deposito] CHECK CONSTRAINT [FK_deposito_cheque]
GO
/****** Object:  ForeignKey [FK_localidad_provincia]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[localidad]  WITH CHECK ADD  CONSTRAINT [FK_localidad_provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[localidad] CHECK CONSTRAINT [FK_localidad_provincia]
GO
/****** Object:  ForeignKey [FK_movimientoCaja_descripcionMovCaja]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoCaja]  WITH CHECK ADD  CONSTRAINT [FK_movimientoCaja_descripcionMovCaja] FOREIGN KEY([idDescripcionMovCaja])
REFERENCES [dbo].[descripcionMovCaja] ([idDescripcionMovCaja])
GO
ALTER TABLE [dbo].[movimientoCaja] CHECK CONSTRAINT [FK_movimientoCaja_descripcionMovCaja]
GO
/****** Object:  ForeignKey [FK_movimientoCaja_medioPago]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoCaja]  WITH CHECK ADD  CONSTRAINT [FK_movimientoCaja_medioPago] FOREIGN KEY([idMedioPago])
REFERENCES [dbo].[medioPago] ([idMedioPago])
GO
ALTER TABLE [dbo].[movimientoCaja] CHECK CONSTRAINT [FK_movimientoCaja_medioPago]
GO
/****** Object:  ForeignKey [FK_movimientoCaja_tipoMovimiento]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoCaja]  WITH CHECK ADD  CONSTRAINT [FK_movimientoCaja_tipoMovimiento] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[tipoMovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[movimientoCaja] CHECK CONSTRAINT [FK_movimientoCaja_tipoMovimiento]
GO
/****** Object:  ForeignKey [FK_movimientoCajaCheque_cheque]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoCajaCheque]  WITH CHECK ADD  CONSTRAINT [FK_movimientoCajaCheque_cheque] FOREIGN KEY([idCheque])
REFERENCES [dbo].[cheque] ([idCheque])
GO
ALTER TABLE [dbo].[movimientoCajaCheque] CHECK CONSTRAINT [FK_movimientoCajaCheque_cheque]
GO
/****** Object:  ForeignKey [FK_movimientoCajaCheque_movimientoCaja]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoCajaCheque]  WITH CHECK ADD  CONSTRAINT [FK_movimientoCajaCheque_movimientoCaja] FOREIGN KEY([idMovimientoCaja])
REFERENCES [dbo].[movimientoCaja] ([idMovimientoCaja])
GO
ALTER TABLE [dbo].[movimientoCajaCheque] CHECK CONSTRAINT [FK_movimientoCajaCheque_movimientoCaja]
GO
/****** Object:  ForeignKey [FK_movimientoStock_producto]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoStock]  WITH CHECK ADD  CONSTRAINT [FK_movimientoStock_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[movimientoStock] CHECK CONSTRAINT [FK_movimientoStock_producto]
GO
/****** Object:  ForeignKey [FK_movimientoStock_tipoMovimiento]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoStock]  WITH CHECK ADD  CONSTRAINT [FK_movimientoStock_tipoMovimiento] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[tipoMovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[movimientoStock] CHECK CONSTRAINT [FK_movimientoStock_tipoMovimiento]
GO
/****** Object:  ForeignKey [FK_movimientoStock_ubicacionStock]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoStock]  WITH CHECK ADD  CONSTRAINT [FK_movimientoStock_ubicacionStock] FOREIGN KEY([idUbicacionStock])
REFERENCES [dbo].[ubicacionStock] ([idUbicacionStock])
GO
ALTER TABLE [dbo].[movimientoStock] CHECK CONSTRAINT [FK_movimientoStock_ubicacionStock]
GO
/****** Object:  ForeignKey [FK_movimientoStock_ubicacionStock1]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoStock]  WITH CHECK ADD  CONSTRAINT [FK_movimientoStock_ubicacionStock1] FOREIGN KEY([idUbicacionStockDestino])
REFERENCES [dbo].[ubicacionStock] ([idUbicacionStock])
GO
ALTER TABLE [dbo].[movimientoStock] CHECK CONSTRAINT [FK_movimientoStock_ubicacionStock1]
GO
/****** Object:  ForeignKey [FK_movimientoStock_ubicacionStock2]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[movimientoStock]  WITH CHECK ADD  CONSTRAINT [FK_movimientoStock_ubicacionStock2] FOREIGN KEY([idUbicacionStockOrigen])
REFERENCES [dbo].[ubicacionStock] ([idUbicacionStock])
GO
ALTER TABLE [dbo].[movimientoStock] CHECK CONSTRAINT [FK_movimientoStock_ubicacionStock2]
GO
/****** Object:  ForeignKey [FK_pago_medioPago]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_medioPago] FOREIGN KEY([idMedioPago])
REFERENCES [dbo].[medioPago] ([idMedioPago])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_medioPago]
GO
/****** Object:  ForeignKey [FK_pagoCheque_cheque]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pagoCheque]  WITH CHECK ADD  CONSTRAINT [FK_pagoCheque_cheque] FOREIGN KEY([idCheque])
REFERENCES [dbo].[cheque] ([idCheque])
GO
ALTER TABLE [dbo].[pagoCheque] CHECK CONSTRAINT [FK_pagoCheque_cheque]
GO
/****** Object:  ForeignKey [FK_pagoCheque_pago]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pagoCheque]  WITH CHECK ADD  CONSTRAINT [FK_pagoCheque_pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[pago] ([idPago])
GO
ALTER TABLE [dbo].[pagoCheque] CHECK CONSTRAINT [FK_pagoCheque_pago]
GO
/****** Object:  ForeignKey [FK_pagoCompra_compraCabe]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pagoCompra]  WITH CHECK ADD  CONSTRAINT [FK_pagoCompra_compraCabe] FOREIGN KEY([idCompra])
REFERENCES [dbo].[compraCabe] ([idCompraCabe])
GO
ALTER TABLE [dbo].[pagoCompra] CHECK CONSTRAINT [FK_pagoCompra_compraCabe]
GO
/****** Object:  ForeignKey [FK_pagoCompra_pago]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pagoCompra]  WITH CHECK ADD  CONSTRAINT [FK_pagoCompra_pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[pago] ([idPago])
GO
ALTER TABLE [dbo].[pagoCompra] CHECK CONSTRAINT [FK_pagoCompra_pago]
GO
/****** Object:  ForeignKey [FK_pedidoCabe_cliente]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pedidoCabe]  WITH CHECK ADD  CONSTRAINT [FK_pedidoCabe_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[pedidoCabe] CHECK CONSTRAINT [FK_pedidoCabe_cliente]
GO
/****** Object:  ForeignKey [FK_pedidoItem_pedidoCabe]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_pedidoItem_pedidoCabe] FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedidoCabe] ([idPedidoCabe])
GO
ALTER TABLE [dbo].[pedidoItem] CHECK CONSTRAINT [FK_pedidoItem_pedidoCabe]
GO
/****** Object:  ForeignKey [FK_pedidoItem_producto]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_pedidoItem_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[pedidoItem] CHECK CONSTRAINT [FK_pedidoItem_producto]
GO
/****** Object:  ForeignKey [FK_pedidoItem_vendedor]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[pedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_pedidoItem_vendedor] FOREIGN KEY([idVendedor])
REFERENCES [dbo].[vendedor] ([idVendedor])
GO
ALTER TABLE [dbo].[pedidoItem] CHECK CONSTRAINT [FK_pedidoItem_vendedor]
GO
/****** Object:  ForeignKey [FK_producto_alicuotaIva]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_alicuotaIva] FOREIGN KEY([idAlicuotaIva])
REFERENCES [dbo].[alicuotaIva] ([idAlicuotaIva])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_alicuotaIva]
GO
/****** Object:  ForeignKey [FK_producto_familia]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_familia] FOREIGN KEY([idFamilia])
REFERENCES [dbo].[familia] ([idFamilia])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_familia]
GO
/****** Object:  ForeignKey [FK_proveedor_localidad]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [FK_proveedor_localidad] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [FK_proveedor_localidad]
GO
/****** Object:  ForeignKey [FK_remito_pedidoCabe]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[remito]  WITH CHECK ADD  CONSTRAINT [FK_remito_pedidoCabe] FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedidoCabe] ([idPedidoCabe])
GO
ALTER TABLE [dbo].[remito] CHECK CONSTRAINT [FK_remito_pedidoCabe]
GO
/****** Object:  ForeignKey [FK_usuarioPantalla_pantalla]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[usuarioPantalla]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPantalla_pantalla] FOREIGN KEY([idPantalla])
REFERENCES [dbo].[pantalla] ([idPantalla])
GO
ALTER TABLE [dbo].[usuarioPantalla] CHECK CONSTRAINT [FK_usuarioPantalla_pantalla]
GO
/****** Object:  ForeignKey [FK_usuarioPantalla_usuario]    Script Date: 10/30/2014 12:19:26 ******/
ALTER TABLE [dbo].[usuarioPantalla]  WITH CHECK ADD  CONSTRAINT [FK_usuarioPantalla_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuarioPantalla] CHECK CONSTRAINT [FK_usuarioPantalla_usuario]
GO
