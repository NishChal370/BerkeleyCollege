<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="BerkeleyCollege.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Teacher Detail
         </div>
         <div class="card-body shadow-lg mb-5 rounded text-center"  >

             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"   OnRowUpdating="saveSalary" OnRowDeleting="GridView1_RowDeleting">
                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClick="DeleteButton_Click" Text="Delete"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                   
                     <asp:TemplateField HeaderText="PERSON_ID" SortExpression="PERSON_ID">
                         <EditItemTemplate>
                             <asp:Label ID="LabelPersonId" runat="server" Text='<%# Bind("PERSON_ID") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabelPersonId" runat="server" Text='<%# Bind("PERSON_ID") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>

                     <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                     <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                     <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
                     <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                     <asp:TemplateField HeaderText="SALARY" SortExpression="SALARY">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SALARY") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("SALARY") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;NAME&quot;,
            &quot;CONTACT&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;EMAIL&quot;) 
            VALUES (:PERSON_ID, :NAME, :CONTACT, :DATE_OF_BIRTH, :EMAIL)" 
                 ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                 SelectCommand="SELECT PERSON.*, TEACHER.SALARY FROM PERSON JOIN TEACHER ON PERSON.PERSON_ID = TEACHER.TEACHER_ID" 
                 UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;NAME&quot; = :NAME, &quot;CONTACT&quot; = :CONTACT, 
            &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH, &quot;EMAIL&quot; = :EMAIL WHERE &quot;PERSON_ID&quot; = :PERSON_ID">
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


             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TEACHER&quot;" 
                 >
                 <InsertParameters>
                     <asp:Parameter Name="TEACHER_ID" Type="String" />
                     <asp:Parameter Name="SALARY" Type="Decimal" />
                 </InsertParameters>
             </asp:SqlDataSource>

            <%-- <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID" 
                 InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;TEACHER_ID&quot;, &quot;SALARY&quot;) VALUES (?, ?)" 
                 ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TEACHER&quot;" 
                 UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;SALARY&quot; = ? WHERE &quot;TEACHER_ID&quot; = ?">
                 <DeleteParameters>
                     <asp:Parameter Name="TEACHER_ID" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="TEACHER_ID" Type="String" />
                     <asp:Parameter Name="SALARY" Type="Decimal" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="SALARY" Type="Decimal" />
                     <asp:Parameter Name="TEACHER_ID" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>--%>


             

             

         </div>
    </section>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" OnItemInserted="saveTeacher">
        <InsertItemTemplate>
            PERSON_ID:
            <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
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
            SALARY:
            <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%#Eval("SALARY") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
