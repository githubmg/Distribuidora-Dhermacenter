Imports Negocio

Public Class frmCobroEdit
    Inherits System.Web.UI.Page
    Private _cobro As Cobro

    Public Property Cobro() As Cobro
        Get
            Return _cobro
        End Get
        Set(ByVal value As Cobro)
            _cobro = value
        End Set
    End Property
  
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarComboFormaDePago()
            CargarComboTipoTarjeta()
            MostrarTarjeta()
            Me.txtFecha.Text = Today.ToShortDateString()
        End If
    End Sub
  
    Private Sub cmdGuardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdGuardar.Click
        If Me.ValidarFormulario() Then
            Me.Cobro = New cobro
            Me.Cobro.Fecha = CType(Me.txtFecha.Text, Date)
            Me.Cobro.Importe = CType(txtImporte.Text, Double)
            Me.Cobro.idFormaPago = cmbFormaPago.SelectedValue
            Me.Cobro.observaciones = txtObservaciones.Text
            Dim strarr = txtCliente.Text.Split("-")
            Me.Cobro.idCliente = CType(strarr(0), Integer)

            If FormaDePagoBiz.getById(Me.Cobro.idFormaPago).esTarjeta = 1 Then
                Me.Cobro.codigoAutorizacion = txtCodAutorizcion.Text
                Me.Cobro.cupon = txtCupon.Text
                Me.Cobro.cuotas = txtCantidadCuotas.Text
                Me.Cobro.idTipoTarjeta = cmbTipoTarjeta.SelectedValue
            End If
            CobroBiz.add(Me.Cobro)
            CobroBiz.imputarCobro(Me.Cobro)
            Response.Redirect("frmCobro.aspx")
            End If
    End Sub
    Private Function ValidarFormulario() As Boolean
        Dim esValido As Boolean = True
        Dim msg As String = ""
        If Not IsDate(Me.txtFecha.Text) Then
            esValido = False
            msg += "La fecha no es válida.<br />"
        End If
        Dim number As Double
        If Not Double.TryParse(txtImporte.Text, number) Then
            esValido = False
            msg += "El importe debe tener el formato 00,00.<br />"
        End If
        If FormaDePagoBiz.getById(CType(cmbFormaPago.SelectedValue, Integer)).esTarjeta = 1 Then
            If txtCodAutorizcion.Text = "" Then
                esValido = False
                msg += "Ingrese el código de autorización.<br />"
            End If
            If txtCupon.Text = "" Then
                esValido = False
                msg += "Ingrese el código de cupón.<br />"
            End If
            If Not Utiles.esEntero(txtCantidadCuotas.Text) Then
                esValido = False
                msg += "Cantidad de cuotas incorrecta. Ingrese un número entero.<br />"
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
  
    Private Sub CargarComboFormaDePago()
        Me.cmbFormaPago.DataSource = FormaDePagoBiz.getAll()
        Me.cmbFormaPago.DataValueField = "idFormaDePago"
        Me.cmbFormaPago.DataTextField = "descripcion"
        Me.cmbFormaPago.DataBind()
    End Sub
    Private Sub CargarComboTipoTarjeta()
        Me.cmbTipoTarjeta.DataSource = TipoTarjetaBiz.getAll()
        Me.cmbTipoTarjeta.DataValueField = "idTipoTarjeta"
        Me.cmbTipoTarjeta.DataTextField = "descripcion"
        Me.cmbTipoTarjeta.DataBind()
    End Sub
    Private Sub cmdCancelar_Click(sender As Object, e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmCobro.aspx")
    End Sub

    Private Sub cmbFormaPago_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbFormaPago.SelectedIndexChanged
        MostrarTarjeta()
    End Sub
    Private Sub MostrarTarjeta()
        If FormaDePagoBiz.getById(cmbFormaPago.SelectedValue).esTarjeta = 1 Then
            pnlTarjeta.Visible = True
        Else
            pnlTarjeta.Visible = False
        End If
    End Sub
End Class