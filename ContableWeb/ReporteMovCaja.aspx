<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="ReporteMovCaja.aspx.vb" Inherits="ContableWeb.ReporteMovCaja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Reporte de Movimientos de Caja
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script language="javascript" type="text/javascript">
    window.onload = function lalal() {
        var iframes = document.getElementsByTagName("IFRAME");
        for (var i = 0, ln = iframes.length; i < ln; i++) {
            iframes[0].parentNode.removeChild(iframes[0]);
        }
    }
</script>
    <form id="frmReporteMovCaja" runat="server" class="stdform" >
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
      
        <label>Desde:</label>
        <span class="field"><asp:TextBox ID="txtFechaDesde" runat="server" CssClass="smallinput"></asp:TextBox></span>
        <asp:CalendarExtender ID="txtFechaDesdeExt" TargetControlID="txtFechaDesde" runat="server" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" />

        <label>Hasta:</label>
        <span class="field"><asp:TextBox ID="txtFechaHasta" runat="server" CssClass="smallinput"></asp:TextBox></span>
        <asp:CalendarExtender ID="txtFechaHastaExt" TargetControlID="txtFechaHasta" runat="server" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" />
        
        <p class="stdformbutton">
            <asp:Button ID="cmdVerMovimientos" runat="server" Text="Ver Movimientos" CssClass="accept"/>
            <asp:Button ID="cmdVolver" runat="server" Text="Volver" CssClass="reset" />
        </p>
        
        <div runat="server" id="divErrorForm" class="notification msgerror" visible ="false" ><a class="close"></a>
            <p><asp:Label ID="lblErrorForm" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="contenttitle radiusbottom0">
            <h2 class="table"><span>Subtotales</span></h2>
        </div>
        <br />
        <asp:Repeater ID="grilla" runat="server">
            <HeaderTemplate>
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable">
                <thead>
                    <tr>
                        <th class="head1">Medio de Pago</th>
                        <th class="head0">Tarjeta</th>
                        <th class="head0">Ingresos</th>
                        <th class="head0">Egresos</th>
                        <th class="head0">Saldo</th>
                  </tr>
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
                    <tr class="">
                        <td><%#DataBinder.Eval(Container.DataItem, "medioDePago")%></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "tarjeta")%></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "ingresos")%></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "egresos")%></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "saldo")%></td>
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
                        </tr>
                </tfoot>
                </table>
            </FooterTemplate>
            </asp:Repeater>
        <div style="text-align:right;padding-right:20px;padding-left:20px;font-size:16px;font-weight:bold;border-style:solid;border-width:1px">
         <span class="field"><asp:Label ID="lblTotal" runat="server" CssClass="smallinput"></asp:Label></span>
        </div>
        <div class="contenttitle radiusbottom0">
            <h2 class="table"><span>Movimientos de Caja</span></h2>
        </div>
        <br />
        <div id="divExportacion" runat="server" visible="false">
            <asp:LinkButton ID="lnkExpoPDF" runat="server" CssClass="btn btn_pdf"  ><span>PDF</span></asp:LinkButton>
            <asp:LinkButton ID="lnkExpoXLS" runat="server" CssClass="btn btn_grid2"><span>Excel</span></asp:LinkButton>
        </div>
      <br />

<asp:Repeater ID="grillaMovimientos" runat="server">
    <HeaderTemplate>
        <table cellpadding="0" cellspacing="0" border="0" class="stdtable">
        <thead>
            <tr>
                <th class="head1">Concepto</th>
                <th class="head0">Fecha</th>
                <th class="head0">Medio de Pago</th>
                <th class="head0">Tipo</th>
                <th class="head0">Monto</th>
                
               
              
                
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="">
                <td><%#DataBinder.Eval(Container.DataItem, "concepto")%></td>
                <td><%# CType(DataBinder.Eval(Container.DataItem, "fecha"), Date).ToShortDateString()%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "medioDePago")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "tipo")%></td>
                <td><%# DataBinder.Eval(Container.DataItem, "monto")%></td>
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
                </tr>
        </tfoot>
        </table>
    </FooterTemplate>
    </asp:Repeater>
</form>
</asp:Content>
