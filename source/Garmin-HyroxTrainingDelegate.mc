import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Attention;

var trainingView;


class Garmin_HyroxTrainingDelegate extends WatchUi.BehaviorDelegate {


    var isPaused = false;

function initialize(view) {
    BehaviorDelegate.initialize();
    trainingView = view;
}

function onKey(keyEvent as KeyEvent) as Boolean {
    
    //Bouton du haut mets en pause le timer et le relance si il est en pause
    if (keyEvent.getKey() == WatchUi.KEY_ENTER) {

    trainingView.workouttimer.stop();

    var pauseView = new Garmin_HyroxPauseView();

    WatchUi.pushView(
        pauseView,
        new Garmin_HyroxPauseDelegate(pauseView),
        WatchUi.SLIDE_UP
    );

    return true;
}
    //fin fonction bouiton haut 

    if (trainingView.currentStation < trainingView.workoutStations.size() - 1) {
    trainingView.currentStation++;
    
    trainingView.lapModeField.setData(2);
    trainingView.stationTimes.add(trainingView.stationSeconds);
    trainingView.activitySession.addLap();
    trainingView.stationSeconds = 0;
    Attention.vibrate([
    new Attention.VibeProfile(100, 300)
]);
}
else {
    Attention.vibrate([
    new Attention.VibeProfile(100, 300)
]);
    trainingView.stationTimes.add(trainingView.stationSeconds);
    trainingView.activitySession.addLap();
    trainingView.workouttimer.stop();
    trainingView.activitySession.stop();
    trainingView.activitySession.save();
    var finishView = new Garmin_HyroxFinishView();
    finishView.totalSeconds = trainingView.totalSeconds;
    finishView.stationTimes = trainingView.stationTimes;
    finishView.workoutStations = trainingView.workoutStations;

    WatchUi.pushView(
        finishView,
        new Garmin_HyroxFinishDelegate(finishView),
        WatchUi.SLIDE_UP
    );
    return true;
}
    //WatchUi.requestUpdate();
    return true;

}
}