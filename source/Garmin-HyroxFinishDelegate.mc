import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxFinishDelegate extends WatchUi.BehaviorDelegate {

    function initialize(view) {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        System.exit();
        
    }
}