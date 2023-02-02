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
    public partial class Form_inst1 : Form
    {
        public Form_inst1()
        {
            InitializeComponent();
        }

        private void Form_inst1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            string instid = txt_inst.Text, sem = txt_sem.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "select Student.sid, Student.fname,Student.lname,Student.section,Student.gender from Student \r\njoin Registration on Student.sid = Registration.sid where Registration.INSTID like '"+instid +"%' and Registration.semester = '"+ sem +"'; \r\n";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
        }

        private void button2_Click(object sender, EventArgs e) 
        {
            string sid = txt_sid.Text, course = txt_Course.Text,name=txt_name.Text,weight=txt_weight.Text,result=txt_resu.Text,date=txt_date.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "update Assesment\r\nset weight='"+weight+"',result='"+result+"',[assesment date]='"+date+"'\r\nwhere Assesment.SID like '"+sid+"%' and COURSE like '"+course+"%' and [Assesment name] like'"+name+"%';";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
            MessageBox.Show("Updated");

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form1 home = new Form1();
            home.Show();
            Visible = false;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string sid = txt_sid.Text, course = txt_Course.Text, name = txt_name.Text, weight = txt_weight.Text, result = txt_resu.Text, date = txt_date.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "insert into Assesment (SID,COURSE,[Assesment name],weight,result,[assesment date]) values\r\n('"+sid+"','"+course+"','"+name +"','"+weight+"','"+result+"','"+date+"')";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
            MessageBox.Show("inserted successfuly");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string inst = txt_inst.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "select Registration.sid,Registration.code,[Assesment name],weight,result,[assesment date] from Registration join Assesment on Registration.code=Assesment.COURSE and Registration.sid=Assesment.SID \r\nwhere Registration.INSTID like '"+inst+"%';";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();

        }

        private void button6_Click(object sender, EventArgs e)
        {

        }
    }
}
