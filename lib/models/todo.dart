class ToDo {
  String _title;
  String _description;
  bool _isDone;

  ToDo(this._title, this._description, this._isDone);

  get title => this._title;

  set title(String title) => this._title = title;

  get description => this._description;

  set description(String description) => this._description = description;

  get isDone => this._isDone;

  set isDone(bool isDone) => this._isDone = isDone;
}
