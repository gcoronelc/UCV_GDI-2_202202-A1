using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaServicios
{
    public class EurekaService: GeneralService
    {

        public string CrearCuenta(string cliente, string moneda, double importe, string clave, string empleado)
        {
            string cuenta = "";
            // Mensaje por defecto
            this.Estado = 1;
            this.Mensaje = "Proceso ejecutado correctamente";
            // Proceso general
            using (SqlConnection con = new SqlConnection(this.CadenaConexion))
            {
                try
                {
                    // La conexión
                    con.Open();
                    // El comando
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dbo.USP_CREAR_CUENTA";
                    // Parametros
                    cmd.Parameters.Add("@CLIENTE", SqlDbType.VarChar).Value = cliente;
                    cmd.Parameters.Add("@MONEDA", SqlDbType.VarChar).Value = moneda;
                    cmd.Parameters.Add("@IMPORTE", SqlDbType.Decimal).Value = importe;
                    cmd.Parameters.Add("@CLAVE", SqlDbType.VarChar).Value = clave;
                    cmd.Parameters.Add("@EMPLEADO", SqlDbType.VarChar).Value = empleado;
                    cmd.Parameters.Add("@CODIGO", SqlDbType.VarChar,8).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@ESTADO", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@MENSAJE", SqlDbType.VarChar, 1500).Direction = ParameterDirection.Output;
                    // Ejecutar el procedimiento
                    cmd.ExecuteNonQuery();
                    cuenta = this.Mensaje = cmd.Parameters["@CODIGO"].Value.ToString();
                    this.Estado = Convert.ToInt32(cmd.Parameters["@ESTADO"].Value);
                    this.Mensaje = cmd.Parameters["@MENSAJE"].Value.ToString();
                    cmd.Dispose();
                }
                catch (Exception e)
                {
                    cuenta = "";
                    this.Estado = -1;
                    this.Mensaje = e.Message;
                }
            }
            // Reporte
            return cuenta;
        }

        public void RegistrarDeposito(string Cuenta, double Importe, string CodEmp)
        {
            // Mensajes por defecto
            this.Estado = 1;
            this.Mensaje = "Proceso ejecutado correctamente";
            // Proceso General
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    // La conexión
                    con.Open();
                    // El comando
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dbo.usp_deposito";
                    // Parametros
                    cmd.Parameters.Add("@cuenta", SqlDbType.VarChar).Value = Cuenta;
                    cmd.Parameters.Add("@importe", SqlDbType.Decimal).Value = Importe;
                    cmd.Parameters.Add("@codemp", SqlDbType.VarChar).Value = CodEmp;
                    cmd.Parameters.Add("@codigo", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@mensaje", SqlDbType.VarChar, 1500).Direction = ParameterDirection.Output;
                    // Ejecutar el procedimiento
                    cmd.ExecuteNonQuery();
                    this.Estado = Convert.ToInt32(cmd.Parameters["@codigo"].Value);
                    this.Mensaje = cmd.Parameters["@mensaje"].Value.ToString();
                    cmd.Dispose();
                }
                catch (Exception e)
                {
                    this.Estado = -1;
                    this.Mensaje = "Hay un error.";
                }

            }
        }

    }
}
