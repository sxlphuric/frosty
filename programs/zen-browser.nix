{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  xdg.desktopEntries.zen-twilight = {
    name = "Zen Browser";
    genericName = "Web Browser";
    exec = "zen-twilight %u";
    terminal = false;
    type = "Application";

    icon = "zen-browser";

    categories = [ "Network" "WebBrowser" ];
    mimeType = [
      "text/html"
      "text/xml"
      "application/xhtml+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
  };
}
