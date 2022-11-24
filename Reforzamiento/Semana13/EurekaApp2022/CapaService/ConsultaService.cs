using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaService
{
    public class ConsultaService : GeneralService
    {
        public DataTable traerMovimientos(string cuenta)
        {
            // Vatiables
            DataTable data = new DataTable();
            string sql = "select movinumero NROMOVIMIENTO, convert(varchar,movifecha,103) FECHA,"
               + "tiponombre TIPO, moviimporte IMPORTE "
               + "from dbo.v_movimiento where cuencodigo = @cuenta";
            // Mensaje por defecto
            this.Estado = 1;
            this.Mensaje = "Proceso ejecutado correctamente";
            // Proceso general
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    // Preparar el comando
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);
                    // Agregar el parámetro
                    cmd.Parameters.Add("@cuenta", SqlDbType.VarChar, 10).Value = cuenta;
                    // Ejecutar el comando
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        data.Load(reader);
                    }
                    else
                    {
                        this.Estado = -1;
                        this.Mensaje = "Cuenta no existe.";
                    }
                }
                catch (Exception e)
                {
                    this.Estado = -1;
                    this.Mensaje = e.Message;
                }
            }
            // Reporte
            return data;
        }

        public DataTable traerPersonas()
        {
            // Variables
            DataTable result = new DataTable();
            // Definir columnas
            result.Columns.Add("ID", typeof(Int32));
            result.Columns.Add("NOMBRE", typeof(string));
            result.Columns.Add("EDAD", typeof(Int32));
            // Cargar datos
            result.Rows.Add(1, "Gustavo Coronel", 50);
            result.Rows.Add(2, "Rosa", 32);
            result.Rows.Add(3, "Ricardo", 45);
            result.Rows.Add(4, "Karla", 28);
            result.Rows.Add(5, "Sergio", 34);
            result.Rows.Add(6, "Laura", 30);
            result.Rows.Add(7, "José", 41);
            result.Rows.Add(8, "Alejandra", 29);
            result.Rows.Add(9, "Manuel", 50);
            result.Rows.Add(10, "Erika", 20);
            // Reporte
            return result;
        }



    }
}
