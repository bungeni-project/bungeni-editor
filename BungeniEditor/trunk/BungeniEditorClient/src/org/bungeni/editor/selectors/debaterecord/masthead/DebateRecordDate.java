/*
 * DebateRecordDate.java
 *
 * Created on August 11, 2008, 10:06 PM
 */

package org.bungeni.editor.selectors.debaterecord.masthead;

import com.sun.star.container.XNameAccess;
import com.sun.star.container.XNamed;
import com.sun.star.text.XTextContent;
import com.sun.star.text.XTextCursor;
import java.awt.Component;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import javax.swing.InputVerifier;
import javax.swing.JComponent;
import javax.swing.JFormattedTextField;
import org.bungeni.db.DefaultInstanceFactory;
import org.bungeni.extutils.BungeniEditorProperties;
import org.bungeni.editor.selectors.BaseMetadataPanel;
import org.bungeni.ooo.OOComponentHelper;
import org.bungeni.ooo.ooDocMetadata;
import org.bungeni.ooo.ooQueryInterface;

/**
 *
 * @author  Ashok Hariharan
 */
public class DebateRecordDate extends BaseMetadataPanel {

      private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DebateRecordDate.class.getName());
    
      /**
       * Metadata variables
       */
      final String _debatedateRefName_ = "BungeniOfficialDate";

    /** Creates new form DebateRecordDate */
    public DebateRecordDate() {
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

        lbl_initdebate_hansard = new javax.swing.JLabel();
        dt_initdebate_hansarddate = new org.jdesktop.swingx.JXDatePicker();

        lbl_initdebate_hansard.setFont(new java.awt.Font("DejaVu Sans", 0, 10));
        java.util.ResourceBundle bundle = java.util.ResourceBundle.getBundle("org/bungeni/editor/selectors/debaterecord/masthead/Bundle"); // NOI18N
        lbl_initdebate_hansard.setText(bundle.getString("DebateRecordDate.lbl_initdebate_hansard.text")); // NOI18N

        dt_initdebate_hansarddate.setFont(new java.awt.Font("DejaVu Sans", 0, 10));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(dt_initdebate_hansarddate, javax.swing.GroupLayout.PREFERRED_SIZE, 194, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(lbl_initdebate_hansard, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(lbl_initdebate_hansard)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 16, Short.MAX_VALUE)
                .addComponent(dt_initdebate_hansarddate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        getAccessibleContext().setAccessibleName("DebateRecord Date");
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private org.jdesktop.swingx.JXDatePicker dt_initdebate_hansarddate;
    private javax.swing.JLabel lbl_initdebate_hansard;
    // End of variables declaration//GEN-END:variables

    @Override
    public String getPanelName() {
        return this.getAccessibleContext().getAccessibleName();
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
       return true;    }

    @Override
    public boolean postFullEdit() {
       return true;    }

    /**
     * Insert Api Functions 
     * @return
     */
    @Override
    public boolean preFullInsert() {
        /*
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
     
            
              //addSectionIntoSectionWithStyling
            getFormContext().getFieldSets("section_back_color").add((Long.toHexString(sectionBackColor)));
            getFormContext().getFieldSets("section_left_margin").add(Float.toString(sectionLeftMargin));
            getFormContext().getFieldSets("container_section").add(parentSection);
            getFormContext().getFieldSets("current_section").add(newSectionName);
             //setSectionMetadataForAction   
            getFormContext().getFieldSets("new_section").add(newSectionName);
            //addImageIntoSections
            SimpleDateFormat formatter = new SimpleDateFormat ("MMMM dd yyyy");
            String strDebateDate = formatter.format( dt_initdebate_hansarddate.getDate());
           getFormContext().addFieldSet("document_field_set");
           getFormContext().getFieldSets("document_field_set").add(new ooDocFieldSet(new String("debaterecord_official_date"),
                                            (String) strDebateDate,
                                            newSectionName));
           //getFormContext().addFieldSet("container_section");
          // getFormContext().getFieldSets("container_section").add(containerSection);
            */
        return true;    
    }

    @Override
    public boolean processFullInsert() {
       log.debug("processFullInsert : running");
       // boolean bReturn = processCatalogCommand();
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

       private void insertRefMark (OOComponentHelper ooHandle, XTextCursor thisCursor, String referenceName ) {
       Object referenceMark = ooHandle.createInstance("com.sun.star.text.ReferenceMark");
       XNamed xRefMark = ooQueryInterface.XNamed(referenceMark);
       xRefMark.setName(referenceName);
       XTextContent xContent = ooQueryInterface.XTextContent(xRefMark);
       try {
       thisCursor.getText().insertTextContent(thisCursor, xContent, true);
       } catch (Exception ex) {
           log.error("insertReferenceMark :" + ex.getMessage()); 
       }
   }
    @Override
    public boolean processSelectInsert() {
        //1 check if reference exists .. if yes then fail... 
        //if no markhighlighted text with named reference
       //also store selected date to metadata 
        //1 - add reference mark
       OOComponentHelper ooDoc = getContainerPanel().getOoDocument();
       insertRefMark(ooDoc, ooDoc.getViewCursor(), this._debatedateRefName_);
       //2 - add metadata
       SimpleDateFormat formatter = new SimpleDateFormat (BungeniEditorProperties.getEditorProperty("metadataDateFormat"));
       final String strDebateDate = formatter.format( dt_initdebate_hansarddate.getDate());
       com.sun.star.text.XTextSection currentSection = ooDoc.currentSection();
       HashMap<String,String> sectionMeta = new HashMap<String,String>() {{
               put (_debatedateRefName_, strDebateDate);
           }};
       ooDoc.setSectionMetadataAttributes(currentSection, sectionMeta);     
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
        OOComponentHelper ooDoc = getContainerPanel().getOoDocument();
        XNameAccess refs = ooDoc.getReferenceMarks();
        if (refs.hasByName(_debatedateRefName_)){
            this.addErrorMessage(null, "This item has already been marked up. Please use the 'Edit Metadata' option to modify it");
            return false;
        }
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
        //String strPath = DefaultInstanceFactory.DEFAULT_INSTALLATION_PATH();
        //m_strLogoPath = strPath + File.separator + logoPath + File.separator + "default_logo.jpg";
        //log.debug("InitDebateRecord:" + m_strLogoPath);
        //dt_initdebate_timeofhansard.setModel(new SpinnerDateModel(new Date(), null, null, Calendar.HOUR));
        //dt_initdebate_timeofhansard.setEditor(new JSpinner.DateEditor(dt_initdebate_timeofhansard, "HH:mm"));
        //((JSpinner.DefaultEditor)dt_initdebate_timeofhansard.getEditor()).getTextField().setEditable(false);
        dt_initdebate_hansarddate.setInputVerifier(new DateVerifier());
        
        if (getOoDocument().propertyExists("Bungeni_DebateOfficialDate")) {
            try {
                ooDocMetadata meta = new ooDocMetadata(getOoDocument());
                String strDate = meta.GetProperty("Bungeni_DebateOfficialDate");
                //String strTime = meta.GetProperty("Bungeni_DebateOfficialTime");
                SimpleDateFormat formatter = new SimpleDateFormat("MMMM dd yyyy");
                this.dt_initdebate_hansarddate.setDate(formatter.parse(strDate));
                //SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                //this.dt_initdebate_timeofhansard.setValue(timeFormat.parse(strTime));
            } catch (ParseException ex) {
                log.error("initFieldsEdit : " + ex.getMessage());
            }
                //SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                //this.dt_initdebate_timeofhansard.setValue(timeFormat.parse(strTime));
                }
        //buildComponentsArray();
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
    
      public class DateVerifier extends InputVerifier {
     
        @Override
        public boolean verify(JComponent input) {
         if (input instanceof JFormattedTextField) {
             JFormattedTextField ftf = (JFormattedTextField)input;
             JFormattedTextField.AbstractFormatter formatter = ftf.getFormatter();
             if (formatter != null) {
                 String text = ftf.getText();
                 try {
                      formatter.stringToValue(text);
                      return true;
                  } catch (ParseException pe) {
                      return false;
                  }
              }
          }
          return true;
      }
        @Override
      public boolean shouldYieldFocus(JComponent input) {
          return verify(input);
      }

     
  }

      /*
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
    */
 
       
  public String getNewSectionName() {
        String newSectionName ="";
        // if (getTheAction().action_type().equals("section")) {
        if (getTheSubAction().action_type().equals("section")) {
            if (getTheSubAction().section_numbering_convention().equals("single")) {
                return getTheSubAction().section_naming_convention();
            } else {
                String sectionPrefix = getTheSubAction().section_naming_convention();
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
