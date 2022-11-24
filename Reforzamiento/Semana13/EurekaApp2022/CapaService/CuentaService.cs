using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using CapaModel;

namespace CapaService
{
    public class CuentaService : GeneralService
    {


        public string CrearCuenta(string cliente, string moneda, double importe, string clave, string empleado)
        {
            // Variables locales
            string cuenta = "";
            // Estado por defecto
            this.Estado = 1;
            this.Mensaje = "Proceso ejecutado correctamente.";
            // Proceso general
            using (SqlConnection con = new SqlConnection(this.CadenaConexion))
            {
                try
                {
                    // Abrir la conexión
                    con.Open();
                    // El comando
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dbo.USP_UCV_GPO_A_CREAR_CUENTA";
                    // Parametros
                    cmd.Parameters.Add("@CLIENTE", SqlDbType.VarChar).Value = cliente;
                    cmd.Parameters.Add("@MONEDA", SqlDbType.VarChar).Value = moneda;
                    cmd.Parameters.Add("@IMPORTE", SqlDbType.Decimal).Value = importe;
                    cmd.Parameters.Add("@CLAVE", SqlDbType.VarChar).Value = clave;
                    cmd.Parameters.Add("@EMPLEADO", SqlDbType.VarChar).Value = empleado;
                    cmd.Parameters.Add("@CODIGO", SqlDbType.VarChar, 8).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@ESTADO", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@MENSAJE", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                    // Ejecutar el procedimiento
                    cmd.ExecuteNonQuery();
                    // Recoger los parametros de salida
                    cuenta = cmd.Parameters["@CODIGO"].Value.ToString();
                    this.Estado = Convert.ToInt32(cmd.Parameters["@ESTADO"].Value.ToString());
                    this.Mensaje = cmd.Parameters["@MENSAJE"].Value.ToString();
                    // Se libera el objeto Command
                    cmd.Dispose();
                }
                catch (Exception e)
                {
                    cuenta = "";
                    if (this.Estado == 1)
                    {
                        this.Estado = -1;
                        this.Mensaje = e.Message;
                    }
                }
            }
            // Reporte
            return cuenta;
        }


        // Crear cuenta version 2

        public string CrearCuenta(CuentaModel model)
        {
            // Variables locales
            string cuenta = "";
            // Estado por defecto
            this.Estado = 1;
            this.Mensaje = "Proceso ejecutado correctamente.";
            // Proceso general
            using (SqlConnection con = new SqlConnection(this.CadenaConexion))
            {
                try
                {
                    // Abrir la conexión
                    con.Open();
                    // El comando
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dbo.USP_UCV_GPO_A_CREAR_CUENTA";
                    // Parametros
                    cmd.Parameters.Add("@CLIENTE", SqlDbType.VarChar).Value = model.cliente;
                    cmd.Parameters.Add("@MONEDA", SqlDbType.VarChar).Value = model.moneda;
                    cmd.Parameters.Add("@IMPORTE", SqlDbType.Decimal).Value = model.saldo;
                    cmd.Parameters.Add("@CLAVE", SqlDbType.VarChar).Value = model.clave;
                    cmd.Parameters.Add("@EMPLEADO", SqlDbType.VarChar).Value = model.empleado;
                    cmd.Parameters.Add("@CODIGO", SqlDbType.VarChar, 8).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@ESTADO", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@MENSAJE", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                    // Ejecutar el procedimiento
                    cmd.ExecuteNonQuery();
                    // Recoger los parametros de salida
                    cuenta = cmd.Parameters["@CODIGO"].Value.ToString();
                    this.Estado = Convert.ToInt32(cmd.Parameters["@ESTADO"].Value.ToString());
                    this.Mensaje = cmd.Parameters["@MENSAJE"].Value.ToString();
                    // Se libera el objeto Command
                    cmd.Dispose();
                }
                catch (Exception e)
                {
                    cuenta = "";
                    if (this.Estado == 1)
                    {
                        this.Estado = -1;
                        this.Mensaje = e.Message;
                    }
                }
            }
            // Reporte
            return cuenta;
        }

    }
}
