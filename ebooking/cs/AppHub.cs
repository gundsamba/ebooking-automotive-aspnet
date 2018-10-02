using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace ebooking.cs
{
    public class AppHub : Hub
    {
        public void Send(string sessionid)
        {
            // Call the broadcastMessage method to update clients.
            Clients.All.broadcastMessage(sessionid);
        }
    }
}