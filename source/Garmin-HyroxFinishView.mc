import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class Garmin_HyroxFinishView extends WatchUi.View {

var totalSeconds;
var stationTimes;
var workoutStations;


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
//fonction layout qui mets le fond d'écran
    function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.MainLayout(dc));
}


    function onUpdate(dc as Dc) as Void {

        dc.clear();         //Nettoyage de l'écran
        View.onUpdate(dc);  
        var bitmap = WatchUi.loadResource(Rez.Drawables.fondfin); //Chargement du fond d'écran
        dc.drawBitmap(0, 0, bitmap);            //Affichage du fond d'écran

//Fin fonction
//recuperation des tailles ecran 
        var width = dc.getWidth();
        var height = dc.getHeight();
//On ajoute le temps total EN ORANGE
dc.setColor(
    Graphics.COLOR_YELLOW,
    Graphics.COLOR_TRANSPARENT
);

dc.drawText(
    width *2/3,
    height / 1.5,
    Graphics.FONT_MEDIUM,
    "Temps Total : " + getTotalTime(),
    Graphics.TEXT_JUSTIFY_RIGHT
);

    
        
    }
}