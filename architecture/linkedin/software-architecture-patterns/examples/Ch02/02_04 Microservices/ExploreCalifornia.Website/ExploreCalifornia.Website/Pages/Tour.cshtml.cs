﻿using ExploreCalifornia.Website.ExternalServices;
using ExploreCalifornia.Website.ExternalServices.Tours;
using ExploreCalifornia.Website.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace ExploreCalifornia.Website.Pages
{
    public class TourModel : PageModel
    {
        private readonly IToursProxy _toursProxy;

        public TourModel(IToursProxy toursProxy)
        {
            _toursProxy = toursProxy;
        }

        public void OnGet(int id)
        {
            Tour = _toursProxy.GetTour(id);
        }

        public Models.Tour Tour { get; private set; }
    }
}
