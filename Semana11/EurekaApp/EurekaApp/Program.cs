using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaModelo;
using CapaServicios;

namespace EurekaApp
{
    static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {

            EurekaService service = new EurekaService();
            string cuenta = service.CrearCuenta("00001","01",7000.0,"123456","0002");
            MessageBox.Show("Estado: " + service.Estado);
            MessageBox.Show("Mensaje: " + service.Mensaje);
            MessageBox.Show("Cuenta: " + cuenta);

            /*
            ClienteModel cliente = new ClienteModel();
            cliente.paterno = "ABC";
            cliente.materno = "XYZ";
            cliente.nombre = "Gustavo";
            cliente.dni = "12345678";
            cliente.ciudad = "43568790";
            cliente.direccion = "Mi casa";
            cliente.telefono = "995467345";

            CrudClienteService ClienteService = new CrudClienteService();
            string codigo = ClienteService.registrarCliente(cliente);

            MessageBox.Show("Estado: " + ClienteService.Estado);
            MessageBox.Show("Codig: " + codigo);
            */

            /*
            Application.SetHighDpiMode(HighDpiMode.SystemAware);
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
            */
        }


    }
}
