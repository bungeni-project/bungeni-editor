/*
 * Copyright (C) 2012 UN/DESA Africa i-Parliaments Action Plan
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
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
package org.bungeni.editor.input;

/**
 *
 * @author Ashok Hariharan
 */
public class InputDocumentReceiverFactory {

    private static org.apache.log4j.Logger log =
        org.apache.log4j.Logger.getLogger(InputDocumentReceiverFactory.class.getName());

    
    public static IInputDocumentReceiver newInstance(String className) {
        IInputDocumentReceiver ireceiver = null;
        try {
            ireceiver = (IInputDocumentReceiver) Class.forName(className).newInstance();
        } catch (ClassNotFoundException ex) {
            log.error("Unable to create instance IInputDocumentReceiver " , ex);
        } catch (InstantiationException ex) {
            log.error("Unable to create instance IInputDocumentReceiver " , ex);
        } catch (IllegalAccessException ex) {
            log.error("Unable to create instance IInputDocumentReceiver " , ex);
        }
        return ireceiver;
    }
}
