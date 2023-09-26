io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
    local orig = f:read("*line")
    io.write(orig, "\n")
    
    --remove spaces and non-alphabetic characters, convert to lowercase
    local trimmed = ""
    for j=1,#orig do
        local char = orig:sub(j,j)
        if string.match(char, "[%w]") then
            trimmed = trimmed .. string.lower(char)
        end
    end
    
    if trimmed == string.reverse(trimmed) then
        answers[i] = 'Y'
    else
        answers[i] = 'N'
    end
end

io.write("\nanswer:\n")

for i=1,lines do
    io.write(answers[i], " ")
end

io.write("\n")
