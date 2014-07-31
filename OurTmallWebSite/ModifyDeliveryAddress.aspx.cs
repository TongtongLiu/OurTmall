using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyConsumer;
using MyAddress;
using System.Collections;

public partial class ModifyDeliveryAddress : System.Web.UI.Page
{
		protected string addressID;
		protected long userIDMark;
		protected void Page_Load(object sender, EventArgs e)
		{
				//显示用户头像
				HttpCookie cookie = Request.Cookies.Get("isLogin");
				string un;
				addressID = Request.QueryString["aid"];
				if (cookie == null)
				{
				    //未登录
						Response.Redirect("Login.aspx");
				}
				else
				{
						un = cookie.Value;
						consumerSync user = new consumerSync(un);
						UserAvatar.ImageUrl = user.photo;
						userIDMark = user.id;
				
						//显示已存储的记录
						addressSync temp = new addressSync();
						ArrayList addrList = temp.getAllAddress(user.id);
						int nRows = addrList.Count;//在这里得到用户共有几条存储的记录
						//int nCells = 6;//这里可以根据实际情况再加列
						int  j;
						for (j = 0; j <= nRows; j++)
						{
								TableRow r = new TableRow();
								if (j == 0)
								{
										r.CssClass = "thead-tbl-grade";
										TableHeaderCell hc1 = new TableHeaderCell();
										hc1.Controls.Add(new LiteralControl("收货人"));
										r.Cells.Add(hc1);

										TableHeaderCell hc2 = new TableHeaderCell();
										hc2.Controls.Add(new LiteralControl("所在地区"));
										r.Cells.Add(hc2);

										TableHeaderCell hc3 = new TableHeaderCell();
										hc3.Controls.Add(new LiteralControl("街道地址"));
										r.Cells.Add(hc3);

										TableHeaderCell hc4 = new TableHeaderCell();
										hc4.Controls.Add(new LiteralControl("邮编"));
										r.Cells.Add(hc4);

										TableHeaderCell hc5 = new TableHeaderCell();
										hc5.Controls.Add(new LiteralControl("联系电话"));
										r.Cells.Add(hc5);

										TableHeaderCell hc7 = new TableHeaderCell();
										hc7.Controls.Add(new LiteralControl("是否默认"));
										r.Cells.Add(hc7);

										TableHeaderCell hc6 = new TableHeaderCell();
										hc6.Controls.Add(new LiteralControl("操作"));
										r.Cells.Add(hc6);
								}
								else
								{
										r.CssClass = "addressRow";
										temp.getAddressByID(Convert.ToInt64(addrList[j - 1]));

										TableCell c1 = new TableCell();
										c1.CssClass = "addressRow";
										c1.Controls.Add(new LiteralControl(temp.consignee));
										r.Cells.Add(c1);

										TableCell c2 = new TableCell();
										c2.Controls.Add(new LiteralControl(temp.country + " " + temp.province + " " + temp.city + " " + temp.county));
										//c2.Controls.Add(new LiteralControl("haha"));
										r.Cells.Add(c2);

										TableCell c3 = new TableCell();
										c3.Controls.Add(new LiteralControl(temp.street));
										r.Cells.Add(c3);

										TableCell c4 = new TableCell();
										c4.Controls.Add(new LiteralControl(temp.zipcode));
										r.Cells.Add(c4);

										TableCell c5 = new TableCell();
										c5.Controls.Add(new LiteralControl(temp.telephone));
										r.Cells.Add(c5);

										TableCell c7 = new TableCell();
										if (temp.isdefault == true)
												c7.Controls.Add(new LiteralControl("是"));
										else
												c7.Controls.Add(new LiteralControl("否"));
										r.Cells.Add(c7);

										TableCell c6 = new TableCell();
										LinkButton lb1 = new LinkButton();
										lb1.Text = "更改";
										lb1.CommandName = temp.id.ToString();
										lb1.Command += new CommandEventHandler(ModifyAddressLinkClick);
										LinkButton lb2 = new LinkButton();
										lb2.Text = "删除";
										lb2.CommandName = temp.id.ToString();
										lb2.Command += new CommandEventHandler(DeleteAddressLinkClick);
										LinkButton lb3 = new LinkButton();
										lb3.Text = "设为默认";
										lb3.CommandName = temp.id.ToString();
										lb3.Command += new CommandEventHandler(SetDefaultAddressLinkClick);
										LiteralControl lc1 = new LiteralControl(" ");
										LiteralControl lc2 = new LiteralControl(" ");
										c6.Controls.Add(lb1);
										c6.Controls.Add(lc1);
										c6.Controls.Add(lb2);
										c6.Controls.Add(lc2);
										c6.Controls.Add(lb3);
										r.Cells.Add(c6);
								}
								SavedAddressTable.Rows.Add(r);
						}
						if (addressID != null)
						{
								addressSync t = new addressSync();
								t.getAddressByID(Convert.ToInt64(addressID));
								DeliverCountry.Text = t.country;
								DeliverProvince.Text = t.province;
								DeliverCity.Text = t.city;
								DeliverCounty.Text = t.county;
								DeliverZipcode.Text = t.zipcode;
								DeliverStreet.Text = t.street;
								DeliverConsignee.Text = t.consignee;
								DeliverTelephone.Text = t.telephone;
								if (t.isdefault == true)
								{
										SetDefaultAddress.Checked = true;
								}
								else
								{
										SetDefaultAddress.Checked = false;
								}
						}
				}
		}

