class AgentOfCreator {
  final int commissionRate;
  final String url;

  AgentOfCreator({required this.commissionRate, required this.url});

  factory AgentOfCreator.fromJson(Map<String, dynamic> json) {
    var commissionRate = json['commission_rate'] as int;
    final url = json['url'] ?? "";

    return AgentOfCreator(commissionRate: commissionRate, url: url);
  }

  Map<String, dynamic> toJson() {
    return {
      'commission_rate': commissionRate,
      'url': url,
    };
  }
}
