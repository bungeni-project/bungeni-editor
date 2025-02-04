/*
 * DebateRecordLogo.java
 *
 * Created on August 11, 2008, 10:42 PM
 */

package org.bungeni.editor.selectors.debaterecord.masthead;

import java.awt.Component;
import java.io.File;
import javax.swing.JFileChooser;
import org.bungeni.db.BungeniClientDB;
import org.bungeni.db.DefaultInstanceFactory;
import org.bungeni.db.QueryResults;
import org.bungeni.db.SettingsQueryFactory;
import org.bungeni.extutils.BungeniEditorProperties;
import org.bungeni.editor.selectors.BaseMetadataPanel;
import org.bungeni.extutils.CommonPropertyFunctions;

/**
 *
 * @author  undesa
 */
public class DebateRecordLogo extends BaseMetadataPanel {
   private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DebateRecordLogo.class.getName());
   private String m_strLogoFileName;

    /** Creates new form DebateRecordLogo */
    public DebateRecordLogo() {
        super();
        initComponents();
        initCommon();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txt_initdebate_selectlogo = new javax.swing.JTextField();
        btn_initdebate_selectlogo = new javax.swing.JButton();

        txt_initdebate_selectlogo.setEditable(false);
        txt_initdebate_selectlogo.setFont(new java.awt.Font("DejaVu Sans", 0, 10));
        txt_initdebate_selectlogo.setName("txt_initdebate_selectlogo"); // NOI18N

        btn_initdebate_selectlogo.setFont(new java.awt.Font("DejaVu Sans", 0, 10));
        java.util.ResourceBundle bundle = java.util.ResourceBundle.getBundle("org/bungeni/editor/selectors/debaterecord/masthead/Bundle"); // NOI18N
        btn_initdebate_selectlogo.setText(bundle.getString("DebateRecordLogo.btn_initdebate_selectlogo.text")); // NOI18N
        btn_initdebate_selectlogo.setName("btn_initdebate_selectlogo"); // NOI18N
        btn_initdebate_selectlogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_initdebate_selectlogoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btn_initdebate_selectlogo, javax.swing.GroupLayout.PREFERRED_SIZE, 133, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_initdebate_selectlogo, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 279, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(btn_initdebate_selectlogo)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_initdebate_selectlogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(16, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

private void btn_initdebate_selectlogoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_initdebate_selectlogoActionPerformed
// TODO add your handling code here:
        String logoPath = "";
        logoPath = BungeniEditorProperties.getEditorProperty("logoPath");
        log.debug("logo path = " + logoPath);
        String strPath = DefaultInstanceFactory.DEFAULT_INSTALLATION_PATH();
        logoPath = strPath + File.separator + logoPath.replace('/', File.separatorChar);
        log.debug("logo path new = "+ logoPath);
        JFileChooser chooser = new JFileChooser();
        chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
        File fLogoPath = new File(logoPath);
        chooser.setCurrentDirectory(fLogoPath);
        int nReturnVal = chooser.showOpenDialog(this);
        if (nReturnVal == JFileChooser.APPROVE_OPTION) {
            File file = chooser.getSelectedFile();
            m_strLogoFileName = file.getName();
            m_strLogoPath = file.getAbsolutePath();
            txt_initdebate_selectlogo.setText(m_strLogoFileName);
            //This is where a real application would open the file.
            log.debug("Opening: " + file.getName() + "." + "\n");
        } else {
            log.debug("Open command cancelled by user." + "\n");
        }
}//GEN-LAST:event_btn_initdebate_selectlogoActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_initdebate_selectlogo;
    private javax.swing.JTextField txt_initdebate_selectlogo;
    // End of variables declaration//GEN-END:variables

    @Override
    public String getPanelName() {
     return getName();
    }

    @Override
    public Component getPanelComponent() {
     return this;
    }

    @Override
    public boolean preFullEdit() {
     return true;
    }

    @Override
    public boolean processFullEdit() {
     return true;
    }

    @Override
    public boolean postFullEdit() {
     return true;
    }

    @Override
    public boolean preFullInsert() {
            long sectionBackColor = 0xffffff;
            float sectionLeftMargin = (float).2;
            String parentSection = getParentSection();
            
            String newSectionName = getNewSectionName();
            if (getOoDocument().hasSection(newSectionName)) {
                getFormContext().getConditionSet().addConditionSet("section_exists", "true");
            } else {
                getFormContext().getConditionSet().addConditionSet("section_exists", "false");
            }
            //create field sets
            //addSectionIntoSectionWithStyling
            getFormContext().addFieldSet("section_back_color");
            getFormContext().addFieldSet("section_left_margin");
            getFormContext().addFieldSet("container_section");
            getFormContext().addFieldSet("current_section");
            //setSctionMetadataForAction
            getFormContext().addFieldSet("new_section");
            //addd image into section
            getFormContext().addFieldSet("image_import_section");
            getFormContext().addFieldSet("selected_logo");
            
              //addSectionIntoSectionWithStyling
            getFormContext().getFieldSets("section_back_color").add((Long.toHexString(sectionBackColor)));
            getFormContext().getFieldSets("section_left_margin").add(Float.toString(sectionLeftMargin));
            getFormContext().getFieldSets("container_section").add(parentSection);
            getFormContext().getFieldSets("current_section").add(newSectionName);
             //setSectionMetadataForAction   
            getFormContext().getFieldSets("new_section").add(newSectionName);
            //addImageIntoSections
            getFormContext().getFieldSets("image_import_section").add(newSectionName);
            String selectedLogoText = this.txt_initdebate_selectlogo.getText();
            getFormContext().getFieldSets("selected_logo").add((String) selectedLogoText);
      
            
         //   getFormContext().addFieldSet("selected_logo");
          //  getFormContext().addFieldSet("document_fragment");
           // getFormContext().addFieldSet("image_import_section");
     return true;
    }

    @Override
    public boolean processFullInsert() {
        boolean bReturn = processCatalogCommand();
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
        boolean bState= validateLogo();
        return bState;
    }

    @Override
    public boolean validateFullEdit() {
     return true;
    }

    public boolean validateLogo(){
        boolean bState= false;
           String logoFieldValue = (String) this.txt_initdebate_selectlogo.getText();
           boolean bError = false;
           if (logoFieldValue.length() == 0) {
               bError = true;
           } else {
              File f = new File(logoFieldValue);
              if (f.exists() && f.isFile()) {
                  bError = false;
              } else {
                  bError = true;
              }
           }
           if (bError ) {
               this.addErrorMessage(this.btn_initdebate_selectlogo, "You must select a logo !");
               return false; 
           } else {
               return true;
           }
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
        return;
    }

    private String m_logoPathProperty;
    private String m_defaultInstallationPath;
    private String m_strLogoPath;
    private void initCommon(){
               m_logoPathProperty = BungeniEditorProperties.getEditorProperty("logoPath");
               m_defaultInstallationPath = DefaultInstanceFactory.DEFAULT_INSTALLATION_PATH();
               m_strLogoPath = m_defaultInstallationPath + File.separator + m_logoPathProperty + File.separator + "default_logo.jpg";

    }
    
      public String getParentSection(){
      String parentSection = "";
      BungeniClientDB dbSettings = new BungeniClientDB(DefaultInstanceFactory.DEFAULT_INSTANCE(), DefaultInstanceFactory.DEFAULT_DB());
      dbSettings.Connect();
      QueryResults qr = dbSettings.QueryResults(SettingsQueryFactory.Q_CHECK_IF_ACTION_HAS_PARENT(getTheAction().action_naming_convention()));
      dbSettings.EndConnect();
      String[] results = qr.getSingleColumnResult("THE_COUNT");
      if (results[0].equals("0")) {
          //get the main root as the partn
          parentSection = CommonPropertyFunctions.getDocumentRootSection();
        } else {
          //this needs to be patched to deal with non root parents..
          parentSection = CommonPropertyFunctions.getDocumentRootSection();
        }
     return parentSection;
    }
  
 
       
  public String getNewSectionName() {
        String newSectionName ="";
        if (getTheAction().action_type().equals("section")) {
            if (getTheAction().action_numbering_convention().equals("single")) {
                return getTheAction().action_naming_convention();
            } else {
                String sectionPrefix = getTheAction().action_naming_convention();
                log.debug("getNewSectionName: sectionPrefix = "+ sectionPrefix);
                for (int i=1; ; i++) {
                    newSectionName = sectionPrefix+i;
                    if (getOoDocument() == null ) {
                        //System.out.println("ooDocument is null in new section name");
                    }
                    if (getOoDocument().hasSection(newSectionName))
                        continue;
                    else
                        break;
                }
            }
            return newSectionName;
        } else {
            log.debug("getNewSectionName: the action type is not a section.");
            return null;
        }
    }
      
      
}
