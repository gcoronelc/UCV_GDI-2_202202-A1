using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using CapaModelo;

namespace CapaServicios
{
    public class CrudClienteService: GeneralService
    {

        public string registrarCliente(ClienteModel Cliente)
        {
            string codigo = null;
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
                    cmd.CommandText = "dbo.usp_registra_cliente";
                    // Parametros
                    cmd.Parameters.Add("@p_paterno", SqlDbType.VarChar).Value = Cliente.paterno;
                    cmd.Parameters.Add("@p_materno", SqlDbType.VarChar).Value = Cliente.materno;
                    cmd.Parameters.Add("@p_nombre", SqlDbType.VarChar).Value = Cliente.nombre;
                    cmd.Parameters.Add("@p_dni", SqlDbType.VarChar).Value = Cliente.dni;
                    cmd.Parameters.Add("@p_ciudad", SqlDbType.VarChar).Value = Cliente.ciudad;
                    cmd.Parameters.Add("@p_direccion", SqlDbType.VarChar).Value = Cliente.direccion;
                    cmd.Parameters.Add("@p_telefono", SqlDbType.VarChar).Value = Cliente.telefono;
                    cmd.Parameters.Add("@p_email ", SqlDbType.VarChar).Value = Cliente.email;
                    cmd.Parameters.Add("@p_codigo", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@p_estado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    // Ejecutar el procedimiento
                    cmd.ExecuteNonQuery();
                    this.Estado = Convert.ToInt32(cmd.Parameters["@p_estado"].Value);
                    codigo = cmd.Parameters["@p_codigo"].Value.ToString();
                    this.Mensaje = "No hay mensaje.";
                    cmd.Dispose();
                }
                catch (Exception e)
                {
                    this.Estado = -1;
                    this.Mensaje = "Hay un error, proceso abortado.";
                }

            }
            return codigo;
        }



    }
}
