<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="BerkeleyCollege.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-header fs-2 fw-bold shadow-lg p-3 mb-5 bg-white rounded text-center">
            Teacher Detail
         </div>
         <div class="card-body shadow-lg mb-5 rounded text-center"  >

             <asp:GridView ID="GridView1" width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                   
                     <asp:TemplateField HeaderText="TEACHER_ID" SortExpression="PERSON_ID">
                         <EditItemTemplate>
                             <asp:Label ID="LabelPersonId" runat="server" Text='<%# Bind("PERSON_ID") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabelPersonId" runat="server" Text='<%# Bind("PERSON_ID") %>'></asp:Label>
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
                             <asp:TextBox ID="TextBoxCONTACT" runat="server" Text='<%# Bind("CONTACT") %>'></asp:TextBox>
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

                     <asp:TemplateField HeaderText="SALARY" SortExpression="SALARY">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBoxSalary" runat="server" Text='<%# Bind("SALARY") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabelSalary" runat="server" Text='<%# Bind("SALARY") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="ADDRESS_ID" SortExpression="ADDRESS_ID" ShowHeader="false">
                         <EditItemTemplate>
                             <asp:Label ID="LabelAddressId" runat="server" Text='<%# Bind("ADDRESS_ID") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabelAddressId" runat="server" Text='<%# Bind("ADDRESS_ID") %>'></asp:Label>
                         </ItemTemplate>
                         
                     </asp:TemplateField>
                     
                     <asp:TemplateField HeaderText="ADDRESS" SortExpression="ADDRESS">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBoxAddress" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:TextBox>
                             
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabelAddress" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" onClick="UpdateButton_Click" Text="Update"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                         </EditItemTemplate>

                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClick="DeleteButton_Click" Text="Delete"></asp:LinkButton>
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
                 SelectCommand="SELECT PERSON.*, TEACHER.SALARY, ADDRESS.* FROM PERSON JOIN TEACHER ON PERSON.PERSON_ID = TEACHER.TEACHER_ID JOIN PERSON_ADDRESS ON PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID JOIN ADDRESS ON ADDRESS.ADDRESS_ID = PERSON_ADDRESS.ADDRESS_ID" 
             >    
             </asp:SqlDataSource>


             <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
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
                    <asp:TextBox ID="DATE_OF_BIRTHTextBox" type="date" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                    <br />
                    EMAIL:
                    <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                    <br />
                    SALARY:
                    <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%#Eval("SALARY") %>' />
                    <br />
                    ADDRESS:
                    <asp:TextBox ID="ADDRESSTEXTBOX" runat="server" Text='<%#Eval("ADDRESS") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" onClick="InsertTeacherButton_Click" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Assign new teacher" />
                    <br />
                </ItemTemplate>
            </asp:FormView>








             <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
                 <InsertItemTemplate>
                     NAME:
                     <asp:DropDownList ID="DropDownListSTUDENT" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="PERSON_ID">
                     </asp:DropDownList>
                     SALARY:
                     <asp:TextBox ID="TextBoxSalary" runat="server"></asp:TextBox>
                     <br />
                     <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" onClick="AddStudentAsTeacher_Click" Text="Insert" />
                     &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </InsertItemTemplate>
                 <ItemTemplate>
                     &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                 </ItemTemplate>
             </asp:FormView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                 SelectCommand="SELECT PERSON.PERSON_ID, CONCAT(CONCAT(PERSON.PERSON_ID,' '),PERSON.NAME)&quot;NAME&quot; FROM PERSON JOIN STUDENT ON PERSON.PERSON_ID = STUDENT.STUDENT_ID" 
                >
             </asp:SqlDataSource>








        </div>
    </section>


    
</asp:Content>


<%--&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="New" Text="Assign new teacher" />
                         <br />
                         <asp:Label ID="Label1" runat="server" Text="Assign student as teacher:"></asp:Label>
                         <asp:DropDownList ID="DropDownListStudent" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="PERSON_ID"></asp:DropDownList>
                         &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Assign" />
                     </ItemTemplate>
                 </asp:FormView>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PERSON.PERSON_ID , CONCAT(CONCAT(PERSON.PERSON_ID,' '),PERSON.NAME)&quot;NAME&quot; FROM PERSON JOIN STUDENT ON PERSON.PERSON_ID = STUDENT.STUDENT_ID"></asp:SqlDataSource>
                <br/>--%>