#!/usr/bin/env tarantool

--- Administrators authentication and authorization.
--
-- @module cartridge.auth


--- Allow or deny unauthenticated access to the administrator's page.
-- (*Changed* in v0.11)
--
-- This function affects only the current instance.
-- It can't be used after the cluster was bootstrapped.
-- To modify clusterwide config use `set_params` instead.
--
-- @function set_enabled
-- @local
-- @tparam boolean enabled
-- @treturn[1] boolean `true`
-- @treturn[2] nil
-- @treturn[2] table Error description
local function set_enabled(enabled)
end

--- Check if unauthenticated access is forbidden.
-- (*Added* in v0.7)
--
-- @function get_enabled
-- @local
-- @treturn boolean enabled
local function get_enabled()
        -- backward compatibility with clusterwide config v0.10
end

--- Modify authentication params.
-- (*Changed* in v0.11)
--
-- Can't be used before the bootstrap.
-- Affects all cluster instances.
-- Triggers `cluster.config_patch_clusterwide`.
--
-- @function set_params
-- @within Configuration
-- @tparam table opts
-- @tparam ?boolean opts.enabled (*Added* in v0.11)
-- @tparam ?number opts.cookie_max_age
-- @tparam ?number opts.cookie_renew_age (*Added* in v0.11)
-- @treturn[1] boolean `true`
-- @treturn[2] nil
-- @treturn[2] table Error description
local function set_params(opts)
        -- backward compatibility with clusterwide config v0.10
end

--- Retrieve authentication params.
--
-- @function get_params
-- @within Configuration
-- @treturn AuthParams
local function get_params()
    --- Authentication params.
    -- @table AuthParams
    -- @within Configuration
    -- @tfield boolean enabled Wether unauthenticated access is forbidden
    -- @tfield number cookie_max_age Number of seconds until the authentication cookie expires
    -- @tfield number cookie_renew_age Update provided cookie if it's older then this age (in seconds)
end

--- Get username for the current HTTP session.
--
-- (**Added** in v1.1.0-4)
-- @function get_session_username
-- @within Authorizarion
-- @treturn string|nil
local function get_session_username()
end

local function coerce_user(user)
    --- User information.
    -- @table UserInfo
    -- @within User management
    -- @tfield string username
    -- @tfield ?string fullname
    -- @tfield ?string email
end

--- Trigger registered add_user callback.
--
-- The callback is triggered with the same arguments and must return
-- a table with fields conforming to `UserInfo`. Unknown fields are ignored.
--
-- @function add_user
-- @within User management
-- @tparam string username
-- @tparam string password
-- @tparam ?string fullname
-- @tparam ?string email
-- @treturn[1] UserInfo
-- @treturn[2] nil
-- @treturn[2] table Error description
local function add_user(username, password, fullname, email)
end

--- Trigger registered get_user callback.
--
-- The callback is triggered with the same arguments and must return
-- a table with fields conforming to `UserInfo`. Unknown fields are ignored.
--
-- @function get_user
-- @within User management
-- @tparam string username
-- @treturn[1] UserInfo
-- @treturn[2] nil
-- @treturn[2] table Error description
local function get_user(username)
end

--- Trigger registered edit_user callback.
--
-- The callback is triggered with the same arguments and must return
-- a table with fields conforming to `UserInfo`. Unknown fields are ignored.
--
-- @function edit_user
-- @within User management
-- @tparam string username
-- @tparam ?string password
-- @tparam ?string fullname
-- @tparam ?string email
-- @treturn[1] UserInfo
-- @treturn[2] nil
-- @treturn[2] table Error description
local function edit_user(username, password, fullname, email)
end

--- Trigger registered list_users callback.
--
-- The callback is triggered without any arguments. It must return
-- an array of `UserInfo` objects.
--
-- @function list_users
-- @within User management
-- @treturn[1] {UserInfo,...}
-- @treturn[2] nil
-- @treturn[2] table Error description
local function list_users()
end

--- Trigger registered remove_user callback.
--
-- The callback is triggered with the same arguments and must return
-- a table with fields conforming to `UserInfo`, which was removed.
-- Unknown fields are ignored.
--
-- @function remove_user
-- @within User management
-- @tparam string username
-- @treturn[1] UserInfo
-- @treturn[2] nil
-- @treturn[2] table Error description
local function remove_user(username)
end

--- Authorize an HTTP request.
--
-- Get username from cookies or basic HTTP authentication.
--
-- (**Added** in v1.1.0-4)
-- @function authorize_request
-- @within Authorizarion
-- @tparam table request
-- @treturn boolean Access granted
local function authorize_request(req)
end

--- Render HTTP response.
--
-- Inject set-cookie headers into response in order to renew or reset
-- the cookie.
--
-- (**Added** in v1.1.0-4)
-- @function render_response
-- @within Authorizarion
-- @tparam table response
-- @treturn table The same response with cookies injected
local function render_response(resp)
end

--- Initialize the authentication HTTP API.
--
-- Set up `login` and `logout` HTTP endpoints.
-- @function init
-- @local
local function init(httpd)
end

--- Set authentication callbacks.
--
-- @function set_callbacks
-- @local
-- @tparam table callbacks
-- @tparam function callbacks.add_user
-- @tparam function callbacks.get_user
-- @tparam function callbacks.edit_user
-- @tparam function callbacks.list_users
-- @tparam function callbacks.remove_user
-- @tparam function callbacks.check_password
-- @treturn boolean `true`
local function set_callbacks(callbacks)
end

--- Get authentication callbacks.
--
-- @function get_callbacks
-- @local
-- @treturn table callbacks
local function get_callbacks()
end

return {
    init = init,

    set_params = set_params,
    get_params = get_params,
    set_callbacks = set_callbacks,
    get_callbacks = get_callbacks,
    set_enabled = set_enabled,
    get_enabled = get_enabled,

    add_user = add_user,
    get_user = get_user,
    edit_user = edit_user,
    list_users = list_users,
    remove_user = remove_user,

    authorize_request = authorize_request,
    render_response = render_response,
    get_session_username = get_session_username,
}
