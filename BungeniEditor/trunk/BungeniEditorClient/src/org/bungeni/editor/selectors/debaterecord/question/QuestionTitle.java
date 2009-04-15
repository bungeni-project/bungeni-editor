/*
 * QuestionTitle.java
 *
 * Created on August 12, 2008, 1:52 PM
 */

package org.bungeni.editor.selectors.debaterecord.question;

import java.awt.Component;
import java.util.HashMap;
import org.bungeni.editor.selectors.BaseMetadataPanel;
import org.bungeni.ooo.OOComponentHelper;

/**
 *
 * @author  undesa
 */
public class QuestionTitle extends BaseMetadataPanel {

    /** Creates new form QuestionTitle */
    public QuestionTitle() {
        initComponents();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txtQuestionTitle = new javax.swing.JTextField();
        lblQuestionTitle = new javax.swing.JLabel();

        txtQuestionTitle.setName("txt_question_title"); // NOI18N

        lblQuestionTitle.setFont(new java.awt.Font("DejaVu Sans", 0, 10));
        java.util.ResourceBundle bundle = java.util.ResourceBundle.getBundle("org/bungeni/editor/selectors/debaterecord/question/Bundle"); // NOI18N
        lblQuestionTitle.setText(bundle.getString("QuestionTitle.lblQuestionTitle.text")); // NOI18N
        lblQuestionTitle.setName("lbl_question_title"); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lblQuestionTitle, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtQuestionTitle, javax.swing.GroupLayout.DEFAULT_SIZE, 279, Short.MAX_VALUE))
                .addGap(82, 82, 82))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(lblQuestionTitle)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtQuestionTitle, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(14, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

public String getPanelName() {
        return getName();
    }

    public Component getPanelComponent() {
        return this;
    }


    @Override
    public boolean doCancel() {
        return true;
    }

    @Override
    public boolean doReset() {
        return true;
    }

    @Override
    public boolean preFullEdit() {
        return true;
    }

    @Override
    public boolean processFullEdit() {
            String editSectionName = getContainerPanel().getEditSectionName();
        if (editSectionName.length() > 0 ) {
            HashMap<String,String> sectionMeta = new HashMap<String,String>();
            sectionMeta.put("BungeniQuestionTitle", this.txtQuestionTitle.getText());
             getContainerPanel().getOoDocument().setSectionMetadataAttributes(editSectionName, sectionMeta);
            
        }
        return true;
    }

    @Override
    public boolean postFullEdit() {
        return true;
    }

    @Override
    public boolean preFullInsert() {
        return true;
    }

    @Override
    public boolean processFullInsert() {

        return true;
    }

    @Override
    public boolean postFullInsert() {
        return true;
    }

    @Override
    public boolean preSelectEdit() {
        return true;
    }

    @Override
    public boolean processSelectEdit() {
        return true;
    }

    @Override
    public boolean postSelectEdit() {
        return true;
    }

    @Override
    public boolean preSelectInsert() {
        return true;
    }

    @Override
    public boolean processSelectInsert() {
        OOComponentHelper ooDoc = getContainerPanel().getOoDocument();
        HashMap<String,String> sectionMeta = new HashMap<String,String>();
        String newSectionName = ((Main)getContainerPanel()).mainSectionName;
        sectionMeta.put("BungeniQuestionTitle", this.txtQuestionTitle.getText());
        ooDoc.setSectionMetadataAttributes(newSectionName, sectionMeta);
        return true;
    }

    @Override
    public boolean postSelectInsert() {
       return true;
    }

    @Override
    public boolean validateSelectedEdit() {
        return true;
    }

    @Override
    public boolean validateSelectedInsert() {
        return true;
    }

    @Override
    public boolean validateFullInsert() {
        return true;
    }

    @Override
    public boolean validateFullEdit() {
        return true;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel lblQuestionTitle;
    private javax.swing.JTextField txtQuestionTitle;
    // End of variables declaration//GEN-END:variables

        @Override
    protected void initFieldsSelectedEdit() {
        return;
    }

    @Override
    protected void initFieldsSelectedInsert() {
        return;
    }

    @Override
    protected void initFieldsInsert() {
        return;
    }

    @Override
    protected void initFieldsEdit() {
        this.txtQuestionTitle.setText(getSectionMetadataValue("BungeniQuestionTitle"));
        return;
    }
    
    @Override
    public boolean doUpdateEvent(){
        HashMap<String,String> selectionData = ((Main)getContainerPanel()).selectionData;
        if (selectionData != null ) {
            if (selectionData.containsKey("QUESTION_TITLE"))
                this.txtQuestionTitle.setText(selectionData.get("QUESTION_TITLE"));
        }
        return true;
    }

    
}
