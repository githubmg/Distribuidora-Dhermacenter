<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmPedidoEdit.aspx.vb" Inherits="ContableWeb.frmPedidoEdit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
    Pedido
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
  <div class="contenttitle"><h2 class="form"><span>Pedidos</span></h2></div>
    <br />
    <form runat="server" id="form1" class="stdform" action="" method="post">
         <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
      
        <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
            <div class="title"><h2 class="general"><span>Items del pedido</span></h2></div>
            <div class="widgetcontent">
            <asp:Panel ID="pnlItemAgregar" runat="server">
                    <label>Producto</label>
                    <span class="field"><asp:TextBox ID="txtProducto" runat="server" CssClass="longinput"></asp:TextBox></span>

                    <asp:DropDownList ID="cmbVendedor" runat="server" AutoPostBack="True" Visible="false"></asp:DropDownList>  
                      
                    <label>Cantidad</label>
                        <span class="field"><asp:TextBox ID="txtCantidad" runat="server" 
                    CssClass="smallinput" MaxLength="9"></asp:TextBox></span>
                       <label>Observaciones</label>
                      <span class="field"><asp:TextBox ID="txtObservacionesItem" runat="server" 
                    CssClass="smallinput" MaxLength="100"></asp:TextBox></span>
                    <p>
                        <asp:Button ID="cmdAgregar" runat="server" Text="Agregar" CssClass="accept" ValidationGroup="Items" />        
                    </p>
                <div runat="server" id="divErrorItem" class="notification msgerror" visible ="false" ><a class="close"></a>
                   <p><asp:Label ID="lblErrorItem" runat="server" Text=""></asp:Label></p>
                </div>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                        TargetControlID="txtProducto"   
                        ServiceMethod="VistaProducto"
                        ServicePath="servicios.asmx"
                        MinimumPrefixLength="2" 
                        CompletionListItemCssClass="select"
                        CompletionInterval="100" 
                                               />
     
      </asp:Panel>
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
                                        <th class="head0">Vendedor</th>
                                        <th class="head0">Familia</th>
                                        <th class="head0">Producto</th>
                                        <th class="head0">Cantidad</th>
                                        <th class="head0">Precio unitario</th>                
                                        <th class="head0">&nbsp;</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="">
                                <td><%# DataBinder.Eval(Container.DataItem, "Vendedor.Descripcion")%></td>
                                <td><%# DataBinder.Eval(Container.DataItem,"Producto.Familia.Descripcion")%></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "Producto.Descripcion")%></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "Cantidad")%></td>                               
                                <td><%#DataBinder.Eval(Container.DataItem, "PrecioUnitario")%></td>
                                <td>
                                <asp:LinkButton id="lnkDelete" CommandName="Borrar" runat="server">Borrar</asp:LinkButton>&nbsp;-&nbsp;
                                <asp:LinkButton id="lnkEditar" CommandName="Editar" runat="server">Editar</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                 
            </div><!--widgetcontent-->
        </div>
        <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
        <div class="title"><h2 class="general"><span>Medios de pago</span></h2></div>
        <div class="widgetcontent">
        <asp:Panel ID="pnlCobroAgregar" runat="server">
        <label>Importe</label>
        <span class="field">$&nbsp;<asp:TextBox ID="txtImporteCobro" runat="server" CssClass="longinput"></asp:TextBox></span>
        <label>Medio de pago</label>
        <span class="field"><asp:DropDownList ID="cmbMedioPago" runat="server" 
        AutoPostBack="True"></asp:DropDownList></span>
        <asp:Panel ID="panelTarjeta" runat="server" Visible="false">
            <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
            <div class="title"><h2 class="general"><span>Datos de la Tarjeta</span></h2></div>
            <div class="widgetcontent">
                <label>Tipo de tarjeta</label>
                <span class="field"><asp:DropDownList ID="cmbTipoTarjeta" runat="server"></asp:DropDownList></span>
                <label>Número</label>
                <span class="field"><asp:TextBox ID="txtNroTarjeta" runat="server" CssClass="longinput" MaxLength="16" Placeholder="1111111111111111"></asp:TextBox></span>
                <label>Fecha de vencimiento</label>
                <span class="field"><asp:TextBox ID="txtMesTarjeta" runat="server" Width="20px" MaxLength="2" Placeholder="MM"></asp:TextBox> / <asp:TextBox ID="txtAnioTarjeta" runat="server" Width="20px" MaxLength="2" Placeholder="AA"></asp:TextBox></span>
                <label>Código de seguridad</label>
                <span class="field"><asp:TextBox ID="txtCodSeguridad" runat="server" Width="50px" MaxLength="4" ></asp:TextBox></span>
                <label>Nombre</label>
                <span class="field"><asp:TextBox ID="txtNombreTarjeta" runat="server" CssClass="longinput"></asp:TextBox></span>  
            </div><!--widgetcontent-->

            </div>
        </asp:Panel>
        <p>
            <asp:Button ID="cmdAgregarCobro" runat="server" Text="Agregar" CssClass="accept" ValidationGroup="Cobro" />        
        </p>
        </asp:Panel>
        <div runat="server" id="div1" class="notification msgerror" visible ="false" ><a class="close"></a>
            <p><asp:Label ID="lblErrorCobro" runat="server" Text=""></asp:Label></p>
        </div>
        <asp:Repeater ID="grillaCobros" runat="server" >
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
                    <col class="con0" />
                </colgroup>
                <thead>
                                <tr>
                                    <th class="head0">Importe</th>
                                    <th class="head0">Medio de pago</th>
                                    <th class="head0">Tipo de tarjeta</th>
                                    <th class="head0">Número</th>
                                    <th class="head0">F. de vencimiento</th>                
                                    <th class="head0">Cod. Seguridad</th>
                                    <th class="head0">Nombre</th>
                                    <th class="head0">&nbsp;</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="">
                            <td><%# DataBinder.Eval(Container.DataItem, "Importe")%></td>
                            <td><%# DataBinder.Eval(Container.DataItem,"MedioPago.Descripcion")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "Tarjeta.TipoTarjeta.Descripcion")%></td>
                            <td><%#DataBinder.Eval(Container.DataItem, "Tarjeta.Numero")%></td>                               
                            <td><%#DataBinder.Eval(Container.DataItem, "Tarjeta.MesYAnio")%></td>  
                            <td><%#DataBinder.Eval(Container.DataItem, "Tarjeta.CodigoSeguridad")%></td>  
                            <td><%#DataBinder.Eval(Container.DataItem, "Tarjeta.Nombre")%></td>  
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
        <label>Cliente</label>
        <span class="field"><asp:TextBox ID="txtCliente" runat="server" CssClass="mediuminput"></asp:TextBox></span>
                              
        <label>Fecha de pedido</label>
        <span class="field"><asp:TextBox ID="txtFecha" runat="server" CssClass="smallinput"></asp:TextBox></span>

        <label>Estado</label>
        <span class="field"><asp:DropDownList ID="cmbEstado" runat="server"></asp:DropDownList></span>
        
         <label>Tipo</label>
        <span class="field"><asp:DropDownList ID="cmbTipoOrden" runat="server" AutoPostBack="true"></asp:DropDownList></span>
    
        <label>Importe</label>
        <span class="field">$ &nbsp;<asp:Label ID="lblImporte" runat="server" Text=""></asp:Label></span>

        <label>Observaciones</label>
        <span class="field"><asp:TextBox ID="txtObservaciones" runat="server" CssClass="longinput"></asp:TextBox></span>

        <div runat="server" id="divErrorForm" class="notification msgerror" visible ="false" ><a class="close"></a>
            <p><asp:Label ID="lblErrorForm" runat="server" Text=""></asp:Label></p>
        </div>
        <p class="stdformbutton">
            <asp:Button ID="cmdGuardar" runat="server" Text="Guardar" CssClass="accept" />
            <asp:Button ID="cmdCancelar" runat="server" Text="Volver" CssClass="reset" />
        </p>

        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
            TargetControlID="txtCliente"   
            ServiceMethod="VistaCliente"
            ServicePath="servicios.asmx"
            MinimumPrefixLength="2" 
            CompletionListItemCssClass="select"
            CompletionInterval="100" />
        <asp:CalendarExtender ID="txtFechaExt" TargetControlID="txtFecha" runat="server" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" />
    </form>
</asp:Content>
