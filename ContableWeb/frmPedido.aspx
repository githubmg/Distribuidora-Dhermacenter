<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmPedido.aspx.vb" Inherits="ContableWeb.frmPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">Pedidos</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
 <form runat="server" id="frmPedido" class="">
    <asp:Button ID="cmdNuevo" runat="server" Text="Nuevo Pedido" CssClass="stdbtn" />
    <br /><br />
    <div class="contenttitle radiusbottom0">
        <h2 class="table"><span>Pedidos</span></h2>
    </div><!--contenttitle-->
     <br />
     <div id="divExportacion" runat="server" >
   
            <asp:LinkButton ID="lnkExpoXLS" runat="server" CssClass="btn btn_grid2"><span>Excel</span></asp:LinkButton>
     </div>
     <br />
   <asp:Repeater ID="grilla" runat="server">
    <HeaderTemplate>
        <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable">
        <colgroup>
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
        </colgroup>
        <thead>
            <tr>
                <th class="head1">Id</th>
                <th class="head0">Fecha de Pedido</th>
                <th class="head0">Cliente</th>
                <th class="head0">Estado</th>
                <th class="head0">Importe</th>
                <th class="head0">Tipo</th>
                <th class="head0">Observaciones</th>
                <th class="head0">&nbsp;</th>
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="">
                <td><%# DataBinder.Eval(Container.DataItem, "idPedidoCabe")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "fechaPedido", "{0:dd/MM/yyyy}")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "razonSocial")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "estado")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "importe")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "tipo")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "observaciones")%></td>
                <td><a href="frmPedidoEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "idPedidoCabe")%>">Ver</a></td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
            <tfoot>
            <tr>
                <th class="head1">&nbsp;</th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
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
