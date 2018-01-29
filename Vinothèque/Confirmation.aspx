<%@ Page Title="" Language="C#" MasterPageFile="~/Vinotheque.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Vinothèque.Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
     <h1>Votre commande  a été transmise à notre service de ventes par correspondance. Nous vous remercions pour votre confiance. </h1>
    <asp:Button ID="Button1" runat="server" Text="Retour à l'accueil"  PostBackUrl="~/Accueil.aspx" />
</asp:Content>
