{ lib, config, ... }:

{
  options.host = lib.mkOption {
    type = lib.types.str;
    description = "Host type (e.g., desktop or laptop)";
    default = "unknown";
  };

  config = {
    # You can provide a default value or let it be set in the specific host configuration
  };
}
