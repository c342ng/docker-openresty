local cjson = require "cjson"
local redis = require "resty.redis"

local red = redis:new()
red:set_timeout(1000) -- 1 sec

local ok, err = red:connect("172.17.0.4", 6379)
if not ok then
    ngx.say("1: failed to connect: ", err)
    return
end
local ok, err = red:set('key',"value")
if not ok then
	ngx.say('failed set', err)
	return
end

local res, err = red:get('key')
if not res then
	ngx.say('failed get', err)
	return
end
ngx.say('get from redis: ', res)