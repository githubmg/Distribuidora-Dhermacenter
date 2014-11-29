Public Class ClienteBiz
    Shared Function getAll() As List(Of cliente)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.clientes Select tbl).ToList()
    End Function
    Shared Function getById(id As Integer) As cliente
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From cli In db.clientes Where cli.idCliente = id Select cli).Single()
    End Function
    Shared Function getByCuit(cuit As Int64) As cliente
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From cli In db.clientes Where cli.cuit = cuit Select cli).SingleOrDefault()
    End Function
    Shared Sub add(cli As cliente)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.clientes.InsertOnSubmit(cli)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As cliente)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.clientes Where tblDB.idCliente = obj.idCliente Select tblDB).SingleOrDefault
        tbl.idCondicionIva = obj.idCondicionIva
        tbl.idFormaDeContacto = obj.idFormaDeContacto
        tbl.idListaDePrecios = obj.idListaDePrecios
        tbl.idLocalidad = obj.idLocalidad
        tbl.observaciones = obj.observaciones
        tbl.razonSocial = obj.razonSocial
        tbl.telefono = obj.telefono
        tbl.cuit = obj.cuit
        tbl.codigoPostal = obj.codigoPostal
        db.SubmitChanges()
    End Sub
    Shared Function getTextBoxById(ByVal id As Integer) As String
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim cliente = (From cli In db.clientes Where cli.idCliente = id Select cli).Single()
        Return (cliente.idCliente.ToString & " - " & cliente.razonSocial)
    End Function
   
End Class
