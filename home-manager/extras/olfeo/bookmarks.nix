{
  programs.firefox.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        toolbar = true;
        bookmarks = [
          {
            name = "work";
            bookmarks = [
              {
                name = "zulip";
                url = "https://chat.olfeo.com/#all_messages";
              }
              {
                name = "bluemind";
                url = "https://mail.olfeo.com/webapp/mail/.t/821c300c-3110-a122-a76d-015efa5bb109:120803a0faa0eed9";
              }
              {
                name = "gather r&d";
                url = "https://app.gather.town/app/nD5c55aYn0bTgxlf/olfeord";
              }
              {
                name = "outlook";
                url = "https://outlook.office.com/mail/";
              }
              {
                name = "gitlab";
                url = "https://gitlab.olfeo.tech";
              }
              {
                name = "jira";
                url = "https://olfeo.atlassian.net/jira/software/c/projects/DT/boards/38";
              }
              {
                name = "lucca";
                url = "https://olfeo.ilucca.net/hello/";
              }
              {
                name = "wiki";
                url = "https://wiki.olfeo.tech/fr/home";
              }
              {
                name = "octopussy";
                url = "https://octopussy.lan.olfeo.com/actions/batch";
              }
              {
                name = "nexus api";
                url = "https://api.oem.olfeo.eu/login";
              }
              {
                name = "figma";
                url = "https://www.figma.com/design/VFgObCkbLboLhxvbDhBVig/Octopussy?node-id=346-3005&m=dev";
              }
            ];
          }
        ];
      }
    ];
  };
}
