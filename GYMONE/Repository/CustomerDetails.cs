using Dapper;
using GYMONE.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace GYMONE.Repository
{
    public class CustomerDetails : ICustomerDetails
    {
        public IEnumerable<CustomerDTO> AllCustomerDetails(string CustomerID)
        {
            using (SqlConnection con = new SqlConnection(Convert.ToString(ConfigurationManager.ConnectionStrings["Mystring"])))
            {
                var param = new DynamicParameters();
                param.Add("@CustomerID", CustomerID);
                return con.Query<CustomerDTO>("Usp_PaymentDetailinfo", param, null, true, 0, commandType: CommandType.StoredProcedure);
            }

        }
    }
}