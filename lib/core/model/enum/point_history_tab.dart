enum HistoryPointTab {
  all,
  buy,
  use,
  received,
  withdrawed;

  int getIndex() {
    switch(this) {
      case HistoryPointTab.all: {
        return 0;
      }
      case HistoryPointTab.buy: {
        return 1;
      }
      case HistoryPointTab.use: {
        return 2;
      }
      case HistoryPointTab.received: {
        return 1;
      }
      case HistoryPointTab.withdrawed: {
        return 2;
      }
    }
  }

  int? getType() {
    switch(this) {
      case HistoryPointTab.all: {
        return null;
      }
      case HistoryPointTab.buy: {
        return 0;
      }
      case HistoryPointTab.use: {
        return 1;
      }
      case HistoryPointTab.received: {
        return 2;
      }
      case HistoryPointTab.withdrawed: {
        return 3;
      }
    }
  }
}
