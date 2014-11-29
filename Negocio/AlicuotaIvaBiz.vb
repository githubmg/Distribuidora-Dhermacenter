Public Class AlicuotaIvaBiz
    Shared Function getAll() As List(Of AlicuotaIva)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.alicuotaIvas Select tbl).ToList()
    End Function

End Class
