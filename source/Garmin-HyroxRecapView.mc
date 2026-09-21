import Toybox.Graphics;
import Toybox.WatchUi;

class Garmin_HyroxRecapView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

//fonction layout qui mets le fond d'écran
    function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.MainLayout(dc));
}
//Fin fonction

    function onUpdate(dc as Dc) as Void {

        var width = dc.getWidth();
        var height = dc.getHeight();

        
        dc.clear();         //Nettoyage de l'écran
        View.onUpdate(dc);  
        var bitmap = WatchUi.loadResource(Rez.Drawables.fondfin); //Chargement du fond d'écran
        dc.drawBitmap(0, 0, bitmap);            //Affichage du fond d'écran

        dc.drawText(
        width / 2,
        height / 5 - 15,
        Graphics.FONT_MEDIUM,
        " FINITOOOOOOO" ,
        Graphics.TEXT_JUSTIFY_CENTER
    );

    
        
    }
}