Imports Negocio
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<System.Web.Script.Services.ScriptService()> _
Public Class servicios
    Inherits System.Web.Services.WebService
    <WebMethod()> _
    Public Function PermisosVistaAjax(ByVal prefixText As String, ByVal count As Integer) As String()
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From d In db.PermisosVistaAjax(prefixText) Select d.descripcion).ToArray()
    End Function
    <WebMethod()> _
    Public Function VistaProducto(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
        If contextKey = "" Then
            Dim strEmpty(-1) As String
            Return strEmpty
        End If
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From d In db.ProductoVistaByCodODescripcionYCliente(prefixText, Utiles.Id(contextKey)) Select d.descripcion).ToArray()
    End Function
    <WebMethod()> _
    Public Function VistaUsuarioAjax(ByVal prefixText As String, ByVal count As Integer) As String()
        Try
            Dim db As New DhermadbDataContext(SQL.Conn)
            Return (From d In db.usuarioVistaAjax(prefixText) Select d.descripcion).ToArray()
        Catch ex As Exception
            Throw ex
        End Try
    End Function
    <WebMethod()> _
    Public Function VistaComprobanteConSaldoByCliente(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
        Try
            Dim db As New DhermadbDataContext(SQL.Conn)
            Return (From d In db.usuarioVistaAjax(prefixText) Select d.descripcion).ToArray()
        Catch ex As Exception
            Throw ex
        End Try
    End Function
    '<WebMethod()> _
    'Public Function VistaCuenta(ByVal prefixText As String, ByVal count As Integer) As String()
    '    Dim dt As DataTable = Sistema.VistaCuenta(prefixText)
    '    Dim l As New List(Of String)
    '    For Each r As DataRow In dt.Rows
    '        l.Add(r.Item("descripcion").ToString())
    '    Next
    '    Return l.ToArray()
    'End Function
    <WebMethod()> _
    Public Function VistaProductoStockByDecripcion(ByVal prefixText As String, ByVal count As Integer) As String()
         Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From d In db.VistaProductoStockByDecripcion(prefixText) Select d.descripcion).ToArray()
    End Function

    <WebMethod()> _
    Public Function VistaCliente(ByVal prefixText As String, ByVal count As Integer) As String()
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From d In db.ClienteVistaPorCuitORazon(prefixText) Select d.descripcion).ToArray()
    End Function
    <WebMethod()> _
    Public Function VistaProveedor(ByVal prefixText As String, ByVal count As Integer) As String()
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From d In db.ProveedorVistaPorCuitORazon(prefixText) Select d.descripcion).ToArray()
    End Function
    <WebMethod()> _
    Public Function GetPrecioByProductoCliente(ByVal idProducto As String, ByVal idCliente As String) As String
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From l In db.listaDePreciosItems _
                Join cli In db.clientes On cli.idListaDePrecios Equals l.idListaDePrecios
                Where l.idProducto = idProducto AndAlso cli.idCliente = idCliente _
                Select l.precio).Single().ToString()
    End Function
    '<WebMethod()> _
    'Public Function VistaChequeCartera(ByVal prefixText As String, ByVal count As Integer) As String()
    '    Try
    '        Dim dt As DataTable = Sistema.VistaChequeCartera(prefixText)
    '        Dim l As New List(Of String)
    '        For Each r As DataRow In dt.Rows
    '            l.Add(r.Item("descripcion").ToString())
    '        Next
    '        Return l.ToArray()
    '    Catch ex As Exception
    '    End Try
    'End Function
    '<WebMethod()> _
    'Public Function VistaCompraSinSaldar(ByVal prefixText As String, ByVal count As Integer) As String()
    '    Dim db As New DhermadbDataContext(SQL.Conn)
    '    Return (From d In db.CompraSSaldarVista(prefixText) Select d.descripcion).ToArray()
    'End Function
    '<WebMethod()> _
    'Public Function VistaPedidoSinSaldar(ByVal prefixText As String, ByVal count As Integer) As String()
    '    Try
    '        Dim dt As DataTable = Sistema.VistaPedidoSinSaldar(prefixText)
    '        Dim l As New List(Of String)
    '        For Each r As DataRow In dt.Rows
    '            l.Add(r.Item(0).ToString())
    '        Next
    '        Return l.ToArray()
    '    Catch ex As Exception
    '    End Try
    'End Function
End Class