<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ContableWeb.Master" CodeBehind="frmListaDePreciosEdit.aspx.vb" Inherits="ContableWeb.frmListaDePreciosEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="Negocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitulo" runat="server">
Información de la Lista de Precios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentCuerpo" runat="server">
    
<div class="contenttitle"><h2 class="form"><span>Lista de precios</span></h2></div>
<br />
<form runat="server" id="frmEdit" class="stdform" action="" method="post">
  <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Información General</a></li>
        </ul>
        <div id="tabs-1">
            <label>Descripción:</label><span class="field"><asp:TextBox ID="txtDescripcion" runat="server" CssClass="mediuminput" MaxLength="100"></asp:TextBox></span>
            
        </div>
            <div class="widgetbox" style="width:75%; position:relative; margin-left:220px;">
            <div class="title"><h2 class="general"><span>Productos de la lista</span></h2></div>
            <div class="widgetcontent">
                <p>
                <label>Producto</label>
                 <span class="field"><asp:TextBox ID="txtProducto" runat="server" CssClass="longinput"></asp:TextBox></span>
                 <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" 
                    TargetControlID="txtProducto"   
                    ServiceMethod="VistaProducto"
                    ServicePath="servicios.asmx"
                    MinimumPrefixLength="2" 
                    CompletionListItemCssClass="select"
                    CompletionInterval="100" />
                <label>Código</label>
                <span class="field"><asp:TextBox ID="txtCodProducto" runat="server" CssClass="longinput"></asp:TextBox></span>
                <label>Precio</label>
                <span class="field">$&nbsp; <asp:TextBox ID="txtPrecio" runat="server" CssClass="longinput"></asp:TextBox></span>
                       <asp:Button ID="cmdAgregar" runat="server" Text="Agregar" CssClass="accept" ValidationGroup="Items" /> 
                 </p>
 
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
                                </colgroup>
                                <thead>
                                    <tr>
                                        
                                        <th class="head0">Producto</th>
                                        <th class="head0">Código</th>
                                        <th class="head0">Precio</th>                                   
                                        <th class="head0">&nbsp;</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="">
                                <td><%# DataBinder.Eval(Container.DataItem, "Producto.Descripcion")%></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "codigo")%></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "precio")%></td>
                                <td>
                                <asp:LinkButton id="lnkDelete" CommandName="Borrar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"idListaDePreciosItem")%>' runat="server">Borrar</asp:LinkButton>
                                
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                
            </div><!--widgetcontent-->
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
