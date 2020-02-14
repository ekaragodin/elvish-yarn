use github.com/zzamboni/elvish-completions/comp

options = [
  [&long=offline &desc="trigger an error if any required dependencies are not available in local cache"]
  [&long=prefer-offline &desc="use network only if dependencies are not available in local cache"]
  [&short=s &long=silent &desc="skip Yarn console logs, other types of logs (script output) will be printed"]
  [&short=v &long=version &desc="output the version number"]
  [&short=h &long=help &desc="output usage information"]
]

add-options = [
  [&short=D &long=dev &desc="save package to your `devDependencies`"]
  [&short=P &long=peer &desc="save package to your `peerDependencies`"]
  [&short=O &long=optional &desc="save package to your `optionalDependencies`"]
  [&short=E &long=exact &desc="install exact version"]
  [&short=T &long=tilde &desc="install most recent release with the same minor version"]
  [&short=A &long=audit &desc="Run vulnerability audit on installed packages"]
]

completions = [
  &access
  &add= (comp:sequence [] &opts= $add-options)
  &audit &utoclean &bin &cache &check &config &create &exec &generate-lock-entry &generateLockEntry
  &global= (comp:item [add bin dir ls list remove upgrade upgrade-interactive])
  &help
  &import &info &init &install &licenses &link &list &login &logout &node &outdated &owner &pack
  &policies &publish &remove &run &tag &team &unlink &unplug &upgrade &upgrade-interactive &upgradeInteractive
  &version &versions &why &workspace &workspaces
]

completions[help] = (comp:item [(keys $completions)])

edit:completion:arg-completer[yarn] = (comp:subcommands &opts=$options $completions)
