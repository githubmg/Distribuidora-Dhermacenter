<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmRecibo.aspx.vb" Inherits="ContableWeb.frmRecibo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Recibos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<form runat="server" id="frmComprobante" class="">
   <asp:Button ID="cmdNuevo" runat="server" Text="Nuevo Recibo" CssClass="stdbtn" /><br /><br />
      <div class="contenttitle radiusbottom0">
        <h2 class="table"><span>Recibos existentes</span></h2>
    </div><!--contenttitle-->
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
            <col class="con0" />         
        </colgroup>
        <thead>
            <tr>
                <th class="head0">Id</th>
               
                <th class="head0">Número</th>
                <th class="head0">Letra</th>
                <th class="head0">Fecha</th>
                <th class="head0">Cliente</th>
                <th class="head0">Condición de venta</th>
                <th class="head0">Vendedor</th>
                <th class="head0">Tipo Orden</th>
                <th class="head0">&nbsp;</th>
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="">
                <td><%#DataBinder.Eval(Container.DataItem, "idComprobante")%></td>
              
                <td><%#DataBinder.Eval(Container.DataItem, "numero")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "letra")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "fecha", "{0:dd/MM/yyyy}")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "cliente.razonSocial")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "condicionVenta")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "vendedor.descripcion")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "tipoOrden.descripcion")%></td>
                <td><a href="frmComprobanteEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "idComprobante")%>">Ver</a>
                
                </td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
            <tfoot>
            <tr>
                <th class="head0"></th>
                <th class="head0"></th>
                
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"> </th>
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
