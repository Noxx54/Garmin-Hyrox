import Toybox.Graphics;
import Toybox.WatchUi;

class Garmin_HyroxStartView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

//fonction layout qui mets le fond d'écran
    function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.MainLayout(dc));
}
//Fin fonction

    function onUpdate(dc as Dc) as Void {

        dc.clear();         //Nettoyage de l'écran
        View.onUpdate(dc);  
        var bitmap = WatchUi.loadResource(Rez.Drawables.fondstart); //Chargement du fond d'écran
        dc.drawBitmap(0, 0, bitmap);            //Affichage du fond d'écran

        

    
        
    }
}