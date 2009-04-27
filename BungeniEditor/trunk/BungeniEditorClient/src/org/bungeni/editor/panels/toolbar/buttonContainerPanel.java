/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.bungeni.editor.panels.toolbar;

import java.awt.GridLayout;
import org.jdesktop.swingx.JXPanel;

/**
 * This class acts as the container for the buttonPanel() objects.
 * We use a JXPanel instead of a JPanel becuase JXPanel supports the scrollable interface.
 * This buttonContainer() panel is set as the viewPort() for a JSCrollPane which is then
 * added as a tab for a JTabContainer object
 *
 * JTabContainer --> (scrollPanel(JScrollPane)) --> buttonContainerPanel(JXpanel) --> (buttonPanel(JButton))s
 *
 * We use a gridlayout with 1 column as we want to stack the buttons vertically.
 * @author Ashok Hariharan
 */
public class buttonContainerPanel  extends JXPanel {
   GridLayout gLayout = null;
   
    public buttonContainerPanel(){
       gLayout = new GridLayout();
       gLayout.setColumns(1);
       gLayout.setRows(1);
       setLayout(gLayout);
   }

   public void setLayoutRows(int nRows) {
        gLayout.setRows(nRows);
   }
}
