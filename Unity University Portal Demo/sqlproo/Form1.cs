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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            form_reg reg = new form_reg();
            reg.Show();
            Visible= false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form_inst inst = new Form_inst();
            inst.Show();
            Visible= false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form_student student = new Form_student();
            student.Show();
            Visible= false;

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
