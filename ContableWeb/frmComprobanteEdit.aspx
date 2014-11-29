<%@ Page Language="vb" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmComprobanteEdit.aspx.vb" Inherits="ContableWeb.frmComprobante" 
    title="Carga de comprobante" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">Emisión de comprobantes</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">

<div class="contenttitle"><h2 class="form"><span>Carga de comprobante</span></h2></div>
<br />
<form runat="server" id="frmComprobanteProveedor" class="stdform" action="" method="post">
<asp:HiddenField ID="hdfSoloLectura" runat="server" />
<script type="text/javascript">
    function AutoCompletedClientItemSelected() {
        var txt = document.getElementById('<%= Page.Master.FindControl("contentCuerpo").FindControl("txtProducto").ClientID %>');
        var txtDescripcion = document.getElementById('<%= Page.Master.FindControl("contentCuerpo").FindControl("txtDescripcion").ClientID %>');
        txtDescripcion.value = txt.value.split('-')[2].trim();
        CompletarPrecioDeProducto(txt.value.split('-')[0].trim());
    }
    function CompletarPrecioDeProducto(idProducto) {
        var txtCliente = document.getElementById('<%= Page.Master.FindControl("contentCuerpo").FindControl("txtCliente").ClientID %>');
        if (txtCliente.value == '') {
            var txtError = document.getElementById('<%= Page.Master.FindControl("contentCuerpo").FindControl("lblErrorItem").ClientID %>');
            txtError.value = 'Seleccione un cliente antes de elegir un producto';
            return false;
        }
        jQuery.ajax({
             type: "POST",
             url: "../Servicios.asmx/GetPrecioByProductoCliente",
             dataType: "json",
             data: "{'idProducto':'" + idProducto + "' , 'idCliente':'" + txtCliente.value.split('-')[0].trim() + "'}",
             contentType: "application/json; charset=utf-8",
             success: function (data) {                    
                         var txtPrecio = document.getElementById('<%= Page.Master.FindControl("contentCuerpo").FindControl("txtPrecioUnitarioItem").ClientID %>');
                         txtPrecio.value = data.d;   
                    },
             error: function (XMLHttpRequest, textStatus, errorThrown) {
                 alert(textStatus + errorThrown + XMLHttpRequest);
             }
         });
     }
     function autoComplete2_OnClientPopulating(sender, args) {
         sender.set_contextKey(document.getElementById('<%= Page.Master.FindControl("contentCuerpo").FindControl("txtCliente").ClientID %>').value);
     }
