package org.bungeni.editor.selectors.judgement.judges;

import java.awt.Component;
import java.util.ArrayList;
import javax.swing.JFrame;
import org.bungeni.editor.selectors.BaseMetadataContainerPanel;
import org.bungeni.editor.selectors.panelInfo;

/**
 *
 * @author  Ashok Hariharan
 */
public class Main extends BaseMetadataContainerPanel {
    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(Main.class.getName());
 
    
    /** Creates new form Main */
    public Main() {
        super();
    }

    
    
    

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 83, Short.MAX_VALUE)
        );

        getAccessibleContext().setAccessibleName("Enter Masthead");
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables

  

    /*
    @Override
    protected void setupPanels() {
    
       m_activePanels = new ArrayList<panelInfo>(){
            {
                    //add(new panelInfo("Title","org.bungeni.editor.selectors.debaterecord.tableddocuments.Title"));
                    add(new panelInfo("TabledDocuments", "org.bungeni.editor.selectors.debaterecord.tableddocuments.TabledDocuments"));
            }
         };
    }
 */
    @Override
    public Component getPanelComponent() {
        return this;
    }
}
