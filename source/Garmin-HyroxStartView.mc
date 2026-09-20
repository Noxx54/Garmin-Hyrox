import Toybox.Graphics;
import Toybox.WatchUi;

class Garmin_HyroxStartView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc as Dc) as Void {

        View.onUpdate(dc);

        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(
            Graphics.COLOR_BLACK,
            Graphics.COLOR_BLACK
        );

        dc.clear();

        dc.setColor(
            Graphics.COLOR_WHITE,
            Graphics.COLOR_TRANSPARENT
        );

        dc.drawText(
            width / 2,
            height / 3,
            Graphics.FONT_LARGE,
            "HYROX",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        dc.drawText(
            width / 2,
            height / 2,
            Graphics.FONT_MEDIUM,
            "START" ,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}