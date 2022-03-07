<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentAttendance.aspx.cs" Inherits="BerkeleyCollege.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Students' Attendence Detail
        </div>


         <div class="card-body shadow-lg mb-5 rounded text-center">
            <asp:GridView ID="GridView1" Width='100%' runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ATTENDANCE_ID" HeaderText="ATTENDANCE_ID" SortExpression="ATTENDANCE_ID" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="ATTENDANCE_DATE" HeaderText="ATTENDANCE_DATE" SortExpression="ATTENDANCE_DATE" DataFormatString = "{0:dd-MM-yyyy}"/>
                    <asp:BoundField DataField="PERCENT" HeaderText="PERCENT" SortExpression="PERCENT" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT COURSEWORK.ATTENDANCE.ATTENDANCE_ID, COURSEWORK.STUDENT.STUDENT_ID, COURSEWORK.PERSON.&quot;NAME&quot;, COURSEWORK.ATTENDANCE.ATTENDANCE_DATE, COURSEWORK.ATTENDANCE.PERCENT FROM COURSEWORK.ATTENDANCE INNER JOIN COURSEWORK.STUDENT ON COURSEWORK.ATTENDANCE.STUDENT_ID = COURSEWORK.STUDENT.STUDENT_ID INNER JOIN COURSEWORK.PERSON ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.STUDENT.STUDENT_ID">

            </asp:SqlDataSource>
         </div>
    </section>
</asp:Content>
