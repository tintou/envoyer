/*
 * Copyright 2016 Andrei-Costin Zisu
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */
 
public class Envoyer.Widgets.AccountFoldersParentItem : Envoyer.FutureGranite.SimpleExpandableItem {
    public AccountFoldersParentItem (E.Source identity_source) {
        base (identity_source.get_display_name ());
        
        build_ui ();
    }
    
    public void build_ui () {
        selectable = false;
    }
}
