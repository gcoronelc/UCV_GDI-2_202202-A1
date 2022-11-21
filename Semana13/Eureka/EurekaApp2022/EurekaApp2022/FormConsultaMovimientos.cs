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
    public partial class FormConsultaMovimientos : Form
    {

        private static FormConsultaMovimientos instancia = null;

        public static FormConsultaMovimientos GetInstance()
        {
            if (((instancia == null) || (instancia.IsDisposed == true)))
            {
                instancia = new FormConsultaMovimientos();
            }
            instancia.BringToFront();
            return instancia;
        }

        private FormConsultaMovimientos()
        {
            InitializeComponent();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            // Varibables
         string cuenta;
            // Datos
            cuenta = txtCuenta.Text;
            // Proceso
            lblMensaje.Text = "";
            dataGridView1.DataSource = "";
            ConsultaService service = new ConsultaService();
            DataTable data = service.traerMovimientos(cuenta);
            // Reporte
            dataGridView1.DataSource = data;
            if (service.Estado == -1)
            {
                lblMensaje.Text = service.Mensaje;
            }
        }
    }
}
