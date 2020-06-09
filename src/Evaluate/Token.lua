--< Variables >--
local Associativity = {
    ["^"] = "Right";
    ["*"] = "Left";
    ["/"] = "Left";
    ["%"] = "Left";
    ["+"] = "Left";
    ["-"] = "Left";
}

local Precedence = {
    ["^"] = 3;
    ["*"] = 2;
    ["/"] = 2;
    ["%"] = 2;
    ["+"] = 1;
    ["-"] = 1;
}

--< Module >--
local function Token(type, value)
    return {
        Type = type;
        Value = value;
        Precedence = type == "Function" and 4 or Precedence[value];
        Associativity = Associativity[value];
    }
end

return Token