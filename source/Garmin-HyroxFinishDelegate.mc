import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxFinishDelegate extends WatchUi.BehaviorDelegate {
            var finishView;

    function initialize(view) {
        BehaviorDelegate.initialize();
        finishView = view;
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        // Clique sur le bouton du haut renvoie sur la page récap
        if (keyEvent.getKey() == WatchUi.KEY_ENTER) {

            var recapView = new Garmin_HyroxRecapView();

            recapView.totalSeconds = finishView.totalSeconds;
            recapView.stationTimes = finishView.stationTimes;
            recapView.workoutStations = finishView.workoutStations;

            WatchUi.pushView(
                recapView,
                new Garmin_HyroxRecapDelegate(recapView),
                WatchUi.SLIDE_UP
            );

            return true;
        }
        //Clique sur le bouton du bas quitte l'appli
        if (keyEvent.getKey() == WatchUi.KEY_ESC) {

            System.exit();

        }

        return false;
    }
    
}