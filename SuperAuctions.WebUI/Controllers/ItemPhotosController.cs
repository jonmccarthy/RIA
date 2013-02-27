using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Concrete;

namespace SuperAuctions.WebUI.Controllers
{
    public class ItemPhotosController : Controller
    {
        private IItemPhotoRepository itemsPhotoRepository;

        public ItemPhotosController(IItemPhotoRepository itemsPhotoRepository)
        {
            this.itemsPhotoRepository = itemsPhotoRepository;
        }

        public ViewResult JSON()
        {
            return View(Json(itemsPhotoRepository.ItemPhotos.ToList()));
        }

        public JsonResult TestJSON()
        {
            return Json(itemsPhotoRepository.ItemPhotos, JsonRequestBehavior.AllowGet);
        }

        public ViewResult ShowPhotos(string imgname)
        {
            //http://localhost:49792/ItemPhotos/ShowPhotos?imgname=Coin1.jpg
            var photoItem = itemsPhotoRepository.ItemPhotos.First(x => x.Photo == imgname);
            return View(photoItem);
        }

        public ViewResult ZoomPhoto(string imgname)
        {
            //http://localhost:49792/ItemPhotos/ZoomPhoto?imgname=Coin1.jpg
            var photoItem = itemsPhotoRepository.ItemPhotos.First(x => x.Photo == imgname);
            return View(photoItem);
        }

        public ViewResult ListPhotos(int catid)
        {
            var picsToShow = (catid == null)
                ? itemsPhotoRepository.ItemPhotos
                : itemsPhotoRepository.ItemPhotos.Where(x => x.CatalogItemsId == catid);

            return View(picsToShow.ToList());
        }

        public ViewResult ListPhotoOnlineBidding(int catid)
        {
            var picsToShow = (catid == null)
                ? itemsPhotoRepository.ItemPhotos
                : itemsPhotoRepository.ItemPhotos.Where(x => x.CatalogItemsId == catid);

            return View(picsToShow.ToList());
        }

        public ViewResult ListPhotoChangeIframe(int catid)
        {
            var picsToShow = (catid == null)
                ? itemsPhotoRepository.ItemPhotos
                : itemsPhotoRepository.ItemPhotos.Where(x => x.CatalogItemsId == catid);

            return View(picsToShow.ToList());
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
