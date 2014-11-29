Imports Negocio
Public Class frmUsuarioPantalla
    Inherits System.Web.UI.Page
    Private _pantallas As List(Of usuarioPantalla)
    Private _usuario As Usuario

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.IsPostBack Then
            CargarComboSiNo()
        End If
    End Sub
    Private Function ValidarFormulario() As Boolean
        Dim msgError As String = ""
        Dim esValido As Boolean = True
        Dim strarr() As String
        strarr = txtUsuario.Text.Split(" ")
        If Not Me.txtUsuario.Text = "" Then
            If Not IsNumeric(strarr(0)) Then
                msgError += "Error debe seleccionar un usuario.<br />"
                esValido = False
            Else
                Dim u As usuario = UsuarioBiz.getById(CType(strarr(0), Integer))
                If u Is Nothing Then
                    msgError += "Error debe seleccionar un usuario.<br />"
                    esValido = False
                End If
            End If
        Else
            msgError += "Error debe seleccionar un usuario.<br />"
            esValido = False
        End If

        If Not esValido Then
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = msgError
        Else
            Me.divErrorForm.Visible = False
            Me.lblErrorForm.Text = ""
        End If

        Return esValido
    End Function

    Private Sub cmdAgregar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAgregar.Click
        If ValidarItem() Then
            Dim strarr() As String
            strarr = txtPermisos.Text.Split(" ")
            Dim strarrus() As String
            strarrus = txtUsuario.Text.Split(" ")

            PantallaBiz.addUsuarioPantalla(strarrus(0), strarr(0), cmbSiNo.SelectedValue)
            Me.grilla.DataSource = PantallaBiz.getUsuarioPantallaByUsuario(strarrus(0))
            Me.grilla.DataBind()
            txtPermisos.Text = ""
            cmbSiNo.SelectedValue = "0"
        End If
    End Sub
    Private Sub cmdVerValores_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdVerPermisos.Click
        If ValidarFormulario() Then
            Dim strarr() As String
            strarr = txtUsuario.Text.Split(" ")
            Me.grilla.DataSource = PantallaBiz.getUsuarioPantallaByUsuario(strarr(0))
            Me.grilla.DataBind()
            Permisos.Visible = True
        Else
            Permisos.Visible = False
        End If

    End Sub
    Private Function ValidarItem() As Boolean
        Dim esValido As Boolean = True
        Dim msg As String = ""
        Dim strarr() As String
        strarr = txtPermisos.Text.Split(" ")
        Dim strarrus() As String
        strarrus = txtUsuario.Text.Split(" ")
        Dim inte As Integer
        Dim pantallas = PantallaBiz.getUsuarioPantallaByUsuario(strarrus(0))
        If Not Integer.TryParse(strarr(0), inte) Then
            esValido = False
            msg += "Debe seleccionar una permiso.<br />"
        Else
            Dim pantalla As pantalla = PantallaBiz.getById(CType(strarr(0), Integer))
            If pantalla Is Nothing Then
                esValido = False
                msg += "Debe seleccionar un permiso.<br />"
            End If
            If Not pantalla Is Nothing And Not pantallas Is Nothing Then
                For Each ip In pantallas
                    If pantalla.idPantalla = ip.pantalla.idPantalla Then
                        esValido = False
                        msg += "Un mismo permiso no se puede otorgar dos veces.<br />"
                    End If
                    If cmbSiNo.SelectedValue = "1" AndAlso ip.esPantallaPrincipal = 1 Then
                        esValido = False
                        msg += "Sólo una pantalla puede marcarse como principal.<br />"
                    End If
                Next
            End If
        End If
        If Not esValido Then
            Me.divErrorItem.Visible = True
            Me.lblErrorItem.Text = msg
        Else
            Me.divErrorItem.Visible = False
            Me.lblErrorItem.Text = ""
        End If
        Return esValido
    End Function
    Private Sub CargarComboSiNo()
        Me.cmbSiNo.Items.Add(New ListItem("No", "0"))
        Me.cmbSiNo.Items.Add(New ListItem("Si", "1"))
    End Sub

    Private Sub myRepeater_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles grilla.ItemCommand
        If e.CommandName = "Borrar" Then
            Dim strarr() As String
            strarr = txtUsuario.Text.Split(" ")
            PantallaBiz.deleteUsuarioPantalla(strarr(0), e.CommandArgument)
            Me.grilla.DataSource = PantallaBiz.getUsuarioPantallaByUsuario(strarr(0))
            Me.grilla.DataBind()
        End If
    End Sub

    Private Sub cmdVolver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdVolver.Click
        Response.Redirect("frmUsuarioPantalla.aspx")
    End Sub
End Class