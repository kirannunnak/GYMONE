using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GYMONE.Models;
using GYMONE.Repository;
using PagedList;

namespace GYMONE.Controllers
{
    public class CustomersController : Controller
    {
        //
        // GET: /CustomersController.cs/
       ICustomerDetails objICustomerlisting;

        public CustomersController()
        {
            //objIPaymentlisting = new Paymentlisting();
        }


        public ActionResult CustomerDetails(CustomerDTO model, string SearchButton)
        {
            CustomerDTO customer = new CustomerDTO();

            if (model.CustomerID > 0)
            {
                var Listpay = objICustomerlisting.AllCustomerDetails(Convert.ToString(model.CustomerID));

                var results = Listpay.Where(p => (p.CustomerID == model.CustomerID));

                var pageIndex = model.Page ?? 1;

                model.SearchResults = results.ToPagedList(pageIndex, 10);
            }
            else
            {
                ModelState.AddModelError("Message", "Please enter Member No to search).");
            }
            return View(model);
        }

    }
}
