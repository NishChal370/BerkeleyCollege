<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentResult.aspx.cs" Inherits="BerkeleyCollege.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Students' Module Results
         </div>


         <div class="card-body shadow-lg mb-5 rounded text-center">
             <asp:Panel ID="Panel1" runat="server">
                 <section class="d-flexflex-row mb-5 text-start">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT COURSEWORK.STUDENT.STUDENT_ID, CONCAT(CONCAT(COURSEWORK.STUDENT.STUDENT_ID, '  '), COURSEWORK.PERSON.&quot;NAME&quot;) AS &quot;NAME&quot; FROM COURSEWORK.STUDENT INNER JOIN COURSEWORK.PERSON ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.STUDENT.STUDENT_ID">

                    </asp:SqlDataSource>
    
                    <asp:Label ID="Label1" runat="server" Text="Filter: "></asp:Label>
    
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField= "NAME" DataValueField="STUDENT_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="187px" OnTextChanged="DropDownList1_TextChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="1">---</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Reset" Height="31px" OnClick="Button1_Click" />
                </section>



                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSEWORK.STUDENT.STUDENT_ID, COURSEWORK.PERSON.&quot;NAME&quot;, COURSEWORK.MODULE.MODULE_CODE, COURSEWORK.MODULE.MODULE_NAME, COURSEWORK.ASSIGNMENT.ASSIGNMENT_TYPE, COURSEWORK.STUDENT_ASSIGNMENT.GRADE, COURSEWORK.STUDENT_ASSIGNMENT.STATUS FROM COURSEWORK.STUDENT_ASSIGNMENT INNER JOIN COURSEWORK.STUDENT ON COURSEWORK.STUDENT.STUDENT_ID = COURSEWORK.STUDENT_ASSIGNMENT.STUDENT_ID INNER JOIN COURSEWORK.ASSIGNMENT ON COURSEWORK.ASSIGNMENT.ASSIGNMENT_ID = COURSEWORK.STUDENT_ASSIGNMENT.ASSIGNMENT_ID INNER JOIN COURSEWORK.MODULE ON COURSEWORK.MODULE.MODULE_CODE = COURSEWORK.STUDENT_ASSIGNMENT.MODULE_CODE INNER JOIN COURSEWORK.PERSON ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.STUDENT.STUDENT_ID"></asp:SqlDataSource>

                 <asp:GridView ID="GridView1" Width='100%' runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                         <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                         <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
                         <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                         <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" SortExpression="ASSIGNMENT_TYPE" />
                         <asp:BoundField DataField="GRADE" HeaderText="GRADE" SortExpression="GRADE" />
                         <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
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

                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSEWORK.STUDENT.STUDENT_ID, COURSEWORK.PERSON.&quot;NAME&quot;, COURSEWORK.MODULE.MODULE_CODE, COURSEWORK.MODULE.MODULE_NAME, COURSEWORK.ASSIGNMENT.ASSIGNMENT_TYPE, COURSEWORK.STUDENT_ASSIGNMENT.GRADE, COURSEWORK.STUDENT_ASSIGNMENT.STATUS FROM COURSEWORK.STUDENT_ASSIGNMENT INNER JOIN COURSEWORK.STUDENT ON COURSEWORK.STUDENT.STUDENT_ID = COURSEWORK.STUDENT_ASSIGNMENT.STUDENT_ID INNER JOIN COURSEWORK.ASSIGNMENT ON COURSEWORK.ASSIGNMENT.ASSIGNMENT_ID = COURSEWORK.STUDENT_ASSIGNMENT.ASSIGNMENT_ID INNER JOIN COURSEWORK.MODULE ON COURSEWORK.MODULE.MODULE_CODE = COURSEWORK.STUDENT_ASSIGNMENT.MODULE_CODE INNER JOIN COURSEWORK.PERSON ON COURSEWORK.PERSON.PERSON_ID = COURSEWORK.STUDENT.STUDENT_ID WHERE (COURSEWORK.STUDENT.&quot;STUDENT_ID&quot; =  :STUDENT_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
    
                 <asp:GridView ID="GridView2" Width='100%' runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                         <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                         <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
                         <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                         <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" SortExpression="ASSIGNMENT_TYPE" />
                         <asp:BoundField DataField="GRADE" HeaderText="GRADE" SortExpression="GRADE" />
                         <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
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
             </asp:Panel>
         </div>
    </section>
    
</asp:Content>
