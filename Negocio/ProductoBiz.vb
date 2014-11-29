Public Class ProductoBiz
    Shared Function getAllActivos() As List(Of producto)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.productos Where tbl.activo = True Select tbl).ToList()
    End Function
    Shared Sub delete(idProducto As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim producto = (From tbl In db.productos Where tbl.idProducto = idProducto Select tbl).SingleOrDefault
        producto.activo = False
        db.SubmitChanges()
    End Sub
    Shared Function getById(idProducto As Integer) As producto
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.productos Where tbl.idProducto = idProducto Select tbl).Single()
    End Function
    Shared Sub add(obj As producto)
        Dim db As New DhermadbDataContext(SQL.Conn)
        obj.activo = True
        db.productos.InsertOnSubmit(obj)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As producto)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.productos Where tblDB.idProducto = obj.idProducto Select tblDB).SingleOrDefault
        tbl.idAlicuotaIva = obj.idAlicuotaIva
        tbl.idEmpresa = obj.idEmpresa
        tbl.idFamilia = obj.idFamilia
        tbl.activo = obj.activo
        tbl.codProducto = obj.codProducto
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
End Class
