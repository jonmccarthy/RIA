using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Entities;

namespace SuperAuctions.Domain.Concrete
{
    public class FakeAuctionsRepository : IAuctionsRepository
    {
        // Fake hard coded list of Menu Items
        private static IQueryable<Auction> fakeAuctions = new List<Auction> {
            new Auction { SaleId=1, SaleName = "Auction 1", SaleLocation="Naas", SaleType="Fine Art", SaleTime="2pm", ViewingCentre="Arts Centre", PriceAchieved=100.00 },
            new Auction { SaleId=1, SaleName = "Auction 2", SaleLocation="Newbridge", SaleType="Coins", SaleTime="3pm", ViewingCentre="Arts Centre", PriceAchieved=200.00 },
            new Auction { SaleId=1, SaleName = "Auction 3", SaleLocation="Kilcullen", SaleType="Furniture", SaleTime="4pm", ViewingCentre="Arts Centre", PriceAchieved=300.00 }
        }.AsQueryable();

        public IQueryable<Auction> Auctions
        {
            get { return fakeAuctions; }
        }

        public void SaveAuction(Auction Auction)
        {
            // Not Implemented
        }

        public void DeleteItems(Auction Auction)
        {
            // Not Implemented
        }

    }
}
