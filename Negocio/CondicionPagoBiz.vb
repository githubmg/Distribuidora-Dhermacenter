Public Class CondicionPagoBiz
    Shared Function getAll() As List(Of condicionPago)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.condicionPagos Select tbl).ToList()
    End Function
End Class
