using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Vinothèque
{
    public partial class Recapitulative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            System.Data.SqlClient.SqlConnection cnn = new System.Data.SqlClient.SqlConnection(connStr);
            cnn.Open();
            SqlCommand selectId = new SqlCommand("SELECT MAX(idcomm) FROM[commandes] ", cnn);
            int idcommande = (int)selectId.ExecuteScalar();
            Session["idcommande"] = idcommande;
            double sumTotalHT = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                string idvinStr = ((Label)row.FindControl("idVin")).Text;
                int idVinInt = Convert.ToInt32(idvinStr);

                //get vin name using idvin
                SqlCommand selectNom = new SqlCommand("SELECT nom FROM[vins] WHERE([idvin] = @idVinInt)", cnn);
                selectNom.Parameters.AddWithValue("@idVinInt", idVinInt);
                string nomVin = (string)selectNom.ExecuteScalar();
                

                //get vin millesime using idvin
                SqlCommand selectMillesime = new SqlCommand("SELECT millesime FROM[vins] WHERE([idvin] = @idVinInt)", cnn);
                selectMillesime.Parameters.AddWithValue("@idVinInt", idVinInt);
                int millesime = (int)selectMillesime.ExecuteScalar();

                //get vin region using idvin
                SqlCommand selectRegion = new SqlCommand("SELECT region FROM[vins] WHERE([idvin] = @idVinInt)", cnn);
                selectRegion.Parameters.AddWithValue("@idVinInt", idVinInt);
                string region = (string)selectRegion.ExecuteScalar();

                ((Label)row.FindControl("nomVin")).Text = nomVin + " " + Convert.ToString(millesime) + "(" + region + ")";


                //get gif addresse using idvin
                SqlCommand selectNomGif = new SqlCommand("SELECT nomgif FROM[vins] WHERE([idvin] = @idVinInt)", cnn);
                selectNomGif.Parameters.AddWithValue("@idVinInt", idVinInt);
                string nomGif = (string)selectNomGif.ExecuteScalar();
                ((Image)row.FindControl("etiquetteVin")).ImageUrl = "~/App_Themes/Theme1/" + nomGif;

                //get price of vin
                SqlCommand selectPrix = new SqlCommand("SELECT prix FROM[vins] WHERE([idvin] = @idVinInt)", cnn);
                selectPrix.Parameters.AddWithValue("@idVinInt", idVinInt);
                double prixVin = (double)selectPrix.ExecuteScalar();
                ((Label)row.FindControl("prixVin")).Text = Convert.ToString(prixVin);

                //show total 
                string quantiteStr = ((Label)row.FindControl("quantite")).Text;
                int quantiteInt = Convert.ToInt32(quantiteStr);
                double total = prixVin * quantiteInt;
                ((Label)row.FindControl("total")).Text = Convert.ToString(total);


                sumTotalHT = sumTotalHT + total;

            }
            cnn.Close();
            double taxe = sumTotalHT * 0.196;
            double sumTotal = sumTotalHT + taxe;

            prixHTLabel.Text = Convert.ToString(sumTotalHT);
            TVALabel.Text = Convert.ToString(taxe);
            prixTTCLabel.Text = Convert.ToString(sumTotal);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            System.Data.SqlClient.SqlConnection cnn = new System.Data.SqlClient.SqlConnection(connStr);
            cnn.Open();

            SqlCommand updateCommandesComm = new SqlCommand("UPDATE [commandes] SET[total] = @total WHERE[idcomm] = @idcomm",cnn);
            updateCommandesComm.Parameters.AddWithValue("@total", Convert.ToDouble(prixTTCLabel.Text));
            updateCommandesComm.Parameters.AddWithValue("@idcomm", Convert.ToInt32(Session["idcommande"].ToString()));
            updateCommandesComm.ExecuteNonQuery();

            SqlCommand insertCommandesComm = new SqlCommand("INSERT into commandes(total) values(@total)", cnn);
            //insertCommandesComm.Parameters.AddWithValue("@idcomm", Convert.ToInt32(Session["idcommande"].ToString()));
            insertCommandesComm.Parameters.AddWithValue("@total", 0);
            insertCommandesComm.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("Confirmation.aspx");
        }
    }
}