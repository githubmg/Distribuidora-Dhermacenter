Public Class EmpresaBiz
    Shared Function getAll() As List(Of empresa)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.empresas Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As empresa
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.empresas Where tbl.idEmpresa = id Select tbl).SingleOrDefault
    End Function
    Shared Sub add(obj As empresa)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.empresas.InsertOnSubmit(obj)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As empresa)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.empresas Where tblDB.idEmpresa = obj.idEmpresa Select tblDB).SingleOrDefault
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
End Class
