cask "mole" do
  version "1.12.1"
  sha256 "477b20ebaac3e112b64bc07d66c554a66c5080325b965daa1d742e5e6e995766"

  url "https://github.com/ivansaul/homebrew-tools/releases/download/mole@#{version}/Mole-#{version}.dmg"
  name "Mole"
  desc "Deep clean and optimize your Mac"
  homepage "https://mole.fit"

  auto_updates true

  app "Mole.app"
end
