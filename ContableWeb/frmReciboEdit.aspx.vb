Imports Negocio

Public Class frmReciboEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.IsPostBack Then
            CargarPagina()
        End If
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
        rptFormasDePago.DataSource = CobroBiz.getByComrpobante(IdQS())
        rptFormasDePago.DataBind()
    End Sub
    Private Sub CargarPagina()
        Me.txtFecha.Text = Today.ToShortDateString()
        CargarComboTipoOrden()
        CargarComboTipoTarjeta()
        rptFormasDePago.DataSource = CobroBiz.getByComrpobante(IdQS())
        rptFormasDePago.DataBind()
        If txtCliente.Text <> "" Then
            rptComprobantesAsociados.DataSource = comprobanteCabeBiz.getComprobantesAsociadosByComprobanteClienteyTipo(IdQS(), Utiles.Id(txtCliente.Text), cmbTipoOrden.SelectedValue)
            rptComprobantesAsociados.DataBind()
            rptComprobantesParaAsociar.DataSource = comprobanteCabeBiz.getComprobantesParaAsociarByClienteyTipo(Utiles.Id(txtCliente.Text), cmbTipoOrden.SelectedValue)
            rptComprobantesParaAsociar.DataBind()
        End If
    End Sub
    Private Sub CargarComboTipoTarjeta()
        Me.cmbTipoTarjeta.DataSource = TipoTarjetaBiz.getAll()
        Me.cmbTipoTarjeta.DataTextField = "descripcion"
        Me.cmbTipoTarjeta.DataValueField = "idTipoTarjeta"
        Me.cmbTipoTarjeta.DataBind()
    End Sub
    Private Function IdQS() As Integer
        If Not Request.QueryString("id") Is Nothing Then
            Return CType(Request.QueryString("id"), Integer)
        Else
            Response.Redirect("frmComprobante.aspx")
        End If
    End Function
    Private Sub CargarComboTipoOrden()
        Me.cmbTipoOrden.DataSource = TipoOrdenBiz.getAll()
        Me.cmbTipoOrden.DataTextField = "descripcion"
        Me.cmbTipoOrden.DataValueField = "idTipoOrden"
        Me.cmbTipoOrden.DataBind()
    End Sub

    Private Sub cmdVerComprobantes_Click(sender As Object, e As EventArgs) Handles cmdVerComprobantes.Click
        rptComprobantesAsociados.DataSource = comprobanteCabeBiz.getComprobantesAsociadosByComprobanteClienteyTipo(IdQS(), Utiles.Id(txtCliente.Text), cmbTipoOrden.SelectedValue)
        rptComprobantesAsociados.DataBind()
        rptComprobantesParaAsociar.DataSource = comprobanteCabeBiz.getComprobantesParaAsociarByClienteyTipo(Utiles.Id(txtCliente.Text), cmbTipoOrden.SelectedValue)
        rptComprobantesParaAsociar.DataBind()
    End Sub
End Class