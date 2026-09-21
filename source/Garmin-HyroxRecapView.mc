import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class Garmin_HyroxRecapView extends WatchUi.View {

    var scrollOffset = 0;
    var totalSeconds;
    var stationTimes as Array<Number> = [];
var workoutStations as Array<String> = [];


    function initialize() {
        View.initialize();
    }

//Fonction qui récupere le temps total 
    function getTotalTime() as Lang.String {
    var minutes = totalSeconds / 60;
    var seconds = totalSeconds % 60;

    if (seconds < 10) {
        return minutes + ":0" + seconds;
    }

    return minutes + ":" + seconds;
}
    //Fonction qui récupère le temps passés sur les stations 
    function getStationTime(secondsTotal as Number) as Lang.String {
    var minutes = secondsTotal / 60;
    var seconds = secondsTotal % 60;

    if (seconds < 10) {
        return minutes + ":0" + seconds;
    }

    return minutes + ":" + seconds;
}
//Fin fonction
    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);

        var width = dc.getWidth();
    

        dc.setColor(
            Graphics.COLOR_BLACK,
            Graphics.COLOR_BLACK
        );
        dc.clear();

        dc.setColor(
            Graphics.COLOR_WHITE,
            Graphics.COLOR_TRANSPARENT
        );

        
        for (var i = 0; i < stationTimes.size(); i++) {

    var y = 180 + (i * 30) - (scrollOffset * 30);
       
        
        dc.drawText(
        20,
        y - 40,
        Graphics.FONT_TINY,
        workoutStations[i],
        Graphics.TEXT_JUSTIFY_LEFT
    );

    dc.drawText(
        width - 20,
        y,
        Graphics.FONT_TINY,
        getStationTime(stationTimes[i]),
        Graphics.TEXT_JUSTIFY_RIGHT
    );
}
}
    }
