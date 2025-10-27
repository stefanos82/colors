FOREGROUND = 38
BACKGROUND = 48
INITIAL = 0
FINAL = 255

def color_range(start, daEnd, anyground)
  resetdefault = "\x1b[0m"
  resetwithspace = "%s " % resetdefault

  resetoutput = resetwithspace

  for color in start..daEnd do
    if color % 16 == 0 then
      puts ""
    end

    if color == daEnd then
      resetoutput = resetdefault
    end

    printf("\x1b[%d;5;%dm%3d%s", anyground, color, color, resetoutput)
  end
end

puts "\x1b[1;39m#{INITIAL} to #{FINAL} Colors (FOREGROUND)\x1b[22;0m"
color_range(INITIAL, FINAL, FOREGROUND)
print "\n\n"

puts "\x1b[1;39m#{INITIAL} to #{FINAL} Colors (BACKGROUND)\x1b[22;0m"
color_range(INITIAL, FINAL, BACKGROUND)
print "\n\n"
