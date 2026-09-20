import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxStartDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {

    var hyroxMenu = new Garmin_HyroxMenuView();


WatchUi.pushView(
    hyroxMenu,
    new Garmin_HyroxMenuDelegate(hyroxMenu),
    WatchUi.SLIDE_UP
);

    return true;
}
}