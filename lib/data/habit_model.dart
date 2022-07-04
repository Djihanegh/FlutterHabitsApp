class HabitModel {
  final String title;
  final String image;
  bool isSelected;

  HabitModel(this.title, this.image, this.isSelected);

  HabitModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['image'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() =>
      {'title': title, 'image': image, 'isSelected': isSelected};

  void selectHabit(bool value) {
    isSelected = value;
  }

  get getImage => image;
  get getTitle => title;
  get getSelectedValue => isSelected;
}
