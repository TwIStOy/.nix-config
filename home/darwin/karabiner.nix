{
  pkgs-unstable,
  pkgs,
  ...
}: let
  default_profile = {
    name = "Default profile";
    devices = [
      {
        ignore = false;
        identifiers = {
          is_game_pad = false;
          is_keyboard = false;
          is_pointing_device = true;
          # Logi M650 L
          product_id = 45098;
          vendor_id = 1133;
        };
        mouse_flip_vertical_wheel = true;
      }
      {
        ignore = false;
        identifiers = {
          is_game_pad = false;
          is_keyboard = false;
          is_pointing_device = true;
          # Logi M650 L
          product_id = 50504;
          vendor_id = 1133;
        };
        mouse_flip_vertical_wheel = true;
      }
      {
        ignore = false;
        identifiers = {
          is_game_pad = false;
          is_keyboard = false;
          is_pointing_device = true;
          # Logi M650 L
          product_id = 45108;
          vendor_id = 1133;
        };
        mouse_flip_vertical_wheel = true;
      }
    ];
    complex_modifications = {
      rules = [
        {
          description = "CAPS_LOCK to CTRL";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "caps_lock";
              };
              to = [
                {
                  key_code = "left_control";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+ALT+ENTER: open kitty";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "return_or_enter";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "open -a kitty";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+E: layout bsp";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "e";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --layout bsp";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+z: Toggle zoom-fullscreen";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "z";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --toggle zoom-fullscreen";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+h: Focus left";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "h";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --focus west";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+j: Focus down";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "j";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --focus south";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+k: Focus up";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "k";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --focus north";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+l: Focus right";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "l";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --focus east";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+ALT+w: Close current space";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "w";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --destroy";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+1: Switch to space 1";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "1";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus 1";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+2: Switch to space 2";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "2";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus 2";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+3: Switch to space 3";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "3";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus 3";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+4: Switch to space 4";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "4";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus 4";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+5: Switch to space 5";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "5";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus 5";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+6: Switch to space 6";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "6";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus 6";
                }
              ];
            }
          ];
        }
        {
          description = "ALT+r: Switch to rencent space";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "r";
                modifiers = {
                  mandatory = [
                    "left_option"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m space --focus recent";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+1: Send current window to space 1";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "1";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space 1";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+2: Send current window to space 2";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "2";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space 2";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+3: Send current window to space 3";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "3";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space 3";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+4: Send current window to space 4";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "4";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space 4";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+5: Send current window to space 5";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "5";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space 5";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+6: Send current window to space 6";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "6";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space 6";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+z: Send current window to next space";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "z";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = "${pkgs-unstable.yabai}/bin/yabai -m window --space next";
                }
              ];
            }
          ];
        }
        {
          description = "CMD+SHIFT+n: Send current window to a new desktop";
          manipulators = [
            {
              type = "basic";
              from = {
                key_code = "n";
                modifiers = {
                  mandatory = [
                    "left_command"
                    "left_shift"
                  ];
                };
              };
              to = [
                {
                  shell_command = ''
                    ${pkgs-unstable.yabai}/bin/yabai -m space --create && index="$(${pkgs-unstable.yabai}/bin/yabai -m query --spaces --display | ${pkgs.jq}/bin/jq '.| length')" && ${pkgs-unstable.yabai}/bin/yabai -m window --space "''${index}" && ${pkgs-unstable.yabai}/bin/yabai -m space --focus "''${index}" && ${pkgs-unstable.yabai}/bin/yabai -m space --layout bsp
                  '';
                }
              ];
            }
          ];
        }
      ];
    };
  };
  json = {
    global = {
      ask_for_confirmation_before_quitting = true;
      check_for_updates_on_startup = false;
      show_in_menu_bar = true;
      show_profile_name_in_menu_bar = false;
      unsafe_ui = false;
    };
    profiles = [
      default_profile
    ];
  };
in {
  xdg.configFile."karabiner/karabiner.json" = {
    text = builtins.toJSON json;
    force = true;
  };
}
