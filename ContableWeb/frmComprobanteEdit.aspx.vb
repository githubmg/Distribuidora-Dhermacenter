Imports Negocio
Partial Public Class frmComprobante
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.IsPostBack Then
            CargarPagina()
        End If
    End Sub
    Private Sub CargarPagina()
        Me.txtFecha.Text = Today.ToShortDateString()
        CargarComboVendedor()
        CargarComboTipoOrden()
        CargarComboFormaDePago()
        CargarComboTipoTarjeta()
        Dim comprobante = comprobanteCabeBiz.getById(IdQS())
        If Not comprobante.idCliente = 0 Then
            cmbTipoComprobante.SelectedValue = comprobante.tipo
            txtCliente.Text = ClienteBiz.getTextBoxById(comprobante.idCliente)
            txtFecha.Text = comprobante.fecha.ToString
            cmbVendedor.SelectedValue = comprobante.idVendedor
            cmbCondicionVenta.SelectedValue = comprobante.condicionVenta
            cmbTipoOrden.SelectedValue = comprobante.idTipoOrden
            hdfSoloLectura.Value = "si"
            DesctivarEdicion()
        End If
        grilla.DataSource = comprobante.comprobanteItems
        grilla.DataBind()
        grilla2.DataSource = CobroBiz.getByComrpobante(IdQS())
        grilla2.DataBind()
    End Sub
    Private Sub DesctivarEdicion()
        txtCliente.Enabled = False
        txtFecha.Enabled = False
        cmbVendedor.Enabled = False
        cmbCondicionVenta.Enabled = False
        cmbTipoOrden.Enabled = False
        pnlAgregarCobro.Visible = False
        pnlAgregarItem.Visible = False
        cmbTipoComprobante.Enabled = False
        txtDescuentoGlobal.Enabled = False
        cmdGuardar.Enabled = False
        cmdCancelar.Text = "Volver"
    End Sub
    Private Sub CargarComboTipoTarjeta()
        Me.cmbTipoTarjeta.DataSource = TipoTarjetaBiz.getAll()
        Me.cmbTipoTarjeta.DataTextField = "descripcion"
        Me.cmbTipoTarjeta.DataValueField = "idTipoTarjeta"
        Me.cmbTipoTarjeta.DataBind()
    End Sub
    Private Sub CargarComboFormaDePago()
        Me.cmbFormaPago.DataSource = FormaDePagoBiz.getAll()
        Me.cmbFormaPago.DataTextField = "descripcion"
        Me.cmbFormaPago.DataValueField = "idFormaDePago"
        Me.cmbFormaPago.DataBind()
    End Sub
    Private Sub CargarComboTipoOrden()
        Me.cmbTipoOrden.DataSource = TipoOrdenBiz.getAll()
        Me.cmbTipoOrden.DataTextField = "descripcion"
        Me.cmbTipoOrden.DataValueField = "idTipoOrden"
        Me.cmbTipoOrden.DataBind()
    End Sub
    Private Sub CargarComboVendedor()
        Me.cmbVendedor.DataSource = VendedorBiz.getAll()
        Me.cmbVendedor.DataTextField = "descripcion"
        Me.cmbVendedor.DataValueField = "idVendedor"
        Me.cmbVendedor.DataBind()
    End Sub
    Private Function IdQS() As Integer
        If Not Request.QueryString("id") Is Nothing Then
            Return CType(Request.QueryString("id"), Integer)
        Else
            Response.Redirect("frmComprobante.aspx")
        End If
    End Function
    Private Function ValidarForm() As Boolean
        Dim esValido As Boolean = True
        Dim strError As String = ""
        If Not IsDate(Me.txtFecha.Text) Then
            strError += "La fecha de emisión debe ser una fecha válida. <br />"
            esValido = False
        End If
        Try
            Dim cliente = ClienteBiz.getById(Utiles.Id(txtCliente.Text))
        Catch ex As Exception
            strError += "Error. Seleccione un cliente válido. <br />"
            esValido = False
        End Try
        If cmbCondicionVenta.SelectedValue = "CD" Then
            If Not comprobanteCabeBiz.validarPagoIgualItems(IdQS()) Then
                strError += "Error. La suma de los ítems debe igualar a la suma de los pagos. <br />"
                esValido = False
            End If
        End If
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = strError
        End If
        Return esValido
    End Function

    Private Function ValidarItem() As Boolean
        Dim esValido As Boolean = True
        Dim strError As String = ""
        Try
            Dim prod = ProductoBiz.getById(Utiles.Id(txtProducto.Text))
        Catch ex As Exception
            If cmbTipoComprobante.SelectedValue = "F" Then
                strError += "Error. Seleccione un producto válido. <br />"
                esValido = False
            End If
        End Try
        If Not Utiles.esEntero(txtCantidadItem.Text) Then
            strError += "Error. Seleccione una cantidad válida. <br />"
            esValido = False
        End If
        If Not txtDescuento.Text = "" Then
            If Not Utiles.esDouble(txtDescuento.Text) Then
                strError += "Error. Ingrese un descuento válido. <br />"
                esValido = False
            End If
        End If
        If Not esValido Then
            Me.divErrorItem.Visible = True
            Me.lblErrorItem.Text = strError
        End If
        Return esValido
    End Function

    Private Sub cmdAgregar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAgregar.Click
        Try

            If ValidarItem() Then
                Dim i As New comprobanteItem
                i.idComprobante = IdQS()
                If txtProducto.Text <> "" Then
                    i.idProducto = Utiles.Id(txtProducto.Text)
                End If
                i.cantidad = CType(Me.txtCantidadItem.Text, Double)
                i.precioUnitario = CType(Me.txtPrecioUnitarioItem.Text, Double)
                If txtDescuento.Text = "" Then
                    If txtDescuentoGlobal.Text <> "" Then
                        i.descuento = CType(Me.txtDescuentoGlobal.Text, Double)
                    Else
                        i.descuento = 0
                    End If
                Else
                    i.descuento = CType(Me.txtDescuento.Text, Double)
                End If
                i.descripcion = txtDescripcion.Text
                ComprobanteItemBiz.add(i)
                Me.grilla.DataSource = ComprobanteItemBiz.getByIdComprobante(IdQS())
                Me.grilla.DataBind()

                Me.txtProducto.Text = ""
                Me.txtCantidadItem.Text = ""
                Me.txtPrecioUnitarioItem.Text = ""
                Me.txtDescuento.Text = ""
                Me.txtDescripcion.Text = ""

                Me.divErrorItem.Visible = False
                Me.lblErrorItem.Text = ""

            End If

        Catch ex As Exception
            Me.divErrorItem.Visible = True
            Me.lblErrorItem.Text = ex.Message
        End Try
    End Sub

    Sub myRepeater_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles grilla.ItemCommand
        If hdfSoloLectura.Value <> "si" Then
            If e.CommandName = "Borrar" Then
                ComprobanteItemBiz.delete(CType(Me.grilla.DataSource(e.Item.ItemIndex), comprobanteItem).idComprobanteItem)
                Me.grilla.DataSource = ComprobanteItemBiz.getByIdComprobante(IdQS())
                Me.grilla.DataBind()
            End If
        End If
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmComprobante.aspx")
    End Sub

    Private Sub cmdGuardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdGuardar.Click
        Try
            If Me.ValidarForm Then
                Dim comprobante As New comprobanteCabe
                Dim cliente = ClienteBiz.getById(Utiles.Id(txtCliente.Text))
                comprobante.condicionVenta = cmbCondicionVenta.SelectedValue
                comprobante.fecha = CType(txtFecha.Text, Date)
                comprobante.idCliente = cliente.idCliente
                comprobante.idListaPrecio = cliente.idListaDePrecios
                comprobante.idTipoOrden = cmbTipoOrden.Text
                comprobante.idVendedor = cmbVendedor.Text
                comprobante.letra = cliente.condicionIva.letra
                comprobante.tipo = cmbTipoComprobante.SelectedValue
                comprobante.idComprobante = IdQS()
                comprobanteCabeBiz.update(comprobante)
                Response.Redirect("frmComprobante.aspx")
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmbCondicionVenta_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCondicionVenta.SelectedIndexChanged
            up2.Visible = (cmbCondicionVenta.SelectedValue = "CD")
    End Sub

    Private Sub cmbFormaPago_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbFormaPago.SelectedIndexChanged
        Dim fp = FormaDePagoBiz.getById(cmbFormaPago.SelectedValue)
        pnlTarjeta.Visible = (fp.esTarjeta = 1)
    End Sub

    Private Sub cmdAgregarFormaDePago_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAgregarFormaDePago.Click
        Dim c As New cobro
        c.idComprobante = IdQS()
        c.fecha = CType(txtFecha.Text, Date)
        c.idFormaPago = cmbFormaPago.SelectedValue
        c.importe = CType(txtImporte.Text, Double)
        If FormaDePagoBiz.getById(CInt(cmbFormaPago.SelectedValue)).esTarjeta Then
            c.idTipoTarjeta = cmbTipoTarjeta.SelectedValue
            c.tarjetaCuotas = txtCuotas.Text
            c.tarjetaAutorizacion = txtAutorizacion.Text
            c.tarjetaCupon = txtCupon.Text
        End If
        CobroBiz.add(c)
        grilla2.DataSource = CobroBiz.getByComrpobante(IdQS())
        grilla2.DataBind()
    End Sub

    Private Sub grilla2_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles grilla2.ItemCommand
        If hdfSoloLectura.Value <> "si" Then
            If e.CommandName = "Borrar" Then
                CobroBiz.delete(CType(Me.grilla2.DataSource(e.Item.ItemIndex), cobro).idCobro)
                Me.grilla2.DataSource = ComprobanteItemBiz.getByIdComprobante(IdQS())
                Me.grilla2.DataBind()
            End If
        End If
    End Sub
End Class