# DDL

DDL module for Tarantool 1.10+

## Contents

- [API](#api)
  - [Set spaces format](#set-spaces-format)
  - [Check compatibility](#check-compatibility)
  - [Get spaces format](#get-spaces-format)
- [Input data format](#input-data-format)
- [Building and testing](#building-and-testing)

## API

 - ### Set spaces format
    `ddl.set_schema(schema)`
    - If no spaces existed before, create them.
    - If a space exists, check the space's format and indexes.
    - If the format/indexes are different from those in the database,
      return an error.
    - The module doesn't drop or alter any indexes.
    - Spaces omitted in the DDL are ignored, the module doesn't check them.

    Return values: `true` if no error, otherwise return `nil, err`

  - ### Check compatibility
    `ddl.check_schema(schema)`
    - Check that a `set_schema()` call will raise no error.

    Return values: `true` if no error, otherwise return `nil, err`

  - ### Get spaces format
    `ddl.get_schema()`
    - Scan spaces and return the database schema.

## Input data format

```lua
function some_lua_func()
end
```

## Schema example

```lua
function yet_another_func()
end
```

## Building and testing

```bash
tarantoolctl rocks make
```

```bash
tarantoolctl rocks install luatest 0.3.0
tarantoolctl rocks install luacheck 0.25.0
make test -C build.luarocks ARGS="-V"
```