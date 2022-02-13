DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS clist;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE clist (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  owner_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES user (id)
);

CREATE TABLE clist_citem (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  clist_id INTEGER NOT NULL,
  citem_id INTEGER NOT NULL,
  FOREIGN KEY (clist_id) REFERENCES clist (id),
  FOREIGN KEY (citem_id) REFERENCES citem (id)
);

CREATE TABLE citem (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL
);