local FOREGROUND = 38
local BACKGROUND = 48

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

io.write("\x1b[1;39m0 to 255 Colors (FOREGROUND)\x1b[22;0m\n")
color_range(0, 255, FOREGROUND)
io.write("\n\n")

io.write("\x1b[1;39m0 to 255 Colors (BACKGROUND)\x1b[22;0m\n")
color_range(0, 255, BACKGROUND)
io.write("\n\n")
