{
  programs.obsidian = {
    enable = true;

    vaults = {
      "Obsidian" = {
        enable = true;
        target = "Documents/Obsidian";
      };
    };

    defaultSettings = {
      app = {
        alwaysUpdateLinks = true;
      };
      corePlugins = [
        "file-explorer"
        "global-search"
        "graph"
        "backlink"
        "canvas"
        "outgoing-link"
        "tag-pane"
        # "footnotes"
        "properties"
        "page-preview"
        # "daily-notes"
        "templates"
        "note-composer"
        "command-palette"
        "slash-command"
        "editor-status"
        "bookmarks"
        # "markdown-importer"
        # "zk-prefixer"
        # "random-note"
        "outline"
        "word-count"
        # "slides"
        # "audio-recorder"
        # "workspaces"
        "file-recovery"
        # "publish"
        # "sync"
        "bases"
        "webviewer"
      ];
    };
  };
}
