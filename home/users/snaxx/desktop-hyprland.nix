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
        # Apps
        "$mod, Return, exec, kitty"
        "$mod, D, exec, rofi -show drun"
        "$mod, E, exec, thunar"
        "$mod, B, exec, firefox"

        # Window management
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod SHIFT, F, fullscreen, 1"
        "$mod, V, togglefloating,"
        "$mod, P, pseudo,"
        "$mod, S, togglesplit,"

        # Session / config
        "$mod, X, exec, hyprlock"
        "$mod SHIFT, R, exec, hyprctl reload"
        "$mod, M, exit,"

        # Focus (flèches)
        "$mod, left, movefocus, l"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"

        # Move windows
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, down, movewindow, d"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, right, movewindow, r"

        # Resize windows
        "$mod CTRL, left, resizeactive, -60 0"
        "$mod CTRL, right, resizeactive, 60 0"
        "$mod CTRL, up, resizeactive, 0 -60"
        "$mod CTRL, down, resizeactive, 0 60"

        # Workspaces (AZERTY)
        "$mod, ampersand, workspace, 1"
        "$mod, eacute, workspace, 2"
        "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, minus, workspace, 6"
        "$mod, egrave, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccedilla, workspace, 9"
        "$mod, agrave, workspace, 10"

        # Move to workspace (AZERTY)
        "$mod SHIFT, ampersand, movetoworkspace, 1"
        "$mod SHIFT, eacute, movetoworkspace, 2"
        "$mod SHIFT, quotedbl, movetoworkspace, 3"
        "$mod SHIFT, apostrophe, movetoworkspace, 4"
        "$mod SHIFT, parenleft, movetoworkspace, 5"
        "$mod SHIFT, minus, movetoworkspace, 6"
        "$mod SHIFT, egrave, movetoworkspace, 7"
        "$mod SHIFT, underscore, movetoworkspace, 8"
        "$mod SHIFT, ccedilla, movetoworkspace, 9"
        "$mod SHIFT, agrave, movetoworkspace, 10"

        # Navigation workspace
        "$mod, TAB, workspace, e+1"
        "$mod SHIFT, TAB, workspace, e-1"

        # Switch rapide dernier workspace
        "$mod, grave, workspace, previous"

        # Screenshots
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "SHIFT, Print, exec, grim - | wl-copy"
        "CTRL, Print, exec, grim -g \"$(hyprctl activewindow -j | jq -r '.at[0],.at[1],.size[0],.size[1]' | paste -sd' ' - | awk '{print $1\",\"$2\" \"$3\"x\"$4}')\" - | wl-copy"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
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
        };

        network = {
          format-wifi = " {essid}";
          format-disconnected = "󰖪";
        };

        pulseaudio = {
          format = "{volume}%";
          format-muted = "muted";
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

      #workspaces button.active {
        color: #cba6f7;
      }
    '';
  };

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
  };

  home.packages = with pkgs; [
    kitty
    rofi
    waybar
    hyprpaper
    networkmanagerapplet
    grim
    slurp
    wl-clipboard
    pamixer
    brightnessctl
    hyprlock
    thunar
    firefox
    jq
  ];
}
