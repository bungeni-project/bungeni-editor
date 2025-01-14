package org.bungeni.trackchanges.uno;

import com.sun.star.document.EventObject;
import com.sun.star.document.XEventListener;
import com.sun.star.lang.XComponent;
import java.io.File;
import java.net.URI;
import org.apache.log4j.Logger;
import org.bungeni.odfdom.document.BungeniOdfDocumentHelper;

/**
 *Keeps track of open ODF files. This class provides a bridge between ODFDOM and UNO.
 * @author Ashok Hariharan
 */
public class UnoOdfFile {
        String filePath;
        URI fileURI;
        BungeniOdfDocumentHelper docHelper;
        XComponent xComponent;
        boolean isDisposed = false;

         private static org.apache.log4j.Logger log                  =
        Logger.getLogger(UnoOdfFile.class.getName());


        public UnoOdfFile(BungeniOdfDocumentHelper docHelper, XComponent xComponent) {
            this.docHelper = docHelper;
            this.xComponent = xComponent;
            this.xComponent.addEventListener(new XEventListener(){
                 public void disposing(com.sun.star.lang.EventObject arg0) {
                   log.info("Disposing component");
                    isDisposed = true;
                }

                public void notifyEvent(EventObject arg0) {
                }

            });
            this.filePath = docHelper.getDocumentPath();
            this.fileURI = (new File(filePath)).toURI();
        }

        /**
         * Checks if a review document is already Open
         * @param oDoc
         * @return
         */
        public boolean isFileOpen(BungeniOdfDocumentHelper oDoc ) {
            String newURI = oDoc.getOdfDocument().getBaseURI();
            if (newURI.equals(fileURI.toString())) {
                return true;
            }
            else return false;
        }

        public boolean isFileDisposed() {
            return isDisposed; 
        }

        /**
         * Returns the UNO component handle
         * @return XComponent variable containing the UNO handle
         */
        public XComponent getComponent() {
            return xComponent;
        }

        public void setComponent (XComponent xComp) {
            this.xComponent = xComp;
            this.isDisposed = false;
        }

        /**
         * Returns the ODF document helper handle
         * @return
         */
        public BungeniOdfDocumentHelper getDocumentHelper() {
            return docHelper;
        }

        /**
         * Returns the path to the file
         * @return String with path to file
         */
        public String getPath() {
            return filePath;
        }

        /**
         * Returns the URI to the file
         * @return
         */
        public URI getURI() {
            return fileURI;
        }

   
}
