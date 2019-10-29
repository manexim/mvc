/*
* Copyright (c) 2019 Manexim (https://github.com/manexim)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Marius Meisenzahl <mariusmeisenzahl@gmail.com>
*/

public class Views.PostView : Gtk.ScrolledWindow {
    private Models.Post model;
    private Gtk.Label title_label;
    private Gtk.Label text_label;
    private Gtk.Label likes_label;

    public PostView (Models.Post model) {
        this.model = model;

        var grid = new Gtk.Grid ();
        grid.margin = 24;
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 24;
        add (grid);

        title_label = new Gtk.Label ("");
        title_label.ellipsize = Pango.EllipsizeMode.END;
        title_label.xalign = 0;
        title_label.get_style_context ().add_class ("h2");

        grid.attach (title_label, 0, 0, 1, 1);

        text_label = new Gtk.Label ("");
        text_label.wrap = true;
        text_label.xalign = 0;

        grid.attach (text_label, 0, 1, 1, 1);

        likes_label = new Gtk.Label ("");
        likes_label.get_style_context ().add_class ("h2");
        likes_label.xalign = 0;

        grid.attach (likes_label, 0, 2, 1, 1);

        model.notify.connect (update);

        update ();
    }

    private void update () {
        title_label.label = model.title;
        text_label.label = model.text;
        likes_label.label = "👍 " + model.likes.to_string ();
    }
}
