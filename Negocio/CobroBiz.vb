Public Class CobroBiz
    Shared Function getAll() As List(Of cobro)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.cobros Select tbl).ToList()
    End Function
    Shared Function getById(ByVal id As Integer) As cobro
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.cobros Where tbl.idCobro = id Select tbl).SingleOrDefault()
    End Function
    Shared Sub add(ByVal tbl As cobro)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.cobros.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Sub update(ByVal obj As cobro)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.cobros Where tblDB.idCobro = obj.idcobro Select tblDB).SingleOrDefault
        tbl.idFormaPago = obj.idFormaPago
        tbl.fecha = obj.fecha
        tbl.importe = obj.importe
        db.SubmitChanges()
    End Sub
    Shared Sub delete(ByVal id As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.cobros Where tblDB.idCobro = id Select tblDB).SingleOrDefault
        db.cobros.DeleteOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Function getByComrpobante(ByVal idComprobante As Integer) As List(Of cobro)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.cobros Where tbl.idComprobante = idComprobante Select tbl).ToList()
    End Function
End Class
