using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace CapaService
{
    public class ConsultaService : GeneralService
    {

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
