-- local status = pcall(require, 'dashboard-nvim')
-- if not status then
--     print('dashboard Error')
--     return
-- end


vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
  [[              ▄▄▄▄▄▄▄▄▄            ]],
  [[           ▄█████████████▄          ]],
  [[   █████  █████████████████  █████  ]],
  [[   ▐████▌ ▀███▄       ▄███▀ ▐████▌  ]],
  [[    █████▄  ▀███▄   ▄███▀  ▄█████    ]],
  [[    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ]],
  [[     ███▄▀███▄  ▀███▀  ▄███▀▄███    ]],
  [[     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ]],
  [[      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ]],
  [[       ▀███▄▀██ █████ ██▀▄███▀      ]],
  [[      █▄ ▀█████ █████ █████▀ ▄█      ]],
  [[      ███        ███        ███      ]],
  [[      ███▄    ▄█ ███ █▄    ▄███      ]],
  [[      █████ ▄███ ███ ███▄ █████      ]],
  [[      █████ ████ ███ ████ █████      ]],
  [[      █████ ████▄▄▄▄▄████ █████      ]],
  [[       ▀███ █████████████ ███▀      ]],
  [[         ▀█ ███ ▄▄▄▄▄ ███ █▀        ]],
  [[            ▀█▌▐█████▌▐█▀            ]],
  [[               ███████              ]]
}

vim.g.dashboard_custom_section = {
  a = {description = {'  Find File          '}, command = 'Telescope find_files'},
  d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
  b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
  c = {description = {'  Handbook           '}, command = 'edit  ~/.config/nvim/handbook.txt'},
  e = {description = {'  Code               '}, command = 'edit /home/paltos/files'},
  f = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.vim'}
}
vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix Philosophy'}

