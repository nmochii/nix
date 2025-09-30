rec {
  name = "akhe";
  fullName = "Albert Khe";
  config = "/home/${name}/SSoT";
  email = "albertkhe@proton.me";
  shell = "fish";
  editor = "hx";
  pager = "bat -p";
  gpgKey = "EDE4DFCE";
  vcs = "jj";
  terminal = "kitty";

  bookmarks.firefox = [
    {
      name = "hackernews";
      url = "https://news.ycombinator.com/";
    }
    {
      name = "reddit";
      url = "https://www.reddit.com/";
    }
    {
      name = "perplexity";
      url = "https://www.perplexity.ai/";
    }
    {
      name = "nix";
      bookmarks = [
        {
          name = "home manager";
          url = "https://home-manager-options.extranix.com/";
        }
        {
          name = "nixos";
          url = "https://search.nixos.org/packages?channel=25.05";
        }
      ];
    }
    {
      name = "proton";
      bookmarks = [
        {
          name = "mail";
          url = "https://mail.proton.me/u/0/inbox";
        }
        {
          name = "drive";
          url = "https://drive.proton.me/u/0/";
        }
        {
          name = "docs";
          url = "https://docs.proton.me/u/0/recents";
        }
        {
          name = "calendar";
          url = "https://calendar.proton.me/u/0/";
        }
        {
          name = "ai";
          url = "https://lumo.proton.me/guest";
        }
      ];
    }
  ];
}
