Imports Negocio
Public Class frmVendedores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.grilla.DataSource = VendedorBiz.getAll
        Me.grilla.DataBind()
    End Sub

    Private Sub cmdNuevo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdNuevo.Click
        Response.Redirect("frmVendedoresEdit.aspx")
    End Sub

End Class