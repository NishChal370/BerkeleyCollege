<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="BerkeleyCollege.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
                Address Info
             </div>
             <div class="card-body shadow-lg mb-5 rounded text-center"  >
                <asp:GridView width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                        <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton class="btn btn-primary" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton type="button" class="btn btn-outline-primary" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton  type="button" class="btn btn-outline-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" 
                    InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;) VALUES (:ADDRESS_ID, :ADDRESS)"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT * FROM &quot;ADDRESS&quot;" 
                    UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ADDRESS_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ADDRESS_ID" Type="String" />
                        <asp:Parameter Name="ADDRESS" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ADDRESS" Type="String" />
                        <asp:Parameter Name="ADDRESS_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                 <section class="text-start d-flex">
                    <asp:Label  ID="Label1" class="fw-bold fs-4 mt-3" runat="server" Text="Add Address: "></asp:Label>
                     <asp:FormView ID="FormView1" runat="server" style="margin-bottom:0.3rem; margin-left:1rem;" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource2">
                         <InsertItemTemplate>
                             ADDRESS_ID:
                             <asp:TextBox ID="ADDRESS_IDTextBox"  style="margin-bottom:0.3rem; margin-left:1rem;" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                             <br />
                             ADDRESS:
                             <asp:TextBox ID="ADDRESSTextBox" style="margin-bottom:0.3rem; margin-left:2.3rem;" runat="server" Text='<%# Bind("ADDRESS") %>' />
                             <br />
                             <asp:LinkButton ID="InsertButton" type="button" class="btn btn-primary py-0 px-4" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                             &nbsp;<asp:LinkButton ID="InsertCancelButton" type="button" class="btn btn-danger py-0 px-4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                         </InsertItemTemplate>
                         <ItemTemplate>
                             <br />
                             &nbsp;<asp:LinkButton ID="NewButton" type="button" class="btn btn-success fs-5 py-0 px-5 m-0" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                         </ItemTemplate>
                     </asp:FormView>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                         InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;) VALUES (:ADDRESS_ID, :ADDRESS)"
                         ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                         SelectCommand="SELECT * FROM &quot;ADDRESS&quot;" OnInserted="dataInserted" 
                     >
                         <InsertParameters>
                             <asp:Parameter Name="ADDRESS_ID" Type="String" />
                             <asp:Parameter Name="ADDRESS" Type="String" />
                         </InsertParameters>
                     </asp:SqlDataSource>
                </section>
                 <br />


                 </div>
        </section>
</asp:Content>
