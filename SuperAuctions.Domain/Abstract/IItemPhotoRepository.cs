using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperAuctions.Domain.Entities;

namespace SuperAuctions.Domain.Abstract
{
    public interface IItemPhotoRepository
    {
        IQueryable<ItemPhoto> ItemPhotos { get; }
    }
}
