/*
 * Main.java
 *
 * Created on August 8, 2008, 1:56 PM
 */

package org.bungeni.editor.selectors.debaterecord.tableddocuments;

import java.awt.Component;
import org.bungeni.editor.selectors.BaseMetadataContainerPanel;

/**
 *
 * @author  Ashok
 */
public class MainSingleSelect extends BaseMetadataContainerPanel {
    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(MainSingleSelect.class.getName());
 
    
    /** Creates new form Main */
    public MainSingleSelect() {
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


    @Override
    public Component getPanelComponent() {
        return this;
    }
}
