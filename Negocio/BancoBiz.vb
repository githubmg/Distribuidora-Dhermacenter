Public Class BancoBiz
    Shared Function getAll() As List(Of banco)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.bancos Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As banco
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.bancos Where tbl.idBanco = id Select tbl).SingleOrDefault()
    End Function
    Shared Sub add(tbl As banco)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.bancos.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As banco)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.bancos Where tblDB.idBanco = obj.idBanco Select tblDB).SingleOrDefault
        tbl.codigo = obj.codigo
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
End Class
