cask "buildsignal" do
  version "0.1.0"
  sha256 "816f65c5acf3cf6509acae1b71020dab9e26b884d517f99747e61e35ed32c419"

  url "https://github.com/hi2gage/BuildSignal/releases/download/v#{version}/BuildSignal-#{version}.zip"
  name "BuildSignal"
  desc "Analyze Xcode build logs and warnings"
  homepage "https://github.com/hi2gage/BuildSignal"

  depends_on macos: ">= :sonoma"

  app "BuildSignal.app"

  zap trash: [
    "~/Library/Preferences/com.draftroomstudios.BuildSignal.plist",
  ]
end
