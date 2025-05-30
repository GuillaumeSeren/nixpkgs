{ pkgs, lib, ... }:

# see man:hylafax-config(5)

{

  TagLineFont = "etc/LiberationSans-25.pcf";
  TagLineLocale = "en_US.UTF-8";

  AdminGroup = "root"; # groups that can change server config
  AnswerRotary = "fax"; # don't accept anything else but faxes
  LogFileMode = "0640";
  PriorityScheduling = true;
  RecvFileMode = "0640";
  ServerTracing = "0x78701";
  SessionTracing = "0x78701";
  UUCPLockDir = "/var/lock";

  SendPageCmd = lib.getExe' pkgs.coreutils "false"; # prevent pager transmit
  SendUUCPCmd = lib.getExe' pkgs.coreutils "false"; # prevent UUCP transmit

}
