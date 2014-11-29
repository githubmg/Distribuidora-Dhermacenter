Imports Negocio

Public Class frmFormaDePagoEdit
    Inherits System.Web.UI.Page

    Private _FormaDePago As FormaDePago
    Public Property FormaDePago() As FormaDePago
        Get
            Return _FormaDePago
        End Get
        Set(ByVal value As FormaDePago)
            _FormaDePago = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.Request.QueryString("id") Is Nothing Then
            Dim id As Integer = CType(Me.Request.QueryString("id"), Integer)
            Me.FormaDePago = FormaDePagoBiz.getById(id)
        End If

        If Not Me.Page.IsPostBack Then
            CargarComboSiNo()
            If Not Me.FormaDePago Is Nothing Then
                Me.txtDescripcion.Text = Me.FormaDePago.descripcion
                Me.cmbSiNo.SelectedValue = Me.FormaDePago.esTarjeta
            End If
        End If
    End Sub
    Private Sub CargarComboSiNo()
        Me.cmbSiNo.Items.Add(New ListItem("No", "0"))
        Me.cmbSiNo.Items.Add(New ListItem("Si", "1"))
    End Sub
    Private Function validarForm() As Boolean
        Dim strError As String = ""
        Dim esValido As Boolean = True

        If Me.txtDescripcion.Text = "" Then
            strError += "Error: debe completar el campo Descripción.<br />"
            esValido = False
        End If
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = strError
        End If
        Return esValido
    End Function
    Private Sub cmdGuardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdGuardar.Click
        Try
            If Me.validarForm() Then
                If Me.FormaDePago Is Nothing Then
                    Me.FormaDePago = New FormaDePago
                    Me.FormaDePago.descripcion = Me.txtDescripcion.Text
                    Me.FormaDePago.esTarjeta = Me.cmbSiNo.SelectedValue
                    FormaDePagoBiz.add(Me.FormaDePago)
                    Response.Redirect("frmFormaDePago.aspx")
                Else
                    Me.FormaDePago.descripcion = Me.txtDescripcion.Text
                    Me.FormaDePago.esTarjeta = Me.cmbSiNo.SelectedValue
                    FormaDePagoBiz.update(Me.FormaDePago)
                    Response.Redirect("frmFormaDePago.aspx")
                End If
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmFormaDePago.aspx")
    End Sub

End Class