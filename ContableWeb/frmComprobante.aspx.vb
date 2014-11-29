Imports Negocio

Public Class frmComprobante1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.grilla.DataSource = comprobanteCabeBiz.getAllMenosRecibos()
        Me.grilla.DataBind()
    End Sub

    Private Sub cmdNuevo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdNuevo.Click
        Dim id = comprobanteCabeBiz.insertEmpty()
        Response.Redirect("frmComprobanteEdit.aspx?id=" & id)
    End Sub

End Class