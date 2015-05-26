using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string laysers = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        /* 远程发布地图*/
        laysers = "topp:tasmania_state_boundaries,topp:tasmania_roads,topp:tasmania_cities";
    }
}