# Here can you add apps that you want to configure during installation, just add the app id from winget
# dot source this file to use with the script
$apps_gui = @(
#    @{name = "ClamWin.ClamWin" }
);
$apps_basic = @(
    @{name = "Joplin.Joplin" }
    @{name = "Bitwarden.Bitwarden" }
    @{name = "Mozilla.Firefox" }
    @{name = "emoacht.Monitorian" }
);
$apps_productivity = @(
    @{name = "Git.Git" }
    @{name = "Neovim.Neovim" }
    @{name = "Rustlang.Rustup" }
    @{name = "MusicBrainz.Picard" }
    @{name = "KiCad.KiCad" }
#    @{name = "7zip.7zip" }
#    choco install autodesk-fusion360
);
$apps_gaming = @(
    @{name = "Valve.Steam" }
    @{name = "Nvidia.GeForceExperience" }
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

$apps_bloatware = @(
    # default Windows 11 apps
    "MicrosoftTeams"
    "Microsoft.Todos"
    "Microsoft.PowerAutomateDesktop"

    # default Windows 10 apps
    "Microsoft.549981C3F5F10"        # Cortana Offline
    "Microsoft.OneDriveSync"         # Onedrive
    "Microsoft.3DBuilder"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.FreshPaint"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MinecraftUWP"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"
    "Microsoft.People"
    "Microsoft.Print3D"    
    "Microsoft.WindowsAlarms"
    # "microsoft.windowscommunicationsapps"        # Mail and Calender     
    "Microsoft.WindowsMaps"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.ZuneVideo"
    "Microsoft.YourPhone"
    # "Microsoft.MSPaint"          # Paint & Paint3D
    # "Microsoft.ZuneMusic"        # New Media Player in Windows

    # Xbox Apps
    # "Microsoft.Xbox.TCUI"
    # "Microsoft.XboxApp"
    # "Microsoft.XboxGameOverlay"
    # "Microsoft.XboxGamingOverlay"
    # "Microsoft.XboxIdentityProvider"
    # "Microsoft.XboxSpeechToTextOverlay"

    # Threshold 2 apps
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"

    # Creators Update apps
    "Microsoft.Microsoft3DViewer"

    #Redstone apps
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.WindowsReadingList"

    # Redstone 5 apps
    "Microsoft.MixedReality.Portal"
    "Microsoft.Whiteboard"

    # non-Microsoft
    # "4DF9E0F8.Netflix"
    # "SpotifyAB.SpotifyMusic"
    "2FE3CB00.PicsArt-PhotoStudio"
    "46928bounde.EclipseManager"
    "613EBCEA.PolarrPhotoEditorAcademicEdition"
    "6Wunderkinder.Wunderlist"
    "7EE7776C.LinkedInforWindows"
    "89006A2E.AutodeskSketchBook"
    "9E2F88E3.Twitter"
    "A278AB0D.DisneyMagicKingdoms"
    "A278AB0D.MarchofEmpires"
    "ActiproSoftwareLLC.562882FEEB491"
    "CAF9E577.Plex"
    "ClearChannelRadioDigital.iHeartRadio"
    "D52A8D61.FarmVille2CountryEscape"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "DolbyLaboratories.DolbyAccess"
    "DolbyLaboratories.DolbyAccess"
    "Drawboard.DrawboardPDF"
    "Facebook.Facebook"
    "Fitbit.FitbitCoach"
    "Flipboard.Flipboard"
    "GAMELOFTSA.Asphalt8Airborne"
    "KeeperSecurityInc.Keeper"
    "NORDCURRENT.COOKINGFEVER"
    "PandoraMediaInc.29680B314EFC2"
    "Playtika.CaesarsSlotsFreeCasino"
    "ShazamEntertainmentLtd.Shazam"
    "SlingTVLLC.SlingTV"
    "TheNewYorkTimes.NYTCrossword"
    "ThumbmunkeysLtd.PhototasticCollage"
    "TuneIn.TuneInRadio"
    "WinZipComputing.WinZipUniversal"
    "XINGAG.XING"
    "flaregamesGmbH.RoyalRevolt2"
    "king.com.*"
    "king.com.BubbleWitch3Saga"
    "king.com.CandyCrushSaga"
    "king.com.CandyCrushSodaSaga"
);

