using System;

namespace CapaService
{
    public abstract class GeneralService
    {

        protected string CadenaConexion { get; set; }

        // Mensaje de error
        public string Mensaje { get; set; }

        // Estado: 1=Ok  -1=Error
        public int Estado { get; set; }

        public GeneralService()
        {
            CadenaConexion = @"Data Source=localhost;Initial Catalog=EUREKABANK;User ID=sa;Password=sql";
        }


    }
}
