DDL
===

DDL module for Tarantool 1.10+

Contents
--------

-  `API <#api>`__

   -  `Set spaces format <#set-spaces-format>`__
   -  `Check compatibility <#check-compatibility>`__
   -  `Get spaces format <#get-spaces-format>`__

-  `Input data format <#input-data-format>`__
-  `Building and testing <#building-and-testing>`__

API
---

-  .. rubric:: Set spaces format
      :name: set-spaces-format

   ``ddl.set_schema(schema)``

   -  If no spaces existed before, create them.
   -  If a space exists, check the space’s format and indexes.
   -  If the format/indexes are different from those in the database,
      return an error.
   -  The module doesn’t drop or alter any indexes.
   -  Spaces omitted in the DDL are ignored, the module doesn’t check
      them.

   Return values: ``true`` if no error, otherwise return ``nil, err``

-  .. rubric:: Check compatibility
      :name: check-compatibility

   ``ddl.check_schema(schema)``

   -  Check that a ``set_schema()`` call will raise no error.

   Return values: ``true`` if no error, otherwise return ``nil, err``

-  .. rubric:: Get spaces format
      :name: get-spaces-format

   ``ddl.get_schema()``

   -  Scan spaces and return the database schema.

Input data format
-----------------

.. code:: lua

   function some_lua_func()
   end

Schema example
--------------

.. code:: lua

   function yet_another_func()
   end

Building and testing
--------------------

.. code:: bash

   tarantoolctl rocks make

.. code:: bash

   tarantoolctl rocks install luatest 0.3.0
   tarantoolctl rocks install luacheck 0.25.0
   make test -C build.luarocks ARGS="-V"
