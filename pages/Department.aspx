<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="BerkeleyCollege.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Department Detail
         </div>
         <div class="card-body shadow-lg mb-5 rounded text-center"  >

             <asp:GridView ID="GridView1" Width='100%' runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" ReadOnly="True" SortExpression="DEPARTMENT_ID" />
                     <asp:TemplateField HeaderText="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                             &nbsp;<asp:LinkButton class="btn btn-primary" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:LinkButton type="button" class="btn btn-outline-primary" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                             &nbsp;<asp:LinkButton type="button" class="btn btn-outline-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
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
                    DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID" 
                    InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;) VALUES (:DEPARTMENT_ID, :DEPARTMENT_NAME)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPARTMENT&quot;" 
                    UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID">
                 <DeleteParameters>
                     <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                     <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                     <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>

             <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1">
                 
                 <InsertItemTemplate>
                     <br />
                     DEPARTMENT_ID:
                     <asp:TextBox ID="DEPARTMENT_IDTextBox" style="margin-bottom:0.3rem; margin-left:1.8rem;"  runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                     <br />
                     DEPARTMENT_NAME:
                     <asp:TextBox ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                     <br />
                     <asp:LinkButton type="button" class="btn btn-primary py-0 px-4" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                     &nbsp;<asp:LinkButton type="button" class="btn btn-danger py-0 px-4" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </InsertItemTemplate>
                 <ItemTemplate>
                     &nbsp;<asp:LinkButton type="button" class="btn btn-success fs-5 py-0 px-5 m-0" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" Font-Bold="true" Font-Size="Larger" />
                 </ItemTemplate>
             </asp:FormView>

         </div>
    </section>
</asp:Content>
