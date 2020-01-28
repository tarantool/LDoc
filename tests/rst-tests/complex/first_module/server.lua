--- Extended luatest.Server class to run tarantool instance.
--
-- @classmod first_module.server

--- Build server object.
-- @function new
-- @param object
-- @string object.command Command to start server process.
-- @string object.workdir Value to be passed in `TARANTOOL_WORKDIR`.
-- @bool[opt] object.chdir Path to cwd before starting a process.
-- @tab[opt] object.env Table to pass as env variables to process.
-- @tab[opt] object.args Args to run command with.
-- @int[opt] object.http_port Value to be passed in `TARANTOOL_HTTP_PORT` and used to perform HTTP requests.
-- @int object.advertise_port Value to generate `TARANTOOL_ADVERTISE_URI` and used for net_box connection.
-- @int[opt] object.net_box_port Alias for `advertise_port`.
-- @tab[opt] object.net_box_credentials Override default net_box credentials.
-- @string object.alias Instance alias.
-- @string object.cluster_cookie Value to be passed in `TARANTOOL_CLUSTER_COOKIE` and used as default net_box password.
-- @string[opt] object.instance_uuid Server identifier.
-- @string[opt] object.replicaset_uuid Replicaset identifier.
-- @return input object
local Server = luatest.Server:inherit({})

--- Generates environment to run process with.
-- The result is merged into os.environ().
-- @return map
function Server:build_env()
end

--- Start the server.
function Server:start()
end

--- Stop server process.
function Server:stop()
end

--- Perform GraphQL request on cluster.
-- @param request object to be serialized into JSON body.
-- @param[opt] options additional options for :http_request.
-- @return parsed response JSON.
-- @raise HTTPRequest error when request fails or first error from `errors` field if any.
function Server:graphql(request, options)
end

--- Advertise this server to the cluster.
-- @param main_server Server to perform GraphQL request on.
-- @param[opt] options
-- @param options.timeout request timeout
function Server:join_cluster(main_server, options)
end

--- Update server's replicaset config.
-- @param config
-- @param config.uuid replicaset uuid
-- @param config.roles list of roles
-- @param config.master
-- @param config.weight
function Server:setup_replicaset(config)
end

--- Upload application config.
-- @tparam string|table config - table will be encoded as yaml and posted to /admin/config.
function Server:upload_config(config)
end

--- Download application config.
function Server:download_config()
end

return Server
