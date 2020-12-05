all:
	tarantoolctl rocks pack http://rocks.moonscript.org/luafilesystem-1.8.0-1.rockspec
	tarantoolctl rocks pack http://rocks.moonscript.org/penlight-1.9.2-1.rockspec
	tarantoolctl rocks pack http://rocks.moonscript.org/markdown-0.33-1.rockspec
	tarantoolctl rocks make_manifest
	rm manifest-*
