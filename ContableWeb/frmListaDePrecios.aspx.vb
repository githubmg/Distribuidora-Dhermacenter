Imports Negocio
Public Class frmListaPrecios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.grilla.DataSource = ListaDePreciosBiz.getAll
        Me.grilla.DataBind()
    End Sub

    Private Sub cmdNuevo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdNuevo.Click
        Dim id = ListaDePreciosBiz.insertEmpty()
        Response.Redirect("frmListaDePreciosEdit.aspx?id=" & id)
    End Sub
End Class