local FOREGROUND = 38
local BACKGROUND = 48
local INITIAL = 0
local FINAL = 255

local function color_range(first, last, anyground)
  local resetdefault = "\x1b[0m"
  local resetwithspace = "\x1b[0m "

  local resetoutput = resetwithspace
  for color = first, last do
    if color % 16 == 0 then
      print()
    end
    if color == last then
      resetoutput = resetdefault
    end

    io.write(string.format("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput))
  end
end

io.write(string.format("\x1b[1;39m%d to %d Colors (FOREGROUND)\x1b[22;0m\n", INITIAL, FINAL))
color_range(INITIAL, FINAL, FOREGROUND)
io.write("\n\n")

io.write(string.format("\x1b[1;39m%d to %d Colors (BACKGROUND)\x1b[22;0m\n", INITIAL, FINAL))
color_range(INITIAL, FINAL, BACKGROUND)
io.write("\n\n")
