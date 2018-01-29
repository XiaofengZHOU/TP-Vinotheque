<%@ Page Title="" Language="C#" MasterPageFile="~/Vinotheque.Master" AutoEventWireup="true" CodeBehind="Caddie.aspx.cs" Inherits="Vinothèque.Caddie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Voici votre Caddie !
        <asp:SqlDataSource ID="SqlDataSourceCaddie" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [prodcomm] WHERE [idprodcomm] = @idprodcomm AND [idcomm] = @idcomm AND [idvin] = @idvin" 
            InsertCommand="INSERT INTO [prodcomm] ([idcomm], [idvin], [quantite]) VALUES (@idcomm, @idvin, @quantite)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT  [idvin],  SUM([quantite])  AS quantite FROM [prodcomm] WHERE ([idcomm] = @idcomm2) GROUP BY idvin" 
            UpdateCommand="UPDATE [prodcomm] SET [quantite] = @quantite WHERE [idprodcomm] = @idprodcomm AND [idcomm] = @idcomm AND [idvin] = @idvin">
            <DeleteParameters>
                <asp:Parameter Name="idprodcomm" Type="Int32" />
                <asp:Parameter Name="idcomm" Type="Int32" />
                <asp:Parameter Name="idvin" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idcomm" Type="Int32" />
                <asp:Parameter Name="idvin" Type="Int32" />
                <asp:Parameter Name="quantite" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="quantite" Type="Int32" />
                <asp:Parameter Name="idprodcomm" Type="Int32" />
                <asp:Parameter Name="idcomm" Type="Int32" />
                <asp:Parameter Name="idvin" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idcomm2" SessionField="idcommande" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idvin" DataSourceID="SqlDataSourceCaddie" EnableModelValidation="True" OnRowCommand="GridView1_Command">
            <Columns>
                <asp:TemplateField HeaderText="Etiquette :">
                    <ItemTemplate>
                        <asp:Image ID="etiquetteVin" runat="server" Height="200px" Width="200px"  />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nom du vin :">
                    <ItemTemplate>
                        <asp:Label ID="nomVin" runat="server" EnableTheming="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField Visible="False" HeaderText="idvin" SortExpression="idvin">
                    <ItemTemplate>
                        <asp:Label ID="idVin" runat="server" Text='<%# Bind("idvin") %>' EnableTheming="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantité" SortExpression="idvin">
                    <ItemTemplate>
                        <asp:TextBox ID="quantite" runat="server" Width="40px" Text='<%# Bind("quantite") %>' EnableTheming="false"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Height="30px" Text="Modifier" BackColor="SkyBlue" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField  HeaderText="Prix unitaire :">
                    <ItemTemplate>
                        <asp:Label ID="prixVin" runat="server"  EnableTheming="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Total :">
                    <ItemTemplate>
                        <asp:Label ID="total" runat="server" EnableTheming="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>

        <strong>Total Hors Taxe :</strong>
        <asp:Label ID="prixHTLabel" runat="server" EnableTheming="false"></asp:Label><img src="App_Themes/Theme1/Images_bandeau/euro.gif" class="euro" /><br />
        <br />
        <strong>TVA à 19,6% : </strong>
        <asp:Label ID="TVALabel" runat="server" EnableTheming="false"></asp:Label><img src="App_Themes/Theme1/Images_bandeau/euro.gif" class="euro" /><br />
        <br />
        <strong>Total Toutes Taxes Comprises : </strong>
        <asp:Label ID="prixTTCLabel" runat="server" EnableTheming="false"></asp:Label><img src="App_Themes/Theme1/Images_bandeau/euro.gif" class="euro" /><br />

        <asp:Button ID="Button4" runat="server" Text="Envoyer la commande"  PostBackUrl="~/Recapitulative.aspx" />


    </h1>
    <asp:Button ID="Button2" runat="server" Text="Voir le Caddie"  PostBackUrl="~/Caddie.aspx" />
    <asp:Button ID="Button3" runat="server" Text="Retour à l'accueil"  PostBackUrl="~/Accueil.aspx" />
</asp:Content>
