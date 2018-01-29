<%@ Page Title="" Language="C#" MasterPageFile="~/Vinotheque.Master" AutoEventWireup="true" CodeBehind="Catalogue.aspx.cs" Inherits="Vinothèque.Catalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Voici notre catalogue :</h1>
    <h2>Veuillez choisir la région :</h2>
    <asp:SqlDataSource ID="SqlDataSourceRegions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [region] FROM [vins]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1"  runat="server" DataSourceID="SqlDataSourceRegions" DataTextField="region" DataValueField="region" AutoPostBack="False"> </asp:DropDownList>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Voir les vins de cette région" />

    <asp:SqlDataSource ID="SqlDataSourceVinOfRegion" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idvin], [nom], [millesime], [nomgif], [prix] FROM [vins] WHERE ([region] = @region)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="Alsace" Name="region" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceVinOfRegion" OnItemCommand="DataList1_ItemCommand" >
        <ItemTemplate>
            <div class="vin">
                <div class="vin_image">

                    <asp:Image ID="nomgifLabel" runat="server" ImageUrl='<%# string.Format("~/App_Themes/Theme1/{0}",Eval("nomgif")) %>' />
                    <div class="vin_infos">
                        <strong>
                            <asp:Label ID="nomLabel" runat="server" Text='<%# Eval("nom") %>' />
                        </strong>
                        <asp:Label ID="idvinLable" runat="server" Visible="false" Text='<%# Eval("idvin") %>' />
                        <br />
                        millesime:<asp:Label ID="millesimeLabel" runat="server" Text='<%# Eval("millesime") %>' />
                        <br />
                        prix:<asp:Label ID="prixLabel" runat="server" Text='<%# Eval("prix") %>'  />
                        <img src="App_Themes/Theme1/Images_bandeau/euro.gif" />
                        <asp:Label ID="prixLabelUSD" runat="server" />
                        <br />
                        <div class="quantite">
                            Quantité :
                            <asp:TextBox ID="Quantite" runat="server" Width="25px" Height="36px" Text="0"></asp:TextBox>
                            <br />
                            <asp:Button ID="Button1" runat="server" Height="30px" Text="Commander" BackColor="SkyBlue"  />
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    
    <asp:Button ID="Button2" runat="server" Text="Voir le Caddie"  PostBackUrl="~/Caddie.aspx" />
    <asp:Button ID="Button3" runat="server" Text="Retour à l'accueil"  PostBackUrl="~/Accueil.aspx" />
</asp:Content>
