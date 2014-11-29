Imports Negocio

Public Class frmRecibo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.grilla.DataSource = comprobanteCabeBiz.getAllRecibos()
        Me.grilla.DataBind()
    End Sub
    Private Sub cmdNuevo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdNuevo.Click
        Dim id = comprobanteCabeBiz.insertEmpty()
        Response.Redirect("frmReciboEdit.aspx?id=" & id)
    End Sub

End Class