import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final int? id, age;
  final String? name;

  const Student({this.id, this.age, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, age, name];

  // Convierte ek objeto en un map
  Map<String, dynamic> toMap() {
    return {'id': id, 'age': age, 'name': name};
  }

  // Constructor que puede retornar objetos
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(id: map['id'], age: map['age'], name: map['name']);
  }

  Student copyWith({int? id, int? age, String? name}) {
    return Student(
      id: id ?? this.id,
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Student{id: $id, age: $age, name: $name}';
  }
}
