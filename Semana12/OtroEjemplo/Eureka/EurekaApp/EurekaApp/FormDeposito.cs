using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CapaServicios;

namespace EurekaApp
{
   public partial class FormDeposito : Form
   {

      private static FormDeposito instancia = null;

      public static FormDeposito GetInstance()
      {
         if (((instancia == null) || (instancia.IsDisposed == true)))
         {
            instancia = new FormDeposito();
         }
         instancia.BringToFront();
         return instancia;
      }

      private FormDeposito()
      {
         InitializeComponent();
         txtEmpleado.Text = Cache.UserLoginCache.Usuario;
      }

      private void button1_Click(object sender, EventArgs e)
      {
         // Datos
         string empleado = Cache.UserLoginCache.Codigo;
         string cuenta = txtCuenta.Text;
         double importe = Double.Parse(txtImporte.Text);
         // Proceso
         EurekaService eurekaService = new EurekaService();
         eurekaService.RegistrarDeposito(cuenta, importe, empleado);
         if (eurekaService.Estado == 1)
         {
            modoEdicion(false);
         }
         else
         {
            modoEdicion(true);
            lblMensaje.Text = eurekaService.Mensaje;
            lblMensaje.Visible = true;
         }
      }

      private void modoEdicion(bool activo)
      {
         txtCuenta.Enabled = activo;
         txtImporte.Enabled = activo;
         btnProcesar.Enabled = activo;
         btnNuevo.Enabled = !activo;
      }

      private void btnNuevo_Click(object sender, EventArgs e)
      {
         modoEdicion(true);
         txtCuenta.Text = "";
         txtImporte.Text = "";
         lblMensaje.Visible = false;
      }

      private void btnCerrar_Click(object sender, EventArgs e)
      {
         this.Close();
      }
   }
}
