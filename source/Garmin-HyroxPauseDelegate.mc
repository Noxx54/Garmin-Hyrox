import Toybox.WatchUi;
import Toybox.Lang;

class Garmin_HyroxPauseDelegate extends WatchUi.BehaviorDelegate {


    function initialize(view) {

        BehaviorDelegate.initialize();
       
    }
    //Fonction qui retourne à l'entrainement apres la pause uniquement sur le bouton du haut
    function onKey(keyEvent as KeyEvent) as Boolean {

    if (keyEvent.getKey() == WatchUi.KEY_ENTER) {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }

    return true;
}
    //Fin de fonction qui retourne à l'entrainement apres la pause uniquement sur le bouton du haut
    }
