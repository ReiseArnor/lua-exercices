local function random_password()
    -- seed it with the os time with some random ms so we don't get the same char all over again
    math.randomseed(os.time() + math.random(100, 10000))
    local key = math.random(33, 126)
    return utf8.char(key)
end

local function make_password(tamano_p)
    if not tamano_p then tamano_p = 10 end 
    local password = ""
    for i = 1, tamano_p do
        password = password .. random_password()
    end
    return password
end

io.write("size of the password: ")
local tamano = io.read()

io.write("your password is: " .. make_password(tamano) .. "\n")