Imports Negocio
Partial Public Class ContableWeb
    Inherits System.Web.UI.MasterPage


    Private Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Me.Session("usuario") Is Nothing Then
            CargarTablas()
            CargarProcesos()
            CargarReportes()
        End If
    End Sub

    Private Sub CargarTablas()
        Dim li As New HtmlGenericControl("li")
        li.InnerHtml = "<a href=""#"" class=""dashboard""><span>Tablas maestras</span></a>"
        li.Attributes.Add("class", "current")
        ulTablas.Controls.Add(li)
        Dim pantallas As List(Of pantalla) = PantallaBiz.getByUsuarioByTipo(CType(Me.Session("usuario"), usuario).idUsuario, "Tabla")
        For Each p In pantallas
            Dim listIt As New HtmlGenericControl("li")
            listIt.InnerHtml = "<a href=""" & p.url & """ class=""tables""><span>" & p.descripcion & "</span></a>"
            ulTablas.Controls.Add(listIt)
        Next
    End Sub

    Private Sub CargarReportes()
        Dim li As New HtmlGenericControl("li")
        li.InnerHtml = "<a href=""#"" class=""dashboard""><span>Reportes</span></a>"
        li.Attributes.Add("class", "current")
        ulReportes.Controls.Add(li)
        Dim pantallas As List(Of pantalla) = PantallaBiz.getByUsuarioByTipo(CType(Me.Session("usuario"), usuario).idUsuario, "Reporte")
        For Each p In pantallas
            Dim listIt As New HtmlGenericControl("li")
            listIt.InnerHtml = "<a href=""" & p.url & """ class=""tables""><span>" & p.descripcion & "</span></a>"
            ulReportes.Controls.Add(listIt)
        Next
    End Sub

    Private Sub CargarProcesos()
        Dim li As New HtmlGenericControl("li")
        li.InnerHtml = "<a href=""#"" class=""dashboard""><span>Procesos</span></a>"
        li.Attributes.Add("class", "current")
        ulProcesos.Controls.Add(li)
        Dim pantallas As List(Of pantalla) = PantallaBiz.getByUsuarioByTipo(CType(Me.Session("usuario"), usuario).idUsuario, "Proceso")
        For Each p In pantallas
            Dim listIt As New HtmlGenericControl("li")
            listIt.InnerHtml = "<a href=""" & p.url & """ class=""tables""><span>" & p.descripcion & "</span></a>"
            ulProcesos.Controls.Add(listIt)
        Next
    End Sub

End Class