Public Class FamiliaBiz
    Shared Function getAll() As List(Of familia)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.familias Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As familia
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.familias Where tbl.idFamilia = id Select tbl).SingleOrDefault
    End Function
    Shared Sub add(obj As familia)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.familias.InsertOnSubmit(obj)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As familia)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.familias Where tblDB.idFamilia = obj.idFamilia Select tblDB).SingleOrDefault
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
End Class
