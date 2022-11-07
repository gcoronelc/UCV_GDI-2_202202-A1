using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaService
{
    public class CuentaService:GeneralService
    {

        public string CrearCuenta(string cliente, string moneda, double importe, string clave, string empleado)
        {
            string codigo = "";
            // Mensaje por defecto
            this.Estado = 1;
            this.Mensaje = "Proceso ejecutado correctamente";
            // Proceso general
            using (SqlConnection con = new SqlConnection(this.CadenaConexion))
            {

            }
                // Reporte
                return codigo;
        }
 

    }
}
