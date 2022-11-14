using System;
using System.Collections.Generic;
using System.Text;
using CapaModelo;
//using CapaModelo;
using System.Data;
using System.Data.SqlClient;

namespace CapaServicios
{
   public class LogonService: GeneralService
   {

      public EmpleadoModel validarUsuario(string usuario, string clave)
      {

         EmpleadoModel empleado = null;
         using (SqlConnection con = new SqlConnection(CadenaConexion))
         {
            try
            {
               con.Open();
               using (SqlCommand cmd = new SqlCommand("dbo.usp_logon", con))
               {
                  // Tipo de comando
                  cmd.CommandType = CommandType.StoredProcedure;
                  // Agregar los parámetros
                  cmd.Parameters.Add("@p_usuario", SqlDbType.VarChar).Value = usuario;
                  cmd.Parameters.Add("@p_clave", SqlDbType.VarChar).Value = clave;
                  // Ejecutar procedimiento
                  SqlDataReader reader = cmd.ExecuteReader();
                  // Verificar resultado
                  if (reader.HasRows)
                  {
                     reader.Read();
                     this.Estado = reader.GetInt32(0);
                     this.Mensaje = reader.GetString(1);
                     if (this.Estado == 1)
                     {
                        empleado = new EmpleadoModel();
                        empleado.Codigo = reader.GetString(2);
                        empleado.Paterno = reader.GetString(3);
                        empleado.Materno = reader.GetString(4);
                        empleado.Nombre = reader.GetString(5);
                        empleado.Usuario = usuario;
                     }
                  }

               }
            }
            catch (Exception e)
            {
               // Estado del proceso
               this.Estado = -3;
               this.Mensaje = e.Message;
            }
         }
         return empleado;
      }


   }
}
