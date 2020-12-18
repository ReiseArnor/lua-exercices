local http = require "socket.http"
local ltn12 = require "ltn12"

local function http_request(url)
    url = (url and url ~= "") or "https://odanisesquea.dev/"
    local resp, r = {}, {}
    local _, code, headers, status = http.request{ url=url, sink=ltn12.sink.table(resp) }
    r['code'], r['headers'], r['status'], r['response'] = code, headers, status, resp
    return r
end

local function get_links(http_c)
  local count = 1
  local links = {}
  for s in string.gmatch(http_c, "\"http.-\"") do
    links[count] = string.gsub(s, "\"", "")
    count = count + 1
  end
  return links
end

io.write("enter the web address(example: https://google.com): ")
local web = io.read()

local http_content = http_request(web).response[1]
local links = get_links(http_content)

for key, value in pairs(links) do
  io.write(key .. ": " .. value .. "\n")
end