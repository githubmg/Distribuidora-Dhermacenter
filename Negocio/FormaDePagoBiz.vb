Public Class FormaDePagoBiz
    Shared Function getAll() As List(Of formaDePago)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.formaDePagos Select tbl).ToList()
    End Function
    Shared Function getById(ByVal id As Integer) As formaDePago
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.formaDePagos Where tbl.idformaDePago = id Select tbl).SingleOrDefault()
    End Function
    Shared Sub add(ByVal tbl As formaDePago)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.formaDePagos.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Sub update(ByVal obj As formaDePago)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.formaDePagos Where tblDB.idformaDePago = obj.idformaDePago Select tblDB).SingleOrDefault
        tbl.esTarjeta = obj.esTarjeta
        tbl.descripcion = obj.descripcion
        db.SubmitChanges()
    End Sub
    Shared Sub delete(ByVal id As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.formaDePagos Where tblDB.idFormaDePago = id Select tblDB).SingleOrDefault
        db.formaDePagos.DeleteOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
End Class
