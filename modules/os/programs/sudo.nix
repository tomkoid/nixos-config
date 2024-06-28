{ ... }:

{
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
      Defaults timestamp_timeout=60
    '';
  };
}
