using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Night.Models;

namespace Night.Controllers
{
    public class DefaultController : Controller
    {
        BusBookingSystemEntities1 entity = new BusBookingSystemEntities1();
        // GET: Default
        public ActionResult Index()
        {
            return View(entity.ProviderDetails.ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(ProviderDetails provider)
        {
            entity.ProviderDetails.Add(provider);
            entity.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int id)
        {
            ProviderDetails provider = entity.ProviderDetails.Find(id);
            return View(provider);
        }

        [HttpPost]
        public ActionResult Edit(ProviderDetails provider)
        {
            entity.Entry(provider).State = EntityState.Modified;
            entity.SaveChanges();
            return RedirectToAction("Index");
        }


       public ActionResult Details(int id)
        {
            ProviderDetails provider = entity.ProviderDetails.Find(id);
            return View(provider);
        }


        public ActionResult Delete(int id)
        {
            ProviderDetails provider = entity.ProviderDetails.Find(id);
            entity.ProviderDetails.Remove(provider);
            entity.SaveChanges();
            return RedirectToAction("Index");
        }



        public ActionResult OfferDetails()
        {
            return View(entity.OfferDetails.ToList());
        }
        public ActionResult CreateOffer()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateOffer(OfferDetails offer)
        {
            entity.OfferDetails.Add(offer);
            entity.SaveChanges();
            return RedirectToAction("OfferDetails");
        }

        public ActionResult EditOffer(int id)
        {
            OfferDetails offer = entity.OfferDetails.Find(id);
            return View(offer);
        }

        [HttpPost]
        public ActionResult EditOffer(OfferDetails offer)
        {
            entity.Entry(offer).State = EntityState.Modified;
            entity.SaveChanges();
            return RedirectToAction("OfferDetails");
        }


        public ActionResult DetailsOffer(int id)
        {
            OfferDetails offer= entity.OfferDetails.Find(id);
            return View(offer);
        }


        public ActionResult DeleteOffer(int id)
        {
            OfferDetails offer = entity.OfferDetails.Find(id);
            entity.OfferDetails.Remove(offer);
            entity.SaveChanges();
            return RedirectToAction("OfferDetails");
        }


        //seat UI code in view of this method
        public ActionResult seat()
        {
            return View();
        }
        
    }
}