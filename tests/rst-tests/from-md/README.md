# Cartridge Command Line Interface

[![pipeline status](https://gitlab.com/tarantool/cartridge-cli/badges/master/pipeline.svg)](https://gitlab.com/tarantool/cartridge-cli/commits/master)

## Contents

* [Usage](#usage)
  * [An application's lifecycle](#an-applications-lifecycle)
  * [Creating an application from template](#creating-an-application-from-template)
  * [Building an application](#building-an-application)
  * [Starting/stopping an application locally](#startingstopping-an-application-locally)
  * [Packing an application](#packing-an-application)

## Usage

1. [Create](#creating-an-application-from-template) an application
   (e.g. `myapp`) from template:

2. [Build](#building-an-application) the application for local development
   and [testing](#running-end-to-end-tests):

3. [Pack](#packing-an-application) the application into a distributable
   (e.g. into an RPM package):

### Creating an application from template

[version](https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#application-versioning)

[custom role](https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#cluster-roles)

* [special files](#special-files) (used to build and pack the application):
  * `cartridge.pre-build`
  * `cartridge.post-build`
  * `Dockerfile.build.cartridge`
  * `Dockerfile.cartridge`

### Building an application

#### Building locally

An advanced alternative would be to specify build logic in the
[pre-build file](#special-files) exists. 
[build directory](#build-directory) and no build artifacts remain in the
application directory.

(e.g. `tarantoolctl rocks make --chdir ./third_party/proj`).
For details, see [special files](#special-files).

### Packing an application

To pack your application, say this in any directory:

#### Build directory
