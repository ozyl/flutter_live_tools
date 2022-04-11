class ChargingDevice {
  int id;
  String? alias;

  ChargingDevice(this.id, [this.alias]);

  @override
  String toString() {
    return '别名: $alias  编号：$id';
  }
}
