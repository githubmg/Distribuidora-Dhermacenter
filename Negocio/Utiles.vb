Imports Microsoft.Reporting.WebForms
Public Class Utiles

    Public Shared Function NormalizarNumero(ByVal s As String) As String
        Return (s.Replace(".", ",").Replace(",", Configuracion.ObtenerInstancia.SeparadorDecimal))
    End Function
    Shared Function BooleanAString(id As Integer) As String
        If id = 0 Then
            Return "NO"
        End If
        Return "SI"
    End Function
    Shared Function Id(ByVal str As String) As Integer
        Try
            Return CType(str.Split(CChar("-"))(0), Integer)
        Catch ex As Exception
            Return 0
        End Try
    End Function
    Public Shared Function validarCuit(ByVal cuit As String) As Boolean
        If cuit.Length <> 11 Then
            Return False
        End If
        'Valores por los que multiplicaremos cada digito del CUIT
        Dim loValores() As Integer = {5, 4, 3, 2, 7, 6, 5, 4, 3, 2}

        'Variable donde iremos sumando los valores que obtengamos de multiplicar
        'los digitos del cuit por los números de loValores
        Dim loProducto As Integer = 0
        For index As Integer = 0 To 9
            loProducto += (CInt(loValores.GetValue(index)) * CInt(cuit.Substring(index, 1)))
        Next

        'Sacamos el mod 11 de loProducto
        Dim intMod11 As Integer = loProducto Mod 11

        'Restamos el resultado de mod11 a 11
        Dim digito As Integer = 11 - intMod11
        If digito = 11 Then digito = 0

        'Comprobamos que el valor coincida con el dígito de control introducido por el usuario en el TextBox
        Dim dc As Integer = CInt(cuit.Substring(10, 1))

        If dc = digito Then
            'El resultado es correcto
            Return True
        Else
            'El resultado es incorrecto
            Return False
        End If
    End Function
    Public Shared Function esEntero(ByVal int As String) As Boolean
        Dim i As Integer
        If Integer.TryParse(int, i) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function esDouble(ByVal x As String) As Boolean
        Dim d As Double
        If Double.TryParse(x, d) Then
            Return True
        Else
            Return False
        End If
    End Function
    'Public Shared Sub ReportviewerToPdf(ByVal dt As DataTable, ByVal reporte As String, ByVal archivo As String)
    '    Dim response As System.Web.HttpResponse
    '    Dim reportViewer1 As ReportViewer = New ReportViewer()
    '    Dim rds As ReportDataSource = New ReportDataSource("Datos", dt)
    '    response = System.Web.HttpContext.Current.Response

    '    reportViewer1.ProcessingMode = ProcessingMode.Local
    '    reportViewer1.LocalReport.ReportPath = reporte
    '    reportViewer1.LocalReport.DataSources.Clear()
    '    reportViewer1.LocalReport.DataSources.Add(rds)
    '    reportViewer1.LocalReport.Refresh()

    '    Dim bytes As Byte() = Nothing
    '    Dim warnings As Warning() = Nothing
    '    Dim streamIds As String() = Nothing
    '    Dim mimeType As String = String.Empty
    '    Dim encoding As String = String.Empty
    '    Dim extension As String = String.Empty

    '    bytes = reportViewer1.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)

    '    response.Buffer = True
    '    response.Clear()
    '    response.ContentType = mimeType
    '    response.AddHeader("content-disposition", "attachment; filename=" + archivo + ".pdf")
    '    response.BinaryWrite(bytes)
    '    response.Flush()
    'End Sub

   
End Class
