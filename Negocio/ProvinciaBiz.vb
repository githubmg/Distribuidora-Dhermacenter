Public Class ProvinciaBiz
    Shared Function getAll() As List(Of provincia)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.provincias Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As provincia
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.provincias Where tbl.idProvincia = id Select tbl).SingleOrDefault()
    End Function
End Class
