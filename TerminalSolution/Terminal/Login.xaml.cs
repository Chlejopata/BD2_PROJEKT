using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlServerCe;
using System.Configuration;
using System.Data.SqlClient;

namespace Terminal
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {

        String connectionString;
        public Login()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["Terminal.Properties.Settings.TerminalMSSQLConnectionString"].ConnectionString;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var wyndows = new List<Window>();
            wyndows.Add(new StaffWindow());
            wyndows.Add(new AgentWindow());
            wyndows.Add(new ManagerWindow());


            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                }
                catch(SqlException exc)
                {
                    MessageBox.Show(exc.Message);
                }
                
                string query = "SELECT * FROM INFORMATION_SCHEMA.TABLES";
                string query2 = "SELECT * FROM dbo.CONTACT_DATA";
                SqlCommand command = new SqlCommand(query2);
                command.Connection = conn;
                var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine("Values:  {0}, {1}, {2}, {3}",
                        reader[0], reader[1], reader[2], reader[3]);
                }
                //MessageBox.Show(result.ToString());
            }

            foreach(Window win in wyndows)
            {
                win.Show();
            }
            this.Close();
        }
    }
}
