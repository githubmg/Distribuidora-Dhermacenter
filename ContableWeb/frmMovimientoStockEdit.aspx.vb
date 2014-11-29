Imports Negocio

Public Class frmMovimientoStockEdit
    Inherits System.Web.UI.Page

    Private _movimientoStock As MovimientoStock
    Public Property MovimientoStock() As MovimientoStock
        Get
            Return _movimientoStock
        End Get
        Set(ByVal value As MovimientoStock)
            _movimientoStock = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Me.Request.QueryString("idMovimientoStock") Is Nothing) And IsNumeric(Me.Request.QueryString("idMovimientoStock")) Then
            Dim id As Integer = CType(Me.Request.QueryString("idMovimientoStock"), Integer)
            Me.MovimientoStock = Sistema.ObtenerMovimientoStock(id)
        End If
        If Not Me.Page.IsPostBack Then
           
            Me.txtFecha.Text = Today.ToShortDateString()
            CargarComboTipoMovimiento()
            If Not Me.MovimientoStock Is Nothing Then
                Me.txtFecha.Text = Me.MovimientoStock.Fecha.ToShortDateString()
                Me.txtProducto.Text = CType(Me.MovimientoStock.Producto.IdProducto, String) & " - " & Me.MovimientoStock.Producto.Descripcion & " - " & Me.MovimientoStock.Producto.CodProducto & " - $" & Me.MovimientoStock.Producto.Precio
                Me.txtCantidad.Text = Me.MovimientoStock.Cantidad.ToString
            End If
        End If
    End Sub
    Private Sub cmdGuardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdGuardar.Click
        Try

            If Me.ValidarFormulario() Then
                If Me.MovimientoStock Is Nothing Then
                    Me.MovimientoStock = New MovimientoStock
                    Me.MovimientoStock.Cantidad = CType(txtCantidad.Text, Double)
                    Me.MovimientoStock.Fecha = CType(txtFecha.Text, Date)
                    Dim strarr As String() = txtProducto.Text.Split("-")
                    Me.MovimientoStock.Producto = Sistema.ObtenerProducto(CType(strarr(0), Integer))
                    Me.MovimientoStock.TipoMovimiento = Sistema.ObtenerTipoMovimiento(CType(cmbTipoMovimiento.SelectedValue, Integer))
                    Sistema.AgregarMovimientoStock(Me.MovimientoStock)
                    Response.Redirect("frmMovimientoStock.aspx")
                Else
                    Me.MovimientoStock.Cantidad = CType(txtCantidad.Text, Double)
                    Me.MovimientoStock.Fecha = CType(txtFecha.Text, Date)
                    Dim strarr As String()
                    strarr = txtProducto.Text.Split("-")
                    Me.MovimientoStock.Producto = Sistema.ObtenerProducto(CType(strarr(0), Integer))
                    Me.MovimientoStock.TipoMovimiento = Sistema.ObtenerTipoMovimiento(CType(cmbTipoMovimiento.SelectedValue, Integer))
                    Sistema.ActualizarMovimientoStock(Me.MovimientoStock)
                    Response.Redirect("frmMovimientoStock.aspx")
                End If
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub
    Private Function ValidarFormulario() As Boolean
        Dim esValido As Boolean = True
        Dim msg As String = ""
        If Not IsDate(Me.txtFecha.Text) Then
            esValido = False
            msg += "La fecha no es válida.<br />"
        End If
        Dim number As Double
        If Not Double.TryParse(txtCantidad.Text, number) Then
            esValido = False
            msg += "La cantidad debe tener el formato 00,00.<br />"
        Else
            If CType(txtCantidad.Text, Double) <= 0 Then
                esValido = False
                msg += "La cantidad debe ser mayor que 0.<br />"
            End If
        End If
        Try
            Dim strarr As String() = txtProducto.Text.Split("-")
            Dim prod = Sistema.ObtenerProducto(CType(strarr(0), Integer))
            If prod Is Nothing Then
                esValido = False
                msg += "Debe seleccionar un producto.<br />"
            End If
        Catch ex As Exception
            esValido = False
            msg += "Debe seleccionar un producto.<br />"
        End Try
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = msg
        Else
            Me.divErrorForm.Visible = False
            Me.lblErrorForm.Text = ""
        End If
        Return esValido

    End Function
    Private Sub CargarComboTipoMovimiento()
        Me.cmbTipoMovimiento.DataSource = Sistema.VistaTipoMovimiento()
        Me.cmbTipoMovimiento.DataValueField = "idTipoMovimiento"
        Me.cmbTipoMovimiento.DataTextField = "descripcion"
        Me.cmbTipoMovimiento.DataBind()
    End Sub
    Private Sub CargarComboOrigen()
        Me.cmbOrigen.DataSource = Sistema.VistaUbicacionStock()
        Me.cmbOrigen.DataValueField = "idUbicacionStock"
        Me.cmbOrigen.DataTextField = "descripcion"
        Me.cmbOrigen.DataBind()
    End Sub
    Private Sub CargarComboDestino()
        Me.cmbDestino.DataSource = Sistema.VistaUbicacionStock()
        Me.cmbDestino.DataValueField = "idUbicacionStock"
        Me.cmbDestino.DataTextField = "descripcion"
        Me.cmbDestino.DataBind()
    End Sub
    Private Sub CargarComboUbicacion()
        Me.cmbUbicacionStock.DataSource = Sistema.VistaUbicacionStock()
        Me.cmbUbicacionStock.DataValueField = "idUbicacionStock"
        Me.cmbUbicacionStock.DataTextField = "descripcion"
        Me.cmbUbicacionStock.DataBind()
    End Sub
    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmMovimientoStock.aspx")
    End Sub

End Class