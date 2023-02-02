using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace sqlproo
{
    public partial class Form_reg2 : Form
    {
        public Form_reg2()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "select * from Registration;";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string sid = txt_sid.Text, course = txt_course.Text, inst = txt_instid.Text, sem = txt_sem.Text, reg_date = txt_date.Text, grade = txt_grade.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = " insert into Registration (sid,code,INSTID,semester,registration_year,Grade) values\r\n('" + sid + "','" + course + "','" + inst + "','" + sem + "','" + reg_date + "','" + grade+ "')\r\n;";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Registered successfuly");


        }

        private void button2_Click(object sender, EventArgs e)
        {
            txt_sid.Clear();
            txt_course.Clear();
            txt_instid.Clear();
            txt_sem.Clear();
            txt_date.Clear();
            txt_grade.Clear();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form1 home = new Form1();
            home.Show();
            Visible = false;
        }
    }
}
