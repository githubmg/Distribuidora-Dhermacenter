Public Class UsuarioBiz
    Shared Function getAll() As List(Of usuario)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.usuarios Select tbl).ToList()
    End Function
    Shared Function getPantallaDefault(idUsuario As Integer) As pantalla
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.usuarioPantallas Where tbl.idUsuario = idUsuario AndAlso tbl.esPantallaPrincipal = 1 Select tbl.pantalla).SingleOrDefault
    End Function
    Shared Function getById(id As Integer) As usuario
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.usuarios Where tbl.idUsuario = id Select tbl).SingleOrDefault
    End Function
    Shared Function getByNombreUsuario(nombreUsuario As String) As usuario
        Dim db As New DhermadbDataContext(SQL.Conn)
        Return (From tbl In db.usuarios Where tbl.nombreUsuario = nombreUsuario Select tbl).SingleOrDefault
    End Function
    Shared Sub add(obj As usuario)
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.usuarios.InsertOnSubmit(obj)
        db.SubmitChanges()
    End Sub
    Shared Sub update(obj As usuario)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.usuarios Where tblDB.idUsuario = obj.idUsuario Select tblDB).SingleOrDefault
        tbl.clave = obj.clave
        tbl.email = obj.email
        tbl.nombre = obj.nombre
        tbl.nombreUsuario = obj.nombreUsuario
        db.SubmitChanges()
    End Sub
    Shared Sub updatePantallasUsuario(pantallas As List(Of usuarioPantalla))
        Dim db As New DhermadbDataContext(SQL.Conn)
        db.usuarioPantallas.DeleteAllOnSubmit((From up In db.usuarioPantallas Where up.idUsuario = pantallas(0).idUsuario Select up).ToList)
        db.usuarioPantallas.InsertAllOnSubmit(pantallas)
        db.SubmitChanges()
    End Sub
    Shared Sub delete(id As Integer)
        Dim db As New DhermadbDataContext(SQL.Conn)
        Dim tbl = (From tblDB In db.usuarios Where tblDB.idUsuario = id Select tblDB).SingleOrDefault
        db.usuarios.DeleteOnSubmit(tbl)
        db.SubmitChanges()
    End Sub
End Class
