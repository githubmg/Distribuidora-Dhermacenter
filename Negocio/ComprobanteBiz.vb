Public Class comprobanteCabeBiz
    Shared Function getAll() As List(Of comprobanteCabe)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.comprobanteCabes Select tbl).ToList()
    End Function
    Shared Function getAllMenosRecibos() As List(Of comprobanteCabe)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.comprobanteCabes Where tbl.letra <> CChar("X") Select tbl).ToList()
    End Function
    Shared Function getAllRecibos() As List(Of comprobanteCabe)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.comprobanteCabes Where tbl.letra = CChar("X") Select tbl).ToList()
    End Function
    Shared Function getById(ByVal id As Integer) As comprobanteCabe
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.comprobanteCabes Where tbl.idComprobante = id Select tbl).SingleOrDefault()
    End Function
    Shared Sub add(ByVal tbl As comprobanteCabe)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.comprobanteCabes.InsertOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
    Shared Function insertEmpty() As Integer
        Dim c As New comprobanteCabe
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.comprobanteCabes.InsertOnSubmit(c)
        db.SubmitChanges()
        Return c.idComprobante
    End Function
    Shared Sub update(ByVal obj As comprobanteCabe)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.comprobanteCabes Where tblDB.idComprobante = obj.idComprobante Select tblDB).SingleOrDefault
        tbl.fecha = obj.fecha
        tbl.idCliente = obj.idCliente
        tbl.idListaPrecio = obj.idListaPrecio
        tbl.idTipoOrden = obj.idTipoOrden
        tbl.idVendedor = obj.idVendedor
        tbl.letra = obj.letra
        tbl.numero = obj.numero
        tbl.numeroAsociado = obj.numeroAsociado
        tbl.tipo = obj.tipo
        db.SubmitChanges()
    End Sub
    Shared Function validarPagoIgualItems(ByVal idComprobanteCabe As Integer) As Boolean
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim total = (From ci In db.comprobanteItems Where ci.idComprobante = idComprobanteCabe Select ci.cantidad * ci.precioUnitario * (100 - ci.descuento) / 100).Sum()
        Dim pagos = (From cob In db.cobros Where cob.idComprobante = idComprobanteCabe Select cob.importe).Sum()
        If pagos <> total Then
            Return False
        End If
        Return True
    End Function

    Shared Function getComprobantesAsociadosByComprobanteClienteyTipo(ByVal idComprobante As Integer, ByVal idCliente As Integer, ByVal idTipoOrden As Integer) As List(Of comprobanteAsociado)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim listaCA As New List(Of comprobanteAsociado)
        listaCA = (From ca In db.comprobanteAsociados Join cc In db.comprobanteCabes On ca.idComprobante Equals cc.idComprobante Where ca.idComprobante = idComprobante AndAlso cc.idCliente = idCliente AndAlso cc.idTipoOrden = idTipoOrden Select ca).ToList
        Return listaCA
    End Function
    Shared Function getComprobantesParaAsociarByClienteyTipo(ByVal idCliente As Integer, ByVal idTipoOrden As Integer) As List(Of comprobanteCabe)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim lista As New List(Of comprobanteCabe)
        lista = (From cc In db.comprobanteCabes Where cc.idCliente = idCliente AndAlso cc.idTipoOrden = idTipoOrden AndAlso db.fcnSaldoPendienteByComprobante(cc.idComprobante) > 0 Select cc).ToList
        Return lista
    End Function
    Shared Function getSaldoPendienteByComprobante(ByVal idComprobante As Integer) As Double
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return CDbl(db.fcnSaldoPendienteByComprobante(idComprobante))
    End Function
End Class
