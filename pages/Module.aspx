<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="BerkeleyCollege.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Module Detail
         </div>
         <div class="card-body shadow-lg mb-5 rounded text-center"  >

             <asp:GridView ID="GridView1" Width='100%' runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
                     <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                     <asp:BoundField DataField="CREDIT_HOURS" HeaderText="CREDIT_HOURS" SortExpression="CREDIT_HOURS" />
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
                    DeleteCommand="DELETE FROM &quot;MODULE&quot; WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE" 
                    InsertCommand="INSERT INTO &quot;MODULE&quot; (&quot;MODULE_CODE&quot;, &quot;MODULE_NAME&quot;, &quot;CREDIT_HOURS&quot;) VALUES (:MODULE_CODE, :MODULE_NAME, :CREDIT_HOURS)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MODULE&quot;" 
                    UpdateCommand="UPDATE &quot;MODULE&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;CREDIT_HOURS&quot; = :CREDIT_HOURS WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE">
                 <DeleteParameters>
                     <asp:Parameter Name="MODULE_CODE" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="MODULE_CODE" Type="String" />
                     <asp:Parameter Name="MODULE_NAME" Type="String" />
                     <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="MODULE_NAME" Type="String" />
                     <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
                     <asp:Parameter Name="MODULE_CODE" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>

             <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="MODULE_CODE">
                 <InsertItemTemplate>
                     MODULE_CODE:
                     <asp:TextBox style="margin-left:0.3rem; margin-bottom:0.3rem" ID="MODULE_CODETextBox" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
                     <br />
                     MODULE_NAME:
                     <asp:TextBox style="margin-bottom:0.3rem;" ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
                     <br />
                     CREDIT_HOURS:
                     <asp:TextBox style="margin-left:0.3rem; margin-bottom:0.3rem;" ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
                     <br />
                     <asp:LinkButton type="button" class="btn btn-primary py-0 px-4" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                     &nbsp;<asp:LinkButton type="button" class="btn btn-danger py-0 px-4" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </InsertItemTemplate>
                 <ItemTemplate>
                     &nbsp;<asp:LinkButton type="button" class="btn btn-success fs-5 py-0 px-5 m-0" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" Font-Bold="true" Font-Size="Larger"/>
                 </ItemTemplate>
             </asp:FormView>

         </div>
    </section>

</asp:Content>
