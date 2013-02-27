using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ninject;
using Ninject.Modules;
using System.Web.Routing;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Concrete;
using System.Configuration;

namespace SuperAuctions.WebUI.Infrastructure
{
    public class NinjectControllerFactory : DefaultControllerFactory
    {
        // A Ninject "kernel" is the thing that can supply object instances
        private IKernel kernel = new StandardKernel(new SuperAuctionsServices());

        // ASP.NET MVC calls this to get the controller for each request
        protected override IController GetControllerInstance(RequestContext context, Type controllerType)
        {
            if (controllerType == null)
                return null;
            return (IController)kernel.Get(controllerType);
        }

        // Configures how abstract service types are mapped to concrete implementations
        private class SuperAuctionsServices : NinjectModule
        {
            public override void Load()
            {
              
                //Bind<IOrderSubmitter>().To<FakeOrderSubmitter>();
                Bind<IAuctionsRepository>()
                    .To<SqlAuctionsRepository>()
                    .WithConstructorArgument("connectionString",
                        ConfigurationManager.ConnectionStrings["AppDb"].ConnectionString
                    );

                Bind<ICatalogItemsRepository>()
                    .To<SqlCatalogItemsRepository>()
                    .WithConstructorArgument("connectionString",
                        ConfigurationManager.ConnectionStrings["AppDb"].ConnectionString
                    );

                Bind<IItemPhotoRepository>()
                    .To<SqlItemPhotosRepository>()
                    .WithConstructorArgument("connectionString",
                        ConfigurationManager.ConnectionStrings["AppDb"].ConnectionString
                    );

                Bind<IItemVideoRepository>()
                    .To<SqlItemVideosRepository>()
                    .WithConstructorArgument("connectionString",
                        ConfigurationManager.ConnectionStrings["AppDb"].ConnectionString
                    );

            }
        }
    }
}