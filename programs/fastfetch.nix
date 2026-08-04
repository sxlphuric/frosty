{
  programs.fastfetch = {
    enable = true;
    settings = {
        logo = {
          type = "small";
          source = "";
          color = {
            "1" = "light_magenta";
            "2" = "light_blue";
            "3" = "light_cyan";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
          };
          width = null;
          height = null;
          padding = {
            top = 0;
            left = 0;
            right = 4;
          };
          printRemaining = true;
          preserveAspectRatio = false;
          recache = false;
          position = "left";
          chafa = {
            fgOnly = false;
            symbols = "block+border+space-wide-inverted";
          };
        };
        display = {
          stat = false;
          pipe = false;
          showErrors = false;
          disableLinewrap = true;
          hideCursor = false;
          separator = "  ⟶  ";
          color = {
            keys = "";
            title = "";
            output = "";
            separator = "";
          };
          brightColor = true;
          duration = {
            abbreviation = false;
            spaceBeforeUnit = "default";
          };
          size = {
            maxPrefix = "YB";
            binaryPrefix = "iec";
            ndigits = 2;
          };
          temp = {
            unit = "D";
            ndigits = 1;
            color = {
              green = "32";
              yellow = "93";
              red = "91";
            };
            spaceBeforeUnit = "default";
          };
          percent = {
            type = [
              "num"
              "num-color"
            ];
            ndigits = 0;
            color = {
              green = "32";
              yellow = "93";
              red = "91";
            };
            spaceBeforeUnit = "default";
            width = 0;
          };
          bar = {
            char = {
              elapsed = "■";
              total = "-";
            };
            border = {
              left = "[ ";
              right = " ]";
              leftElapsed = "";
              rightElapsed = "";
            };
            color = {
              elapsed = "auto";
              total = "97";
              border = "97";
            };
            width = 10;
          };
          fraction = {
            ndigits = 2;
          };
          noBuffer = false;
          key = {
            width = 10;
            type = "both";
            paddingLeft = 0;
          };
          freq = {
            ndigits = 2;
            spaceBeforeUnit = "default";
          };
          constants = [];
        };
        general = {
          thread = true;
          processingTimeout = 5000;
          detectVersion = true;
          playerName = "";
          dsForceDrm = false;
        };
        modules = [
          /*{
            "type": "title",
            "key": "me ",
            "keyIcon": "󰀄",
            "fqdn": false,
            "format": "{user-name}"
          },*/
          /*{
            "type": "os",
            "key": "os",
            "keyIcon": "󰌽",
            "format": "{id}"
          },*/
          {
            type = "kernel";
            key = "{#light_blue}ker";
            keyIcon = "󰟼";
            format = "{release}";
          }
          {
            type = "uptime";
            key = "{#light_magenta}up ";
            keyIcon = "󰅐";
            format = "{days}d {hours}h {minutes}m";
          }
          /*{
            "type": "packages",
            "keyIcon": "󰏗",
            "key": "pkg",
            "disabled": [
              "apk"
            ],
            "format": "{all}",
            "combined": true
          },*/
          {
            type = "shell";
            keyIcon = "";
            key = "{#light_blue}sh ";
            format = "{pretty-name}";
          }
          {
            type = "wm";
            keyIcon = "󰘔";
            key = "{#light_magenta}wm ";
            detectPlugin = true;
            format = "{pretty-name}";
          }
          {
            type = "terminal";
            key = "{#light_blue}ter";
            keyIcon = "󰞷";
            format = "{pretty-name}";
          }
          /*{
            "type": "localip",
            "key": "ip",
            "keyIcon": "󰖩",
            "showIpv4": true,
            "showIpv6": false,
            "showMac": false,
            "showLoop": false,
            "showPrefixLen": true,
            "showMtu": false,
            "showSpeed": false,
            "showFlags": false,
            "compact": false,
            "defaultRouteOnly": true,
            "showAllIps": false,
            "namePrefix": ""
          },*/
          "break"
          {
            type = "custom";
            format = "{#light_black}󰮯    {#light_red}󰊠    {#light_green}󰊠    {#light_yellow}󰊠    {#light_blue}󰊠    {#light_magenta}󰊠    {#light_cyan}󰊠 ";
          }
        ];
    };
  };
}
