Public Class ComprobanteItemBiz
    Shared Function getByIdComprobante(ByVal idComprobante As Integer) As List(Of comprobanteItem)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.comprobanteItems Where tbl.idComprobante = idComprobante Select tbl).ToList()
    End Function
    Shared Function getById(ByVal id As Integer) As comprobanteItem
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.comprobanteItems Where tbl.idComprobanteItem = id Select tbl).Single()
    End Function
    Shared Sub add(ByVal tbl As comprobanteItem)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.comprobanteItems.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Sub update(ByVal obj As comprobanteItem)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.comprobanteItems Where tblDB.idComprobante = obj.idComprobante Select tblDB).SingleOrDefault
        tbl.idComprobante = obj.idComprobante
        tbl.idProducto = obj.idProducto
        tbl.cantidad = obj.cantidad
        tbl.precioUnitario = obj.precioUnitario
        tbl.descuento = obj.descuento
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
    Shared Sub delete(ByVal id As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.comprobanteItems Where tblDB.idComprobanteItem = id Select tblDB).SingleOrDefault
        db.comprobanteItems.DeleteOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
End Class
