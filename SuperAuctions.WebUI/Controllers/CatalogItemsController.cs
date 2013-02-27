using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SuperAuctions.Domain.Abstract;

namespace SuperAuctions.WebUI.Controllers
{
    public class CatalogItemsController : Controller
    {
        private ICatalogItemsRepository catalogItemsRepository;

        public CatalogItemsController(ICatalogItemsRepository catalogItemsRepository)
        {
            this.catalogItemsRepository = catalogItemsRepository;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ViewResult JSON()
        {
            return View(Json(catalogItemsRepository.CatalogItems.ToList()));
        }

        public JsonResult TestJSON()
        {
            return Json(catalogItemsRepository.CatalogItems, JsonRequestBehavior.AllowGet);
        }

        public ViewResult GetItem(int itemid)
        {
            var genItem = catalogItemsRepository.CatalogItems.First(x => x.CatalogItemsId == itemid);
            return View(genItem);
        }

        public ViewResult OnlineBidding(int itemid)
        {
            var genItem = catalogItemsRepository.CatalogItems.First(x => x.CatalogItemsId == itemid);
            return View(genItem);
        }

    }
}