		protected void ModifyAddressLinkClick(object sender, CommandEventArgs e)
		{
				Response.Redirect("ModifyDeliveryAddress.aspx?aid=" + e.CommandName);
		}

		protected void DeleteAddressLinkClick(object sender, CommandEventArgs e)
		{
				addressSync iList = new addressSync();
				iList.deleteAddressByID(Convert.ToInt64(e.CommandName));
				Response.Redirect("ModifyDeliveryAddress.aspx");
		}

		protected void SetDefaultAddressLinkClick(object sender, CommandEventArgs e)
		{
				addressSync defaultAddr = new addressSync();
				defaultAddr.getAddressByID(Convert.ToInt64(e.CommandName));
				addressSync iList = new addressSync();
				ArrayList list = iList.getAllAddress(userIDMark);
				for (int i = 0; i < list.Count; i++)
				{
						iList.getAddressByID(Convert.ToInt64(list[i]));
						iList.isdefault = false;
				}
				defaultAddr.isdefault = true;
				Response.Redirect("ModifyDeliveryAddress.aspx");
		}

		protected void SubmitDeliveryAddressButton_Click(object sender, EventArgs e)
		{
				string country = Request.Form["DeliverCountry"];
				string province = Request.Form["DeliverProvince"];
				string city = Request.Form["DeliverCity"];
				string county = Request.Form["DeliverCounty"];
				string zipcode = Request.Form["DeliverZipcode"];
				string street = Request.Form["DeliverStreet"];
				string consignee = Request.Form["DeliverConsignee"];
				string telephone = Request.Form["DeliverTelephone"];
				bool ch = SetDefaultAddress.Checked;
				if (addressID == null)
				{
						addressSync newAddr = new addressSync(userIDMark);
						newAddr.country = country;
						newAddr.province = province;
						newAddr.city = city;
						newAddr.county = county;
						newAddr.zipcode = zipcode;
						newAddr.street = street;
						newAddr.consignee = consignee;
						newAddr.telephone = telephone;
						if (ch)
						{
								addressSync iList = new addressSync();
								ArrayList list = iList.getAllAddress(userIDMark);
								for (int i = 0; i < list.Count; i++)
								{
										iList.getAddressByID(Convert.ToInt64(list[i]));
										iList.isdefault = false;
								}
								newAddr.isdefault = true;
						}
				}
				else
				{
						addressSync modifyAddr = new addressSync();
						modifyAddr.getAddressByID(Convert.ToInt64(addressID));
						modifyAddr.country = country;
						modifyAddr.province = province;
						modifyAddr.city = city;
						modifyAddr.county = county;
						modifyAddr.zipcode = zipcode;
						modifyAddr.street = street;
						modifyAddr.consignee = consignee;
						modifyAddr.telephone = telephone;
						if (ch)
						{
								addressSync iList = new addressSync();
								ArrayList list = iList.getAllAddress(userIDMark);
								for (int i = 0; i < list.Count; i++)
								{
										iList.getAddressByID(Convert.ToInt64(list[i]));
										iList.isdefault = false;
								}
								modifyAddr.isdefault = true;
						}
				}
				Response.Redirect("ModifyDeliveryAddress.aspx");
		}
}