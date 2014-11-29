<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmCobroEdit.aspx.vb" Inherits="ContableWeb.frmCobroEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Información del Cobro
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<div class="contenttitle"><h2 class="form"><span>Cobro</span></h2></div>
    <br />
    <form runat="server" id="frmCobroEdit" class="stdform" action="" method="post">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
        <p>
        <label>Cliente</label>
        <span class="field"><asp:TextBox ID="txtCliente" runat="server" CssClass="longinput"></asp:TextBox></span>
                 <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="txtCliente"   
                    ServiceMethod="VistaCliente"
                    ServicePath="servicios.asmx"
                    MinimumPrefixLength="2" 
                    CompletionListItemCssClass="select"
                    CompletionInterval="100" />

        <label>Fecha de cobro</label>
        <span class="field"><asp:TextBox ID="txtFecha" runat="server" CssClass="mediuminput"></asp:TextBox></span>
        <asp:CalendarExtender ID="txtFechaExt" TargetControlID="txtFecha" runat="server" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" />
        
        <label>Forma de pago</label>
        <span class="field"><asp:DropDownList ID="cmbFormaPago" runat="server" 
                AutoPostBack="True"></asp:DropDownList></span>

        <asp:UpdatePanel ID="pnlTarjeta" runat="server" Visible="False" >
        <ContentTemplate>
          <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
            <div class="title"><h2 class="general"><span>Datos de la Tarjeta</span></h2></div>
            <div class="widgetcontent">
            
                <label>Código de autorización</label>
                <span class="field"><asp:TextBox ID="txtCodAutorizcion" runat="server" CssClass="longinput"></asp:TextBox></span>
                <label>Código de cupón</label>
                <span class="field"><asp:TextBox ID="txtCupon" runat="server" CssClass="longinput"></asp:TextBox></span>
                <label>Cantidad de cuotas</label>
                <span class="field"><asp:TextBox ID="txtCantidadCuotas" runat="server" CssClass="smallinput></asp:TextBox></span>
                <label>Tipo de tarjeta</label>
                <span class="field"><asp:DropDownList ID="cmbTipoTarjeta" runat="server"></asp:DropDownList></span>
            </div><!--widgetcontent-->
        </div>
        </ContentTemplate>
       </asp:UpdatePanel>
       
        <label>Importe</label>
        <span class="field"><asp:TextBox ID="txtImporte" runat="server" CssClass="smallinput"></asp:TextBox>&nbsp;&nbsp;(9999,99)</span>
        <label>Observaciones</label>
        <span class="field"><asp:TextBox ID="txtObservaciones" runat="server" CssClass="longinput"></asp:TextBox></span>
        <div runat="server" id="divErrorForm" class="notification msgerror" visible ="false" ><a class="close"></a>
            <p><asp:Label ID="lblErrorForm" runat="server" Text=""></asp:Label></p>
        </div>
        <p class="stdformbutton">
            <asp:Button ID="cmdGuardar" runat="server" Text="Guardar" CssClass="accept" />
            <asp:Button ID="cmdCancelar" runat="server" Text="Cancelar" CssClass="reset" />
        </p>
    </form>
</asp:Content>
