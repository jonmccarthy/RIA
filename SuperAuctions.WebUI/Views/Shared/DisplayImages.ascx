<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SuperAuctions.Domain.Entities.ItemPhoto>" %>

<td><a href="http://localhost:49792/Images/<%: Model.Photo %>" class="preview"><img width="100" height="100" src="http://localhost:49792/Images/<%: Model.Photo %>" alt="gallery thumbnail" /></a></td> 
