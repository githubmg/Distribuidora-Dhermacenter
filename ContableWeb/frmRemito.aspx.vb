Imports Negocio
Imports Microsoft.Reporting.WebForms

Public Class frmRemito
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Me.grilla.DataSource = Sistema.VistaRemitoObj
            Me.grilla.DataBind()
    End Sub

    Private Sub grilla_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles grilla.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim rc As RemitoVistaClass = (CType(Me.grilla.DataSource(e.Item.ItemIndex), RemitoVistaClass))
            If Not rc.Factura.Trim.ToLower = "pendiente" Then
                Dim ch As CheckBox = e.Item.FindControl("chkFacturar")
                ch.Enabled = False
            End If
        End If
    End Sub

    Protected Sub cmdGenerarFactura_Click(ByVal sender As Object, ByVal e As EventArgs) Handles cmdGenerarFactura.Click
        Dim a = hfSeleccionados.Value
        If ValidarFacturacion() Then
            Dim factura As New Factura
            Dim listaRemitos As New List(Of Remito)
            factura.Fecha = Date.Now
            factura.Observaciones = txtObservaciones.Text
            For Each it In grilla.Items
                If it.ItemType = ListItemType.Item Or it.ItemType = ListItemType.AlternatingItem Then
                    Dim ch As CheckBox = it.FindControl("chkFacturar")
                    If ch.Checked Then
                        Dim hf As HiddenField = it.FindControl("hfID")
                        listaRemitos.Add(Sistema.ObtenerRemito(hf.Value))
                    End If
                End If
            Next
            factura.Remitos = listaRemitos
            If ValidarFactura(factura) Then
                Dim idFactura = Sistema.AgregarFactura(factura)
                Response.Redirect("frmViewer.aspx?tipo=FA&id=" & idFactura.ToString)
            End If
        End If
    End Sub
    Protected Function ValidarFactura(ByVal factura As Factura) As Boolean
        Dim strError As String = ""
        Dim esValido As Boolean = True
        Dim cuitCliente As Long = factura.Remitos(0).Pedido.Cliente.Cuit
        For Each r As Remito In factura.Remitos
            If r.Pedido.Cliente.Cuit <> cuitCliente Then
                esValido = False
            End If
        Next
        If Not esValido Then
            strError += "Error: todos los remitos seleccionados deben pertenecer al mismo cliente.<br />"
        End If
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = strError
        End If
        Return esValido
    End Function
    Protected Function ValidarFacturacion() As Boolean
        Dim strError As String = ""
        Dim esValido As Boolean = False
        For Each it In grilla.Items
            If it.ItemType = ListItemType.Item Or it.ItemType = ListItemType.AlternatingItem Then
                Dim ch As CheckBox = it.FindControl("chkFacturar")
                If ch.Checked Then
                    esValido = True
                    Exit For
                End If
            End If
        Next
        If Not esValido Then
            strError += "Error: debe seleccionar al menos un remito para facturar.<br />"
        End If
        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = strError
        End If
        Return esValido
    End Function
    Protected Sub Check_Changed(ByVal sender As Object, ByVal e As EventArgs)
        Dim id = CType(sender, CheckBox).InputAttributes("value")

    End Sub
End Class