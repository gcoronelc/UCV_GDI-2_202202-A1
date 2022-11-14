using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CapaServicios;
using CapaModelo;

namespace EurekaApp
{
   public partial class FormLogin : Form
   {
      public FormLogin()
      {
         InitializeComponent();
      }

      private void textBox1_TextChanged(object sender, EventArgs e)
      {

      }

      private void label2_Click(object sender, EventArgs e)
      {

      }

      private void textBox2_TextChanged(object sender, EventArgs e)
      {

      }

      private void button3_Click(object sender, EventArgs e)
      {
         Application.Exit();
      }

      private void button1_Click(object sender, EventArgs e)
      {
         // Datos
         string usuario = txtUsuaio.Text;
         string clave = txtClave.Text;
         if(usuario!="" && clave != "")
         {
            LogonService service = new LogonService();
            EmpleadoModel empleado = service.validarUsuario(usuario, clave);
            if (service.Estado==1)
            {
               FormularioPrincipal principal = new FormularioPrincipal();
               principal.Show();
               this.Hide();
               Cache.UserLoginCache.Codigo = empleado.Codigo;
               Cache.UserLoginCache.Paterno = empleado.Paterno;
               Cache.UserLoginCache.Materno = empleado.Materno;
               Cache.UserLoginCache.Nombre = empleado.Nombre;
               Cache.UserLoginCache.Usuario = empleado.Usuario;
            }
            else
            {
               lblMensaje.Text = service.Mensaje;
               lblMensaje.Visible = true;
            }
         }
         else
         {
            lblMensaje.Text = "Error, faltan datos.";
            lblMensaje.Visible= true;
         }
      }
   }
}
