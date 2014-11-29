Public Class PantallaBiz
    Shared Function getByUsuarioByTipo(ByVal idUsuario As Integer, ByVal tipo As String) As List(Of pantalla)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From uspa In db.usuarioPantallas Where uspa.idUsuario = idUsuario And uspa.pantalla.tipo = tipo Select uspa.pantalla).ToList()
    End Function
    Shared Function getById(id As Integer) As pantalla
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.pantallas Where tbl.idPantalla = id Select tbl).SingleOrDefault
    End Function
    Shared Function getByUsuario(ByVal idUsuario As Integer) As List(Of pantalla)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From uspa In db.usuarioPantallas Where uspa.idUsuario = idUsuario Select uspa.pantalla).ToList()
    End Function
    Shared Function getUsuarioPantallaByUsuario(ByVal idUsuario As Integer) As List(Of usuarioPantalla)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From uspa In db.usuarioPantallas Where uspa.idUsuario = idUsuario Select uspa).ToList()
    End Function
    Shared Sub addUsuarioPantalla(ByVal idUsuario As Integer, ByVal idPantalla As Integer, ByVal esPrincipal As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim up As New usuarioPantalla
        up.esPantallaPrincipal = esPrincipal
        up.idPantalla = idPantalla
        up.idUsuario = idUsuario
        db.usuarioPantallas.InsertOnSubmit(up)
        db.SubmitChanges()
    End Sub
    Shared Sub deleteUsuarioPantalla(ByVal idUsuario As Integer, ByVal idPantalla As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim up As usuarioPantalla = (From upa In db.usuarioPantallas Where upa.idUsuario = idUsuario And upa.idPantalla = idPantalla Select upa).Single()
        db.usuarioPantallas.DeleteOnSubmit(up)
        db.SubmitChanges()
    End Sub
End Class
