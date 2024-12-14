{inputs, username, ...}: 
let 
  secretspath = builtins.toString inputs.secrets;
in
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [
        "/home/${username}/.ssh/id_ed25519"
      ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      domain = {
        owner = "${username}";
      };
    };
  };
}
