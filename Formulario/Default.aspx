<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Formulario._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p>Formulário</p>
    </div>
    <div class="row">
        <div class="col-md-4">
            <p>Selecione o arquivo:</p>
            <p>
                <asp:FileUpload ID="fuXml" runat="server" />
                <asp:RegularExpressionValidator ID="uplValidator" runat="server" ControlToValidate="fuXml"
                    ErrorMessage="Apenas arquivos xml"
                    ValidationExpression="(.+\.([Xx][Mm][Ll]))"></asp:RegularExpressionValidator>
            </p>
            <asp:Button ID="btnAddXml" runat="server" Text="Adicionar" CssClass="btn btn-default" OnClick="btnAddXml_Click" />
            
        </div>
    </div>
    <div id="divFormulario" runat="server">

    </div>

</asp:Content>
