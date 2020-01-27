class ToDo {
  String _title;
  bool _done;

  ToDo(this._title, this._done);

  get title => this._title;

  set title(String title) => this._title = title;

  get done => this._done;

  set done(bool done) => this._done = done;
}
