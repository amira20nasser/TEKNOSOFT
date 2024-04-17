String bmiRange(String cat) {
  if (cat == "underweight") {
    return "0 - 18.4";
  } else if (cat == "normal") {
    return "18.5 - 24.9";
  } else if (cat == "overweight") {
    return "25 - 29.9";
  } else
  //(cat == "obese")
  {
    return "30 - 34.9";
  }
}
