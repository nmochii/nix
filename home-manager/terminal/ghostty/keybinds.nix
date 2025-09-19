{
  programs.ghostty.settings = {
    keybind = [
      # tabs
      "super+t=new_tab"
      "super+shift+t=toggle_tab_overview"
      "super+[=previous_tab"
      "super+]=next_tab"
      "super+shift+[=move_tab:-1"
      "super+shift+]=move_tab:1"
      # clipboard
      "ctrl+shift+c=copy_to_clipboard"
      "ctrl+shift+v=paste_from_clipboard"
      # font size
      # "ctrl+shift+equal=increase_font_size"
      # "ctrl+shift+minus=decrease_font_size"
      # splits
      "super+shift+r=new_split:down"
      "super+r=new_split:right"
      "super+l=goto_split:right"
      "super+j=goto_split:down"
      "super+h=goto_split:left"
      "super+k=goto_split:up"
      # scroll
      "super+left=jump_to_prompt:-1"
      "super+right=jump_to_prompt:1"
      "super+up=scroll_page_up"
      "super+down=scroll_page_down"
    ];
  };
}
