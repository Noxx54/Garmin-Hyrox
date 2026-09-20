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

    isPaused = !isPaused;

    if (isPaused) {
        trainingView.workouttimer.stop();
    } else {
        trainingView.startWorkoutTimer();
    }

    return true;
}
    //fin fonction bouiton haut 

    if (trainingView.currentStation < trainingView.workoutStations.size() - 1) {
    trainingView.currentStation++;
    trainingView.stationSeconds = 0;
    trainingView.lapModeField.setData(2);
    trainingView.activitySession.addLap();
    Attention.vibrate([
    new Attention.VibeProfile(100, 300)
]);
}
else {
    Attention.vibrate([
    new Attention.VibeProfile(100, 300)
]);
    trainingView.activitySession.addLap();
    trainingView.workouttimer.stop();
    trainingView.activitySession.stop();
    trainingView.activitySession.save();
    var finishView = new Garmin_HyroxFinishView();

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