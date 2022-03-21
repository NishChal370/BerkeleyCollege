<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentFinance.aspx.cs" Inherits="BerkeleyCollege.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Students' Fee Detail
         </div>


         <div class="card-body shadow-lg mb-5 rounded text-center"  >
             <section class="d-flexflex-row mb-5 text-start">
    
                    <asp:Label ID="Label1" runat="server" Text="Filter: " Font-Bold="true"></asp:Label>
    
                  
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="PERSON_ID" Font-Size="Medium" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
    
                  
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Reset" Height="34px" OnClick="ResetButton_Click" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.person_id, 
CONCAT(CONCAT(person.person_id, ' '),person.name)&quot;NAME&quot; from person
inner join student
on person.person_id = student.student_id"></asp:SqlDataSource>
                </section>

             <asp:GridView ID="GridView1" Width='100%' runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:BoundField DataField="INVOICE_ID" HeaderText="INVOICE_ID" SortExpression="INVOICE_ID" />
                    <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="FEE_DATE" HeaderText="FEE_DATE" SortExpression="FEE_DATE" DataFormatString = "{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
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
                SelectCommand="SELECT COURSEWORK.FEE.INVOICE_ID, COURSEWORK.DEPARTMENT.DEPARTMENT_NAME, COURSEWORK.STUDENT.STUDENT_ID, COURSEWORK.PERSON.&quot;NAME&quot;, 
COURSEWORK.PERSON.EMAIL, COURSEWORK.PERSON.CONTACT, COURSEWORK.FEE.FEE_DATE, COURSEWORK.FEE.AMOUNT FROM COURSEWORK.FEE
INNER JOIN COURSEWORK.DEPARTMENT ON COURSEWORK.DEPARTMENT.DEPARTMENT_ID = COURSEWORK.FEE.DEPARTMENT_ID INNER JOIN COURSEWORK.STUDENT ON COURSEWORK.STUDENT.STUDENT_ID = COURSEWORK.FEE.STUDENT_ID 
INNER JOIN COURSEWORK.PERSON ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.STUDENT.STUDENT_ID
">
            </asp:SqlDataSource>
             <asp:GridView ID="GridView2" runat="server" width='100%' DataSourceID="SqlDataSource3" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="INVOICE_ID" HeaderText="INVOICE_ID" SortExpression="INVOICE_ID" />
                     <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME" />
                     <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                     <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                     
                     <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                     <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                     <asp:BoundField DataField="FEE_DATE" HeaderText="FEE_DATE" ReadOnly="True" SortExpression="FEE_DATE" DataFormatString = "{0:dd-MM-yyyy}"/>
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
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSEWORK.FEE.INVOICE_ID, COURSEWORK.DEPARTMENT.DEPARTMENT_NAME, COURSEWORK.STUDENT.STUDENT_ID, COURSEWORK.PERSON.&quot;NAME&quot;,  COURSEWORK.PERSON.EMAIL, COURSEWORK.PERSON.CONTACT, COURSEWORK.FEE.FEE_DATE, COURSEWORK.FEE.AMOUNT FROM COURSEWORK.FEE INNER JOIN COURSEWORK.DEPARTMENT ON COURSEWORK.DEPARTMENT.DEPARTMENT_ID = COURSEWORK.FEE.DEPARTMENT_ID INNER JOIN COURSEWORK.STUDENT ON COURSEWORK.STUDENT.STUDENT_ID = COURSEWORK.FEE.STUDENT_ID INNER JOIN COURSEWORK.PERSON ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.STUDENT.STUDENT_ID 
WHERE COURSEWORK.STUDENT.STUDENT_ID = :STUDENT_ID">
                  <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
             </asp:SqlDataSource>
         </div>
    </section>
</asp:Content>
