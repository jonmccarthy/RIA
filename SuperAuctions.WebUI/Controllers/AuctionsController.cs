using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Concrete;

namespace SuperAuctions.WebUI.Controllers
{
    public class AuctionsController : Controller
    {
        private IAuctionsRepository auctionsRepository;

        public AuctionsController(IAuctionsRepository auctionsRepository)
        {
            this.auctionsRepository = auctionsRepository;
        }

       /* public AuctionsController()
        {
            // this is just temporary until we have more infrastructure in place
            string connString = @"Server=POSSERVER\SQLEXPRESS;Database=Antiques;Trusted_Connection=yes;";
            auctionsRepository = new SqlAuctionsRepository(connString);
            
            //auctionsRepository = new FakeAuctionsRepository();
        } */

        public ViewResult List()
        {
            return View(auctionsRepository.Auctions.ToList());
        }

        public ViewResult Start()
        {
            return View(auctionsRepository.Auctions.ToList());
        }

        public ViewResult JSON()
        {
            return View(Json(auctionsRepository.Auctions.ToList()));
        }

        public JsonResult TestJSON()
        {
            return Json(auctionsRepository.Auctions, JsonRequestBehavior.AllowGet);
        }
        
        public ActionResult Index()
        {
            return View();
        }

    }
}
