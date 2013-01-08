/*
 * Copyright (C) 2012 bzuadmin
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package org.bungeni.editor.metadata;

import java.util.List;
import java.util.Locale;

/**
 *
 * @author bzuadmin
 */
public class JudgementFamily {

    private String CJ_Family_Id;
    private String CJ_Family_Name;
    private String CJ_Family_Name_E;
     

    public JudgementFamily() {
        CJ_Family_Id = CJ_Family_Name = CJ_Family_Name_E = "";
    }

    public JudgementFamily(String jfID, String jfName, String jfName_E) {
        CJ_Family_Id = jfID;
        CJ_Family_Name = jfName;
        CJ_Family_Name_E = jfName_E;
    }

    @Override
    public String toString() {
            if (Locale.getDefault().getLanguage().equalsIgnoreCase("ar")) {
                 return getJudgementFamilyName();
            }
            if (Locale.getDefault().getLanguage().equalsIgnoreCase("en")) {
                 return getJudgementFamilyName_E();
            }
       return getJudgementFamilyName_E();
    }
    
    public String getJudgementFamilyID() {
        return CJ_Family_Id;
    }
   
    public String getJudgementFamilyName() {
        return CJ_Family_Name;
    }
    
    public String getJudgementFamilyName_E() {
        return CJ_Family_Name_E;
    }
      
}
