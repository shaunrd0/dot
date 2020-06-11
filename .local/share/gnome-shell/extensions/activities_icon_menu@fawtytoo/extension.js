const Main = imports.ui.main;
const Lang = imports.lang;
const PanelMenu = imports.ui.panelMenu;
const St = imports.gi.St;
const Clutter = imports.gi.Clutter;
const PopupMenu = imports.ui.popupMenu;

let activities;
let button;

const ActivitiesIconMenu = new Lang.Class({
    Name: 'ActivitiesIconMenu',
    Extends: PanelMenu.Button,

    _init(labelText)
    {
        this.parent(1, 'ActivitiesIconMenu', false);

        let box = new St.BoxLayout();

        let label = new St.Label({text: labelText, y_expand: true, y_align: Clutter.ActorAlign.CENTER});

        box.add(label);
        box.add(PopupMenu.arrowIcon(St.Side.BOTTOM));

        this.actor.add_child(box);

        this.buttonMenu = new PopupMenu.PopupBaseMenuItem({reactive: false});

        this.buttonBox = new St.BoxLayout({style_class: 'activitiesiconmenu-box'});

        this.appButton = this.createButton('view-app-grid-symbolic', "applications");
        this.appButton.connect('clicked', Lang.bind(this, this._showApplications));
        this.buttonBox.add_actor(this.appButton);

        this.overButton = this.createButton('focus-windows-symbolic', "workspaces");
        this.overButton.connect('clicked', Lang.bind(this, this._showWorkspaces));
        this.buttonBox.add_actor(this.overButton);

        this.buttonMenu.actor.add_actor(this.buttonBox);
        this.menu.addMenuItem(this.buttonMenu);
    },

    destroy()
    {
        this.parent();
    },

    createButton(iconName, accessibleName)
    {
        let button = new St.Button({ reactive: true,
                                     can_focus: true,
                                     track_hover: true,
                                     accessible_name: accessibleName,
                                     style_class: 'button activitiesiconmenu-button' });

        button.child = new St.Icon({ icon_name: iconName });

        return button;
    },

    _changePage(appsButtonChecked)
    {
        // selecting the same view again will hide the overview
        if (Main.overview.visible && appsButtonChecked == Main.overview.viewSelector._showAppsButton.checked)
        {
            Main.overview.hide();
            return;
        }

        Main.overview.viewSelector._showAppsButton.checked = appsButtonChecked;

        if (!Main.overview.visible)
            Main.overview.show();
        else
            Main.overview.viewSelector._showAppsButtonToggled();
    },

    _showApplications()
    {
        this.menu.close();
        this._changePage(true);
    },

    _showWorkspaces()
    {
        this.menu.close();
        this._changePage(false);
    }
});

function init()
{
    activities = Main.panel.statusArea['activities'];
}

function enable()
{
    button = new ActivitiesIconMenu(activities._label.get_text());

    activities.container.hide();
    Main.panel.addToStatusArea('activitiesiconmenu', button, 0, 'left');
}

function disable()
{
    button.destroy();
    activities.container.show();
}
