class Student {
  
  final String name;
  final int age;

  Student({required this.name, required this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return 
      Student(  name: json['name'], 
                age: json['age']
              );
  }

  // Override toString to have a beautiful log of student object
  @override
  String toString() {
    return 'Student: {name = $name, age = $age}';
  }
}
