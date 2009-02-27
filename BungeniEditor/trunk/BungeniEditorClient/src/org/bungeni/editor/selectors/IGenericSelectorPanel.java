/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.bungeni.editor.selectors;

import java.awt.Component;
import java.awt.Window;
import javax.swing.JFrame;
import org.bungeni.editor.actions.toolbarAction;
import org.bungeni.editor.actions.toolbarSubAction;
import org.bungeni.ooo.OOComponentHelper;

/**
 *
 * @author undesa
 */
public interface IGenericSelectorPanel {
   public void initVariables(OOComponentHelper ooDoc, JFrame parentFrm, toolbarAction aAction, toolbarSubAction aSubAction, SelectorDialogModes dlgMode) ;
   /**
    * initialize() is always invoked after initVariables();
    */
   public void initialize();
   public void setContainerFrame (Window frame);
   public Component getPanelComponent();
  
}
