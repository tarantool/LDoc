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

1. :ref:`Create <creating-an-application-from-template>` an application
   (e.g. `myapp`) from template:

2. :ref:`Build <building-an-application>` the application for local development
   and :ref:`testing <running-end-to-end-tests>`:

3. :ref:`Pack <packing-an-application>` the application into a distributable
   (e.g. into an RPM package):

.. _creating-an-application-from-template:

Creating an application from template
=====================================

`version <https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#application-versioning>`_

`custom role <https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#cluster-roles>`_

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

An advanced alternative would be to specify build logic in the
:ref:`pre-build file <special-files>` exists.
:ref:`build directory <build-directory>` and no build artifacts remain in the
application directory.

(e.g. `tarantoolctl rocks make --chdir ./third_party/proj`).
For details, see :ref:`special files <special-files>`.

.. _packing-an-application:

Packing an application
======================

To pack your application, say this in any directory:

.. _build-directory:

Build directory
---------------
