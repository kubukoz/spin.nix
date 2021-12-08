{ buildGoModule, gitignore-source, sources }:
let version = "1.22.0"; in
buildGoModule {
  pname = "spin";
  inherit version;
  vendorSha256 = "sha256-tehTguY/PqgmmAqMDH/w6oG2jvC/pXqf+/Ix/YNMsF0=";
  src = gitignore-source.lib.gitignoreSource sources;
}
