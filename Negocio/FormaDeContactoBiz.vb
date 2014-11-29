Public Class FormaDeContactoBiz
    Shared Function getAll() As List(Of formaDeContacto)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.formaDeContactos Select tbl).ToList()
    End Function
End Class
