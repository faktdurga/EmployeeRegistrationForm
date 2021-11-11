<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="EmployeeRegistrationForm.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Registration Form</title>

    <%-- StyleSheet --%>
    <link href="CSS/MyStyleSheet.css" rel="stylesheet" />


</head>
<body>

    <h1>Employee Registration Form</h1>
    <div class="Grid">

    <form id="form1" runat="server">
        <div>
          <table>
              <tr>
                  <td>Employee Name</td>
                  <td><asp:TextBox ID="txtEmpName" runat="server" Width="200px" ValidationGroup="G1"></asp:TextBox></td>   
                  <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmpName" ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator></td>
              </tr>

              <tr>
                  <td>Employee ID</td>
                  <td><asp:TextBox ID="txtEmpID" runat="server" Width="200px" ValidationGroup="G1"></asp:TextBox></td>   
                  <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtEmpID" ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator></td>
              </tr>


              <tr>
                  <td>Date of Birth </td>
                  <td>
                      <asp:TextBox ID="txtDOB" runat="server" Width="200px"></asp:TextBox>
                      <asp:LinkButton ID="lnkbtnGetDate" runat="server" OnClick="lnkbtnGetDate_Click">GetDate</asp:LinkButton>
                      <asp:Calendar ID="datePicker" runat="server" Visible="False" OnSelectionChanged="datePicker_SelectionChanged"></asp:Calendar>
                  </td>   
                  <td>
                      
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtEmpID" ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator></td>
              </tr>

              <tr>
                  <td>Contact Number</td>
                  <td><asp:TextBox ID="txtNumber" runat="server" Width="200px" ValidationGroup="G1"></asp:TextBox></td>   
                  <td>
                 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtNumber" ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
                  </td>
                 
              </tr>


              <tr>
                  <td>Email ID</td>
                  <td><asp:TextBox ID="txtEmail" runat="server" Width="200px" ValidationGroup="G1"></asp:TextBox></td>   
                  <td>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Format" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G1"></asp:RegularExpressionValidator>

                  </td>
              </tr>

              <tr>
                  <td>Address</td>
                  <td><asp:TextBox ID="txtAddress" runat="server" Width="200px" Height="52px" TextMode="MultiLine" ValidationGroup="G1" ></asp:TextBox></td>   
                  <td>
                     

                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="*" ValidationGroup="G1" ForeColor="Red"></asp:RequiredFieldValidator>
                     

                  </td>
              </tr>

          </table>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="G1" OnClick="btnSubmit_Click"/>
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
        <p> 
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </p>

        <asp:GridView ID="grdResult" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="SerialNumber" ShowHeaderWhenEmpty="true" PageSize="2" OnRowDeleting="grdResult_RowDeleting">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />

        
            <Columns>
                <asp:TemplateField HeaderText ="Employee Name">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("EmployeeName") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" Text='<%# Eval("EmployeeName") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText ="Employee ID">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("EmployeeID") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEID" Text='<%# Eval("EmployeeID") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText ="Date of Birth">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Emloyee_Date_of_Birth") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDOB" Text='<%# Eval("Emloyee_Date_of_Birth") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText ="Date of Birth">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Mobile_number") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNumber" Text='<%# Eval("Mobile_number") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText ="Email">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Email") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmailID" Text='<%# Eval("Email") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText ="Address">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Employee_Address") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEAddress" Text='<%# Eval("Employee_Address") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                       
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/Minus.jpg" runat="server" CommandName="Delete" Height="25px" Width="25px" />
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>
        
    </form>
    
  
   

    </div>

    

</body>
</html>
