class medicineTask {
// Definition of variables
  int? id; // the id in data base whene creaete each new madicine
  String? medicineName;
  String? price;
  int? isCompleted; // if it is finished
  int? amountOfMedication;
  int? packagesNumber;
  int? medicationDose;
  String? startDate;
  String? time;
  String? condition;
  int? color;
  int? remind;
  String? repeat;

  medicineTask({
    this.id,
    this.medicineName,
    this.price,
    this.isCompleted,
    this.amountOfMedication,
    this.packagesNumber,
    this.medicationDose,
    this.startDate,
    this.time,
    this.condition,
    this.color,
    this.remind,
    this.repeat,
  });

  //When calling data from the database
  medicineTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicineName = json['medicineName'];
    price = json['price'];
    isCompleted = json['isCompleted'];
    amountOfMedication = json['amountOfMedication'];
    packagesNumber = json['packagesNumber'];
    medicationDose = json['medicationDose'];
    startDate = json['startDate'];
    time = json['time'];
    condition = json['condition'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  //To convert data to Json Format like -> "Key" : "Value"
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicineName'] = this.medicineName;
    data['price'] = this.price;
    data['isCompleted'] = this.isCompleted;
    data['amountOfMedication'] = this.amountOfMedication;
    data['packagesNumber'] = this.packagesNumber;
    data['medicationDose'] = this.medicationDose;
    data['startDate'] = this.startDate;
    data['time'] = this.time;
    data['condition'] = this.condition;
    data['color'] = this.color;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    return data;
  }
}
//  medicineName: _titleController.text,
//         price: _priceController.text,
//         isCompleted: 0,
//         amountOfMedication: _selectedAmountBox,
//         packagesNumber: _selectedPackages,
//         medicationDose: _selectedDose,
//         startDate: DateFormat.yMd().format(_selectedDate),
//         time: _startTime,
//         condition: _selectedCondition,
//         color: _selectedColor,
//         remind: _selectedRemind,
//         repeat: _selectedRepeat,