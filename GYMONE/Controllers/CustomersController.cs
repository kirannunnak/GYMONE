using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GYMONE.Models;
using GYMONE.Repository;

namespace GYMONE.Controllers
{
    public class CustomersController : Controller
    {
        //
        // GET: /CustomersController.cs/
        IPaymentlisting objIPaymentlisting;

        public PaymentController()
        {
            objIPaymentlisting = new Paymentlisting();
        }


        public ActionResult CustomerDetails(PaymentlistingDTOVM model, string SearchButton)
        {
            return View(model);
        }

    }
}
