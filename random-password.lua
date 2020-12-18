local function random_key()
    -- seed it with the os time and some random ms so we don't get the same char all over again
    math.randomseed(os.time() + math.random(100, 10000))
    local key = math.random(33, 126)
    return utf8.char(key)
end

local function make_password(tamano_p)
    tamano_p = (tamano_p and tamano_p ~= "") or 15
    local password = ""
    for i = 1, tamano_p do
        password = password .. random_key()
    end
    return password
end

io.write("size of the password(default: 15): ")
local tamano = io.read()

io.write("your password is: " .. make_password(tamano) .. "\n")