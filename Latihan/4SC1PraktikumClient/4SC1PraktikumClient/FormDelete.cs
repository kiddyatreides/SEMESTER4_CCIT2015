//Made by Kiddy
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace _4SC1PraktikumClient
{
    public partial class FormDelete : Form
    {
        public FormDelete()
        {
            InitializeComponent();
        }

        private void FormDelete_Load(object sender, EventArgs e)
        {
            autoload();
            tb_id.Enabled = false;
            tb_nama.Enabled = false;
            tb_alamat.Enabled = false;
            tb_jk.Enabled = false;
            tb_telepon.Enabled = false;
            btn_delete.Enabled = false;
        }

        private void autoload()
        {
            PegawaiService.PegawaiClient objBarang = new PegawaiService.PegawaiClient();
            IList<PegawaiService.PegawaiInfo> dataBarang = new List<PegawaiService.PegawaiInfo>();
            dataBarang = objBarang.getPegawaiInfo();
            dataGridView1.DataSource = dataBarang;
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
                tb_jk.Text = jeniskelamin;
                tb_telepon.Text = telepon;

                btn_delete.Enabled = true;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 frm = new Form1();
            this.Hide();
            frm.Show();
        }

        private void clear()
        {
            tb_id.Text = "";
            tb_nama.Text = "";
            tb_alamat.Text = "";
            tb_jk.Text = "";
            tb_telepon.Text = "";
        }

        private void btn_delete_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Are you sure want to delete data ?", "Delete Data", MessageBoxButtons.YesNo, MessageBoxIcon.Information);

            if (dr == DialogResult.Yes)
            {
                //PegawaiService.PegawaiInfo objBarang = new PegawaiService.PegawaiInfo();
                string id;
                id = tb_id.Text;
                PegawaiService.PegawaiClient objService = new PegawaiService.PegawaiClient();
                string msg = objService.deletePegawai(id);
                MessageBox.Show(msg);
                this.dataGridView1.DataSource = null;
                this.dataGridView1.Rows.Clear();
                clear();
                autoload();
            }
            else if (dr == DialogResult.Cancel)
            {
                //
            }
            
        }
    }
}
