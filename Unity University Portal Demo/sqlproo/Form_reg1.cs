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
    public partial class Form_reg1 : Form
    {
        public Form_reg1()
        {
            InitializeComponent();
        }

        private void button_show_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "select * from Student;";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
        }

        private void button_Insert_Click(object sender, EventArgs e)
        {
            string sid = txt_sid.Text, fname = txt_fname.Text, lname = txt_lname.Text, dep = txt_dep.Text, divi = txt_divi.Text, sec = txt_sec.Text, dob=txt_dob.Text, batch=txt_batch.Text,entry=txt_entry.Text,gender=txt_gender.Text;

            
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = " insert into Student (sid,fname,lname,department,division,section,DOB,batch,entry,gender) values\r\n('" + sid+ "','"+ fname +"','"+ lname +"','"+ dep +"','"+ divi +"','"+ sec +"','"+ dob + "','"+ batch +"','"+ entry + "','"+ gender +"')\r\n;";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("inserted successfuly");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            txt_sid.Clear();
            txt_fname.Clear();
            txt_lname.Clear();
            txt_dep.Clear();
            txt_gender.Clear();
            txt_dob.Clear();
            txt_batch.Clear();
            txt_entry.Clear();
            txt_sec.Clear();
            txt_divi.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form_reg2 reg2 = new Form_reg2();
            reg2.Show();
            Visible = false;
        }
    }
}
