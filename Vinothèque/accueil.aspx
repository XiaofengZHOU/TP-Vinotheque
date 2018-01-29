<%@ Page Title="" Language="C#" MasterPageFile="~/Vinotheque.master" AutoEventWireup="true" CodeFile="accueil.aspx.cs" Inherits="Accueil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <h1>Bienvenue sur le site internet de la société "La Vinothèque" !</h1>
    <h2>Nous vous proposons des vins de qualité provenant de 10 régions françaises :</h2>
    <ol>
        <li>
            Alsace
        </li>
        <li>
            Beaujolais
        </li>
        <li>
            Bordeaux
        </li>
        <li>
            Bourgogne
        </li>
        <li>
            Champagne
        </li>
        <li>
            Languedoc-Roussillon
        </li>
        <li>
            Médoc
        </li>
        <li>
            Provence
        </li>
        <li>
            Savoie
        </li>
        <li>
            Val de Loire
        </li>
    </ol>
    <asp:Button ID="Button1" runat="server" Text="Voir notre catagolue" PostBackUrl="~/Catalogue.aspx"/>
</asp:Content>

