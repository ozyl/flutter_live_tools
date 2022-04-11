/// socket : [{"channel":"00","status":1,"dev_id":61039962},{"channel":"01","status":1,"dev_id":61039962},{"channel":"02","status":0,"dev_id":61039962},{"channel":"03","status":0,"dev_id":61039962},{"channel":"04","status":1,"dev_id":61039962},{"channel":"05","status":1,"dev_id":61039962},{"channel":"06","status":0,"dev_id":61039962},{"channel":"07","status":0,"dev_id":61039962},{"channel":"08","status":1,"dev_id":61039962},{"channel":"09","status":0,"dev_id":61039962}]
/// money_list : [{"money":1},{"money":2},{"money":3}]
/// times_list : []
/// pay_list : [{"payType":3}]
/// vp_des : ""
/// vp_des2 : ""
/// type : 0

class DeviceStatus {
  DeviceStatus({
      List<Socket>? socket, 
      List<MoneyList>? moneyList, 
      List<dynamic>? timesList, 
      List<PayList>? payList, 
      String? vpDes, 
      String? vpDes2, 
      int? type,}){
    _socket = socket;
    _moneyList = moneyList;
    _timesList = timesList;
    _payList = payList;
    _vpDes = vpDes;
    _vpDes2 = vpDes2;
    _type = type;
}

  DeviceStatus.fromJson(dynamic json) {
    if (json['socket'] != null) {
      _socket = [];
      json['socket'].forEach((v) {
        _socket?.add(Socket.fromJson(v));
      });
    }
    if (json['money_list'] != null) {
      _moneyList = [];
      json['money_list'].forEach((v) {
        _moneyList?.add(MoneyList.fromJson(v));
      });
    }
    if (json['times_list'] != null) {
      _timesList = [];
      json['times_list'].forEach((v) {
        _timesList?.add(v);
      });
    }
    if (json['pay_list'] != null) {
      _payList = [];
      json['pay_list'].forEach((v) {
        _payList?.add(PayList.fromJson(v));
      });
    }
    _vpDes = json['vp_des'];
    _vpDes2 = json['vp_des2'];
    _type = json['type'];
  }
  List<Socket>? _socket;
  List<MoneyList>? _moneyList;
  List<dynamic>? _timesList;
  List<PayList>? _payList;
  String? _vpDes;
  String? _vpDes2;
  int? _type;
DeviceStatus copyWith({  List<Socket>? socket,
  List<MoneyList>? moneyList,
  List<dynamic>? timesList,
  List<PayList>? payList,
  String? vpDes,
  String? vpDes2,
  int? type,
}) => DeviceStatus(  socket: socket ?? _socket,
  moneyList: moneyList ?? _moneyList,
  timesList: timesList ?? _timesList,
  payList: payList ?? _payList,
  vpDes: vpDes ?? _vpDes,
  vpDes2: vpDes2 ?? _vpDes2,
  type: type ?? _type,
);
  List<Socket>? get socket => _socket;
  List<MoneyList>? get moneyList => _moneyList;
  List<dynamic>? get timesList => _timesList;
  List<PayList>? get payList => _payList;
  String? get vpDes => _vpDes;
  String? get vpDes2 => _vpDes2;
  int? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_socket != null) {
      map['socket'] = _socket?.map((v) => v.toJson()).toList();
    }
    if (_moneyList != null) {
      map['money_list'] = _moneyList?.map((v) => v.toJson()).toList();
    }
    if (_timesList != null) {
      map['times_list'] = _timesList?.map((v) => v.toJson()).toList();
    }
    if (_payList != null) {
      map['pay_list'] = _payList?.map((v) => v.toJson()).toList();
    }
    map['vp_des'] = _vpDes;
    map['vp_des2'] = _vpDes2;
    map['type'] = _type;
    return map;
  }

}

/// payType : 3

class PayList {
  PayList({
      int? payType,}){
    _payType = payType;
}

  PayList.fromJson(dynamic json) {
    _payType = json['payType'];
  }
  int? _payType;
PayList copyWith({  int? payType,
}) => PayList(  payType: payType ?? _payType,
);
  int? get payType => _payType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payType'] = _payType;
    return map;
  }

}

/// money : 1

class MoneyList {
  MoneyList({
      int? money,}){
    _money = money;
}

  MoneyList.fromJson(dynamic json) {
    _money = json['money'];
  }
  int? _money;
MoneyList copyWith({  int? money,
}) => MoneyList(  money: money ?? _money,
);
  int? get money => _money;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['money'] = _money;
    return map;
  }

}

/// channel : "00"
/// status : 1
/// dev_id : 61039962

class Socket {
  Socket({
      String? channel, 
      int? status, 
      int? devId,}){
    _channel = channel;
    _status = status;
    _devId = devId;
}

  Socket.fromJson(dynamic json) {
    _channel = json['channel'];
    _status = json['status'];
    _devId = json['dev_id'];
  }
  String? _channel;
  int? _status;
  int? _devId;
Socket copyWith({  String? channel,
  int? status,
  int? devId,
}) => Socket(  channel: channel ?? _channel,
  status: status ?? _status,
  devId: devId ?? _devId,
);
  String? get channel => _channel;
  int? get status => _status;
  int? get devId => _devId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channel'] = _channel;
    map['status'] = _status;
    map['dev_id'] = _devId;
    return map;
  }

}