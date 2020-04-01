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

For more details, say:
```sh
cartridge --help
```

These commands are supported:

* `create` - create a new application from template;
* `build` - build the application for local development and testing;
* `start` - start a Tarantool instance(s);
* `stop` - stop a Tarantool instance(s);
* `pack` - pack the application into a distributable bundle.

### An application's lifecycle

In a nutshell:

1. [Create](#creating-an-application-from-template) an application
   (e.g. `myapp`) from template:

   ```sh
   cartridge create --name myapp
   cd ./myapp
   ```

2. [Build](#building-an-application) the application for local development
   and [testing](#running-end-to-end-tests):

   ```sh
   cartridge build
   ```

3. [Pack](#packing-an-application) the application into a distributable
   (e.g. into an RPM package):

   ```sh
   cartridge pack rpm
   ```

### Creating an application from template

This will create a simple Cartridge application in the `/path/to/<app_name>/`
directory with:

If you have `git` installed, this will also set up a Git repository with the
initial commit, tag it with
[version](https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#application-versioning)
0.1.0, and add a `.gitignore` file to the project root.

* application files:
  * `app/roles/custom-role.lua` a sample
    [custom role](https://www.tarantool.io/en/doc/latest/book/cartridge/cartridge_dev/#cluster-roles)
    with simple HTTP API; can be enabled as `app.roles.custom`
  * `<app_name>-scm-1.rockspec` file where you can specify application
    dependencies
  * `init.lua` file which is the entry point for your application
* [special files](#special-files) (used to build and pack the application):
  * `cartridge.pre-build`
  * `cartridge.post-build`
  * `Dockerfile.build.cartridge`
  * `Dockerfile.cartridge`

### Building an application

#### Building locally

This command runs:

1. `cartridge.pre-build` (or [DEPRECATED] `.cartridge.pre`), if the
   [pre-build file](#special-files) exists.
   This builds the application in the `path` directory.
2. `tarantoolctl rocks make`, if the [rockspec file](#special-files) exists.
   This installs all Lua rocks to the `path` directory.

During step 1 of the `cartridge build` command, `cartridge` builds the application
inside the application directory -- unlike when building the application as part
of the `cartridge pack` command, when the application is built in a temporary
[build directory](#build-directory) and no build artifacts remain in the
application directory.

  **NOTE:** An advanced alternative would be to specify build logic in the
  rockspec as `cmake` commands, like we
  [do it](https://github.com/tarantool/cartridge/blob/master/cartridge-scm-1.rockspec#L26).
  for `cartridge`.

(e.g. `tarantoolctl rocks make --chdir ./third_party/proj`).
For details, see [special files](#special-files).

#### Building in Docker

To stop one or more running instances, say:

### Packing an application

To pack your application, say this in any directory:

#### Build directory

By default, application build is done in a temporary directory in
`~/.cartridge/tmp/`, so the packaging process doesn't affect the contents
of your application directory.
