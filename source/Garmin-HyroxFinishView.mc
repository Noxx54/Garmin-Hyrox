import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Lang;
import Toybox.ActivityRecording;
import Toybox.Activity;
import Toybox.System;

class Garmin_HyroxFinishView extends WatchUi.View {



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
            height / 2,
            Graphics.FONT_MEDIUM,
            "TRAINING",
            Graphics.TEXT_JUSTIFY_CENTER
        );
        dc.drawText(
            width / 2,
            height / 3,
            Graphics.FONT_MEDIUM,
            "DONE ",              
            Graphics.TEXT_JUSTIFY_CENTER
        );
        
        
    }
}