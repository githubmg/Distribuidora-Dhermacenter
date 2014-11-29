﻿<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmProveedorEdit.aspx.vb" Inherits="ContableWeb.frmProveedorEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">Información del proveedor</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">


<div class="contenttitle"><h2 class="form"><span>Proveedor</span></h2></div>
<br />
<form runat="server" id="frmProveedorEdit" class="stdform" action="" method="post">
    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>--%>
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Información de Proveedor</a></li>
        </ul>
        <div id="tabs-1">
            <label>CUIT</label>
            <span class="field"><asp:TextBox ID="txtCuit" runat="server" CssClass="smallinput" MaxLength="11"></asp:TextBox></span>
            <label>Razon social</label>
            <span class="field"><asp:TextBox ID="txtRazonSocial" runat="server" CssClass="mediuminput" MaxLength="100"></asp:TextBox></span>
            <label>Provincia</label>
            <span class="field"><asp:DropDownList ID="cmbProvincia" runat="server" 
                AutoPostBack="True"></asp:DropDownList></span>
            <label>Localidad</label>
            <span class="field"><asp:DropDownList ID="cmbLocalidad" runat="server"></asp:DropDownList></span>
            <label>Domicilio</label>
            <span class="field"><asp:TextBox ID="txtDomicilio" runat="server" CssClass="mediuminput" MaxLength="100"></asp:TextBox></span>
            <label>Código postal</label>
            <span class="field"><asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="smallinput" MaxLength="10"></asp:TextBox></span>
            <label>Teléfono</label>
            <span class="field"><asp:TextBox ID="txtTelefono" runat="server" CssClass="mediuminput" MaxLength="20"></asp:TextBox></span>  
            <label>Correo Electrónico</label>
            <span class="field"><asp:TextBox ID="txtEmail" runat="server" CssClass="mediuminput" MaxLength="100"> </asp:TextBox></span>
            <label>Cuenta Corriente</label>
            <span class="field"><asp:DropDownList ID="cmbCuentaCorriente" runat="server" 
                AutoPostBack="True">
                <asp:ListItem Text="SI" Value="1"></asp:ListItem>
                <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                </asp:DropDownList></span>
            <label>Condición de Pago</label>
            <span class="field"><asp:DropDownList ID="cmbCondicionPago" runat="server"></asp:DropDownList></span>
            <label>Observaciones</label>
            <span class="field"><asp:TextBox ID="txtObservaciones" runat="server" CssClass="longinput" MaxLength="250"> </asp:TextBox></span>
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
