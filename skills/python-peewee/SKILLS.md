---
name: python-peewee
description: Patterns for using Peewee ORM with DatabaseProxy and scoped connections/transactions.
---
## Setup

### DatabaseProxy & BaseModel

```python
from peewee import DatabaseProxy, Model

db_proxy = DatabaseProxy()

class BaseModel(Model):
    class Meta:
        database = db_proxy
```

### Initialize DB

```python
from peewee import SqliteDatabase

db = SqliteDatabase("app.db", pragmas={"foreign_keys": 1})
db_proxy.initialize(db)
```

## Connection & Transaction

### Read (no transaction)

```python
with db_proxy.obj.connection_context():
    rows = MyModel.select().limit(100)
```

### Write (atomic)

```python
with db_proxy.obj.atomic():
    a.save()
    b.save()
```

### Combined

```python
db = db_proxy.obj
with db.connection_context():
    with db.atomic():
        ...
```

## When to Use

* **connection_context()** → scoped connection (open/close)
* **atomic()** → atomic writes (BEGIN/COMMIT/ROLLBACK)

## Testing (SQLite)

```python
import pytest
from peewee import SqliteDatabase

@pytest.fixture
def test_db(tmp_path):
    db = SqliteDatabase(str(tmp_path / "test.db"))
    db_proxy.initialize(db)
    with db.connection_context():
        db.create_tables([MyModel])
    yield db
    db.close()
```
