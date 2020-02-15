//ID	Symbol	Type	Size	Open rate	Open time	Stop loss	Take profit	Profit	Swap	Contract	Close rate

class ClosedPosition {
  String id;
  String symbol;
  String type;
  String size;
  String openRate;
  String openTime;
  String stopLoss;
  String takeProfit;
  String profit;
  String swap;
  String contract;
  String closeRate;

  ClosedPosition({
    this.id,
    this.symbol,
    this.type,
    this.size,
    this.openRate,
    this.openTime,
    this.stopLoss,
    this.takeProfit,
    this.profit,
    this.swap,
    this.contract,
    this.closeRate,
  });
}
