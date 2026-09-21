import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Lang;
import Toybox.ActivityRecording;
import Toybox.Activity;
import Toybox.System;
import Toybox.FitContributor;


class Garmin_HyroxTrainingView extends WatchUi.View {

// les variables 

    var activitySession;
    var lapModeField;
    var currentStation = 0;
    var totalSeconds = 0;
    var stationSeconds = 0;
    var nomStation = "";
    var workouttimer;
    var stations as Array<String> = [
    "Running",
    "Ski Erg",
    "Running",
    "Sled Push",
    "Running",
    "Sled Pull",
    "Running",
    "Burpee Broad Jump",
    "Running",
    "Rowing",
    "Running",
    "Farmer's Carry",
    "Running",
    "Sandbag Lunges",
    "Running",
    "Wall Balls"
];


    var enabledStations as Array<Boolean> = [];
    var workoutStations as Array<String> = [];
    var heartRate = 0;
    var stationTimes as Array<Number> = [];
    // fin des variables

    
    // fonction qui initialise la vue et lance le timer
    function initialize() {
        View.initialize();       
        startWorkoutTimer();
        
    }

    // fonction qui démarre le timer
    function startWorkoutTimer() {
        if (workouttimer == null) {
            workouttimer = new Timer.Timer();
        }
       workouttimer.start(method(:onTimer), 1000, true);
    }

    // fonction qui s'execute a chaque tick du timer
    function onTimer() as Void {
    
            totalSeconds++;
            stationSeconds++;
            WatchUi.requestUpdate();
        
    }
    //fonction qui relance le timer apres la pause
    function onShow() as Void {

    if (workouttimer != null) {
        startWorkoutTimer();
    }
}
    //Fin de fontion qui relance le timer


// fonction qui retourne le temps écoulé formatté de la station actuelle
    function getStationTime() as Lang.String {

    var minutes = stationSeconds / 60;
    var seconds = stationSeconds % 60;

    if (seconds < 10) {
        return minutes + ":0" + seconds;
    }

    return minutes + ":" + seconds;
}

// fonction qui retourne le temps total écoulé formatté
  function getTotalTime() as Lang.String {

    var minutes = totalSeconds / 60;
    var seconds = totalSeconds % 60;

    if (seconds < 10) {
        return minutes + ":0" + seconds;
    }

    return minutes + ":" + seconds;
}

    //fonction de creation d'activité et lancement de celle-ci
    function startActivity() as Void {
        activitySession = ActivityRecording.createSession({
        :name => "HYROX",
        :sport => Activity.SPORT_GENERIC
        
    });

    //ajout du type de sport a l'activité exportée sur Garmin Connect
    lapModeField = activitySession.createField(
    "MODE",
    0,
    FitContributor.DATA_TYPE_UINT8,
    {
        :count => 1,
        :mesgType => FitContributor.MESG_TYPE_LAP,
        :units => "",
        :nativeNum => 0
    }
);
    //Fin de l'ajout du type de sport a l'activité exportée sur Garmin Connect

    //Demarrage de l'activité
    activitySession.start();
    }
    //find e la fonction de creatione t lancement d'activité

//Fonction qui séléctione les activité
function buildWorkoutStations() as Void {

    workoutStations = [];

    for (var i = 0; i < stations.size(); i++) {
        if (enabledStations[i]) {
            workoutStations.add(stations[i]);
        }
    }
}
//Fin de la fonction de selection

    function onUpdate(dc as Dc) as Void {

        View.onUpdate(dc);


        nomStation = workoutStations[currentStation];
        //Récuperation de la FC
        
        var info = Activity.getActivityInfo();

        if (info.currentHeartRate != null) {
        heartRate = info.currentHeartRate;

        // Fin de la récupération de la FC
        }
        
        
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
            height / 5 - 15,
            Graphics.FONT_TINY,
            "Temps total : "+ getTotalTime(),
              Graphics.TEXT_JUSTIFY_CENTER
        );
        dc.drawText(
            width / 2,
            height * 2 / 5 - 15,
            Graphics.FONT_TINY,
            "Station: " + (currentStation + 1) +" / " + workoutStations.size() + " " + nomStation,              
            Graphics.TEXT_JUSTIFY_CENTER
        );

        
        dc.drawText(
            width / 2,
            height * 3 / 5 - 15,
            Graphics.FONT_TINY,
            "Temps Station : "+ getStationTime(),
              Graphics.TEXT_JUSTIFY_CENTER
        );
        //Affichage de la fréquence cardiaque
        dc.drawText( 
             width / 2,
            height * 4 / 5 - 15,
            Graphics.FONT_TINY,
            "HR : " + heartRate + " BPM",
            Graphics.TEXT_JUSTIFY_CENTER
);
        //Affichage de la barre de progression 
        var totalStations = workoutStations.size();
        var progressY = height - 35;

for (var i = 0; i < totalStations; i++) {

    var x = width / 2 - ((totalStations - 1) * 10) + (i * 20);

    if (i <= currentStation) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.fillCircle(x, progressY, 4);
    } else {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(x, progressY, 2);
    }
}
        //Fin affichage barre
        
    }
}