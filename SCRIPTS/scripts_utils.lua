utils = {};



function utils.member(tbl, item)
	for key, value in pairs(tbl) do
		if value == item then
			return key;
		end
	end
	return -1;
end



function utils.sizeOf(tbl)
	return #tbl + 1;
end



function trim(s)
	return s:match("^%s*(.-)%s*$")
end



function utils.capitalize(str)
	if not str then
		str = "";
	end

	str = tostring(str);

	return string.upper(str:sub(1,1)) .. str:sub(2);
end



function systemMessage(arg)
    cecho("<yellow>DARTMUDLET: "..arg.."\n")
end


function scaleFontSize(width, height, base)
    --local labelWidth, labelHeight = label:get_width(), label:get_height()
    --local baseFontSize = 12 -- Base font size
    local scaleFactor = 0.05 -- Scale factor to adjust text size

    -- Calculate new font size based on label dimensions
    local newFontSize = math.min(width, height) * scaleFactor

    -- Apply the new font size to the label
    --label:setFontSize(newFontSize)
    return newFontSize
end

return utils;
