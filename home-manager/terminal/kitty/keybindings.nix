{
  programs.kitty = {
    keybindings = {
      # tabs
      "super+t" = "new_tab";
      "super+[" = "previous_tab";
      "super+]" = "next_tab";
      "super+shift+[" = "move_tab_backward";
      "super+shift+]" = "move_tab_forward";
      # clipboard
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      # window
      "super+r" = "new_window";
      "super+shift+r" = "next_layout";
      "super+j" = "next_window";
      "super+k" = "previous_window";
      # scroll
      "super+up" = "scroll_page_up";
      "super+down" = "scroll_page_down";
      "super+right" = "scroll_to_prompt 1";
      "super+left" = "scroll_to_prompt -1";
      # resize
      "super+f1" = "start_resizing_window";
      "super+f2" = "change_font_size all -1";
      "super+f3" = "change_font_size all +1";
    };
  };
}
