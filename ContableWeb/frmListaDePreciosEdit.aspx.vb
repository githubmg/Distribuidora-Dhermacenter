Imports Negocio

Public Class frmListaDePreciosEdit
    Inherits System.Web.UI.Page
    Private _listaDePrecios As listaDePrecio
    Public Property listaDePrecio() As listaDePrecio
        Get
            Return _listaDePrecios
        End Get
        Set(ByVal value As listaDePrecio)
            _listaDePrecios = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Me.Request.QueryString("id") Is Nothing Then
                Dim id As Integer = CType(Me.Request.QueryString("id"), Integer)
                Me.listaDePrecio = ListaDePreciosBiz.getById(id)
            Else
                Response.Redirect("frmListaDePrecios.aspx")
            End If
        If Not Page.IsPostBack Then
            txtDescripcion.Text = listaDePrecio.descripcion
            grilla.DataSource = Me.listaDePrecio.listaDePreciosItems
            grilla.DataBind()
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
    Private Function validarItem() As Boolean
        Dim strError As String = ""
        Dim esValido As Boolean = True
        Try
            ProductoBiz.getById(Utiles.Id(txtProducto.Text))
        Catch ex As Exception
            strError += "Error: seleccione un producto válido.<br />"
            esValido = False
        End Try
        If Not Utiles.esDouble(txtPrecio.Text) Then
            strError += "Error: ingrese un precio válido.<br />"
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
                Me.listaDePrecio.descripcion = Me.txtDescripcion.Text
                ListaDePreciosBiz.update(Me.listaDePrecio)
                Response.Redirect("frmListaDePrecios.aspx")
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmdAgregar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAgregar.Click
        If validarItem Then
            ListaDePreciosBiz.addItem(Me.listaDePrecio.idListaDePrecios, Utiles.Id(txtProducto.Text), txtCodProducto.Text, CType(txtPrecio.Text, Double))
            grilla.DataSource = Me.listaDePrecio.listaDePreciosItems
            grilla.DataBind()
        End If
    End Sub

    Private Sub grilla_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles grilla.ItemCommand
        If e.CommandName = "Borrar" Then
            ListaDePreciosBiz.deleteItem(e.CommandArgument)
            grilla.DataSource = Me.listaDePrecio.listaDePreciosItems
            grilla.DataBind()
        End If
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmListaDePrecios.aspx")
    End Sub
End Class