module Dumbo.SidebarTreeStore;

import gtk.TreeStore;
import gtk.TreeIter;
import gtkc.gobjecttypes;

import Dumbo.DumboController;
import Dumbo.DumboViewType;


class SidebarTreeStore : TreeStore {

    DumboController controller;
    TreeIter tablesIter;
    TreeIter viewsIter;
    TreeIter triggersIter;

    this(DumboController mController)
    {
        super([GType.STRING]);

        this.controller = mController;

        // Tables
        tablesIter = createIter();
        setValue(tablesIter, 0, "Tables");

        TreeIter treeNoneIter;
        insert(treeNoneIter, tablesIter, 0); 
        setValue(treeNoneIter, 0, "None");
        

        // Views
        viewsIter = createIter();
        setValue(viewsIter, 0, "Views");

        TreeIter viewsNoneIter;
        insert(viewsNoneIter, viewsIter, 0); 
        setValue(viewsNoneIter, 0, "None");


        // Triggers
        triggersIter = createIter();
        setValue(triggersIter, 0, "Triggers");

        TreeIter triggersNoneIter;
        insert(triggersNoneIter, triggersIter, 0); 
        setValue(triggersNoneIter, 0, "None");

    }

    public void refreshFromDatabase() {
        string[] tableNames = this.controller.getDatabaseBackend().getTableNames();

        int i = 0;
        foreach (tableName; tableNames) {
            TreeIter tableNameIter;
            insert(tableNameIter, tablesIter, -1); 
            setValue(tableNameIter, 0, tableName);
            i++;
        }
    }
}

