local mysql = require "resty.mysql"
local db, err = mysql:new()
if not db then
    ngx.say("failed load mysql", err)
    return
end
db:set_timeout(1000)
local ok, err, errno, sqlstate = db:connect{
    host = "172.17.0.2",
    port = 3306,
    user = "root",
    password = "123456",
    database = "ngx",
    max_packet_size = 1024 * 1204
}
if not ok then
    ngx.say("failed connect mysql", err)
    return
end
local res, err, errno, sqlstate = 
    db:query("select * from t")
if not res then
    ngx.say("query result bad", err)
    return
end
-- local ok, err = db:close()
-- if not ok then
--     ngx.say("failed close db")
--     return
-- end
local ok, err = db:set_keepalive(10000, 100)
local cjson = require "cjson"
ngx.say(cjson.encode(res))