</script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>

    <label>Tipo de comprobante</label>
    <span class="field">
    <asp:DropDownList ID="cmbTipoComprobante" runat="server" AutoPostBack="true">
        <asp:ListItem Text="Factura" Value="F">
        </asp:ListItem>
        <asp:ListItem Text="Nota de Crédito" Value="C">
        </asp:ListItem>
        <asp:ListItem Text="Nota de Débito" Value="D">
        </asp:ListItem>
     </asp:DropDownList>
    </span>
    <label>Fecha</label>
    <span class="field"><asp:TextBox ID="txtFecha" runat="server" CssClass="smallinput"></asp:TextBox></span>
    <asp:CalendarExtender ID="txtFechaVencimientoExt" TargetControlID="txtFecha" runat="server" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" />

     <label>Cliente</label>
     <span class="field"><asp:TextBox ID="txtCliente" runat="server" CssClass="longinput"></asp:TextBox></span>
                 <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="txtCliente"   
                    ServiceMethod="VistaCliente"
                    ServicePath="servicios.asmx"
                    MinimumPrefixLength="2" 
                    CompletionListItemCssClass="select"
                    CompletionInterval="100" />

    <label>Condición de venta</label>
    <span class="field">
        <asp:DropDownList ID="cmbCondicionVenta" AutoPostBack="true" runat="server">
            <asp:ListItem Value="CD">Contado</asp:ListItem>
            <asp:ListItem Value="CT">Cuenta Corriente</asp:ListItem>
        </asp:DropDownList>
    </span>

    <label>Vendedor</label>
    <span class="field">
        <asp:DropDownList ID="cmbVendedor" runat="server">
        </asp:DropDownList>
    </span>
    <label>Tipo Orden</label>
    <span class="field">
        <asp:DropDownList ID="cmbTipoOrden" runat="server">
        </asp:DropDownList>
    </span>
    <label>Descuento</label>
    <span class="field"><asp:TextBox ID="txtDescuentoGlobal" runat="server" CssClass="longinput"></asp:TextBox></span>
    <br />
    <asp:UpdatePanel ID="up1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="cmdAgregar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="grilla" EventName="ItemCommand" />
        </Triggers>
        <ContentTemplate>
        <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
            <div class="title"><h2 class="general"><span>Items del comprobante</span></h2></div>
            <div class="widgetcontent">
                <asp:Panel ID="pnlAgregarItem" runat="server">
                
                <p>
                    <label>Producto</label>
                    <span class="field"><asp:TextBox ID="txtProducto" runat="server" CssClass="longinput" MaxLength="100"></asp:TextBox></span>
                    <asp:AutoCompleteExtender  ID="AutoCompleteExtender2" runat="server" 
                                                TargetControlID="txtProducto"   
                                                ServiceMethod="VistaProducto"
                                                ServicePath="servicios.asmx"
                                                MinimumPrefixLength="2" 
                                                CompletionListItemCssClass="select"
                                                CompletionInterval="100"
                                                OnClientItemSelected="AutoCompletedClientItemSelected"
                                                UseContextKey="true"
                                                OnClientPopulating="autoComplete2_OnClientPopulating"                                              
                                                 />
                    <label>Descripción</label>
                    <span class="field"><asp:TextBox ID="txtDescripcion" runat="server" CssClass="longinput"></asp:TextBox></span>
                    <label>Valor Unitario</label>
                    <span class="field"><asp:TextBox ID="txtPrecioUnitarioItem" runat="server" CssClass="smallinput"></asp:TextBox></span>
                    <label>Cantidad</label>
                    <span class="field"><asp:TextBox ID="txtCantidadItem" runat="server" CssClass="smallinput"></asp:TextBox></span>
                    <label>Porcentaje de descuento</label>
                    <span class="field"><asp:TextBox ID="txtDescuento" runat="server" CssClass="smallinput"></asp:TextBox></span>
                  
                    <asp:Button ID="cmdAgregar" runat="server" Text="Agregar" CssClass="accept" ValidationGroup="Items" />        
                </p>
                </asp:Panel>
                <div runat="server" id="divErrorItem" class="notification msgerror" visible ="false" ><a class="close"></a>
                    <p><asp:Label ID="lblErrorItem" runat="server" Text=""></asp:Label></p>
                </div>
                
                <asp:Repeater ID="grilla" runat="server" >
                    <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" border="1" class="stdtable delete">
                            <colgroup>
                                <col class="con0" />
                                <col class="con0" />
                                <col class="con0" />
                                <col class="con0" />
                                <col class="con0" />
                                <col class="con0" />
                               
                            </colgroup>
                            <thead>
                                <tr>
                                 
                                    <th class="head0">Descripcion</th>
                                    <th class="head0">Valor Unitario</th>
                                    <th class="head0">Cantidad</th>
                                    <th class="head0">% Descuento</th>
                                    <th class="head0">&nbsp;</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="">
                            <td><%#DataBinder.Eval(Container.DataItem, "Descripcion")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "PrecioUnitario")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Cantidad")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Descuento")%></td>  
                            <td>
                            <asp:LinkButton id="lnkDelete" CommandName="Borrar" runat="server">Borrar</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                
            </div><!--widgetcontent-->
        </div>
    
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="up2" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="cmdAgregarFormaDePago" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="grilla2" EventName="ItemCommand" />
        </Triggers>
        <ContentTemplate>
        <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
            <div class="title"><h2 class="general"><span>Forma de Pago</span></h2></div>
            <div class="widgetcontent">
                <asp:Panel ID="pnlAgregarCobro" runat="server">
               
                <p>
                    <label>Forma de pago</label>
                    <span class="field">
						<asp:DropDownList ID="cmbFormaPago" runat="server" AutoPostBack="true">
						</asp:DropDownList>
					</span>                   
                    <label>Importe</label>
                    <span class="field"><asp:TextBox ID="txtImporte" runat="server" CssClass="longinput"></asp:TextBox></span>					
                    <asp:Panel ID="pnlTarjeta" runat="server" Visible="false">
                     <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
                        <div class="title"><h2 class="general"><span>Datos de la Tarjeta</span></h2></div>
                        <div class="widgetcontent">
                            <label>Tipo de Tarjeta</label>
                            <span class="field">
						        <asp:DropDownList ID="cmbTipoTarjeta" runat="server">
						        </asp:DropDownList>
					        </span>
                            <label>Cupón</label>
                           <span class="field"><asp:TextBox ID="txtCupon" runat="server" CssClass="longinput"></asp:TextBox></span>					
                            <label>Autorización</label>
                            <span class="field"><asp:TextBox ID="txtAutorizacion" runat="server" CssClass="longinput"></asp:TextBox></span>					
                            <label>Cuotas</label>
                            <span class="field"><asp:TextBox ID="txtCuotas" runat="server" CssClass="smallinput"></asp:TextBox></span>					                   
                        </div>
                       </div>
                    </asp:Panel>
                    <asp:Button ID="cmdAgregarFormaDePago" runat="server" Text="Agregar" CssClass="accept" ValidationGroup="ItemsFormasDePago" />        
                </p>
                </asp:Panel>
                <div runat="server" id="div1" class="notification msgerror" visible ="false" ><a class="close"></a>
                    <p><asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>
                </div>
                
                <asp:Repeater ID="grilla2" runat="server" >
                    <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" border="1" class="stdtable delete">
                            <colgroup>
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
                                 
                                    <th class="head0">Forma de pago</th>
                                    <th class="head0">Importe</th>
                                    <th class="head0">Tipo de tarjeta</th>
                                    <th class="head0">Cupón</th>
                                    <th class="head0">Autorización</th>
									<th class="head0">Cuotas</th>
                                    <th class="head0">&nbsp;</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="">
                            <td><%#DataBinder.Eval(Container.DataItem, "formaDePago.descripcion")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "importe")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "tipotarjeta.descripcion")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "tarjetaCupon")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "tarjetaAutorizacion")%></td>
							<td><%# DataBinder.Eval(Container.DataItem, "tarjetaCuotas")%></td>
                            <td>
                            <asp:LinkButton id="lnkDelete" CommandName="Borrar" runat="server">Borrar</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                
            </div><!--widgetcontent-->
        </div>
    
        </ContentTemplate>
    </asp:UpdatePanel>
    <div runat="server" id="divErrorForm" class="notification msgerror" visible ="false" ><a class="close"></a>
        <p><asp:Label ID="lblErrorForm" runat="server" Text=""></asp:Label></p>
    </div>

    <p class="stdformbutton">
        <asp:Button ID="cmdGuardar" runat="server" Text="Guardar" CssClass="accept" />
        <asp:Button ID="cmdCancelar" runat="server" Text="Cancelar" CssClass="reset" />
    </p>
</form>
</asp:Content>
