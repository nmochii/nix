{
  programs.helix.settings = {
    keys.insert = {
      j.k = "normal_mode";
      C-a = "insert_at_line_start";
      C-e = "insert_at_line_end";
      C-f = "move_char_right";
      C-b = "move_char_left";
    };
    keys.normal.D = [
      "select_mode"
      "goto_line_end"
      "delete_selection"
    ];
    keys.normal = {
      A-w = "move_next_sub_word_start";
      A-b = "move_prev_sub_word_start";
      A-e = "move_next_sub_word_end";
    };
    keys.normal.C-g = "collapse_selection";
    keys.normal." " = {
      tab = "rotate_view_reverse";
      l = ":toggle lsp.display-inlay-hints";
      space = "trim_selections";
      f = "file_picker";
    };
    keys.normal." ".b = {
      b = "buffer_picker";
      n = "goto_next_buffer";
      p = "goto_previous_buffer";
      d = ":buffer-close";
    };
    keys.select.C-g = [
      "exit_select_mode"
      "collapse_selection"
    ];
    keys.select.up = "extend_visual_line_up";
    keys.select.down = "extend_visual_line_down";
  };
}
