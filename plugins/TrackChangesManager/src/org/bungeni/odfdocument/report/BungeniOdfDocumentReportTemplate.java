package org.bungeni.odfdocument.report;

import java.io.File;
import org.bungeni.odfdom.document.BungeniOdfDocumentHelper;
import org.bungeni.odfdom.utils.BungeniOdfFileCopy;

/**
 * This class is a report template class --  it provides an API to generate copies of a report template
 * @author Ashok Hariharan
 */
public class BungeniOdfDocumentReportTemplate {
    String fullPathToTemplateFile;
      private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(BungeniOdfDocumentReportTemplate.class.getName());

    BungeniOdfDocumentHelper m_docHelper;

    public BungeniOdfDocumentReportTemplate(String pathToFile) throws Exception {
      fullPathToTemplateFile = pathToFile;
      File fTemplate=  new File(pathToFile);
      m_docHelper = new BungeniOdfDocumentHelper (fTemplate);
    }

    public BungeniOdfDocumentHelper documentFromTemplate (File fOutputFile) {
        BungeniOdfDocumentHelper docHelper = null;
        try {
            BungeniOdfFileCopy fcp = new BungeniOdfFileCopy(this.m_docHelper.getOdfDocument().getPackage());
            fcp.copyFile(fOutputFile);
            docHelper = new BungeniOdfDocumentHelper (fOutputFile);
        } catch (Exception ex) {
             log.error("documentFromTemplate : " + ex.getMessage(), ex);
        } 
        return docHelper;
    }

}
