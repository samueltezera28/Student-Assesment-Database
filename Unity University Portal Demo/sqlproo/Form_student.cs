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
    public partial class Form_student : Form
    {
        public Form_student()
        {
            InitializeComponent();
        }

        private void hsdToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void sdsdToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string studid = txt_sid.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "select Registration.sid,Registration.INSTID,code as 'Course',semester,registration_year as 'Registration date',[Assesment name],weight,result,[assesment date] \r\nfrom Registration join Assesment on Registration.sid=Assesment.SID and Registration.code =Assesment.COURSE \r\nwhere Registration.sid like '"+ studid +"%';";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
        }

        private void cal_grade_Click(object sender, EventArgs e)
        {
            string studid = txt_sid.Text;
            string connectionString = "Data Source=(local);Initial Catalog=\"Student Assesment Database\";Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT Assesment.SID,Assesment.COURSE ,grade=\r\nCASE\r\n    when SUM(result)> 90 Then 'A+'\r\n    WHEN SUM(result)>=80 and SUM(result)<90 THEN 'A'\r\n    WHEN SUM(result)>=70 and SUM(result)<80 THEN 'B+'\r\n    WHEN SUM(result)>=65 and SUM(result)<70 THEN 'B'\r\n    WHEN SUM(result)>=60 and SUM(result)<65 THEN 'C+'\r\n    WHEN SUM(result)>=55 and SUM(result)<60 THEN 'C'\r\n    WHEN SUM(result)>=45 and SUM(result)<55 THEN 'D'                    \r\n    WHEN SUM(result)<45 and SUM(result)>=35 THEN 'F'\r\n    ELSE 'NG'\r\nEND \r\nFROM Assesment join Registration on Registration.code=Assesment.COURSE and Registration.sid=Assesment.SID where Assesment.SID like '" + studid + "%' group by COURSE,Assesment.SID ";
            SqlCommand cmd = new SqlCommand(query, con);
            var reader = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;

            con.Close();
        }

        private void home_Click(object sender, EventArgs e)
        {
            Form1 home =  new Form1();
            home.Show();
            Visible= false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
