<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TeacherModule.aspx.cs" Inherits="BerkeleyCollege.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Teacher Module
         </div>


         <div class="card-body shadow-lg mb-5 rounded text-center"  >
             <section class="d-flexflex-row mb-5 text-start">
    
                    <asp:Label ID="Label1" runat="server" Text="Filter: " Font-Bold="true"></asp:Label>
    
                 
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="PERSON_ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
    
                 
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Reset" Height="34px" OnClick="ResetButton_Click" />

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSEWORK.PERSON.PERSON_ID, CONCAT(CONCAT(COURSEWORK.PERSON.PERSON_ID, ' '), COURSEWORK.PERSON.&quot;NAME&quot;) AS &quot;NAME&quot; FROM COURSEWORK.PERSON INNER JOIN COURSEWORK.TEACHER ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.TEACHER.TEACHER_ID"></asp:SqlDataSource>

                </section>



             <asp:GridView ID="GridView1" Width='100%' runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" SortExpression="TEACHER_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSEWORK.TEACHER.TEACHER_ID, COURSEWORK.PERSON.&quot;NAME&quot;, COURSEWORK.PERSON.CONTACT, MODULE.MODULE_CODE, MODULE.MODULE_NAME FROM COURSEWORK.TEACHER INNER JOIN COURSEWORK.PERSON ON COURSEWORK.TEACHER.TEACHER_ID = COURSEWORK.PERSON.PERSON_ID INNER JOIN COURSEWORK.MODULE_TEACHER ON COURSEWORK.MODULE_TEACHER.TEACHER_ID = COURSEWORK.TEACHER.TEACHER_ID INNER JOIN COURSEWORK.MODULE ON COURSEWORK.MODULE_TEACHER.MODULE_CODE = COURSEWORK.MODULE.MODULE_CODE"></asp:SqlDataSource>
             <asp:GridView ID="GridView2" Width='100%'  runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" SortExpression="TEACHER_ID" />
                     <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                     <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                     <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
                     <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
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
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSEWORK.TEACHER.TEACHER_ID, COURSEWORK.PERSON.&quot;NAME&quot;, COURSEWORK.PERSON.CONTACT, MODULE.MODULE_CODE, MODULE.MODULE_NAME FROM COURSEWORK.TEACHER INNER JOIN COURSEWORK.PERSON ON COURSEWORK.TEACHER.TEACHER_ID = COURSEWORK.PERSON.PERSON_ID INNER JOIN COURSEWORK.MODULE_TEACHER ON COURSEWORK.MODULE_TEACHER.TEACHER_ID = COURSEWORK.TEACHER.TEACHER_ID INNER JOIN COURSEWORK.MODULE ON COURSEWORK.MODULE_TEACHER.MODULE_CODE = COURSEWORK.MODULE.MODULE_CODE
WHERE COURSEWORK.TEACHER.TEACHER_ID = :TEACHER_ID">

                 <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="TEACHER_ID" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
             </asp:SqlDataSource>

         </div>
    </section>
</asp:Content>
