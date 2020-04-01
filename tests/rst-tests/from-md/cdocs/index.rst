.. _README.md:

.. _cartridge-command-line-interface:

################################
Cartridge Command Line Interface
################################

.. _contents:

********
Contents
********

* :ref:`Usage <usage>`

  * :ref:`An application's lifecycle <an-applications-lifecycle>`
  * :ref:`Creating an application from template <creating-an-application-from-template>`
  * :ref:`Building an application <building-an-application>`
  * :ref:`Starting/stopping an application locally <startingstopping-an-application-locally>`
  * :ref:`Packing an application <packing-an-application>`

.. _usage:

*****
Usage
*****

For more details, say:

.. code-block:: sh

    cartridge --help


These commands are supported:

* `create` - create a new application from template;
* `build` - build the application for local development and testing;
* `start` - start a Tarantool instance(s);
* `stop` - stop a Tarantool instance(s);
* `pack` - pack the application into a distributable bundle.

.. _an-applications-lifecycle:

An application's lifecycle
==========================

In a nutshell:

1. :ref:`Create <creating-an-application-from-template>` an application
   (e.g. `myapp`) from template:


.. code-block:: sh

       cartridge create --name myapp
       cd ./myapp


2. :ref:`Build <building-an-application>` the application for local development
   and :ref:`testing <running-end-to-end-tests>`:


.. code-block:: sh

       cartridge build


3. :ref:`Pack <packing-an-application>` the application into a distributable
   (e.g. into an RPM package):


.. code-block:: sh

       cartridge pack rpm


.. _creating-an-application-from-template:

Creating an application from template
=====================================

This will create a simple Cartridge application in the `/path/to/<app_name>/`
directory with:

If you have `git` installed, this will also set up a Git repository with the
initial commit, tag it with
`version <https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#application-versioning>`_
0.1.0, and add a `.gitignore` file to the project root.

* application files:

  * `app/roles/custom-role.lua` a sample
    `custom role <https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#cluster-roles>`_
    with simple HTTP API; can be enabled as `app.roles.custom`
  * `<app_name>-scm-1.rockspec` file where you can specify application
    dependencies
  * `init.lua` file which is the entry point for your application

* :ref:`special files <special-files>` (used to build and pack the application):

  * `cartridge.pre-build`
  * `cartridge.post-build`
  * `Dockerfile.build.cartridge`
  * `Dockerfile.cartridge`

.. _building-an-application:

Building an application
=======================

.. _building-locally:

Building locally
----------------

This command runs:

1. `cartridge.pre-build` (or [DEPRECATED] `.cartridge.pre`), if the
   :ref:`pre-build file <special-files>` exists.
   This builds the application in the `path` directory.
2. `tarantoolctl rocks make`, if the :ref:`rockspec file <special-files>` exists.
   This installs all Lua rocks to the `path` directory.

During step 1 of the `cartridge build` command, `cartridge` builds the application
inside the application directory -- unlike when building the application as part
of the `cartridge pack` command, when the application is built in a temporary
:ref:`build directory <build-directory>` and no build artifacts remain in the
application directory.

  **NOTE:** An advanced alternative would be to specify build logic in the
  rockspec as `cmake` commands, like we
  `do it <https://github.com/tarantool/cartridge/blob/master/cartridge-scm-1.rockspec#L26>`_.
  for `cartridge`.

(e.g. `tarantoolctl rocks make --chdir ./third_party/proj`).
For details, see :ref:`special files <special-files>`.

.. _building-in-docker:

Building in Docker
------------------

To stop one or more running instances, say:

.. _packing-an-application:

Packing an application
======================

To pack your application, say this in any directory:

.. _build-directory:

Build directory
---------------

By default, application build is done in a temporary directory in
`~/.cartridge/tmp/`, so the packaging process doesn't affect the contents
of your application directory.
