{
  pkgs,
  lib,
  package ? pkgs.odoo,
  ...
}:
{
  name = "odoo";
  meta.maintainers = with lib.maintainers; [ mkg20001 ];

  nodes = {
    server =
      { ... }:
      {
        services.nginx = {
          enable = true;
          recommendedProxySettings = true;
        };

        services.odoo = {
          enable = true;
          package = package;
          autoInit = true;
          autoInitExtraFlags = [ "--without-demo=all" ];
          domain = "localhost";
        };
      };
  };

  testScript =
    { nodes, ... }:
    ''
      server.wait_for_unit("odoo.service")
      server.wait_until_succeeds("curl -s http://localhost:8069/web/database/selector | grep '<title>Odoo</title>'")
      server.succeed("curl -s http://localhost/web/database/selector | grep '<title>Odoo</title>'")
    '';
}
