<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication4.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChinookConnectionString %>" SelectCommand="GetPopularGenres" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChinookConnectionString %>" SelectCommand="GetPopularMusicByCountry" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="InputCountry" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChinookConnectionString %>" SelectCommand="GetSimilarTracksByTrackId" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="BaseTrackId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChinookConnectionString %>" SelectCommand="GetArtistRanking" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource4">
        </asp:GridView>
    </form>
</body>
</html>
