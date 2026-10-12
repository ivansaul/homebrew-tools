cask "aldente" do
  version "1.36"
  sha256 "56d9ddebb3059e11e8118a6418c404287d2653bd634adaf86bbaaedfc9839426"

  url "https://github.com/ivansaul/homebrew-tools/releases/download/aldente@#{version}/AlDente-#{version}.dmg"
  name "AlDente"
  desc "Menu bar tool to limit maximum charging percentage"
  homepage "https://apphousekitchen.com/"

  # The Sparkle feed can contain items on the "beta" channel, so we restrict
  # matching to the default channel.
  livecheck do
    url "https://apphousekitchen.com/aldente/aldenteproappcast.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.short_version
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "AlDente.app"

  uninstall launchctl:  "com.apphousekitchen.aldente-pro.helper",
            quit:       "com.apphousekitchen.aldente-pro",
            login_item: "AlDente",
            delete:     "/Library/PrivilegedHelperTools/com.apphousekitchen.aldente-pro.helper"

  zap trash: [
    "~/Library/Application Support/AlDente",
    "~/Library/Caches/com.apphousekitchen.aldente-pro",
    "~/Library/HTTPStorages/com.apphousekitchen.aldente-pro",
    "~/Library/HTTPStorages/com.apphousekitchen.aldente-pro.binarycookies",
    "~/Library/Preferences/com.apphousekitchen.aldente-pro.plist",
    "~/Library/Preferences/com.apphousekitchen.aldente-pro_backup.plist",
    "~/Library/Preferences/com.apphousekitchen.aldente-pro_stats.sqlite3",
  ]
end
