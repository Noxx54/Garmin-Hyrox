import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Lang;
import Toybox.ActivityRecording;
import Toybox.Activity;
//variable

var stations as Array<String> = [
    "Running 1 : 1km",
    "Ski Erg",
    "Running 2 : 1km",
    "Sled Push",
    "Running 3 : 1km",
    "Sled Pull",
    "Running 4 : 1km",
    "Burpees",
    "Running 5 : 1km",
    "Rowing",
    "Running 6 : 1km",
    "Farmer's Carry",
    "Running 7 : 1km",
    "Sandbag Lunges",
    "Running 8 : 1km",
    "Wall Balls"
];
var isReady = false;

class Garmin_HyroxMenuView extends WatchUi.View {

var screenHeight = 0;

var stationEnabled as Array<Boolean> = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
];

  var selectedStation = 0;
    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        screenHeight = dc.getHeight();
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Dc) as Void {

        View.onUpdate(dc);

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;

        // Fond noir
        dc.setColor(
            Graphics.COLOR_BLACK,
            Graphics.COLOR_BLACK
        );

        dc.clear();

        // --------------------------------------------------------
        // TITRE
        // --------------------------------------------------------

        dc.setColor(
            Graphics.COLOR_WHITE,
            Graphics.COLOR_TRANSPARENT
        );

var symbole = "0";
if (stationEnabled[selectedStation]) {
        symbole = "1";
    }

    dc.drawText(
        centerX,
        height / 5 - 15,
        Graphics.FONT_TINY,
        symbole + " " + stations[selectedStation],
        Graphics.TEXT_JUSTIFY_CENTER
    );

    // Station 2
    var symbole2 = "0";
    if (stationEnabled[selectedStation + 1]) {
        symbole2 = "1";
    }

    dc.drawText(
        centerX,
        height * 2 / 5 - 15,
        Graphics.FONT_TINY,
        symbole2 + " " + stations[selectedStation + 1],
        Graphics.TEXT_JUSTIFY_CENTER
    );

    // Station 3
    var symbole3 = "0";
    if (stationEnabled[selectedStation + 2]) {
        symbole3 = "1";
    }

    dc.drawText(
        centerX,
        height * 3 / 5 - 15,
        Graphics.FONT_TINY,
        symbole3 + " " + stations[selectedStation + 2],
        Graphics.TEXT_JUSTIFY_CENTER
    );

    var symbole4 = "0";
    if (stationEnabled[selectedStation + 3]) {
        symbole4 = "1";
    }

    dc.drawText(
        centerX,
        height * 4 / 5 - 15,
        Graphics.FONT_TINY,
        symbole4 + " " + stations[selectedStation + 3],
        Graphics.TEXT_JUSTIFY_CENTER
    );
        
    }

    function onHide() as Void {
    }
}