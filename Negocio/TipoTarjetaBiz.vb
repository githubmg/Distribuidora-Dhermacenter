Public Class TipoTarjetaBiz
    Shared Function getAll() As List(Of tipoTarjeta)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.tipoTarjetas Select tbl).ToList()
    End Function
    Shared Function getById(ByVal id As Integer) As tipoTarjeta
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.tipoTarjetas Where tbl.idtipoTarjeta = id Select tbl).SingleOrDefault()
    End Function
    Shared Sub add(ByVal tbl As tipoTarjeta)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.TipoTarjetas.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Sub update(ByVal obj As tipoTarjeta)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.TipoTarjetas Where tblDB.idTipoTarjeta = obj.idTipoTarjeta Select tblDB).SingleOrDefault
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
End Class
