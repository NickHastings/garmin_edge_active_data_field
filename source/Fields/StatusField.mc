class StatusField {
  function draw(dc, elapsedTime) {
    dc.setColor(Colors.get([0x000000, 0xffffff]), -1);

    var clockTime = System.getClockTime();
    var clockAmOrPm = clockTime.hour < 12 ? "am" : "pm";
    var clockHour = clockTime.hour % 12 == 0 ? 12 : clockTime.hour % 12;

    elapsedTime = elapsedTime / 1000;
    var hours = (elapsedTime / 3600);
    var minutes = (elapsedTime - (hours * 3600)) / 60;
    var seconds = (elapsedTime - (hours * 3600) - (minutes * 60));

    dc.drawText(
      (dc.getWidth() * 0.02),
      (dc.getWidth() * 0.02),
      2,
      clockHour.format("%2d") + ":" + clockTime.min.format("%02d") + clockAmOrPm + " / " + System.getSystemStats().battery.format("%2d") + "%",
      2
    );

    dc.drawText(
      dc.getWidth() * 0.94,
      (dc.getWidth() * 0.02),
      2,
      hours.format("%2d") + ":" + minutes.format("%02d") + ":" + seconds.format("%02d"),
      0
    );
  }
}
