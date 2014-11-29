<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmReciboEdit.aspx.vb" Inherits="ContableWeb.frmReciboEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="Negocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Emisión de recibos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
<form runat="server" id="frmProductoEdit" class="stdform" method="post">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
<asp:HiddenField ID="hdfSoloLectura" runat="server" />
     <label>Cliente</label>
     <span class="field"><asp:TextBox ID="txtCliente" runat="server" CssClass="longinput"></asp:TextBox></span>
                 <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="txtCliente"   
                    ServiceMethod="VistaCliente"
                    ServicePath="servicios.asmx"
                    MinimumPrefixLength="2" 
                    CompletionListItemCssClass="select"
                    CompletionInterval="100" />
    
    <label>Tipo de Orden</label>
    <span class="field"><asp:DropDownList ID="cmbTipoOrden" runat="server"></asp:DropDownList></span>
    
    <span class="field"><asp:TextBox ID="txtFecha" runat="server" CssClass="smallinput"></asp:TextBox></span>
    <asp:CalendarExtender ID="txtFechaVencimientoExt" TargetControlID="txtFecha" runat="server" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" />

    <p class="stdformbutton">
       <asp:Button ID="cmdVerComprobantes" runat="server" Text="Ver Comprobantes" CssClass="accept" />
    </p>
     <h2 class="table"><span>Información del Recibo</span></h2>
      <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
          <br />
            <div class="title"><h2 class="general"><span>Comprobantes para asociar</span></h2></div>
            <div class="widgetcontent">
               <asp:Repeater ID="rptComprobantesParaAsociar" runat="server">
                <HeaderTemplate>
                    <table cellpadding="0" cellspacing="0" border="0" class="stdtable" id="dyntable">
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
                            <th class="head0">Tipo</th>                
                            <th class="head0">Número</th>                
                            <th class="head0">Fecha</th>
                            <th class="head0">Tipo</th>
                            <th class="head0">Sin saldar</th>
                            <th class="head0">Importe a asociar</th>
                            <th class="head0">&nbsp;</th>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr class="">
                            <td><%#DataBinder.Eval(Container.DataItem, "tipo")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "numero")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "fecha", "{0:dd/MM/yyyy}")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "tipoOrden.descripcion")%></td>
                            <td><%#comprobanteCabeBiz.getSaldoPendienteByComprobante(DataBinder.Eval(Container.DataItem, "idComprobante"))%></td>
                            <td>
                              <asp:TextBox ID="txtImporte" CssClass="smallinput" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton id="lnkEditar" CommandName="Seleccionar" runat="server">Seleccionar</asp:LinkButton>
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
                        
                        </tr>
                    </tfoot>
                    </table>
                </FooterTemplate>
               </asp:Repeater>
            </div>
      </div>
      <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">  
            <hr />
            <div class="title"><h2 class="general"><span>Comprobantes asociados</span></h2></div>
            <div class="widgetcontent">
               <asp:Repeater ID="rptComprobantesAsociados" runat="server">
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
                            <th class="head0">Tipo</th>
                            <th class="head0">Número</th>
                            <th class="head0">Letra</th>
                            <th class="head0">Fecha</th>
                            <th class="head0">Cliente</th>
                            <th class="head0">Vendedor</th>
                            <th class="head0">Tipo Orden</th>
                            <th class="head0">Importe Asociado</th>
                            <th class="head0">&nbsp;</th>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr class="">
                            <td><%#DataBinder.Eval(Container.DataItem, "idComprobante")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "comprobanteCabe.tipo")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "comprobanteCabe.numero")%></td>                          
                            <td><%#DataBinder.Eval(Container.DataItem, "comprobanteCabe.fecha", "{0:dd/MM/yyyy}")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "comprobanteCabe.tipoOrden.descripcion")%></td>
                            <td>
                                  <%# DataBinder.Eval(Container.DataItem, "importeAsociado")%>
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
                           
                        </tr>
                    </tfoot>
                    </table>
                </FooterTemplate>
               </asp:Repeater>
            </div>
        </div>
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
                
                <asp:Repeater ID="rptFormasDePago" runat="server" >
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
</form>
</asp:Content>
