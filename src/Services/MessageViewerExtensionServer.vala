[DBus (name = "io.elementary.envoyer.MessageViewerExtension")]
public class Envoyer.Services.MessageViewerExtensionServer : GLib.Object, Envoyer.Services.IMessageViewerExtension {
    private WebKit.WebPage page;
    private uint web_view_id;

    [DBus (visible = false)]
    public MessageViewerExtensionServer (uint web_view_id) {
        this.web_view_id = web_view_id;
        
        GLib.Bus.own_name(
            GLib.BusType.SESSION,
            "io.elementary.envoyer.MessageViewerExtension.id%u".printf(web_view_id),
            GLib.BusNameOwnerFlags.NONE,
            on_bus_aquired,
            null,
            on_unable_acquire_name
        );
    }

    [DBus (visible = false)]
    public void on_bus_aquired(DBusConnection connection) {
        try {
            connection.register_object("/io/elementary/envoyer/MesssageViewerExtension", this);
        } catch (IOError error) {
            warning("Could not register service: %s", error.message);
        }
    }
    
    [DBus (visible = false)]
    public void on_unable_acquire_name(DBusConnection connection) {
        warning("Could not aquire name");
    }
    
    [DBus (visible = false)]
    public void on_page_created(WebKit.WebExtension extension, WebKit.WebPage page) {
        this.page = page;
    }

    public uint get_height () {
        return (uint) page.get_dom_document ().body.scroll_height;
    }
}