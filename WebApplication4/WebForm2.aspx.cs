using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 首次加載頁面時填充 DropDownList
                PopulateCountries();
            }
        }

        protected void PopulateCountries()
        {
            // 從資料庫中獲取國家列表
            List<string> countries = GetCountriesFromDatabase();

            // 填充 DropDownList
            DropDownList1.DataSource = countries;
            DropDownList1.DataBind();
        }

        protected List<string> GetCountriesFromDatabase()
        {
            List<string> countries = new List<string>();

            // 使用連接字串
            string connectionString = ConfigurationManager.ConnectionStrings["ChinookConnectionString"].ToString();

            // SQL 查詢
            string query = "SELECT DISTINCT BillingCountry FROM Invoice";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // 將每個 BillingCountry 添加到列表中
                            countries.Add(reader["BillingCountry"].ToString());
                        }
                    }
                }
            }

            return countries;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 調用綁定到 SqlDataSource2 的 GridView 的方法，以觸發其重新綁定
            GridView2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // 檢查 TextBox1 中是否有值
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                // 將 TextBox1 的值轉換為整數
                if (int.TryParse(TextBox1.Text, out int baseTrackId))
                {
                    // 調用預存程序
                    GetSimilarTracks(baseTrackId);
                }
            }
        }

        protected void GetSimilarTracks(int baseTrackId)
        {
            // 使用連接字串
            string connectionString = ConfigurationManager.ConnectionStrings["ChinookConnectionString"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("GetSimilarTracksByTrackId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // 添加參數
                    command.Parameters.AddWithValue("@BaseTrackId", baseTrackId);

                    connection.Open();

                    // 使用 SqlDataAdapter 執行預存程序，填充 DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        // 將 DataTable 綁定到 GridView2
                        GridView2.DataSource = dataTable;
                        GridView2.DataBind();
                    }
                }
            }
        }
    }
}
