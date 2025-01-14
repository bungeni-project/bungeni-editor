package org.bungeni.editor.selectors.debaterecord.bills;

import com.sun.star.text.XTextSection;
import com.sun.star.text.XTextViewCursor;
import java.awt.Component;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.AbstractButton;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import org.bungeni.connector.client.BungeniConnector;
import org.bungeni.connector.element.Bill;
import org.bungeni.db.RegistryQueryFactory;
import org.bungeni.editor.selectors.BaseMetadataPanel;
import org.bungeni.extutils.BungeniEditorProperties;
import org.bungeni.extutils.CommonConnectorFunctions;
import org.bungeni.extutils.CommonStringFunctions;
import org.bungeni.ooo.OOComponentHelper;

/**
 *
 * @author  Ashok Hariharan
 */
public class Bills extends BaseMetadataPanel {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(Bills.class.getName());

    /** Creates new form TabledDocuments */
    public Bills() {
        super();
        initComponents();
        initTable();
    }
    private static final ResourceBundle bundle = ResourceBundle.getBundle("org/bungeni/editor/selectors/debaterecord/committees/Bundle");

    class BillsModel extends DefaultTableModel {

        private boolean cellsEditable = false;

        public BillsModel() {
            super();
        }

        @Override
        public boolean isCellEditable(int row, int col) {
            return cellsEditable;
        }

        public void setModelEditable(boolean bState) {
            this.cellsEditable = bState;
        }
    }

    protected String getTableQuery() {
        String countryIso = BungeniEditorProperties.getEditorProperty("parliament.CountryCode");
        String sQuery = RegistryQueryFactory.Q_FETCH_BILLS(countryIso);
        return sQuery;
    }

