//ID	Symbol	Type	Size	At the rate	Open time	Stop loss	Take profit	Profit	Swap	Contract	Current rate	Actions

//ID	Symbol	Type	Size	Open rate	Open time	Stop loss	Take profit	Profit	Swap	Contract	Close rate

class PendingOrder {
  String id;
  String symbol;
  String type;
  String size;
  String atTheRate;
  String openTime;
  String stopLoss;
  String takeProfit;
  String profit;
  String swap;
  String contract;
  String currentRate;

  PendingOrder({
    this.id,
    this.symbol,
    this.type,
    this.size,
    this.atTheRate,
    this.openTime,
    this.stopLoss,
    this.takeProfit,
    this.profit,
    this.swap,
    this.contract,
    this.currentRate,
  });
}
