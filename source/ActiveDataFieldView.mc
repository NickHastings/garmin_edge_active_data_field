using Toybox.WatchUi as Ui;
using Toybox.Graphics;
using Toybox.Lang;

class ActiveDataFieldView extends Ui.DataField
{
  hidden var batteryPercentage;
  hidden var clockTime;
  hidden var elapsedTime;
  hidden var calculator = new Calculator();

  function initialize() {
    DataField.initialize();
  }

  function compute(info) {
    batteryPercentage = System.getSystemStats().battery;
    clockTime = System.getClockTime();
    elapsedTime = info.elapsedTime;
    calculator.logInfo(info);
    calculator.updateMode();
  }

  function onUpdate(dc) {
    Colors.backgroundColor = getBackgroundColor();
    var fieldsSelector = new FieldSelector(calculator);

    new ElapsedTimeField().draw(dc, elapsedTime);
    new CurrentTimeAndBatteryField().draw(dc, clockTime, batteryPercentage);
    new SecondaryFields().draw(dc, fieldsSelector.secondaryFields());

    var mainField = fieldsSelector.mainField();

    new ArcField().draw(dc, mainField);
    new MainField().draw(dc, mainField);
  }
}
