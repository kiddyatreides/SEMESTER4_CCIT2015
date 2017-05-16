//Made by Kiddy
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace _4SC1PraktikumClient
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            autoload();
            btn_update.Enabled = false;
            AutoGenerate();
        }

        private void autoload()
        {
            PegawaiService.PegawaiClient objBarang = new PegawaiService.PegawaiClient();
            IList<PegawaiService.PegawaiInfo> dataBarang = new List<PegawaiService.PegawaiInfo>();
            dataBarang = objBarang.getPegawaiInfo();
            dataGridView1.DataSource = dataBarang;
        }
        private void AutoGenerate()
        {
            PegawaiService.PegawaiClient objBarang = new PegawaiService.PegawaiClient();
            string id = objBarang.getPegawaiLastID();
            tb_id.Text = id;
        }

        private void btn_save_Click(object sender, EventArgs e)
        {
            PegawaiService.PegawaiInfo objBarang = new PegawaiService.PegawaiInfo();
            objBarang.IDPegawai = tb_id.Text;
            objBarang.NamaPegawai = tb_nama.Text;
            objBarang.alamatPegawai = tb_alamat.Text;
            if (rb_pria.Checked)
            {
                objBarang.jeniskelaminPegawai = "Pria";
            }
            if (rb_wanita.Checked)
            {
                objBarang.jeniskelaminPegawai = "Wanita";
            }
            objBarang.teleponPegawai = tb_telepon.Text;
            PegawaiService.PegawaiClient objService = new PegawaiService.PegawaiClient();
            string msg = objService.insertPegawai(objBarang);
            MessageBox.Show(msg);
            this.dataGridView1.DataSource = null;
            this.dataGridView1.Rows.Clear();
            autoload();
        }

        private void btn_update_Click(object sender, EventArgs e)
        {
            PegawaiService.PegawaiInfo objBarang = new PegawaiService.PegawaiInfo();
            objBarang.IDPegawai = tb_id.Text;
            objBarang.NamaPegawai = tb_nama.Text;
            objBarang.alamatPegawai = tb_alamat.Text;
            if (rb_pria.Checked)
            {
                objBarang.jeniskelaminPegawai = "Pria";
            }
            if (rb_wanita.Checked)
            {
                objBarang.jeniskelaminPegawai = "Wanita";
            }
            objBarang.teleponPegawai = tb_telepon.Text;
            PegawaiService.PegawaiClient objService = new PegawaiService.PegawaiClient();
            string msg = objService.updatePegawai(objBarang);
            MessageBox.Show(msg);
            this.dataGridView1.DataSource = null;
            this.dataGridView1.Rows.Clear();
            autoload();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dataGridView1.SelectedRows)
            {
                string id = row.Cells[0].Value.ToString();
                string nama = row.Cells[1].Value.ToString();
                string alamat = row.Cells[2].Value.ToString();
                string jeniskelamin = row.Cells[3].Value.ToString();
                string telepon = row.Cells[4].Value.ToString();

                tb_id.Text = id;
                tb_nama.Text = nama;
                tb_alamat.Text = alamat;
                if (jeniskelamin == "Pria")
                {
                    rb_pria.Checked = true;
                }
                if (jeniskelamin == "Wanita")
                {
                    rb_wanita.Checked = true;
                }
                tb_telepon.Text = telepon;

                btn_update.Enabled = true;
                btn_save.Enabled = false;
                tb_id.Enabled = false;

            }
        }

        private void btn_delete_Click(object sender, EventArgs e)
        {
            FormDelete frm = new FormDelete();
            this.Hide();
            frm.Show();
        }
    }
}
