Imports Negocio

Public Class frmUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.grilla.DataSource = UsuarioBiz.getAll
        Me.grilla.DataBind()
    End Sub
    Private Sub cmdNuevo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdNuevo.Click
        Response.Redirect("frmUsuarioEdit.aspx")
    End Sub
    Private Sub myRepeater_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles grilla.ItemCommand
        If e.CommandName = "Borrar" Then
            UsuarioBiz.delete(CType(e.CommandArgument.ToString, Integer))
            Me.grilla.DataSource = UsuarioBiz.getAll()
            Me.grilla.DataBind()
        End If
    End Sub
End Class