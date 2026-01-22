{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 12;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
        };
      };

      exec-once = [
        "waybar"
        "hyprpaper"
        "nm-applet --indicator"
      ];

      bind = [
        "$mod, Return, exec, kitty"
        "$mod, D, exec, rofi -show drun"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, F, fullscreen,"
        "$mod, V, togglefloating,"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        # Move to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"

        # Screenshot
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
      ];

      bindl = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      ];
    };
  };

  # Waybar config déclarative
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" ];

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A %d %B %Y}";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = " {essid}";
          format-disconnected = "󰖪";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = [ "" "" "" ];
          };
        };
      };
    };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 13px;
      }
      #waybar {
        background: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
      }
      #workspaces button {
        color: #cdd6f4;
        padding: 0 5px;
      }
      #workspaces button.active {
        color: #cba6f7;
      }
      #clock, #battery, #network, #pulseaudio {
        padding: 0 10px;
      }
    '';
  };

  # Rofi
  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
  };
}
