class Template {
  static final List templates = [
  Template(1, 'Stranger in a Strange Land', 'Robert A. Heinlein'),
  Template(2, 'Foundation', 'Isaac Asimov'),
  Template(3, 'Fahrenheit 451', 'Ray Bradbury'),
];
  const Template(this.id, this.title, this.author);

  final int id;
  final String title;
  final String author;
}