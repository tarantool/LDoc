--- Class to run and manage multiple tarantool instances.
--
-- @classmod first_module.cluster

--- Build cluster object.
-- @param object
-- @string object.datadir Data directory for all cluster servers.
-- @string object.server_command Command to run server.
-- @string object.cookie Cluster cookie.
-- @int[opt] object.base_http_port Value to calculate server's http_port.
-- @int[opt] object.base_advertise_port Value to calculate server's advertise_port.
-- @bool[opt] object.use_vshard bootstrap vshard after server is started.
-- @tab object.replicasets Replicasets configuration. List of @{replicaset_config}
-- @return object
function Cluster:new(object)
    checks('table', {
        datadir = 'string',
        server_command = 'string',
        cookie = '?string',
        base_http_port = '?number',
        base_advertise_port = '?number',
        use_vshard = '?boolean',
        replicasets = 'table',
    })
    --- Replicaset config.
    -- @table @replicaset_config
    -- @string[opt] alias Prefix to generate server alias automatically.
    -- @string uuid Replicaset uuid.
    -- @tparam {string} roles List of roles for servers in the replicaset.
    -- @tparam ?string vshard_group Name of vshard group.
    -- @tab servers List of objects to build `Server`s with.
end

--- Find server by alias.
-- @string alias
-- @return @{first_module.server}
function Cluster:server(alias)
end

--- Bootstraps cluster if it wasn't bootstrapped before. Otherwise starts servers.
function Cluster:start()
end

--- Stop all servers.
function Cluster:stop()
end

--- Register running server in the cluster.
-- @tparam Server server Server to be registered.
function Cluster:join_server(server)
end

--- Blocks fiber until `cartridge.is_healthy()` returns true on main_server.
function Cluster:wait_until_healthy(server)
end

--- Upload application config, shortcut for `cluster.main_server:upload_config(config)`.
--  @see first_module.server:upload_config
function Cluster:upload_config(config)
end

--- Download application config, shortcut for `cluster.main_server:download_config()`.
-- @see first_module.server:download_config
function Cluster:download_config()
end

--- Keeps calling fn until it returns without error.
-- Throws last error if config.timeout is elapsed.
-- @tab config Options for `luatest.helpers.retrying`.
-- @func fn Function to call
-- @param[opt] ... Args to run fn with.
function Cluster:retrying(config, fn, ...)
end

return Cluster
