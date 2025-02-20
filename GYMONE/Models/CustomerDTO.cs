using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GYMONE.Models
{
    public class CustomerDTO
    {
        public int? CustomerID { get; set; }
        public string SearchButton { get; set; }
        public string PaymentSearch { get; set; }
        public int? Page { get; set; }

        public IPagedList<CustomerDTO> SearchResults { get; set; }


    }
}