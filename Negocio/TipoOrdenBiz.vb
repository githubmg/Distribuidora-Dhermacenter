Public Class TipoOrdenBiz
    Shared Function getAll() As List(Of tipoOrden)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.tipoOrdens Select tbl).ToList()
    End Function
End Class
