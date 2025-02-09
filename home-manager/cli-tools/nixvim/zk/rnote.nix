{ pkgs, ... }: {


  home.sessionVariables = {
    RNOTE_DIR = "$HOME/Notes/Zk/attachments/drawings";
    RNOTE_TEMPLATES = "$HOME/Notes/Zk/attachments/drawings/templates/templates.json";
  };

  home.packages = with pkgs; [
    # rnote
  ];

  programs.nixvim = {
    extraConfigLua = ''
      local has_telescope, telescope = pcall(require, 'telescope')

      if not has_telescope then
        print("Telescope is not installed")
        return
      end

      local pickers = require('telescope.pickers')
      local finders = require('telescope.finders')
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      local rnote_template_json = vim.fn.getenv("RNOTE_TEMPLATES")

      -- Function to generate a random hash
      local function generate_random_hash()
        local random_seed = vim.fn.reltimefloat(vim.fn.reltime())  -- Get time-based random seed
        local hash = vim.fn.sha256(tostring(random_seed))  -- Generate a SHA256 hash from the random seed
        return hash:sub(1, 8)  -- Limit the hash to 8 characters for brevity
      end

      -- Function to load templates from templates.json
      local function load_templates()
        local templates_file = rnote_template_json

        local templates_json = vim.fn.readfile(templates_file)
        local templates = vim.fn.json_decode(table.concat(templates_json, "\n"))

        return templates
      end

      -- Function to choose template using Telescope and create note
      local function choose_template_and_create_note(templates)
        local template_names = {}

        for template_name, _ in pairs(templates) do
          table.insert(template_names, template_name)
        end

        -- Telescope picker
        pickers.new({}, {
          prompt_title = "Choose Note Template",
          finder = finders.new_table {
            results = template_names
          },
          sorter = require('telescope.config').values.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)

              -- Proceed with creating the note
              local chosen_template = templates[selection[1]]
              if chosen_template then
                local created_file = _G.create_note_from_template(chosen_template.template_file)
                if created_file then
                  print("Created file: " .. created_file)  -- Optional: Print the created file
                  return created_file  -- Return the created file name
                end
              end
            end)
            return true
          end
        }):find()
      end

      -- Function to create note from the selected template
      _G.create_note_from_template = function(template_file)
        local rnote_dir = vim.fn.getenv("RNOTE_DIR")

        -- Check if the environment variable is set
        if rnote_dir == nil or rnote_dir == "" then
          print("RNOTE_DIR environment variable is not set")
          return
        end

        -- Strip "templates.json" from the RNOTE_TEMPLATES path
        local template_dir = string.gsub(rnote_template_json, "/templates.json", "")

        -- Full path to the template
        local template_full_path = template_dir .. '/' .. template_file

        -- Generate a random file name
        local file_name = rnote_dir .. "/" .. generate_random_hash() .. ".rnote"

        -- Copy the template
        vim.fn.system('cp ' .. template_full_path .. ' ' .. file_name)

        -- Command to run rnote on the file
        vim.fn.system('rnote ' .. file_name .. ' &')

        -- Feedback to the user
        print("Created and opened " .. file_name .. " with rnote.")
      end

      -- Define the function in the global scope so it's accessible from the keybinding
      _G.touch_and_run_rnote = function()
        -- Load templates from the JSON file
        local templates = load_templates()

        -- Use Telescope to choose a template
        return choose_template_and_create_note(templates)
      end
        '';
    userCommands = {
      InsertNote = {
        bar = true;
        command = ''
            :lua touch_and_run_rnote()<CR>
          '';
      };
    };
  };
}
