using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CapaService;

namespace EurekaApp2022
{
    public partial class FormPersonas : Form
    {
        private static FormPersonas instancia = null;

        public static FormPersonas GetInstance()
        {
            if (((instancia == null) || (instancia.IsDisposed == true)))
            {
                instancia = new FormPersonas();
            }
            instancia.BringToFront();
            return instancia;
        }

        private FormPersonas()
        {
            InitializeComponent();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            ConsultaService consultaService = new ConsultaService();
            DataTable data = consultaService.traerPersonas();
            dgViewPersonas.DataSource = data;

        }

        private void FormPersonas_Load(object sender, EventArgs e)
        {

        }
    }
}
