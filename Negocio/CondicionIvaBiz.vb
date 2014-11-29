Public Class CondicionIvaBiz
    Shared Function getAll() As List(Of condicionIva)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.condicionIvas Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As condicionIva
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.condicionIvas Where tbl.idCondicionIva = id Select tbl).SingleOrDefault()
    End Function
   
End Class
