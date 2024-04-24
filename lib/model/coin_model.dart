class Coin { 
  final int coinValue;

  const Coin({
    required this.coinValue
  });

 factory Coin.fromFirestore(Map<String, dynamic> data) {
  return Coin(coinValue: data['iCoins'] ?? 0);
 }
 }