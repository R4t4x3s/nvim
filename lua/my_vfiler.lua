local status_ok, vfiler = pcall(require, "vfiler")
if not status_ok then
  print("couldn't load vfiler")
  return
end

local config_ok, vfiler_config = pcall(require, "vfiler/config")
if not config_ok then
  print("couldn't load vfiler/config")
  return
end

local action_ok, vfiler_action = pcall(require, "vfiler/action")
if not config_ok then
  print("couldn't load vfiler/action")
  return
end

local defaultMaps = {
  ['.'] = vfiler_action.toggle_show_hidden,
  ['<BS>'] = vfiler_action.change_to_parent,
  ['<C-l>'] = vfiler_action.reload,
  ['<C-p>'] = vfiler_action.toggle_auto_preview,
  ['<C-r>'] = vfiler_action.sync_with_current_filer,
  ['<C-s>'] = vfiler_action.toggle_sort,
  ['<CR>'] = vfiler_action.open,
  ['<S-Space>'] = function(vfiler, context, view)
    vfiler_action.toggle_select(vfiler, context, view)
    vfiler_action.move_cursor_up(vfiler, context, view)
  end,
  ['<Space>'] = function(vfiler, context, view)
    vfiler_action.toggle_select(vfiler, context, view)
    vfiler_action.move_cursor_down(vfiler, context, view)
  end,
  ['<Tab>'] = vfiler_action.switch_to_filer,
  ['~'] = vfiler_action.jump_to_home,
  ['*'] = vfiler_action.toggle_select_all,
  ['\\'] = vfiler_action.jump_to_root,
  ['cc'] = vfiler_action.copy_to_filer,
  ['dd'] = vfiler_action.delete,
  ['gg'] = vfiler_action.move_cursor_top,
  ['b'] = vfiler_action.list_bookmark,
  ['h'] = vfiler_action.close_tree_or_cd,
  ['j'] = vfiler_action.loop_cursor_down,
  ['k'] = vfiler_action.loop_cursor_up,
  ['l'] = vfiler_action.open_tree,
  ['mm'] = vfiler_action.move_to_filer,
  ['p'] = vfiler_action.toggle_preview,
  ['q'] = vfiler_action.quit,
  ['r'] = vfiler_action.rename,
  ['s'] = vfiler_action.open_by_split,
  ['t'] = vfiler_action.open_by_tabpage,
  ['v'] = vfiler_action.open_by_vsplit,
  ['x'] = vfiler_action.execute_file,
  ['yy'] = vfiler_action.yank_path,
  ['B'] = vfiler_action.add_bookmark,
  ['C'] = vfiler_action.copy,
  ['D'] = vfiler_action.delete,
  ['G'] = vfiler_action.move_cursor_bottom,
  ['J'] = vfiler_action.jump_to_directory,
  ['K'] = vfiler_action.new_directory,
  ['L'] = vfiler_action.switch_to_drive,
  ['M'] = vfiler_action.move,
  ['N'] = vfiler_action.new_file,
  ['P'] = vfiler_action.paste,
  ['S'] = vfiler_action.change_sort,
  ['U'] = vfiler_action.clear_selected_all,
  ['YY'] = vfiler_action.yank_name,
}

local defaultOpts = {
  auto_cd = false,
  auto_resize = false,
  columns = 'indent,devicons,name,mode,size,time',
  header = true,
  keep = false,
  listed = true,
  name = '',
  session = 'buffer',
  show_hidden_files = false,
  sort = 'name',
  layout = 'none',
  width = 90,
  height = 30,
  new = false,
  quit = true,
  row = 0,
  col = 0,
  blend = 0,
  border = 'rounded',
  zindex = 200,
  git = {
    enabled = true,
    ignored = true,
    untracked = true,
  },
  preview = {
    layout = 'floating',
    width = 0,
    height = 0,
  },
}

local explorerOpts = {
  auto_cd = false,
  auto_resize = false,
  columns = 'indent,devicons,name,mode,size,time',
  header = true,
  keep = false,
  listed = true,
  name = '',
  session = 'buffer',
  show_hidden_files = false,
  sort = 'name',
  layout = 'left',
  width = 90,
  height = 30,
  new = false,
  quit = true,
  row = 0,
  col = 0,
  blend = 0,
  border = 'rounded',
  zindex = 200,
  git = {
    enabled = true,
    ignored = true,
    untracked = true,
  },
  preview = {
    layout = 'floating',
    width = 0,
    height = 0,
  },
}


local defaultConf = {
  options = defaultOpts,
  mappings = defaultMaps,
}
local explorerConf = {
  options = explorerOpts,
  mappings = defaultMaps,
}

function _VFILER_DEFAULT()
  vfiler.start("", defaultConf)
end

function _VFILER_EXPLORER()
  vfiler.start("", explorerConf)
end

function _FILER_FLOAT()
end
