let
  name = "akhe";
in {
  inherit name;
  fullName = "Albert Khe";
  SSoT = "/home/${name}/SSoT";
  email = "albertkhe@proton.me";
  shell = "fish"; # fish | nu | bash
  editor = "hx";
  gpgKey = "EDE4DFCE";
  vcs = "jj"; # jj | git

  bookmarks.firefox = [
    {
      name = "perplexity";
      url = "https://www.perplexity.ai/";
    }
    {
      name = "home";
      bookmarks = [
        {
          name = "tailscale";
          url = "https://login.tailscale.com/admin/machines";
        }
        {
          name = "pve";
          url = "https://pve.mochi.home/";
        }
        {
          name = "dns";
          url = "https://dns.mochi.home/";
        }
        {
          name = "papers";
          url = "https://papers.mochi.home/";
        }
        {
          name = "vault";
          url = "https://vault.mochi.home/";
        }
        {
          name = "medias";
          url = "https://medias.mochi.home/";
        }
      ];
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
    {
      name = "others";
      bookmarks = [
        {
          name = "hackernews";
          url = "https://news.ycombinator.com/";
        }
        {
          name = "reddit";
          url = "https://www.reddit.com/";
        }
        {
          name = "terminal trove";
          url = "https://terminaltrove.com/new/";
        }
        {
          name = "github trends";
          url = "https://github.com/nschloe/github-trends";
        }
        {
          name = "deep wiki";
          url = "https://deepwiki.com/";
        }
      ];
    }
  ];
}
