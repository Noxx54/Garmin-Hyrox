import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Garmin_HyroxStartDelegate extends WatchUi.BehaviorDelegate {
    var hyroxMenu = new Garmin_HyroxMenuView();

    function initialize() {
        BehaviorDelegate.initialize();
    }
    //Fonction de click sur le boutons qui envcoie au prochain ecran 
    function onKey(keyEvent as KeyEvent) as Boolean {



WatchUi.pushView(
    hyroxMenu,
    new Garmin_HyroxMenuDelegate(hyroxMenu),
    WatchUi.SLIDE_UP
);

    return true;
}
//Fin de fonction

function onTap(clickEvent as ClickEvent) as Boolean {
WatchUi.pushView(
    hyroxMenu,
    new Garmin_HyroxMenuDelegate(hyroxMenu),
    WatchUi.SLIDE_UP
);

    return true;
}


}