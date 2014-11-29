<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmFormaDePago.aspx.vb" Inherits="ContableWeb.frmFormaDePago" %>

<%@ Import Namespace="Negocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
FormaDePagos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<form runat="server" id="frmFormaDePago" class="">
   <asp:Button ID="cmdNuevo" runat="server" Text="Nueva  forma de pago" CssClass="stdbtn" /><br /><br />
    
    <div class="contenttitle radiusbottom0">
        <h2 class="table"><span>Formas de pago existentes</span></h2>
    </div><!--contenttitle-->
   <asp:Repeater ID="grilla" runat="server">
    <HeaderTemplate>
        <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable">
        <colgroup>
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
        </colgroup>
        <thead>
            <tr>
                <th class="head1">Id</th>
                <th class="head0">Descripcion</th>
                <th class="head0">Es tarjeta</th>
                <th class="head0">&nbsp;</th>
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="">
                <td><%# DataBinder.Eval(Container.DataItem, "idFormaDePago")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "descripcion")%></td>
                <td><%# Utiles.BooleanAString(DataBinder.Eval(Container.DataItem, "estarjeta"))%></td>
                <td><a href="frmFormaDePagoEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "idFormaDePago")%>">Editar</a>
                
                </td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
            <tfoot>
            <tr>
                <th class="head1"></th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
            </tr>
        </tfoot>
        </table>
    </FooterTemplate>
   </asp:Repeater>
   </form>
</asp:Content>
