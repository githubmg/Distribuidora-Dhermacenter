Public Class ProveedorBiz
    Shared Function getAll() As List(Of proveedor)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.proveedors Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As proveedor
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From cli In db.proveedors Where cli.idproveedor = id Select cli).SingleOrDefault()
    End Function
    Shared Function getByCuit(cuit As Int64) As proveedor
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From cli In db.proveedors Where cli.cuit = cuit Select cli).SingleOrDefault()
    End Function
    Shared Sub add(obj As proveedor)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.proveedors.InsertOnSubmit(obj)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As proveedor)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.proveedors Where tblDB.idproveedor = obj.idproveedor Select tblDB).SingleOrDefault
        tbl.idLocalidad = obj.idLocalidad
        tbl.observaciones = obj.observaciones
        tbl.razonSocial = obj.razonSocial
        tbl.telefono = obj.telefono
        tbl.cuit = obj.cuit
        tbl.codigoPostal = obj.codigoPostal
        tbl.idCondicionPago = obj.idCondicionPago
        db.SubmitChanges()
    End Sub
End Class