    private void initTable() {

        // !+BUNGENI_CONNECTOR(reagan,06-01-2012)
        // Changed the Initialization of the BungeniConnector Object
        // to ensure that metadata is accessed using the REST API
        // rather than directly from the datasource
        BungeniConnector client = null;
        try {
            client = CommonConnectorFunctions.getDSClient();

            List<Bill> bills = client.getBills();
            if (!bills.isEmpty()) {
                BillsModel mdl = new BillsModel();
                mdl.addColumn("BILL_NAME");
                mdl.addColumn("BILL_URI");
                mdl.addColumn("BILL_ONTOLOGY");
                mdl.setRowCount(bills.size());
                for (int i = 0; i < bills.size(); i++) {
                    Bill bill = bills.get(i);
                    mdl.setValueAt(bill.getName(), i, 0);
                    mdl.setValueAt(bill.getUri(), i, 1);
                    mdl.setValueAt(bill.getOntology(), i, 2);
                }
                tbl_Bills.setModel(mdl);
                ((BillsModel) this.tbl_Bills.getModel()).setModelEditable(false);
                enableButtons(false);
            }
            tbl_Bills.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        } catch (IOException ex) {
            log.error("Error initializing the BungeniConnectorClient " + ex) ;
        }
        

//        HashMap<String,String> registryMap = BungeniRegistryFactory.fullConnectionString();
//            BungeniClientDB dbInstance = new BungeniClientDB(registryMap);
//            dbInstance.Connect();
//            QueryResults qr = dbInstance.QueryResults(getTableQuery());
//            dbInstance.EndConnect();
//            if (qr != null ) {
//                if (qr.hasResults()) {
//                    Vector<Vector<String>> resultRows = new Vector<Vector<String>>();
//                    resultRows = qr.theResults();
//                    BillsModel mdl = new BillsModel() ;
//                    mdl.setDataVector(resultRows, qr.getColumnsAsVector());
//                    tbl_Bills.setModel(mdl);
//                     ((BillsModel)this.tbl_Bills.getModel()).setModelEditable(false);
//                     enableButtons(false);
//                    }
//            }
//            tbl_Bills.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    }

    private void enableButtons(boolean b) {
        Enumeration<AbstractButton> buttons = this.grpEditButtons.getElements();
        while (buttons.hasMoreElements()) {
            AbstractButton abButton = buttons.nextElement();
            abButton.setEnabled(b);
        }
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        grpEditButtons = new javax.swing.ButtonGroup();
        lbl_SelectCommittee = new javax.swing.JLabel();
        scrollTabledDocs = new javax.swing.JScrollPane();
        tbl_Bills = new javax.swing.JTable();

        setName("Form"); // NOI18N

        lbl_SelectCommittee.setFont(new java.awt.Font("DejaVu Sans", 0, 11));
        java.util.ResourceBundle bundle = java.util.ResourceBundle.getBundle("org/bungeni/editor/selectors/debaterecord/bills/Bundle"); // NOI18N
        lbl_SelectCommittee.setText(bundle.getString("Bills.lbl_SelectCommittee.text")); // NOI18N
        lbl_SelectCommittee.setName("lbl_SelectCommittee"); // NOI18N

        scrollTabledDocs.setName("scrollTabledDocs"); // NOI18N

        tbl_Bills.setFont(new java.awt.Font("DejaVu Sans", 0, 11));
        tbl_Bills.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tbl_Bills.setName("tbl_Bills"); // NOI18N
        scrollTabledDocs.setViewportView(tbl_Bills);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(scrollTabledDocs, javax.swing.GroupLayout.PREFERRED_SIZE, 375, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lbl_SelectCommittee, javax.swing.GroupLayout.PREFERRED_SIZE, 194, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(lbl_SelectCommittee)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(scrollTabledDocs, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents
    // Variables declaration - do not modify//GEN-BEGIN:variables
    protected javax.swing.ButtonGroup grpEditButtons;
    private javax.swing.JLabel lbl_SelectCommittee;
    protected javax.swing.JScrollPane scrollTabledDocs;
    protected javax.swing.JTable tbl_Bills;
    // End of variables declaration//GEN-END:variables

    public String getPanelName() {
        return java.util.ResourceBundle.getBundle("org/bungeni/editor/selectors/debaterecord/committees/Bundle").getString("PanelName");
    }

    public Component getPanelComponent() {
        return this;
    }

    public HashMap<String, ArrayList<String>> getTableSelection() {

        int[] selectedRows = tbl_Bills.getSelectedRows();
        ArrayList<String> billNames = new ArrayList<String>();
        ArrayList<String> billUris = new ArrayList<String>();
        ArrayList<String> billOntology = new ArrayList<String>();

        for (int i = 0; i < selectedRows.length; i++) {
            String docTitle = (String) tbl_Bills.getModel().getValueAt(i, 0);
            String docURI = (String) tbl_Bills.getModel().getValueAt(i, 1);
            String docOntology = (String) tbl_Bills.getModel().getValueAt(i, 2);
            billNames.add(docTitle);
            billUris.add(docURI);
            billOntology.add(docOntology);
        }
        HashMap<String, ArrayList<String>> tblData = new HashMap<String, ArrayList<String>>();
        tblData.put("document_titles", billNames);
        tblData.put("document_uris", billUris);
        tblData.put("document_ontologies", billOntology);
        return tblData;

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
        HashMap<String, ArrayList<String>> tblData = new HashMap<String, ArrayList<String>>();


        return true;
    }

    @Override
    public boolean processSelectInsert() {
        // applyBulletedList();
        markupCommittee();
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
        //validate the tabled documents
        //all rows in table need to be full.
        boolean bState = true;

        if (this.tbl_Bills.getSelectedRowCount() == 0) {
            addErrorMessage(this.tbl_Bills, bundle.getString("no_row_selected"));
            bState = false;
        } else {
            //validate selected rows for empty data
            int[] nRows = this.tbl_Bills.getSelectedRows();
            int nCols = this.tbl_Bills.getColumnCount();

            for (int i = 0; i < nRows.length; i++) {
                for (int j = 0; j < nCols; j++) {
                    String sValue = (String) this.tbl_Bills.getValueAt(nRows[i], j);
                    if (sValue.trim().length() == 0) {
                        Object[] values = {Integer.toString(nRows[i] + 1), Integer.toString(j + 1)};
                        String formattedMsg = MessageFormat.format(bundle.getString("tableValidationError"),
                                values);
                        this.addErrorMessage(this.tbl_Bills, formattedMsg);
                        bState = false;
                    }
                }
            }
        }
        return bState;
    }

    class objBill {

        String billName;
        String billUri;
        String billOntology;

        objBill() {
        }
    }
    private static final String BUNGENI_BILL_META = "BungeniBill.";
    private static final String BUNGENI_BILL_REF_SEPARATOR = ":";
    private static final String BUNGENI_BILL_REF_PREFIX = "sBillRef";

    private void markupCommittee() {
        //check if selected committee exists in section meta
        //if it does make reference to it
        //if it does not added meta for committe and then make reference
        int nSelectedRow = this.tbl_Bills.getSelectedRow();
        objBill aBill = new objBill();

        aBill.billName = (String) tbl_Bills.getValueAt(nSelectedRow, 0);
        aBill.billUri = (String) tbl_Bills.getValueAt(nSelectedRow, 1);
        aBill.billOntology = (String) tbl_Bills.getValueAt(nSelectedRow, 2);

        OOComponentHelper ooDoc = getContainerPanel().getOoDocument();

        XTextSection xCurrentSection = ooDoc.currentSection();
        HashMap<String, String> sectionMeta = ooDoc.getSectionMetadataAttributes(xCurrentSection);
        String sMetaValue = aBill.billName + ";" + aBill.billUri + ";" + aBill.billOntology;
        //String sMetaReference = BUNGENI_COMMITTEE_META + CommonStringFunctions.convertUriForAttrUsage(aCommittee.committeeUri.trim());
        //check if section meta exists
        if (sectionMeta.containsValue(sMetaValue)) {
            //we just add the references
            //get key for value
            String foundKey = "";
            Set<String> billKeys = sectionMeta.keySet();
            for (String sCommittee : billKeys) {
                String commValue = sectionMeta.get(sCommittee);
                if (commValue.trim().equals(sMetaValue)) {
                    foundKey = sCommittee;
                    break;
                }
            }
            String refString = generateReferenceToCommittee(ooDoc, foundKey);
            addBillReference(ooDoc, refString);
        } else {
            //we append to section meta
            //the key is : bungenicommittee-comitte/uri , value = committee name;
            int i = 1;
            while (sectionMeta.containsKey(BUNGENI_BILL_META + i)) {
                i++;
            }
            sectionMeta.put(BUNGENI_BILL_META + i, sMetaValue);
            ooDoc.setSectionMetadataAttributes(xCurrentSection, sectionMeta);
            //now we add the reference
            String refString = generateReferenceToCommittee(ooDoc, BUNGENI_BILL_META + i);
            addBillReference(ooDoc, refString);

        }

    }

    private String generateReferenceToCommittee(OOComponentHelper ooDoc, String billMetaRef) {
        //name of refernce mark
        String sRefMark = BUNGENI_BILL_REF_PREFIX + BUNGENI_BILL_REF_SEPARATOR + CommonStringFunctions.makeReferenceFriendlyString(billMetaRef, ".");
        int i = 1;
        String newRefNo = sRefMark + ";#" + i;
        while (ooDoc.referenceExists(newRefNo)) {
            newRefNo = sRefMark + ";#" + (++i);
        }
        return newRefNo;
    }

    private void addBillReference(OOComponentHelper ooDoc, String referenceString) {
        XTextViewCursor selCursor = ooDoc.getViewCursor();
        ooDoc.insertReferenceMark(selCursor, referenceString);
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
        //  BungeniClientDB dbnew = new BungeniClientDB();
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
}
