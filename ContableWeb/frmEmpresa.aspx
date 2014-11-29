﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmEmpresa.aspx.vb" Inherits="ContableWeb.frmEmpresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Empresas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<form runat="server" id="frmFamilia" class="">
   <asp:Button ID="cmdNuevo" runat="server" Text="Nueva Familia" CssClass="stdbtn" /><br /><br />
    
    <div class="contenttitle radiusbottom0">
        <h2 class="table"><span>Familias existentes</span></h2>
    </div><!--contenttitle-->
   <asp:Repeater ID="grilla" runat="server">
    <HeaderTemplate>
        <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable">
        <colgroup>
            <col class="con0" />
            <col class="con0" />
            <col class="con0" />
       </colgroup>
        <thead>
            <tr>
                <th class="head1">Id</th>
                <th class="head0">Descripción</th>
                <th class="head0">&nbsp;</th>
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="">
                <td><%#DataBinder.Eval(Container.DataItem, "idEmpresa")%></td>
                <td><%#DataBinder.Eval(Container.DataItem, "descripcion")%></td>
         
                <td><a href="frmEmpresaEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "idEmpresa")%>">Editar</a>
                
                </td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
            <tfoot>
            <tr>
                <th class="head1">Id</th>
                <th class="head0">Descripcion</th>
                <th class="head0">&nbsp;</th>
            </tr>
        </tfoot>
        </table>
    </FooterTemplate>
   </asp:Repeater>
   </form>
</asp:Content>
