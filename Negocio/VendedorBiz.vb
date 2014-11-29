Public Class VendedorBiz
    Shared Function getAll() As List(Of Vendedor)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.Vendedors Select tbl).ToList()
    End Function
    Shared Function getById(ByVal id As Integer) As Vendedor
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.Vendedors Where tbl.idVendedor = id Select tbl).SingleOrDefault()
    End Function
    Shared Sub add(ByVal tbl As Vendedor)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.Vendedors.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Sub update(ByVal obj As Vendedor)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.Vendedors Where tblDB.idVendedor = obj.idVendedor Select tblDB).SingleOrDefault
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
End Class
