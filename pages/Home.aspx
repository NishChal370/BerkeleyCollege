<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BerkeleyCollege.WebForm4" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            --bs-table-bg: #e2e3e5;
            --bs-table-striped-bg: #d7d8da;
            --bs-table-striped-color: #000;
            --bs-table-active-bg: #cbccce;
            --bs-table-active-color: #000;
            --bs-table-hover-bg: #d1d2d4;
            --bs-table-hover-color: #000;
            color: #000;
            border-color: #cbccce;
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card" style="width: 100%; background-image: linear-gradient(180deg, rgba(96, 97, 99, 0.226), rgba(224, 224, 224, 0.267)); padding-bottom:2rem;">

          <%--  --%>

        <div class="elementor-widget-container">
	        <div class="banner-wrapper" style="background-image:url(https://themes.envytheme.com/ecademy/wp-content/uploads/2020/06/main-banner1.jpg);">
                <div class="d-table">
                    <div class="d-table-cell">
                        <div class="container">
                            <div class="banner-wrapper-text">
                                
							    <h1 style="margin-top:10rem; color:white;">Build Skills With Experts Any Time, Anywhere</h1>
                                <p style="color:white;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
		                    </div>
                        </div>
                    </div>
                </div>

                <div class="banner-shape11" data-speed="0.06" data-revert="true" style="transform: matrix(1, 0, 0, 1, 43.57, 20.41);">
                    <img src="https://themes.envytheme.com/ecademy/wp-content/uploads/2020/06/banner-shape12.png" alt="shape image">
                </div>
                <div class="banner-shape12" data-speed="0.06" data-revert="true" style="transform: matrix(1, 0, 0, 1, 43.57, 20.41);">
                    <img src="https://themes.envytheme.com/ecademy/wp-content/uploads/2020/06/banner-shape13.png" alt="shape image">
                </div>
                <div class="banner-shape13" data-speed="0.06" data-revert="true" style="transform: matrix(1, 0, 0, 1, 43.57, 20.41);">
                    <img src="https://themes.envytheme.com/ecademy/wp-content/uploads/2020/06/banner-shape14.png" alt="shape image">
                </div>
            </div>
        </div>


          <%--  --%>


        <div class="d-flex" style="gap: 2rem;">
            <section class="d-flex" style="padding: 5% 2%; width:fit-content">
                <section class="card-body d-flex flex-column align-items-stretch" style="gap: 5rem;">
                    <div class="card shadow-lg " style="width:20rem; background-color:#0a3fbbab;  padding: 1rem ;border:none; cursor:pointer; ;">
                      <div class="card-body text-center ">
                        <a class="card-title fw-bolder" href="Student.aspx" style="font-size: 2rem; color: white; border: none">Student Detail</a>
                      </div>
                    </div>

                    <div class="card shadow-lg" style="width:20rem; background-color:#0a3fbbab; padding: 1rem; border:none;cursor:pointer">
                      <div class="card-body text-center">
                        <a class="card-title fw-bolder" href="StudentFinance.aspx" style="font-size: 2rem; color: white; border: none">Student Fee</a>
                      </div>
                    </div>

                    <div class="card shadow-lg" style="width:20rem; background-color:#0a3fbbab; padding: 1rem; border:none;cursor:pointer">
                      <div class="card-body text-center">
                        <a class="card-title fw-bolder" href="StudentModule.aspx" style="font-size: 2rem; color: white; border: none">Student Module</a>
                      </div>
                    </div>

                    <div class="card shadow-lg" style="width:20rem; background-color:#0a3fbbab; padding: 1rem; border:none; cursor:pointer">
                      <div class="card-body text-center">
                        <a class="card-title fw-bolder" href="StudentAttendance.aspx" style="font-size: 2rem; color: white; border: none">Student Attendence</a>
                      </div>
                    </div>
                </section>

                <section class="card-body d-flex flex-column align-items-stretch justify-content-center" style="gap: 5rem;">
                     <div class="card shadow-lg " style="width:20rem; background-color:#0a3fbbab; padding: 1rem;border:none; cursor:pointer">
                      <div class="card-body text-center ">
                        <a class="card-title fw-bolder" href="StudentResult.aspx" style="font-size: 2rem; color: white; border: none">Student Results</a>
                      </div>
                    </div>

                    <div class="card shadow-lg " style="width:20rem; background-color:#0a3fbbab; padding: 1rem;border:none; cursor:pointer">
                      <div class="card-body text-center ">
                        <a class="card-title fw-bolder" href="Module.aspx" style="font-size: 2rem; color: white; border: none">Module Info</a>
                      </div>
                    </div>

                    <div class="card shadow-lg " style="width:20rem; background-color:#0a3fbbab; padding: 1rem;border:none; cursor:pointer">
                      <div class="card-body text-center ">
                        <a class="card-title fw-bolder" href="Teacher.aspx" style="font-size: 2rem; color: white; border: none">Teacher Info</a>
                      </div>
                    </div>

                    <div class="card shadow-lg" style="width:20rem; background-color:#0a3fbbab; padding: 1rem; border:none; cursor:pointer">
                      <div class="card-body text-center">
                        <a class="card-title fw-bolder" href="TeacherModule.aspx" style="font-size: 2rem; color: white; border: none">Teachers' Module</a>
                      </div>
                    </div>
               
                </section>

                <section class="card-body d-flex flex-column align-items-stretch justify-content-start" style="gap: 5rem;">
                    <div class="card shadow-lg " style="width:20rem; background-color:#0a3fbbab; padding: 1rem;border:none; cursor:pointer">
                      <div class="card-body text-center ">
                        <a class="card-title fw-bolder" href="Department.aspx" style="font-size: 2rem; color: white; border: none">Department Info</a>
                      </div>
                    </div>       
                </section>
          </section>

          <section class="d-flex flex-column gap-5" style="padding-top: 5rem">
                      <div class="d-flex flex-column justify-content-center text-center shadow-lg bg-white">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="329px" Width="519px">
                        <Series>
                            <asp:Series Name="Student" XValueMember="MODULE_NAME" YValueMembers="Total Student" Legend="Legend1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=" select module.module_name, count(student_module.student_id)&quot;Total Student&quot; from student_module inner join module on student_module.module_code = module.module_code group by module_name"></asp:SqlDataSource>
                    <asp:Label ID="Label1" runat="server" Text="No. of Student in different modules" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                </div>

                <div class="d-flex flex-column justify-content-center text-center shadow-lg bg-white">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Height="336px" Width="502px">
                        <Series>
                            <asp:Series Name="Teacher" XValueMember="MODULE_NAME" YValueMembers="Total Teacher" Legend="Legend1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select module.module_name, count(module_teacher.teacher_id)&quot;Total Teacher&quot; from module_teacher inner join module on module_teacher.module_code = module.module_code group by module_name"></asp:SqlDataSource>
                    <asp:Label ID="Label2" runat="server" Text="No. of Teacher in different modules" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                </div>
            </section>
        </div>

        <div class="d-flex justify-content-center gap-5 mb-5 text-center">
            <section class="d-flex flex-column shadow-lg bg-white">
                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="500px">
                    <Series>
                        <asp:Series Name="Teacher" XValueMember="ADDRESS" YValueMembers="Total Teacher" Legend="Legend1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1">
                        </asp:Legend>
                    </Legends>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select address.address, Count(address.address)&quot;Total Teacher&quot; from person join teacher on person.person_id = teacher.teacher_id inner join person_address on person.person_id =  person_address.person_id inner join address on address.address_id = person_address.address_id group by address.address"></asp:SqlDataSource>
                <asp:Label ID="Label3" runat="server" Text="No. of Teacher in different address" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
            </section>

            <section class="d-flex flex-column shadow-lg bg-white">
                <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4" Width="500px">
                    <Series>
                        <asp:Series Name="Student" XValueMember="ADDRESS" YValueMembers="Total Student" Legend="Legend1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1">
                        </asp:Legend>
                    </Legends>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select address.address, Count(address.address)&quot;Total Student&quot; from person join student on person.person_id = student.student_id inner join person_address on person.person_id =  person_address.person_id inner join address on address.address_id = person_address.address_id group by address.address"></asp:SqlDataSource>
                <asp:Label ID="Label4" runat="server" Text="No. of Student in different address" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
            
            
            
                <br />
            
            
            
            </section>
        </div>
    </div>

  


    

</asp:Content>
