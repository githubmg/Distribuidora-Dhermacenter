﻿<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmCuentaEdit.aspx.vb" Inherits="ContableWeb.frmCuentaEdit" 
    title="Datos de la cuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">Información de la cuenta</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<div class="contenttitle"><h2 class="form"><span>Cuentas</span></h2></div>
<br />
<form runat="server" id="frmCuentaEdit" class="stdform" action="" method="post">
    <p>
    <label>Código de cuenta</label>
    <span class="field"><asp:TextBox ID="txtCuenta" runat="server" CssClass="smallinput"></asp:TextBox></span>
    <small class="desc">Código de la cuenta (del tipo X.X.XX.XX.XX)</small>

    <small class="desc">Descripción de la cuenta</small>
    <small class="desc">Tipo de la cuenta</small>
        <asp:DropDownList ID="cmbCentroCostos" runat="server"></asp:DropDownList>
    </span>
    <small class="desc">Centro de costos asignado</small>
        <p><asp:Label ID="lblErrorForm" runat="server" Text=""></asp:Label></p>
    </div>
        <asp:Button ID="cmdGuardar" runat="server" Text="Guardar" CssClass="accept"/>
        <asp:Button ID="cmdCancelar" runat="server" Text="Cancelar" CssClass="reset" />
    </p>


</asp:Content>