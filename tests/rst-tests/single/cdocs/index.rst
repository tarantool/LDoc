.. _cartridge.auth:

===============================================================================
Module *cartridge.auth*
===============================================================================

Administrators authentication and authorization.




-------------------------------------------------------------------------------
Configuration
-------------------------------------------------------------------------------


.. _cartridge.auth.set_params:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set_params (opts)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modify authentication params. 
(*Changed* in v0.11)

Can't be used before the bootstrap.
Affects all cluster instances.
Triggers  ``cluster.config_patch_clusterwide`` .



**Parameters:**

- *opts:* 

  - *enabled:* (optional **boolean**) (*Added* in v0.11)  
  - *cookie_max_age:* (optional **number**)   
  - *cookie_renew_age:* (optional **number**) (*Added* in v0.11)  


**Returns**:

(**boolean**) `true`


**Or**

(**nil**) 

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) Error description


.. _cartridge.auth.get_params:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get_params ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Retrieve authentication params.



**Returns**:

(`AuthParams <cartridge.auth.AuthParams_>`_) 


.. _cartridge.auth.AuthParams:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
AuthParams
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Authentication params.


**Fields:**

- *enabled:* (**boolean**) Wether unauthenticated access is forbidden  
- *cookie_max_age:* (**number**) Number of seconds until the authentication cookie expires  
- *cookie_renew_age:* (**number**) Update provided cookie if it's older then this age (in seconds)  


-------------------------------------------------------------------------------
Authorizarion
-------------------------------------------------------------------------------


.. _cartridge.auth.get_session_username:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get_session_username ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Get username for the current HTTP session. 

(**Added** in v1.1.0-4)



**Returns**:

(`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_ or **nil**) 


.. _cartridge.auth.authorize_request:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
authorize_request (request)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Authorize an HTTP request. 

Get username from cookies or basic HTTP authentication.

(**Added** in v1.1.0-4)


**Parameters:**

- *request:* (`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_)   

**Returns**:

(**boolean**) Access granted


.. _cartridge.auth.render_response:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
render_response (response)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Render HTTP response. 

Inject set-cookie headers into response in order to renew or reset
the cookie.

(**Added** in v1.1.0-4)


**Parameters:**

- *response:* (`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_)   

**Returns**:

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) The same response with cookies injected


-------------------------------------------------------------------------------
User management
-------------------------------------------------------------------------------


.. _cartridge.auth.UserInfo:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UserInfo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

User information.


**Fields:**

- *username:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *fullname:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *email:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   


.. _cartridge.auth.add_user:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add_user (username, password, fullname, email)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Trigger registered add_user callback. 

The callback is triggered with the same arguments and must return
a table with fields conforming to  ``UserInfo`` . Unknown fields are ignored.



**Parameters:**

- *username:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *password:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *fullname:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *email:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   

**Returns**:

(`UserInfo <cartridge.auth.UserInfo_>`_) 


**Or**

(**nil**) 

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) Error description


.. _cartridge.auth.get_user:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get_user (username)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Trigger registered get_user callback. 

The callback is triggered with the same arguments and must return
a table with fields conforming to  ``UserInfo`` . Unknown fields are ignored.



**Parameters:**

- *username:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   

**Returns**:

(`UserInfo <cartridge.auth.UserInfo_>`_) 


**Or**

(**nil**) 

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) Error description


.. _cartridge.auth.edit_user:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
edit_user (username, password, fullname, email)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Trigger registered edit_user callback. 

The callback is triggered with the same arguments and must return
a table with fields conforming to  ``UserInfo`` . Unknown fields are ignored.



**Parameters:**

- *username:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *password:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *fullname:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   
- *email:* (optional `string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   

**Returns**:

(`UserInfo <cartridge.auth.UserInfo_>`_) 


**Or**

(**nil**) 

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) Error description


.. _cartridge.auth.list_users:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
list_users ()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Trigger registered list_users callback. 

The callback is triggered without any arguments. It must return
an array of  ``UserInfo``  objects.




**Returns**:

(`{UserInfo,...} <cartridge.auth.UserInfo_>`_) 


**Or**

(**nil**) 

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) Error description


.. _cartridge.auth.remove_user:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
remove_user (username)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Trigger registered remove_user callback. 

The callback is triggered with the same arguments and must return
a table with fields conforming to  ``UserInfo`` , which was removed.
Unknown fields are ignored.



**Parameters:**

- *username:* (`string <https://www.lua.org/manual/5.1/manual.html#5.4>`_)   

**Returns**:

(`UserInfo <cartridge.auth.UserInfo_>`_) 


**Or**

(**nil**) 

(`table <https://www.lua.org/manual/5.1/manual.html#5.5>`_) Error description


