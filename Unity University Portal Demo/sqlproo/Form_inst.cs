using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sqlproo
{
    public partial class Form_inst : Form
    {
        public Form_inst()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form_inst1 inst1= new Form_inst1();
            inst1.Show();
            Visible = false;

        }

        private void home_Click(object sender, EventArgs e)
        {
            Form1 home = new Form1();
            home.Show();
            Visible = false;
        }
    }
}
