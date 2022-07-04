class DayModel {
  final String day;
  final int id;
  bool isSelected;

  DayModel(this.day, this.id, this.isSelected);

  DayModel.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        id = json['id'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() =>
      {'day': day, 'id': id, 'isSelected': isSelected};

  void selectDay(bool value) {
    isSelected = value;
  }

  get getId => id;
  get getDay => day;
  get getSelectedValue => isSelected;
}
