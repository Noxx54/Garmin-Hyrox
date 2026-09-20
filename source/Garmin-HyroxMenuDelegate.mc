import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxMenuDelegate extends WatchUi.BehaviorDelegate {
    
    var menuView as Garmin_HyroxMenuView;
    var enabledStations;


    function initialize(view) {
        BehaviorDelegate.initialize();
        menuView = view;
    }

    function onTap(clickEvent as ClickEvent) as Boolean {

    var coordinates = clickEvent.getCoordinates();
    var station = menuView.selectedStation ;
    var y = coordinates[1];
    var height = menuView.screenHeight;

    if (y < height / 3) {
    station = menuView.selectedStation;
} else if (y < height * 2 / 3) {
    station = menuView.selectedStation + 1;
} else {
    station = menuView.selectedStation + 2;
}

    if (menuView.stationEnabled[station]) {
        menuView.stationEnabled[station] = false;
    } else {
        menuView.stationEnabled[station] = true;
    }

    WatchUi.requestUpdate();

    return true;
}

    function onNextPage() as Boolean {

    if (menuView.selectedStation < 13) {
        menuView.selectedStation++;
    }

    WatchUi.requestUpdate();

    return true;
}

function onPreviousPage() as Boolean {

    if (menuView.selectedStation > 0) {
        menuView.selectedStation--;
    }


    WatchUi.requestUpdate();

    return true;
}
function onKey(keyEvent as KeyEvent) as Boolean {

    var trainingView = new Garmin_HyroxTrainingView();
    trainingView.enabledStations = menuView.stationEnabled;
    trainingView.buildWorkoutStations();
    trainingView.startActivity();

    WatchUi.pushView(
        trainingView,
        new Garmin_HyroxTrainingDelegate(trainingView),
        WatchUi.SLIDE_UP
    );

    return true;
}
}