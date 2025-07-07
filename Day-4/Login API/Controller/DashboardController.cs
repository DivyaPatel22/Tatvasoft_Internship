using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace Login_API.Controller
{
    public class DashboardController : Microsoft.AspNetCore.Mvc.Controller

    {
        [Authorize(Roles = "Admin")]
        public IActionResult AdminDashboard()
        {
            return View();
        }

        [Authorize(Roles = "User")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
