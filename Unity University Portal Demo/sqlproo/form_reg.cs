using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sqlproo
{
    public partial class form_reg : Form
    {
        public form_reg()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button_login_Click(object sender, EventArgs e)
        {
            String username, user_passwd;
            username= "reg_student";
            user_passwd=txt_passw.Text;

            //string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Persist Security Info=True;User ID=reg_student";
     
           
            try
            {
                if (username =="reg_student")
                {
                    Form_reg1 reg1= new Form_reg1();
                    reg1.Show();
                    Visible= false;
                }
                else
                {
                    MessageBox.Show("error");
                }

                
            }
            catch
            {
                MessageBox.Show("Error");
            }
            finally
            {

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 home = new Form1();
            home.Show();
            Visible = false;
        }

        private void txt_passw_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
