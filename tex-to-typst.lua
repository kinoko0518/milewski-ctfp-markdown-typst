-- LaTeXのコマンドをTypst用の呼び出し形式に文字列置換する補助関数
local function convert_latex_to_typst(text, is_math)
  -- 数式モード内ならそのまま、テキストモード内ならTypstのコマンド呼び出し用の#を付与
  local prefix = is_math and "" or "#"

  -- \cat{...} -> cat(...)
  text = text:gsub("\\cat%s*(%b{})", function(b)
    return prefix .. "cat(" .. b:sub(2, -2) .. ")"
  end)

  -- \idarrow[...] -> idarrow(...)
  text = text:gsub("\\idarrow%s*(%b[])", function(b)
    return prefix .. "idarrow(" .. b:sub(2, -2) .. ")"
  end)
  -- \idarrow -> idarrow()
  text = text:gsub("\\idarrow%f[^%a]", prefix .. (is_math and "idarrow" or "idarrow()"))

  -- \Lim[...] -> Lim(...)
  text = text:gsub("\\Lim%s*(%b[])", function(b)
    return prefix .. "Lim(" .. b:sub(2, -2) .. ")"
  end)
  -- \Lim -> Lim()
  text = text:gsub("\\Lim%f[^%a]", prefix .. (is_math and "Lim" or "Lim()"))

  local simple_cmds = {
    "Set", "Rel", "Cat", "id", "Ran", "Lan", "Hask", "Fop", "Nat"
  }
  for _, cmd in ipairs(simple_cmds) do
    text = text:gsub("\\" .. cmd .. "%f[^%a]", prefix .. cmd)
  end

  return text
end

-- 数式モード
function Math(el)
  el.text = convert_latex_to_typst(el.text, true)
  return el
end

-- 地の文に直接書かれたTeXコマンドの処理
function RawInline(el)
    if el.format == "tex" or el.format == "latex" then
    -- \index(...) -> #footnote(...)
    local idx = el.text:match("\\index{(.-)}")
    if idx then
      return pandoc.RawInline('typst', '#footnote("' .. idx .. '")')
    end

    local original_text = el.text
    local converted_text = convert_latex_to_typst(original_text, false)

    if converted_text ~= original_text then
      return pandoc.RawInline('typst', converted_text)
    end
  end
end
