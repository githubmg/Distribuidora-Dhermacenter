Public Class SQL
    Shared Function Conn() As String
        Return ConfigurationManager.ConnectionStrings("strcnn").ConnectionString
    End Function
End Class
