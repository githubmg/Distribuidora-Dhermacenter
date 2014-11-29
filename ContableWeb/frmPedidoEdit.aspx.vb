Imports Negocio

Public Class frmPedidoEdit
    Inherits System.Web.UI.Page

    Private _pedidoCabe As PedidoCabe
    Private _pedidoItems As List(Of PedidoItem)

    Public Property PedidoCabe() As PedidoCabe
        Get
            Return _pedidoCabe
        End Get
        Set(ByVal value As PedidoCabe)
            _pedidoCabe = value
        End Set
    End Property

    Public Property PedidoItems() As List(Of PedidoItem)
        Get
            Return _pedidoItems
        End Get
        Set(ByVal value As List(Of PedidoItem))
            _pedidoItems = value
        End Set
    End Property
    Private _cobros As List(Of Cobro)
    Public Property Cobros() As List(Of Cobro)
        Get
            Return _cobros
        End Get
        Set(ByVal value As List(Of Cobro))
            _cobros = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Me.Request.QueryString("id") Is Nothing) And IsNumeric(Me.Request.QueryString("id")) Then
            Dim id As Integer = CType(Me.Request.QueryString("id"), Integer)
            Me.PedidoCabe = Sistema.ObtenerPedidoCabe(id)
        End If
        If Not Me.Page.IsPostBack Then
            CargarVistaEstado()
            CargarComboTipoOrden()
            Me.txtFecha.Text = Today.ToShortDateString()
            CargarComboVendedor()
            CargarComboMedioPago()
            CargarComboTipoTarjeta()

            Me.txtFecha.Text = Today.ToShortDateString()

            If Not Me.PedidoCabe Is Nothing Then
                'Es sólo lectura, se deshabilitan los campos.
                Me.txtFecha.Text = Me.PedidoCabe.FechaPedido.ToShortDateString()
                Me.txtCliente.Text = Me.PedidoCabe.Cliente.IdCliente & "- " & Me.PedidoCabe.Cliente.Cuit & " - " & Me.PedidoCabe.Cliente.RazonSocial
                Me.txtObservaciones.Text = Me.PedidoCabe.Observaciones
                Me.cmbEstado.SelectedValue = Me.PedidoCabe.EstadoPedido.IdEstadoPedido.ToString
                Me.cmbTipoOrden.SelectedValue = Me.PedidoCabe.TipoOrden.IdTipoOrden.ToString
                Me.PedidoItems = Sistema.ObtenerPedidoItems(Me.PedidoCabe.IdPedidoCabe)
                Me.Cobros = Sistema.ObtenerPedidoCobros(Me.PedidoCabe.IdPedidoCabe)
                'Me.lblImporte.Text = Me.PedidoCabe.Cobro.Importe
                Me.ViewState("pedidoItems") = Me.PedidoItems
                Me.grilla.DataSource = Me.PedidoItems
                Me.grilla.DataBind()
                Me.ViewState("cobros") = Me.Cobros
                Me.grillaCobros.DataSource = Me.Cobros
                Me.grillaCobros.DataBind()
                DeshabilitarEdicion()
            End If
        Else 'PAGE IS POSTBACK
            If Not Me.ViewState("pedidoItems") Is Nothing Then
                Me.PedidoItems = CType(Me.ViewState("pedidoItems"), List(Of PedidoItem))
                Me.grilla.DataSource = Me.PedidoItems
                Me.grilla.DataBind()
                CalcularTotal()
            End If
            If Not Me.ViewState("cobros") Is Nothing Then
                Me.Cobros = CType(Me.ViewState("cobros"), List(Of Cobro))
                Me.grillaCobros.DataSource = Me.Cobros
                Me.grillaCobros.DataBind()
            End If
        End If

    End Sub
    Private Sub DeshabilitarEdicion()
        pnlItemAgregar.Visible = False
        pnlCobroAgregar.Visible = False
        Me.txtFecha.Enabled = False
        Me.txtCliente.Enabled = False
        Me.txtObservaciones.Enabled = False
        Me.cmbEstado.Enabled = False
        Me.cmbTipoOrden.Enabled = False
        Me.cmbMedioPago.Enabled = False
        Me.cmdGuardar.Visible = False
        CalcularTotal()

    End Sub
    Private Sub CargarComboTipoOrden()
        Me.cmbTipoOrden.DataSource = Sistema.VistaTipoOrden
        Me.cmbTipoOrden.DataValueField = "idTipoOrden"
        Me.cmbTipoOrden.DataTextField = "descripcion"
        Me.cmbTipoOrden.DataBind()
    End Sub

    Private Sub cmdAgregar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAgregar.Click
        If ValidarItem() Then
            If Me.PedidoItems Is Nothing Then
                Me.PedidoItems = New List(Of PedidoItem)
            End If

            Dim pi As New PedidoItem
            pi.Cantidad = CType(txtCantidad.Text, Integer)
            pi.Observaciones = txtObservacionesItem.Text
            Dim arrPrecio() As String
            arrPrecio = txtProducto.Text.Split("$")
            Dim floatPre = arrPrecio(1).Replace(".", ",")
            Double.TryParse(floatPre, pi.PrecioUnitario)
            Dim strarr() As String
            strarr = txtProducto.Text.Split(" ")
            pi.Producto = Sistema.ObtenerProducto(CType(strarr(0), Integer))
            pi.Vendedor = Sistema.ObtenerVendedor(CType(cmbVendedor.SelectedValue, Integer))
            Me.PedidoItems.Add(pi)
            Me.ViewState("pedidoItems") = Me.PedidoItems
            Me.grilla.DataSource = Me.PedidoItems
            Me.grilla.DataBind()

            Me.txtCantidad.Text = ""
            Me.txtObservacionesItem.Text = ""
            Me.txtProducto.Text = ""
            CalcularTotal()
            txtProducto.Focus()
        End If
    End Sub
    Private Sub cmdGuardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdGuardar.Click
        If Me.ValidarFormulario() Then
            Dim idCliente As Integer = ObtenerId()
            If Me.PedidoCabe Is Nothing Then
                Me.PedidoCabe = New PedidoCabe
                Me.PedidoCabe.Cliente = Sistema.Obtenercliente(idCliente)
                Me.PedidoCabe.EstadoPedido = Sistema.ObtenerEstadoPedido(CType(cmbEstado.SelectedValue, Integer))
                Me.PedidoCabe.TipoOrden = Sistema.ObtenerTipoOrden(CType(cmbTipoOrden.SelectedValue, Integer))
                Me.PedidoCabe.FechaPedido = CType(Me.txtFecha.Text, Date)
                Me.PedidoCabe.Observaciones = txtObservaciones.Text
                Me.PedidoCabe.Items = Me.PedidoItems
                Me.PedidoCabe.Cobros = Me.Cobros
                If Me.PedidoCabe.TipoOrden.Descripcion = "Controlado" Then
                    Dim idFactura = Sistema.AgregarPedidoCabe(Me.PedidoCabe)
                    Response.Redirect("frmViewer.aspx?tipo=FA&id=" & idFactura.ToString)
                Else
                    Sistema.AgregarPedidoCabe(Me.PedidoCabe)
                End If
            End If
            Response.Redirect("frmPedido.aspx")
        End If
    End Sub
    Private Function ObtenerId()
        Dim partes As String() = Me.txtCliente.Text.Split(New Char() {"-"c})
        Return partes(0)
    End Function
    Private Sub myRepeater_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles grilla.ItemCommand
        If Me.Request.QueryString("id") Is Nothing Then
            'Sólo tengo que seguir los comandos cuando estoy en el ALTA y no en la visualización
            If e.CommandName = "Borrar" Then
                Me.PedidoItems.Remove(CType(Me.grilla.DataSource(e.Item.ItemIndex), PedidoItem))
                Me.ViewState("pedidoItems") = Me.PedidoItems
                Me.grilla.DataSource = Me.PedidoItems
                Me.grilla.DataBind()

            ElseIf e.CommandName = "Editar" Then
                Dim pi As PedidoItem = CType(Me.grilla.DataSource(e.Item.ItemIndex), PedidoItem)
                txtProducto.Text = CType(pi.Producto.IdProducto, String) & " - " & pi.Producto.Descripcion & " - " & pi.Producto.CodProducto & " - $" & pi.Producto.Precio
                txtObservacionesItem.Text = pi.Observaciones
                txtCantidad.Text = pi.Cantidad.ToString
                Me.PedidoItems.Remove(pi)
                Me.ViewState("pedidoItems") = Me.PedidoItems
                Me.grilla.DataSource = Me.PedidoItems
                Me.grilla.DataBind()
            End If
        End If
    End Sub

    Private Function ValidarItem() As Boolean
        Dim esValido As Boolean = True
        Dim msg As String = ""
        If Me.txtCantidad.Text = "" Then
            esValido = False
            msg += "Error. Debe ingresar una cantidad.<br />"
        End If
        Dim inte As Integer
        If Not Integer.TryParse(txtCantidad.Text, inte) Then
            esValido = False
            msg += "Error. La cantidad debe ser un número entero.<br />"
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
            Me.divErrorItem.Visible = True
            Me.lblErrorItem.Text = msg
        Else
            Me.divErrorItem.Visible = False
            Me.lblErrorItem.Text = ""
        End If
        Return esValido

    End Function

    Private Sub CargarVistaEstado()
        Me.cmbEstado.DataSource = Sistema.VistaEstadoPedido()
        Me.cmbEstado.DataValueField = "idEstadoPedido"
        Me.cmbEstado.DataTextField = "descripcion"
        Me.cmbEstado.DataBind()
    End Sub

    Private Function ValidarFormulario() As Boolean
        Dim esValido As Boolean = True
        Dim msg As String = ""

        If Not IsDate(Me.txtFecha.Text) Then
            esValido = False
            msg += "La fecha no es válida.<br />"
        End If
        If Me.PedidoItems Is Nothing Then
            esValido = False
            msg += "Debe ingresar al menos un item para el pedido.<br />"
        Else
            If Me.PedidoItems.Count = 0 Then
                esValido = False
                msg += "Debe ingresar al menos un item para el pedido.<br />"
            End If
        End If
        Dim dou As Double
        If Not Double.TryParse(lblImporte.Text, dou) Then
            esValido = False
            msg += "Error. El importe debe tener el formato $00,00.<br />"
        End If
        If Me.txtCliente.Text = "" Then
            esValido = False
            msg += "Error. Debe seleccionar un cliente.<br />"
        End If
        If Me.cmbMedioPago.SelectedValue = 4 Then
            Dim tar As New Tarjeta
            tar.Numero = txtNroTarjeta.Text
            If tar.Validar = Tarjeta.CreditCardTypes.Invalid Or Not tar.ValidacionLuhn Then
                esValido = False
                msg += "Error. Introduzca un número válido de tarjeta de crédito.<br />"
            End If
        End If
        Dim totalCobros As Double = 0
        For Each Cobro In Cobros
            totalCobros += Cobro.Importe
        Next
        If totalCobros <> CType(lblImporte.Text, Double) Then
            esValido = False
            msg += "Error. El total abonado con los distintos medios de pago ($" & totalCobros & ") debe ser igual al importe total($" & lblImporte.Text & "). <br />"
        End If
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = msg
        Else
            Me.divErrorForm.Visible = False
            Me.lblErrorForm.Text = ""
        End If
        Return esValido

    End Function

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmPedido.aspx")
    End Sub

    Private Sub CargarComboVendedor()
        Me.cmbVendedor.DataSource = Sistema.VistaVendedor()
        Me.cmbVendedor.DataTextField = "descripcion"
        Me.cmbVendedor.DataValueField = "idVendedor"
        Me.cmbVendedor.DataBind()
    End Sub
    Private Sub CargarComboMedioPago()
        Me.cmbMedioPago.DataSource = Sistema.VistaMedioPago()
        Me.cmbMedioPago.DataTextField = "descripcion"
        Me.cmbMedioPago.DataValueField = "idMedioPago"
        Me.cmbMedioPago.DataBind()
    End Sub
    Private Sub CargarComboTipoTarjeta()
        Me.cmbTipoTarjeta.DataSource = Sistema.VistaTipoTarjeta()
        Me.cmbTipoTarjeta.DataTextField = "descripcion"
        Me.cmbTipoTarjeta.DataValueField = "idTipoTarjeta"
        Me.cmbTipoTarjeta.DataBind()
    End Sub
    Private Sub cmbMedioPago_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cmbMedioPago.SelectedIndexChanged
        If cmbMedioPago.SelectedValue = "4" Then
            panelTarjeta.Visible = True
        Else
            panelTarjeta.Visible = False
        End If
    End Sub

    Private Sub cmdAgregarCobro_Click(sender As Object, e As System.EventArgs) Handles cmdAgregarCobro.Click
        If ValidarCobro() Then
            If Me.Cobros Is Nothing Then
                Me.Cobros = New List(Of Cobro)
            End If
            Dim cobro As New Cobro
            Dim importeFloat = txtImporteCobro.Text.Replace(".", ",")
            cobro.Importe = CType(importeFloat, Double)
            cobro.Fecha = Date.Now
            cobro.MedioPago = Sistema.ObtenerMedioPago(CType(cmbMedioPago.SelectedValue, Integer))
            cobro.Observaciones = txtObservaciones.Text
            If Me.cmbMedioPago.SelectedValue = 4 Then
                Dim tar As New Tarjeta
                tar.Nombre = txtNombreTarjeta.Text
                tar.Numero = txtNroTarjeta.Text
                tar.TipoTarjeta = Sistema.ObtenerTipoTarjeta(CInt(cmbTipoTarjeta.SelectedValue))
                tar.FechaVencimiento = New Date(CInt(txtAnioTarjeta.Text) + 2000, CInt(txtMesTarjeta.Text), 1)
                tar.CodigoSeguridad = txtCodSeguridad.Text
                cobro.Tarjeta = tar
            End If
            Me.Cobros.Add(cobro)
            Me.ViewState("cobros") = Me.Cobros
            Me.grillaCobros.DataSource = Me.Cobros
            Me.grillaCobros.DataBind()

        End If
    End Sub
    Private Function ValidarCobro() As Boolean
        Dim esValido As Boolean = True
        Dim msg = ""
        If Me.cmbMedioPago.SelectedValue = 4 Then
            Dim tar As New Tarjeta
            tar.Numero = txtNroTarjeta.Text
            If tar.Validar = Tarjeta.CreditCardTypes.Invalid Or Not tar.ValidacionLuhn Then
                esValido = False
                msg += "Error. Introduzca un número válido de tarjeta de crédito.<br />"
            End If
            If txtAnioTarjeta.Text <> "" And txtMesTarjeta.Text <> "" Then
                If Date.Today.Year.ToString.Substring(2, 2) > CType(txtAnioTarjeta.Text, Integer) Or (Date.Today.Year.ToString.Substring(2, 2) = CType(txtAnioTarjeta.Text, Integer) And Date.Today.Month > CType(txtMesTarjeta.Text, Integer)) Then
                    esValido = False
                    msg += "Error. La tarjeta ingresada se encuentra vencida.<br />"
                End If
            End If
        End If
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = msg
        Else
            Me.divErrorForm.Visible = False
            Me.lblErrorForm.Text = ""
        End If
        Return esValido
    End Function

    Private Sub grillaCobros_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles grillaCobros.ItemCommand
        If Me.Request.QueryString("id") Is Nothing Then
            'Sólo tengo que seguir los comandos cuando estoy en el ALTA y no en la visualización
            If e.CommandName = "Borrar" Then
                Me.Cobros.Remove(CType(Me.grillaCobros.DataSource(e.Item.ItemIndex), Cobro))
                Me.ViewState("cobros") = Me.Cobros
                Me.grillaCobros.DataSource = Me.Cobros
                Me.grillaCobros.DataBind()
            End If
        End If
    End Sub

    Private Sub cmbTipoOrden_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cmbTipoOrden.SelectedIndexChanged
        CalcularTotal()
    End Sub
    Private Sub CalcularTotal()
        Dim subtotal As Double
        If Me.cmbTipoOrden.SelectedValue.ToString = "1" Then
            For Each pi In Me.PedidoItems
                subtotal += pi.PrecioUnitario * pi.Cantidad * (1 + pi.Producto.AlicuotaIva.Valor / 100)
            Next
        Else
            For Each pi In Me.PedidoItems
                subtotal += pi.PrecioUnitario * pi.Cantidad
            Next
        End If
        lblImporte.Text = String.Format("{0:0.00}", subtotal)
    End Sub
End Class