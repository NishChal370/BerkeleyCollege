<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="BerkeleyCollege.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
                Student Info
             </div>
             <div class="card-body shadow-lg mb-5 rounded text-center"  >
                 


                 <asp:GridView ID="GridView1" width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>

                         <asp:TemplateField HeaderText="STUDENT_ID" SortExpression="PERSON_ID">
                             <EditItemTemplate>
                                 <asp:Label ID="LabelPERSON_ID" runat="server" Text='<%# Bind("PERSON_ID") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelPERSON_ID" runat="server" Text='<%# Bind("PERSON_ID") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBoxNAME" runat="server" Text='<%# Bind("NAME") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelNAME" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="CONTACT" SortExpression="CONTACT">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBoxCONTACT"   runat="server" Text='<%# Bind("CONTACT") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelCONTACT" runat="server" Text='<%# Bind("CONTACT") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBoxDATE_OF_BIRTH" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelDATE_OF_BIRTH" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="EMAIL" SortExpression="EMAIL">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBoxEMAIL" runat="server" Text='<%# Bind("EMAIL") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelEMAIL" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="ADDRESS_ID" SortExpression="ADDRESS_ID">
                             <EditItemTemplate>
                                 <asp:Label ID="LabelADDRESS_ID" runat="server" Text='<%# Bind("ADDRESS_ID") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelADDRESS_ID" runat="server" Text='<%# Bind("ADDRESS_ID") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="ADDRESS" SortExpression="ADDRESS">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBoxADDRESS" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="LabelADDRESS" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField ShowHeader="False">
                             <EditItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" onClick="UpdateRowButton_Click" Text="Update"></asp:LinkButton>
                                 &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                 &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" onClick="DeleteRowButton_Click" Text="Delete"></asp:LinkButton>
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
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT PERSON.*,  ADDRESS.* FROM PERSON JOIN STUDENT ON PERSON.PERSON_ID = STUDENT.STUDENT_ID JOIN PERSON_ADDRESS ON PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID JOIN ADDRESS ON ADDRESS.ADDRESS_ID = PERSON_ADDRESS.ADDRESS_ID" 
                >
                    <DeleteParameters>
                        <asp:Parameter Name="PERSON_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PERSON_ID" Type="String" />
                        <asp:Parameter Name="NAME" Type="String" />
                        <asp:Parameter Name="CONTACT" Type="String" />
                        <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>


                 <section class="text-start d-flex">
                     <asp:Label ID="Label1" class="fw-bold" runat="server" Text="Add Student: "></asp:Label>
                     <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                         <InsertItemTemplate>
                             PERSON_ID:
                             <asp:TextBox ID="PERSON_IDTextBox" style="margin-bottom:0.3rem; margin-left:1.9rem;" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                             <br />
                             NAME:
                             <asp:TextBox ID="NAMETextBox" style="margin-bottom:0.3rem; margin-left:4.1rem;" runat="server" Text='<%# Bind("NAME") %>' />
                             <br />
                             CONTACT:
                             <asp:TextBox ID="CONTACTTextBox" style="margin-bottom:0.3rem; margin-left:2.6rem;" runat="server" Text='<%# Bind("CONTACT") %>' />
                             <br />
                             DATE_OF_BIRTH:
                             <asp:TextBox ID="DATE_OF_BIRTHTextBox" style="margin-bottom:0.3rem;" type="date" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                             <br />
                             EMAIL:
                             <asp:TextBox ID="EMAILTextBox" style="margin-bottom:0.3rem; margin-left:4.1rem;" runat="server" Text='<%# Bind("EMAIL") %>' />
                             <br />
                             ADDRESS:
                             <asp:TextBox ID="ADDRESSTextBox" style="margin-bottom:0.3rem; margin-left:2.6rem;" runat="server" Text='<%# Bind("ADDRESS") %>' />
                             <br />
                             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" onClick="InsertButton_Click" Text="Insert" />
                             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                         </InsertItemTemplate>
                         <ItemTemplate>
                             &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                         </ItemTemplate>
                     </asp:FormView>
                 </section>
                <br/>


             </div>
    </section>
    
</asp:Content>


       <%--             DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSON_ID&quot; = ?" 
                    InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;NAME&quot;, &quot;CONTACT&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;EMAIL&quot;) VALUES (?, ?, ?, ?, ?)" --%>
