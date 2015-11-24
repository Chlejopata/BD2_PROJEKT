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
            connectionString = ConfigurationManager.ConnectionStrings["Terminal.Properties.Settings.TerminalDBConnectionString"].ConnectionString;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var wyndows = new List<Window>();
            wyndows.Add(new StaffWindow());
            wyndows.Add(new AgentWindow());
            wyndows.Add(new ManagerWindow());

            foreach(Window win in wyndows)
            {
                win.Show();
            }
            this.Close();
        }
    }
}
