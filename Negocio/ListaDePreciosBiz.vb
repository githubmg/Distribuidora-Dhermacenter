Public Class ListaDePreciosBiz
    Shared Function getAllActivas() As List(Of listaDePrecio)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.listaDePrecios Where tbl.activa = 1 Select tbl).ToList()
    End Function
    Shared Function getAll() As List(Of listaDePrecio)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.listaDePrecios Select tbl).ToList()
    End Function
    Shared Function insertEmpty() As Integer
        Dim li As New listaDePrecio
        li.descripcion = ""
        li.activa = 1
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.listaDePrecios.InsertOnSubmit(li)
        db.SubmitChanges()
        Return li.idListaDePrecios
    End Function
    Shared Sub update(ByVal mylista As listaDePrecio)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim listaUpd = (From li In db.listaDePrecios Where li.idListaDePrecios = mylista.idListaDePrecios Select li).Single()
        listaUpd.descripcion = mylista.descripcion
        listaUpd.activa = mylista.activa
        db.SubmitChanges()
    End Sub
    Shared Sub addItem(ByVal idLista As Integer, ByVal idProducto As Integer, ByVal codProducto As String, ByVal precio As Double)
        Dim il As New listaDePreciosItem
        il.idListaDePrecios = idLista
        il.idProducto = idProducto
        il.codigo = codProducto
        il.precio = precio
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.listaDePreciosItems.InsertOnSubmit(il)
        db.SubmitChanges()
    End Sub
    Shared Sub deleteItem(ByVal id As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim item = (From it In db.listaDePreciosItems Where it.idListaDePreciosItem = id Select it).Single
        db.listaDePreciosItems.DeleteOnSubmit(item)
        db.SubmitChanges()
    End Sub
    Shared Function getById(ByVal id As Integer) As listaDePrecio
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.listaDePrecios Where tbl.idListaDePrecios = id Select tbl).SingleOrDefault()
    End Function
End Class
