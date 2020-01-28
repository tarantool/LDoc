.. _first_module.server:

===============================================================================
Class *first_module.server*
===============================================================================

Extended luatest.Server class to run tarantool instance.




-------------------------------------------------------------------------------
Functions
-------------------------------------------------------------------------------


.. _first_module.server.Server:build_env:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:build_env ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Generates environment to run process with. 
The result is merged into os.environ().



**Returns**:

map


.. _first_module.server.Server:start:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:start ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start the server.




.. _first_module.server.Server:stop:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:stop ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Stop server process.




.. _first_module.server.Server:graphql:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:graphql (request[, options])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform GraphQL request on cluster.


**Parameters:**

- *request:*  object to be serialized into JSON body.  
- *options:*  additional options for :http_request. (optional) 

**Returns**:

parsed response JSON.


**Raises:**

HTTPRequest error when request fails or first error from  ``errors``  field if any.


.. _first_module.server.Server:join_cluster:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:join_cluster (main_server[, options])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Advertise this server to the cluster.


**Parameters:**

- *main_server:*  Server to perform GraphQL request on.  
- *options:* 

  - *timeout:*  request timeout  



.. _first_module.server.Server:setup_replicaset:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:setup_replicaset (config)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Update server's replicaset config.


**Parameters:**

- *config:* 

  - *uuid:*  replicaset uuid  
  - *roles:*  list of roles  
  - *master:*    
  - *weight:*    



.. _first_module.server.Server:upload_config:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:upload_config (config)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upload application config.


**Parameters:**

- *config:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_ or `table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) * table will be encoded as yaml and posted to /admin/config.  


.. _first_module.server.Server:download_config:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Server:download_config ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Download application config.




-------------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------


.. _first_module.server.first_module.server:new:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
first_module.server:new (object)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Build server object.


**Parameters:**

- *object:* 

  - *command:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Command to start server process.  
  - *workdir:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Value to be passed in  ``TARANTOOL_WORKDIR`` .  
  - *chdir:* (**bool**) Path to cwd before starting a process. (optional) 
  - *env:* (**tab**) Table to pass as env variables to process. (optional) 
  - *args:* (**tab**) Args to run command with. (optional) 
  - *http_port:* (**int**) Value to be passed in  ``TARANTOOL_HTTP_PORT``  and used to perform HTTP requests. (optional) 
  - *advertise_port:* (**int**) Value to generate  ``TARANTOOL_ADVERTISE_URI``  and used for net_box connection.  
  - *net_box_port:* (**int**) Alias for  ``advertise_port`` . (optional) 
  - *net_box_credentials:* (**tab**) Override default net_box credentials. (optional) 
  - *alias:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Instance alias.  
  - *cluster_cookie:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Value to be passed in  ``TARANTOOL_CLUSTER_COOKIE``  and used as default net_box password.  
  - *instance_uuid:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Server identifier. (optional) 
  - *replicaset_uuid:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Replicaset identifier. (optional) 


**Returns**:

input object


