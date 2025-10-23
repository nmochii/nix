{
  programs.kitty = {
    keybindings = {
      # tabs
      "super+t" = "new_tab";
      "super+Shift+[" = "previous_tab";
      "super+Shift+]" = "next_tab";
      # clipboard
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      # window
      "super+r" = "new_window";
      "super+shift+r" = "next_layout";
      "super+]" = "next_window";
      "super+[" = "previous_window";
      # scroll
      "ctrl+super+up" = "scroll_page_up";
      "ctrl+super+down" = "scroll_page_down";
      "ctrl+super+right" = "scroll_to_prompt 1";
      "ctrl+super+left" = "scroll_to_prompt -1";
      # resize
      "super+f1" = "start_resizing_window";
      "super+f2" = "change_font_size all -1";
      "super+f3" = "change_font_size all +1";
    };
  };
}
