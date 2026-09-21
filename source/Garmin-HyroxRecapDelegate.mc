import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxRecapDelegate extends WatchUi.BehaviorDelegate {

    var recapView;

    function initialize(view) {
        BehaviorDelegate.initialize();
        recapView = view;
    }
    //on quitte l'appli a la moindre pression de bouton
    function onKey(keyEvent as KeyEvent) as Boolean {
        System.exit();
        
    }
    function onSwipe(event as SwipeEvent) as Boolean {

    var direction = event.getDirection();

    if (direction == WatchUi.SWIPE_UP) {

    var maxScroll = recapView.stationTimes.size() - 5;

    if (recapView.scrollOffset < maxScroll) {
        recapView.scrollOffset += 1;
        WatchUi.requestUpdate();
    }

    return true;
}

    if (direction == WatchUi.SWIPE_DOWN) {

    if (recapView.scrollOffset > 0) {
        recapView.scrollOffset -= 1;
        WatchUi.requestUpdate();
    }

    return true;
}

    return false;
}
}