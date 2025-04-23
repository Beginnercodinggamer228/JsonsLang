function RanCode(leng)
    local chars = string.ascii_letters .. string.digits
    return string.gsub(chars, ".", ""):sub(1, leng):gmatch(".")
  
    -- or using math.randomseed and a loop for true randomness
    math.randomseed(os.time())
    local result for _ = 1, leng do
    result = result .. chars:sub(math.random(1, #chars), 1)
    end
    return result
  end
  
  function FileValue(name, exp, data)
    local filepath = name .. "." .. exp
    local file = io.open(filepath, "w")
    if file then
    file:write(json.encode(data))
    file:close()
    end
  end
  
  username = io.read("Введите имя - ")
  password = RanCode(math.random(10, 20) * 3) -- scale to 0-30 length
  datafile = { username = username, password = password, iflogin? = true }
  
  if love.event.isInitialized() then
    FileValue("File", "json", datafile)
  end