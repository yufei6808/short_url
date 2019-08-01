ngx.header.content_type = 'text/html'
local config = require('short.config')
local functions = require('short.functions')
local short_string = string.sub(ngx.var.uri, -#config['start_url'])
local str = string.match(ngx.var.uri,"^/([0-9a-zA-Z]+)")
local long_url, err = functions.get_long_url(short_string)
if err then
	long_url, errs = functions.get_long_url(str)
	if errs then
	    functions.show_err(err)
	end
end
ngx.redirect(long_url)
