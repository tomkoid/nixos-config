{ lib
, buildGoModule
, fetchFromGitea
}:

buildGoModule rec {
  pname = "supershush";
  version = "0.2.1";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "tomkoid";
    repo = pname;
    rev = version;
    hash = "sha256-PkBzqplgX7sXoZFhq1J4RttNDayz/B4KoUudLWI2uuA=";
  };

  vendorHash = null;

  meta = with lib; {
    description = "Stop audio from playing when the audio output changes";
    homepage = "https://codeberg.org/tomkoid/supershush";
    license = licenses.mit;
    changelog = "https://codeberg.org/tomkoid/supershush/releases";
    maintainers = with maintainers; [ tomkoid ];
    mainProgram = "supershush";
  };
}
