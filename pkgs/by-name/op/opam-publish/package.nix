{
  lib,
  fetchFromGitHub,
  ocamlPackages,
}:

let
  inherit (ocamlPackages)
    buildDunePackage
    cmdliner
    github
    github-unix
    lwt_ssl
    opam-core
    opam-format
    opam-state
    ;
in

buildDunePackage rec {
  pname = "opam-publish";
  version = "2.5.1";

  src = fetchFromGitHub {
    owner = "ocaml-opam";
    repo = "opam-publish";
    rev = version;
    hash = "sha256-clTEm2DGxcNsv+Y1wwWwnM/lrRJDQBHsncwrdqVWA5U=";
  };

  buildInputs = [
    cmdliner
    lwt_ssl
    opam-core
    opam-format
    opam-state
    github
    github-unix
  ];

  meta = with lib; {
    homepage = "https://github.com/ocaml-opam/opam-publish";
    description = "Tool to ease contributions to opam repositories";
    mainProgram = "opam-publish";
    license = with licenses; [
      lgpl21Only
      ocamlLgplLinkingException
    ];
    maintainers = with maintainers; [ niols ];
  };
}
