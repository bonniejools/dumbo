module Dumbo.SidebarTreeView;

private import gtk.TreeView;
private import gtk.TreeViewColumn;
private import gtk.ListStore;
private import gtk.CellRendererText;
private import gtk.ListStore;

class SidebarTreeView : TreeView
{
    
    this(ListStore store)
    {        
        size_t i = 0;
        foreach (columnName; [""]) {
            TreeViewColumn newColumn = new TreeViewColumn(
                    columnName, new CellRendererText(), "text", 0);
            appendColumn(newColumn);

            i++;
        }

        this.setHeadersVisible(false);

        setModel(store);
    }
}