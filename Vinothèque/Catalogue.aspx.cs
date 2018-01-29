using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Vinothèque.ws;

namespace Vinothèque
{
    public partial class Catalogue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            System.Data.SqlClient.SqlConnection cnn = new System.Data.SqlClient.SqlConnection(connStr);
            SqlCommand selectId = new SqlCommand("SELECT MAX(idcomm) FROM[commandes] ", cnn);
            int idcommande;
            cnn.Open();
            try
            {
                idcommande = (int)selectId.ExecuteScalar();
            }
            catch
            {
                SqlCommand insertCommandesComm = new SqlCommand("INSERT into commandes(total) values(@total)", cnn);
                //insertCommandesComm.Parameters.AddWithValue("@idcomm", Convert.ToInt32(Session["idcommande"].ToString()));
                insertCommandesComm.Parameters.AddWithValue("@total", 0);
                insertCommandesComm.ExecuteNonQuery();
                idcommande = (int)selectId.ExecuteScalar();
            }
            
            cnn.Close();
            Session["idcommande"] = idcommande;

            foreach (DataListItem item in DataList1.Items)
            {
                Label prixLabel = (Label)item.FindControl("prixLabel");
                Label prixLabelUSD = (Label)item.FindControl("prixLabelUSD");
                string prix = prixLabel.Text;

                CurrencyConvertor conv = new CurrencyConvertor();
                double rate = (conv.ConversionRate(Currency.EUR, Currency.USD));
                string prixUSD = Convert.ToString(Convert.ToDouble(prix) * rate);
                prixLabelUSD.Text = "(" + prixUSD + " )";
            }

                

           








        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label idvinLab = (Label)e.Item.FindControl("idvinLable");
            Session["currentIdVin"] = Convert.ToInt32(idvinLab.Text);
            TextBox quantiteLab = (TextBox)e.Item.FindControl("Quantite");
            Session["currentQuantite"] = Convert.ToInt32(quantiteLab.Text);

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            System.Data.SqlClient.SqlConnection cnn = new System.Data.SqlClient.SqlConnection(connStr);
            SqlCommand insertProdComm = new SqlCommand("INSERT into prodcomm(idcomm, idvin, quantite) values(@idcomm, @idvin, @quantite)", cnn);
            insertProdComm.Parameters.AddWithValue("@idcomm", Convert.ToInt32(Session["idcommande"].ToString()));
            insertProdComm.Parameters.AddWithValue("@idvin", Convert.ToInt32(Session["currentIdVin"].ToString()));
            insertProdComm.Parameters.AddWithValue("@quantite", Convert.ToInt32(Session["currentQuantite"].ToString()));
            cnn.Open();
            insertProdComm.ExecuteNonQuery();
            cnn.Close();
        }
    }
}