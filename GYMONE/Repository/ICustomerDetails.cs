using GYMONE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GYMONE.Repository
{   
        interface ICustomerDetails
        {
            IEnumerable<CustomerDTO> AllCustomerDetails(string ID);
        }
}