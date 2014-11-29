Imports Negocio

Public Class frmClienteEdit
    Inherits System.Web.UI.Page
    Private _cliente As Cliente
    Public Property Cliente() As Cliente
        Get
            Return Me._cliente
        End Get
        Set(ByVal value As Cliente)
            Me._cliente = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.Request.QueryString("id") Is Nothing Then
            Dim id As Long = CType(Me.Request.QueryString("id"), Integer)
            Me.Cliente = ClienteBiz.getById(id)
        End If

        If Not Me.Page.IsPostBack Then
            CargarDrops()
            If Not Me.Cliente Is Nothing Then
                Me.txtCuit.Text = Me.Cliente.cuit
                Me.txtCuit.ReadOnly = True
                Me.txtRazonSocial.Text = Me.Cliente.razonSocial
                Me.txtDomicilio.Text = Me.Cliente.domicilio
                Me.txtCodigoPostal.Text = Me.Cliente.codigoPostal
                Me.txtTelefono.Text = Me.Cliente.telefono
                Me.txtEmail.Text = Me.Cliente.email
                Me.txtObservaciones.Text = Me.Cliente.observaciones
                Me.cmbProvincia.SelectedValue = Me.Cliente.localidad.idProvincia.ToString()
                Me.cmbLocalidad.SelectedValue = Me.Cliente.idLocalidad.ToString()
                Me.cmbCondicionIva.SelectedValue = Me.Cliente.idCondicionIva.ToString()
                Me.cmbListaPrecios.SelectedValue = Me.Cliente.idListaDePrecios
                Me.cmbCuentaCorriente.SelectedValue = Me.Cliente.cuentaCorriente
                Me.cmbFormaContacto.SelectedValue = Me.Cliente.idFormaDeContacto
            End If
        End If
    End Sub
    Private Sub CargarDrops()
        Me.cmbCondicionIva.DataSource = CondicionIvaBiz.getAll()
        Me.cmbCondicionIva.DataTextField = "descripcion"
        Me.cmbCondicionIva.DataValueField = "idCondicionIva"
        Me.cmbCondicionIva.DataBind()

        Me.cmbProvincia.DataSource = ProvinciaBiz.getAll()
        Me.cmbProvincia.DataTextField = "descripcion"
        Me.cmbProvincia.DataValueField = "idProvincia"
        Me.cmbProvincia.DataBind()

        Me.cmbLocalidad.DataSource = LocalidadBiz.getByProvincia(cmbProvincia.SelectedValue)
        Me.cmbLocalidad.DataTextField = "descripcion"
        Me.cmbLocalidad.DataValueField = "idLocalidad"
        Me.cmbLocalidad.DataBind()

        Me.cmbFormaContacto.DataSource = FormaDeContactoBiz.getAll()
        Me.cmbFormaContacto.DataTextField = "descripcion"
        Me.cmbFormaContacto.DataValueField = "idFormaDeContacto"
        Me.cmbFormaContacto.DataBind()

        Me.cmbListaPrecios.DataSource = ListaDePreciosBiz.getAllActivas()
        Me.cmbListaPrecios.DataTextField = "descripcion"
        Me.cmbListaPrecios.DataValueField = "idListaDePrecios"
        Me.cmbListaPrecios.DataBind()
    End Sub
    Private Function validarForm() As Boolean
        Dim strError As String = ""
        Dim esValido As Boolean = True
        If Me.txtCuit.Text <> "" And Me.txtCuit.Text <> "0" Then
            If Not IsNumeric(Me.txtCuit.Text) Or Not Me.txtCuit.Text.Length = 11 Then
                strError += "Error: el valor ingresado en el campo CUIT debe ser numérico y tener 11 caracteres.<br />"
                esValido = False
            Else
                If Not Utiles.validarCuit(Me.txtCuit.Text) Then
                    strError += "Error: ingrese un número de CUIT válido.<br />"
                    esValido = False
                End If
            End If
        End If
        If Me.Cliente Is Nothing Then
            'Estoy dando de Alta
            If txtCuit.Text <> "" And txtCuit.Text <> "0" Then
                Dim c As cliente = ClienteBiz.getByCuit(Convert.ToInt64(txtCuit.Text))
                If Not c Is Nothing Then
                    strError += "Error: El CUIT ingresado corresponde a un cliente existente en el sistema.<br />"
                    esValido = False
                End If
            End If
        End If
        If Me.txtRazonSocial.Text = "" Then
            strError += "Error: debe completar el campo 'Razón Social'<br />"
            esValido = False
        End If
        If txtEmail.Text <> "" Then
            Dim expression As String = "^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" & "0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" & "[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$"
            Dim match As Match = Regex.Match(txtEmail.Text, expression, RegexOptions.IgnoreCase)
            If Not match.Success Then
                strError += "Error: debe ingresar una dirección de correo válida.<br />"
                esValido = False
            End If
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
                If Me.Cliente Is Nothing Then
                    Me.Cliente = New cliente
                    Me.Cliente.codigoPostal = txtCodigoPostal.Text
                    Me.Cliente.idCondicionIva = CType(cmbCondicionIva.SelectedValue, Integer)
                    If txtCuit.Text = "" Then
                        Me.Cliente.Cuit = 0
                    Else
                        Me.Cliente.Cuit = txtCuit.Text
                    End If
                    Me.Cliente.Domicilio = txtDomicilio.Text
                    Me.Cliente.Email = txtEmail.Text
                    Me.Cliente.idLocalidad = CType(cmbLocalidad.SelectedValue, Integer)
                    Me.Cliente.Observaciones = txtObservaciones.Text
                    Me.Cliente.RazonSocial = txtRazonSocial.Text
                    Me.Cliente.telefono = txtTelefono.Text
                    Me.Cliente.cuentaCorriente = CType(cmbCuentaCorriente.SelectedValue, Integer)
                    Me.Cliente.idListaDePrecios = CType(cmbListaPrecios.SelectedValue, Integer)
                    Me.Cliente.idFormaDeContacto = CType(cmbFormaContacto.SelectedValue, Integer)
                    ClienteBiz.add(Me.Cliente)
                    Response.Redirect("frmCliente.aspx")
                Else
                    Me.Cliente.CodigoPostal = txtCodigoPostal.Text
                    Me.Cliente.idCondicionIva = CType(cmbCondicionIva.SelectedValue, Integer)
                    Me.Cliente.Cuit = txtCuit.Text
                    Me.Cliente.Domicilio = txtDomicilio.Text
                    Me.Cliente.Email = txtEmail.Text
                    Me.Cliente.idLocalidad = CType(cmbLocalidad.SelectedValue, Integer)
                    Me.Cliente.Observaciones = txtObservaciones.Text
                    Me.Cliente.RazonSocial = txtRazonSocial.Text
                    Me.Cliente.telefono = txtTelefono.Text
                    Me.Cliente.cuentaCorriente = CType(cmbCuentaCorriente.SelectedValue, Integer)
                    Me.Cliente.idListaDePrecios = CType(cmbListaPrecios.SelectedValue, Integer)
                    Me.Cliente.idFormaDeContacto = CType(cmbFormaContacto.SelectedValue, Integer)
                    ClienteBiz.update(Me.Cliente)
                    Response.Redirect("frmCliente.aspx")
                End If
                End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmCliente.aspx")
    End Sub

    Private Sub cmbProvincia_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cmbProvincia.SelectedIndexChanged
        Me.cmbLocalidad.DataSource = LocalidadBiz.getByProvincia(CType(cmbProvincia.SelectedValue, Integer))
        Me.cmbLocalidad.DataTextField = "descripcion"
        Me.cmbLocalidad.DataValueField = "idLocalidad"
        Me.cmbLocalidad.DataBind()
    End Sub
End Class