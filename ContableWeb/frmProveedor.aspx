<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmProveedor.aspx.vb" Inherits="ContableWeb.frmProveedor" %>

<%@ Import Namespace="Negocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">Proveedores</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
 <form runat="server" id="frmProveedor" class="">
   <asp:Button ID="cmdNuevo" runat="server" Text="Nuevo Proveedor" CssClass="stdbtn" /><br /><br />
    
    <div class="contenttitle radiusbottom0">
        <h2 class="table"><span>Proveedores existentes</span></h2>
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
                <th class="head0">CUIT</th>
                <th class="head0">Razón Social</th>
                <th class="head0">Teléfono</th>
                <th class="head0">Correo Electrónico</th>
                <th class="head0">Domicilio</th>
                <th class="head0">Localidad</th>
                <th class="head0">Condición Pago</th>
                <th class="head0">Cta. Cte.</th>
                <th class="head0">&nbsp;</th>
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="">
                <td><%# DataBinder.Eval(Container.DataItem, "cuit")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "razonSocial")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "telefono")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "email")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "domicilio")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "localidad.descripcion")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "condicionPago.descripcion")%></td>
                <td><%# Utiles.BooleanAString(DataBinder.Eval(Container.DataItem, "cuentaCorriente"))%></td>
                <td><a href="frmProveedorEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "idProveedor")%>">Editar</a>
            
                </td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
            <tfoot>
            <tr>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
                <tf class="head0"></tf>
            </tr>
        </tfoot>
        </table>
    </FooterTemplate>
   </asp:Repeater>
   </form>
</asp:Content>
