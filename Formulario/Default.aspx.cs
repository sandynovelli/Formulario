using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;

namespace Formulario
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddXml_Click(object sender, EventArgs e)
        {
            if (fuXml.HasFile)
            {
                if (ValidarTipo(fuXml.FileName))
                {
                    divFormulario.InnerHtml = string.Empty;
                    fuXml.SaveAs(Server.MapPath("~/Arquivos/" + fuXml.FileName));
                    GerarHtml();

                }

            }
        }
        protected bool ValidarTipo(string nomeArquivo)
        {
            string ext = Path.GetExtension(nomeArquivo);
            if (ext.ToLower() != ".xml")
                return false;
            else
                return true;
        }
        protected void GerarHtml()
        {
            //XmlTextReader reader = new XmlTextReader(fuXml.FileContent);
            //StringBuilder html = new StringBuilder();

            //while (reader.Read())
            //{
            //    switch (reader.Name)
            //    {
            //        case "Row":
            //            html.Append(" <div class='row'> ");
            //            break;
            //        case "Textbox":
            //            html.Append(" <input type='text'> ");
            //            break;
            //        case "/Row":
            //            html.Append(" </div> ");
            //            break;
            //    }
            //}

            StringBuilder sbXslOutput = new StringBuilder();

            //using (XmlWriter xslWriter = XmlWriter.Create(sbXslOutput))
            //{
                XslCompiledTransform transformer = new XslCompiledTransform();
                transformer.Load(Server.MapPath("~/transformar.xslt"));
                var sw = new StringWriter(sbXslOutput);
                XsltArgumentList args = new XsltArgumentList();

                transformer.Transform(Server.MapPath("~/Arquivos/" + fuXml.FileName), args, sw);

            //}

            string dataSetHtml = sbXslOutput.ToString();
            divFormulario.InnerHtml = dataSetHtml;
            
        }
    }
}