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

namespace Terminal
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var wyndows = new List<Window>();
            wyndows.Add(new StaffWindow());
            wyndows.Add(new AgentWindow());
            wyndows.Add(new ManagerWindow());

            String path = System.IO.Path.GetDirectoryName(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName) + "\\";
            MessageBox.Show(path);
            SqlCeConnection conn = DatabaseConnection.InitializeDatabase(path);

            //DatabaseConnection.CreateTable(conn);

            foreach(Window win in wyndows)
            {
                win.Show();
            }
            this.Close();
        }
    }
}
