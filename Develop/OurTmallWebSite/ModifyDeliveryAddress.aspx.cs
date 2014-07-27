using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModifyDeliveryAddress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
			int nRows = 3;//在这里得到用户共有几条存储的记录
			int nCells = 5;//这里可以根据实际情况再加列
			int i, j;
			for (j = 0; j < nRows; j++)
			{
					TableRow r = new TableRow();
					if (j == 0)
					{
							r.CssClass = "thead-tbl-grade";
							for (i = 0; i < nCells; i++)
							{//这里进行表头的设置，后面加入操作一栏加上HyperLink对象
									TableHeaderCell hc = new TableHeaderCell();
									hc.Controls.Add(new LiteralControl("地址"));
									r.Cells.Add(hc);
							}
					}
					else
					{
							r.CssClass = "thead-tbl-address";
							for (i = 0; i < nCells; i++)
							{//这里获取后端数据库的数据并加入表中 
									TableCell c = new TableCell();
									c.Controls.Add(new LiteralControl(i + ""));
									r.Cells.Add(c);
							}
					}
					SavedAddressTable.Rows.Add(r);
			}
    }
}