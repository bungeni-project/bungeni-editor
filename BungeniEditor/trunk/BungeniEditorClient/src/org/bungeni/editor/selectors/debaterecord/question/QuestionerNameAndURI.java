/*
 * QuestionerName.java
 *
 * Created on August 12, 2008, 1:53 PM
 */

package org.bungeni.editor.selectors.debaterecord.question;

import java.awt.Component;
import java.util.HashMap;
import org.bungeni.db.BungeniClientDB;
import org.bungeni.db.BungeniRegistryFactory;
import org.bungeni.db.GeneralQueryFactory;
import org.bungeni.db.QueryResults;
import org.bungeni.editor.selectors.BaseMetadataPanel;
import org.bungeni.ooo.OOComponentHelper;

/**
 *
 * @author  undesa
 */
public class QuestionerNameAndURI extends BaseMetadataPanel {

    /** Creates new form QuestionerName */
    public QuestionerNameAndURI() {
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

        lblNameOfPersonFrom = new javax.swing.JLabel();
        txtPersonName = new javax.swing.JTextField();
        lblPersonURI = new javax.swing.JLabel();
        txtPersonURI = new javax.swing.JTextField();

        lblNameOfPersonFrom.setText("Edit name of Person asking Question");
        lblNameOfPersonFrom.setName("lbl_person_name"); // NOI18N

        txtPersonName.setName("txt_person_name"); // NOI18N

        lblPersonURI.setText("URI of Person");
        lblPersonURI.setName("lbl_person_uri"); // NOI18N

        txtPersonURI.setName("txt_person_uri"); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblNameOfPersonFrom, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(txtPersonName, javax.swing.GroupLayout.DEFAULT_SIZE, 279, Short.MAX_VALUE)
            .addComponent(lblPersonURI, javax.swing.GroupLayout.PREFERRED_SIZE, 138, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(txtPersonURI, javax.swing.GroupLayout.DEFAULT_SIZE, 279, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(lblNameOfPersonFrom)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtPersonName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblPersonURI)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtPersonURI, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel lblNameOfPersonFrom;
    private javax.swing.JLabel lblPersonURI;
    private javax.swing.JTextField txtPersonName;
    private javax.swing.JTextField txtPersonURI;
    // End of variables declaration//GEN-END:variables
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
            sectionMeta.put("BungeniQuestionBy", this.txtPersonName.getText());
            sectionMeta.put("BungeniQuestionByURI", this.txtPersonURI.getText());
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
        sectionMeta.put("BungeniQuestionBy", this.txtPersonName.getText());
        sectionMeta.put("BungeniQuestionByURI", this.txtPersonURI.getText());
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
        this.txtPersonName.setText(this.getSectionMetadataValue("BungeniQuestionBy"));
        this.txtPersonURI.setText(this.getSectionMetadataValue("BungeniQuestionByURI"));
        return;
    }
    
       @Override
    public boolean doUpdateEvent(){
        HashMap<String,String> registryMap = BungeniRegistryFactory.fullConnectionString();  
        BungeniClientDB dbInstance = new BungeniClientDB(registryMap);
        HashMap<String,String> selectionData = ((Main)getContainerPanel()).selectionData;
        if (selectionData == null) return true;
        if (!selectionData.containsKey("QUESTION_FROM")) return true;
        String questionFrom = ((Main)getContainerPanel()).selectionData.get("QUESTION_FROM");
        dbInstance.Connect();
        QueryResults rs = dbInstance.QueryResults(GeneralQueryFactory.Q_FETCH_PERSON_BY_URI(questionFrom));
        dbInstance.EndConnect();
            String fullName = "";
            if (rs.hasResults()) {
                
                String[] firstName = rs.getSingleColumnResult("FIRST_NAME");
                String[] lastName = rs.getSingleColumnResult("LAST_NAME");
                if (firstName != null )
                    fullName = firstName[0];
                if (lastName != null ) 
                    fullName += " " + lastName[0];
            }

        this.txtPersonName.setText(fullName);
        this.txtPersonURI.setText(questionFrom);
        return true;
    }
}
