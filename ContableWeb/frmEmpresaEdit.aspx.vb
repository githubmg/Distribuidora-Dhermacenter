Imports Negocio
Public Class frmEmpresaEdit
    Inherits System.Web.UI.Page

    Private _Empresa As Empresa
    Public Property Empresa() As Empresa
        Get
            Return _Empresa
        End Get
        Set(ByVal value As Empresa)
            _Empresa = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.Request.QueryString("id") Is Nothing Then
            Dim id As Integer = CType(Me.Request.QueryString("id"), Integer)
            Me.Empresa = EmpresaBiz.getById(id)
        End If

        If Not Me.Page.IsPostBack Then
            If Not Me.Empresa Is Nothing Then
                Me.txtDescripcion.Text = Me.Empresa.Descripcion
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
                If Me.Empresa Is Nothing Then
                    Me.Empresa = New Empresa
                    Me.Empresa.Descripcion = Me.txtDescripcion.Text
                    EmpresaBiz.add(Me.Empresa)
                    Response.Redirect("frmEmpresa.aspx")
                Else
                    Me.Empresa.Descripcion = Me.txtDescripcion.Text
                    EmpresaBiz.update(Me.Empresa)
                    Response.Redirect("frmEmpresa.aspx")
                End If
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmEmpresa.aspx")
    End Sub


End Class