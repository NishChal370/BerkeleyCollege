<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="BerkeleyCollege.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
                Student Info
             </div>
             <div class="card-body shadow-lg mb-5 rounded text-center"  >

                        <asp:GridView ID="GridView1" width='100%' runat="server" AutoGenerateColumns="False" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" ReadOnly="True" SortExpression="PERSON_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
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
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" 
            InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;NAME&quot;,
            &quot;CONTACT&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;EMAIL&quot;) 
            VALUES (:PERSON_ID, :NAME, :CONTACT, :DATE_OF_BIRTH, :EMAIL)
            " 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT PERSON.* FROM PERSON JOIN STUDENT ON PERSON.PERSON_ID = STUDENT.STUDENT_ID"
            UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;NAME&quot; = :NAME, &quot;CONTACT&quot; = :CONTACT, 
            &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH, &quot;EMAIL&quot; = :EMAIL WHERE &quot;PERSON_ID&quot; = :PERSON_ID" >
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
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource3" OnItemInserted="InsertStudent">
                     
                            <InsertItemTemplate>
                                PERSON_ID:
                                <asp:TextBox ID="PersonId" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                                <br />
                                NAME:
                                <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                                <br />
                                CONTACT:
                                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                                <br />
                                DATE_OF_BIRTH:
                                <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                                <br />
                                EMAIL:
                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                          
                              
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSON_ID&quot; = ?" 
                            InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;NAME&quot;, 
                            &quot;CONTACT&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;EMAIL&quot;)
                            VALUES (:PERSON_ID, :NAME, :CONTACT, :DATE_OF_BIRTH, :EMAIL)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PERSON&quot;" UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;NAME&quot; = ?, &quot;CONTACT&quot; = ?, &quot;DATE_OF_BIRTH&quot; = ?, &quot;EMAIL&quot; = ? WHERE &quot;PERSON_ID&quot; = ?">
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
                            <UpdateParameters>
                                <asp:Parameter Name="NAME" Type="String" />
                                <asp:Parameter Name="CONTACT" Type="String" />
                                <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                                <asp:Parameter Name="EMAIL" Type="String" />
                                <asp:Parameter Name="PERSON_ID" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

             </div>
    </section>
    
</asp:Content>
