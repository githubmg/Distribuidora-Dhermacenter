Imports Negocio

Public Class frmTipoTarjetaEdit
    Inherits System.Web.UI.Page

    Private _TipoTarjeta As tipoTarjeta
    Public Property TipoTarjeta() As tipoTarjeta
        Get
            Return _TipoTarjeta
        End Get
        Set(ByVal value As tipoTarjeta)
            _TipoTarjeta = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.Request.QueryString("id") Is Nothing Then
            Dim id As Integer = CType(Me.Request.QueryString("id"), Integer)
            Me.TipoTarjeta = TipoTarjetaBiz.getById(id)
        End If

        If Not Me.Page.IsPostBack Then
            If Not Me.TipoTarjeta Is Nothing Then
                Me.txtDescripcion.Text = Me.TipoTarjeta.descripcion

            End If
        End If
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
                If Me.TipoTarjeta Is Nothing Then
                    Me.TipoTarjeta = New tipoTarjeta
                    Me.TipoTarjeta.descripcion = Me.txtDescripcion.Text
                    TipoTarjetaBiz.add(Me.TipoTarjeta)
                    Response.Redirect("frmTipoTarjeta.aspx")
                Else
                    Me.TipoTarjeta.descripcion = Me.txtDescripcion.Text
                    TipoTarjetaBiz.update(Me.TipoTarjeta)
                    Response.Redirect("frmTipoTarjeta.aspx")
                End If
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmTipoTarjeta.aspx")
    End Sub

End Class