<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmFormaDePagoEdit.aspx.vb" Inherits="ContableWeb.frmFormaDePagoEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Información de la Forma de pago
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">

<div class="contenttitle"><h2 class="form"><span>Forma de pago</span></h2></div>
<br />
<form runat="server" id="frmFormaDePagoEdit" class="stdform" action="" method="post">

    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Información General</a></li>
        </ul>
        <div id="tabs-1">
            <label>Descripción:</label><span class="field"><asp:TextBox ID="txtDescripcion" runat="server" CssClass="mediuminput" MaxLength="100"></asp:TextBox></span>
            <label>Es tarjeta:</label><span class="field"><asp:DropDownList ID="cmbSiNo" runat="server"></asp:DropDownList></span>
        </div>
     </div>
    <br />
    <div runat="server" id="divErrorForm" class="notification msgerror" visible ="false" ><a class="close"></a>
        <p><asp:Label ID="lblErrorForm" runat="server" Text=""></asp:Label></p>
    </div>
    <p class="stdformbutton">
        <asp:Button ID="cmdGuardar" runat="server" Text="Guardar" CssClass="accept"/>
        <asp:Button ID="cmdCancelar" runat="server" Text="Cancelar" CssClass="reset" />
    </p>
</form>
</asp:Content>
