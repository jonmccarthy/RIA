using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SuperAuctions.Domain.Abstract;

namespace SuperAuctions.WebUI.Controllers
{
    public class ItemVideosController : Controller
    {
        private IItemVideoRepository itemsVideoRepository;

        public ItemVideosController(IItemVideoRepository itemsVideoRepository)
        {
            this.itemsVideoRepository = itemsVideoRepository;
        }

        public ViewResult ListVideos(int catid)
        {
            var picsToShow = (catid == null)
                ? itemsVideoRepository.ItemVideos
                : itemsVideoRepository.ItemVideos.Where(x => x.CatalogItemsId == catid);

            return View(picsToShow.ToList());
        }

    }
}
