//calculate date difference(years)
dateDiff(DateTime dateFormat) {
    if (dateFormat.day.compareTo(DateTime.now().day) == -1 &&
        dateFormat.month.compareTo(DateTime.now().month) == -1 &&
        dateFormat.year.compareTo(DateTime.now().year) == 0) {
      return true;
    } else {
      return false;
    }
  }
