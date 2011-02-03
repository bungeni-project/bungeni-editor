/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * scrollPanel.java
 *
 * Created on Apr 27, 2009, 12:19:22 PM
 */

package org.bungeni.editor.panels.toolbar;

import java.awt.Component;

/**
 *
 * @author undesa
 */
public class scrollPanel extends javax.swing.JPanel {

    /** Creates new form scrollPanel */
    public scrollPanel() {
        initComponents();
    }

    public void setScrollViewPort(buttonContainerPanel panel) {
        this.scrollActionButtons.setViewportView(panel);
    }

    public buttonContainerPanel getViewPortPanel() {
        Component viewComponent = this.scrollActionButtons.getViewport().getView();
        if (viewComponent != null ) {
            return (buttonContainerPanel)viewComponent;
        }
        return null;
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        scrollActionButtons = new javax.swing.JScrollPane();

        scrollActionButtons.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        scrollActionButtons.setToolTipText("Click on an action to execute it");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(scrollActionButtons, javax.swing.GroupLayout.DEFAULT_SIZE, 219, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(scrollActionButtons, javax.swing.GroupLayout.DEFAULT_SIZE, 264, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane scrollActionButtons;
    // End of variables declaration//GEN-END:variables

}
