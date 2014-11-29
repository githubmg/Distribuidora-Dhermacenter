﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmCliente.aspx.vb" Inherits="ContableWeb.frmCliente" %>

<%@ Import Namespace="Negocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">Clientes</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
 <form runat="server" id="frmCliente" class="">
   <asp:Button ID="cmdNuevo" runat="server" Text="Nuevo Cliente" CssClass="stdbtn" /><br /><br />
    
    <div class="contenttitle radiusbottom0">
        <h2 class="table"><span>Clientes existentes</span></h2>
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
                <th class="head0">Condición IVA</th>
                <th class="head0">Cta. Cte.</th>
                <th class="head0">Lista de Precios</th>
                <th class="head0">Forma de pago</th>
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
                <td><%#DataBinder.Eval(Container.DataItem, "condicionIva.descripcion")%></td>
                <td><%# Utiles.BooleanAString(DataBinder.Eval(Container.DataItem, "cuentaCorriente"))%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "listaDePrecio.descripcion")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "formaDeContacto.descripcion")%></td>
                <td><a href="frmClienteEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "idCliente")%>">Editar</a>
                 
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
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0"></th>
                <th class="head0">&nbsp;</th>
            </tr>
        </tfoot>
        </table>
    </FooterTemplate>
   </asp:Repeater>
   </form>
</asp:Content>