class Book {
  int id;
  String name;
  int totalPages;
  int currentPage;
  String coverDir;

  Book({
    this.id,
    this.name,
    this.totalPages,
    this.currentPage,
    this.coverDir,
  });

  factory Book.fromJson(Map<String, dynamic> data) => new Book(
        id: data['id'],
        name: data['name'],
        totalPages: data['total_pages'],
        currentPage: data['current_page'],
        coverDir: data['cover_dir'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "total_pages": totalPages,
        "current_page": currentPage,
        "cover_dir": coverDir,
      };
}
