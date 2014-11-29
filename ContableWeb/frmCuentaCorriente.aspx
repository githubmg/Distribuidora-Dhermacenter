<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCuentaCorriente.aspx.vb" Inherits="ContableWeb.frmCuentaCorriente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <label>Cliente:</label><span class="field"><asp:TextBox ID="txtCliente" runat="server" CssClass="mediuminput" MaxLength="100"></asp:TextBox></span>
         <asp:Button ID="cmdVer" runat="server" Text="Ver cuente corriente" CssClass="accept"/>
    </div>
    <hr />
    <label>Saldo:</label><span class="field"><asp:label ID="lblSaldo" runat="server" CssClass="mediuminput" MaxLength="100"></asp:label></span>
    </form>
</body>
</html>
