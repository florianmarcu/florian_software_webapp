class Project{
  String name;
  String description;

  Project({required this.name, required this.description});

  static Project fromData(Map<String, dynamic> data){
    return Project(
      name: data['name'] ?? null,
      description: data['description'] ?? null
    );
  }
  
}