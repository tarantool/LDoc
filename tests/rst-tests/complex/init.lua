--- Helpers for integration testing.
-- This module extends `luatest.helpers` with cartridge-specific classes and helpers.
--
-- @module helpers
-- @alias helpers

local luatest = require('luatest')

local helpers = table.copy(luatest.helpers)

--- Extended luatest.server class to run tarantool instance.
-- @see extra.foo
function ref_func()
end

--- Extended luatest.server class to run tarantool instance.
-- @see first_module.server
helpers.Server = require('cartridge.test-helpers.server')
--- Class to run and manage multiple tarantool instances.
-- @see first_module.cluster
helpers.Cluster = require('cartridge.test-helpers.cluster')

return helpers
