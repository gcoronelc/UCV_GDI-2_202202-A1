﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CapaService;

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
            // Proceso
            CuentaService cuentaService = new CuentaService();
            string cuenta = cuentaService.CrearCuenta(cliente, moneda, importe, clave, "0004");
            string mensaje = cuenta + " | " + cuentaService.Estado + " | " + cuentaService.Mensaje;
            MessageBox.Show("Resultado: " + mensaje);
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
