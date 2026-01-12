local starter = require("mini.starter")
local picker = require("snacks.picker")
local starter_quotes = {
    "In order to quit NeoVim, use power button.",
    "NeoVim > Vim > Vi > Notepad > Stone and Chisel > InteliJ",
    '"Family matters more than anything else" - (c) Vim Diesel',
    "\"I'm not a good programmer, I'm a good googler\" - (c) JSON State-ham",
    "This NeoVim config works on my machine...",
    '"You gotta get schwifty" - (c) Rick Sanchez',
    "Glory to Ukraine!",
    "Нашої русофобії все ще недостатньо!",
    "If you see this message - donate to UA army!",
}

local starter_logo = [[
      ___         ___         ___        _____        ___         ___
     /__/\       /  /\       /  /\      /  /::\      /  /\       /__/\
    _\_ \:\     /  /::\     /  /::\    /  /:/\:\    /  /:/_      \  \:\
   /__/\ \:\   /  /:/\:\   /  /:/\:\  /  /:/  \:\  /  /:/ /\      \  \:\
  _\_ \:\ \:\ /  /:/~/::\ /  /:/~/:/ /__/:/ \__\:|/  /:/ /:/_ _____\__\:\
 /__/\ \:\ \:/__/:/ /:/\:/__/:/ /:/__\  \:\ /  /:/__/:/ /:/ //__/::::::::\
 \  \:\ \:\/:\  \:\/:/__\\  \:\/:::::/\  \:\  /:/\  \:\/:/ /:\  \:\~~\~~\/
  \  \:\ \::/ \  \::/     \  \::/~~~~  \  \:\/:/  \  \::/ /:/ \  \:\  ~~~
   \  \:\/:/   \  \:\      \  \:\       \  \::/    \  \:\/:/   \  \:\
    \  \::/     \  \:\      \  \:\       \__\/      \  \::/     \  \:\
     \__\/       \__\/       \__\/                   \__\/       \__\/
             _____                  ___                           ___
            /  /::\     ___        /  /\      ___         ___    /  /\
           /  /:/\:\   /  /\      /  /:/_    /  /\       /  /\  /  /::\
          /  /:/  \:\ /  /:/     /  /:/ /\  /  /:/      /  /:/ /  /:/\:\  ___     ___
         /__/:/ \__\:/__/::\    /  /:/_/::\/__/::\     /  /:/ /  /:/~/::\/__/\   /  /\
         \  \:\ /  /:\__\/\:\__/__/:/__\/\:\__\/\:\__ /  /::\/__/:/ /:/\:\  \:\ /  /:/
          \  \:\  /:/   \  \:\/\  \:\ /~~/:/  \  \:\//__/:/\:\  \:\/:/__\/\  \:\  /:/
           \  \:\/:/     \__\::/\  \:\  /:/    \__\::\__\/  \:\  \::/      \  \:\/:/
            \  \::/      /__/:/  \  \:\/:/     /__/:/     \  \:\  \:\       \  \::/
             \__\/       \__\/    \  \::/      \__\/       \__\/\  \:\       \__\/
                                   \__\/                         \__\/
]]

local random_quote = starter_quotes[math.random(#starter_quotes)]
random_quote = "[ " .. random_quote .. " ]"

local align_logo_and_quote = function(logo, quote)
    local function find_longest_line(multiline_string)
        local longest_line_length = 0
        for line in multiline_string:gmatch("[^\n]*") do
            longest_line_length = math.max(longest_line_length, #line)
        end
        return longest_line_length
    end

    local logo_length = find_longest_line(logo)
    local quote_length = find_longest_line(quote)

    if logo_length > quote_length then
        random_quote = string.rep(" ", (logo_length - quote_length) / 2) .. random_quote
    else
        starter_logo = string.rep(" ", (quote_length - logo_length) / 2) .. starter_logo
    end
    return starter_logo, random_quote
end

starter_logo, random_quote = align_logo_and_quote(starter_logo, random_quote)

local browse_section = {
    { action = function() picker.files() end, name = ' Files', section = 'Browse' },
    { action = function() picker.grep() end, name = ' Search', section = 'Browse' },
    { action = function() picker.command_history() end, name = ' Commands', section = 'Browse' },
    { action = function() picker.help() end, name = '󰋖 Help', section = 'Browse' },
}

starter.setup({
    header = starter_logo .. "\n" .. random_quote .. "\n",
    items = {
        browse_section,
        starter.sections.recent_files(10, false, true),
    },
    footer = "Happy coding with NeoVim!",
})
