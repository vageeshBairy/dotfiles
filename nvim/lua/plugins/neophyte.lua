return {
  'tim-harding/neophyte',
  tag = '0.3.0',
  event = 'VeryLazy',

  config = function()
    -- API usage example:
    local neophyte = require 'neophyte'
    neophyte.setup {
      fonts = {
        {
          name = 'JetBrains Mono NL',
          features = {
            {
              name = 'calt',
              value = 1,
            },
          },
        },
        -- Fallback fonts
        {
          name = 'JetBrains Mono',
          -- Variable font axes
          variations = {
            {
              name = 'slnt',
              value = -5,
            },
          },
        },
        -- Shorthand for no features or variations
        'Symbols Nerd Font',
        'Noto Color Emoji',
      },
      font_size = {
        -- kind = 'width', -- 'width' | 'height'
        kind = 'width', -- 'width' | 'height'
        size = 8.5,
      },
      -- Multipliers of the base animation speed.
      -- To disable animations, set these to large values like 1000.
      cursor_speed = 2,
      scroll_speed = 2,
      -- Increase or decrease the distance from the baseline for underlines.
      underline_offset = 1,
    }
  end,
}
