using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CapaService;
using CapaModel;

namespace EurekaApp2022
{
    public partial class FormCrearCuenta : Form
    {

        private static FormCrearCuenta instancia = null;

        public static FormCrearCuenta GetInstance()
        {
            if (((instancia == null) || (instancia.IsDisposed == true)))
            {
                instancia = new FormCrearCuenta();
            }
            instancia.BringToFront();
            return instancia;
        }


        private FormCrearCuenta()
        {
            InitializeComponent();
        }

        private void btnProcesar_Click(object sender, EventArgs e)
        {
            // Datos
            string cliente = txtCliente.Text;
            string moneda = txtMoneda.Text;
            double importe = Double.Parse(txtImporte.Text);
            string clave = txtClave.Text;
            // Modelo
            CuentaModel model = new CuentaModel();
            model.cliente = cliente;
            model.moneda = moneda;
            model.saldo = importe;
            model.clave = clave;
            model.empleado = Cache.UserLoginCache.Codigo;
            // Proceso
            CuentaService cuentaService = new CuentaService();
            //string cuenta = cuentaService.CrearCuenta(cliente, moneda, importe, clave, Cache.UserLoginCache.Codigo);
            string cuenta = cuentaService.CrearCuenta(model);
            string mensaje = cuenta + " | " + cuentaService.Estado + " | " + cuentaService.Mensaje;
            MessageBox.Show("Resultado: " + mensaje);
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void FormCrearCuenta_Load(object sender, EventArgs e)
        {
            txtEmpleado.Text = Cache.UserLoginCache.Codigo;
        }
    }
}
