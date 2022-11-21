using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaService;

namespace EurekaApp2022
{
    static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {

            /*
            CuentaService service = new CuentaService();
            string cuenta = service.CrearCuenta("00015", "01", -8000.0, "123456", "0004");
            string mensaje = cuenta + " | " + service.Estado + " | " + service.Mensaje;
            MessageBox.Show("Resultado: " + mensaje);
            */

            
            Application.SetHighDpiMode(HighDpiMode.SystemAware);
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FormLogon());
            
        }
    }
}
