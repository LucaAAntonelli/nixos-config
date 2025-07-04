{inputs, lib, ... }:
{
  imports = [inputs.mms.module];
  services.modded-minecraft-servers = {
    eula = true;
    instances = {
      divinejourney2 = {
        enable = false; # disable for now
        rsyncSSHKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFKjNIRdnej5xu7x68O7Yj5Svz4QZW7C60gCCDs/Hfni"];

        # Currently not used, but left here in case this changes
        jvmOpts = lib.concatStringsSep " " [
          "-XX:+UseG1GC"
          "-XX:+ParallelRefProcEnabled"
          "-XX:MaxGCPauseMillis=200"
          "-XX:+UnlockExperimentalVMOptions"
          "-XX:+DisableExplicitGC"
          "-XX:+AlwaysPreTouch"
          "-XX:G1NewSizePercent=40"
          "-XX:G1MaxNewSizePercent=50"
#          "-XX:G1HeapRegionSize=16M"
          "-XX:G1ReservePercent=15"
          "-XX:G1HeapWastePercent=5"
          "-XX:G1MixedGCCountTarget=4"
          "-XX:InitiatingHeapOccupancyPercent=20"
          "-XX:G1MixedGCLiveThresholdPercent=90"
          "-XX:G1RSetUpdatingPauseTimePercent=5"
          "-XX:SurvivorRatio=32"
          "-XX:+PerfDisableSharedMem"
          "-XX:MaxTenuringThreshold=1"
        ];


        serverConfig = {
          motd = "NixOS-hosted Divine Journey 2 server";
          white-list = true;
          max-players = 1;
          allow-flight = true;
        };
      };
    };
  };
}
