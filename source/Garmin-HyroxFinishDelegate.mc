import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxFinishDelegate extends WatchUi.BehaviorDelegate {

    function initialize(view) {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {

        if (keyEvent.getKey() == WatchUi.KEY_ENTER) {

            var recapView = new Garmin_HyroxRecapView();

            WatchUi.pushView(
                recapView,
                new Garmin_HyroxRecapDelegate(recapView),
                WatchUi.SLIDE_UP
            );

            return true;
        }

        if (keyEvent.getKey() == WatchUi.KEY_ESC) {

            System.exit();

        }

        return false;
    }
}