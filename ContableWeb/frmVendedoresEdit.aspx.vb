﻿Imports Negocio

Public Class frmVendedoresEdit
    Inherits System.Web.UI.Page


    Private _Vendedor As vendedor
    Public Property Vendedor() As vendedor
        Get
            Return _Vendedor
        End Get
        Set(ByVal value As vendedor)
            _Vendedor = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.Request.QueryString("id") Is Nothing Then
            Dim id As Integer = CType(Me.Request.QueryString("id"), Integer)
            Me.Vendedor = VendedorBiz.getById(id)
        End If

        If Not Me.Page.IsPostBack Then
            If Not Me.Vendedor Is Nothing Then
                Me.txtDescripcion.Text = Me.Vendedor.descripcion

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
                If Me.Vendedor Is Nothing Then
                    Me.Vendedor = New vendedor
                    Me.Vendedor.descripcion = Me.txtDescripcion.Text
                    VendedorBiz.add(Me.Vendedor)
                    Response.Redirect("frmVendedores.aspx")
                Else
                    Me.Vendedor.descripcion = Me.txtDescripcion.Text
                    VendedorBiz.update(Me.Vendedor)
                    Response.Redirect("frmVendedores.aspx")
                End If
            End If
        Catch ex As Exception
            Me.divErrorForm.Visible = True
            Me.lblErrorForm.Text = ex.Message
        End Try
    End Sub

    Private Sub cmdCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancelar.Click
        Response.Redirect("frmVendedores.aspx")
    End Sub

End Class