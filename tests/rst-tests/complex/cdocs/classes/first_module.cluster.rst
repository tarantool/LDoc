.. _first_module.cluster:

===============================================================================
Class *first_module.cluster*
===============================================================================

Class to run and manage multiple tarantool instances.




-------------------------------------------------------------------------------
Functions
-------------------------------------------------------------------------------


.. _first_module.cluster.Cluster:new:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:new (object)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Build cluster object.


**Parameters:**

- *object:* 

  - *datadir:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Data directory for all cluster servers.  
  - *server_command:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Command to run server.  
  - *cookie:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Cluster cookie.  
  - *base_http_port:* (**int**) Value to calculate server's http_port. (optional) 
  - *base_advertise_port:* (**int**) Value to calculate server's advertise_port. (optional) 
  - *use_vshard:* (**bool**) bootstrap vshard after server is started. (optional) 
  - *replicasets:* (**tab**) Replicasets configuration. List of :ref:`replicaset_config <first_module.cluster.first_module.cluster.replicaset_config>`  


**Returns**:

object


.. _first_module.cluster.Cluster:server:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:server (alias)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Find server by alias.


**Parameters:**

- *alias:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   

**Returns**:

:ref:`first_module.server <first_module.server>`


.. _first_module.cluster.Cluster:start:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:start ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bootstraps cluster if it wasn't bootstrapped before.  Otherwise starts servers.




.. _first_module.cluster.Cluster:stop:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:stop ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Stop all servers.




.. _first_module.cluster.Cluster:join_server:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:join_server (server)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Register running server in the cluster.


**Parameters:**

- *server:* (**Server**) Server to be registered.  


.. _first_module.cluster.Cluster:wait_until_healthy:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:wait_until_healthy (server)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Blocks fiber until  ``cartridge.is_healthy()``  returns true on main_server.


**Parameters:**

- *server:*    


.. _first_module.cluster.Cluster:upload_config:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:upload_config (config)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upload application config, shortcut for  ``cluster.main_server:upload_config(config)`` .


**Parameters:**

- *config:*    


**See also:**

:ref:`first_module.server.Server:upload_config`

.. _first_module.cluster.Cluster:download_config:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:download_config ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Download application config, shortcut for  ``cluster.main_server:download_config()`` .




**See also:**

:ref:`first_module.server.Server:download_config`

.. _first_module.cluster.Cluster:retrying:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cluster:retrying (config, fn[, ...])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Keeps calling fn until it returns without error. 
Throws last error if config.timeout is elapsed.


**Parameters:**

- *config:* (**tab**) Options for  ``luatest.helpers.retrying`` .  
- *fn:* (**func**) Function to call  
- *...:*  Args to run fn with. (optional) 


-------------------------------------------------------------------------------
Tables
-------------------------------------------------------------------------------


.. _first_module.cluster.first_module.cluster.replicaset_config:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
first_module.cluster.replicaset_config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Replicaset config.


**Fields:**

- *alias:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Prefix to generate server alias automatically. (optional) 
- *uuid:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Replicaset uuid.  
- *roles:* (`{string} <https://www.lua.org/manual/5.1/manual.html#5.4>`_) List of roles for servers in the replicaset.  
- *vshard_group:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_) Name of vshard group.  
- *servers:* (**tab**) List of objects to build  ``Server`` s with.  


