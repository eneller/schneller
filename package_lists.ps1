# Here can you add apps that you want to configure during installation, just add the app id from winget
# dot source this file to use with the script
$apps_gui = @(
#    @{name = "ClamWin.ClamWin" }
);
$apps_basic = @(
    @{name = "Joplin.Joplin" }
    @{name = "Bitwarden.Bitwarden" }
    @{name = "Mozilla.Firefox" }
    # Monitorian sometimes needs to be installed from the store manually
    @{name = "emoacht.Monitorian" }
);
$apps_productivity = @(
    @{name = "Git.Git" }
#    @{name = "Neovim.Neovim" }
#    @{name = "Rustlang.Rustup" }
    @{name = "MusicBrainz.Picard" }
    @{name = "KiCad.KiCad" }
    @{name = "VSCodium.VSCodium" }
#    @{name = "7zip.7zip" }
# TODO choco install autodesk-fusion360
);
$apps_gaming = @(
    @{name = "Valve.Steam" }
    @{name = "Nvidia.GeForceExperience" }
    @{name = "Mojang.MinecraftLauncher" }
);
### These apps are installed silently for all users ###
# for msstore apps you need to specify the source like below
$apps_comms = @(
    @{name = "TeamSpeakSystems.TeamSpeakClient" }
    @{name = "Telegram.TelegramDesktop" }
    @{name = "Discord.Discord" }
#    @{name = "Microsoft.VC++2015-2022Redist-x86" }
#    @{name = "Microsoft.VC++2015-2022Redist-x64" }
#    @{name = "9PMMSR1CGPWG"; source = "msstore" }        # HEIF-PictureExtension
#    @{name = "9MVZQVXJBQ9V"; source = "msstore" }        # AV1 VideoExtension
#    @{name = "9NCTDW2W1BH8"; source = "msstore" }        # Raw-PictureExtension
#    @{name = "9N95Q1ZZPMH4"; source = "msstore" }        # MPEG-2-VideoExtension
);

$apps_all = $apps_basic + $apps_productivity + $apps_gaming + $apps_comms
