Public Class LocalidadBiz
    Shared Function getByProvincia(idProvincia As Integer) As List(Of localidad)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.localidads Where tbl.idProvincia = idProvincia Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As localidad
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.localidads Where tbl.idLocalidad = id Select tbl).SingleOrDefault()
    End Function
End Class
