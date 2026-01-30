cask "buildsignal" do
  version "0.0.10"
  sha256 "55d28e12f98b1dda6852b20a5534d744a9630f4e2fa8b6b06aed54493ad54b5c"

  url "https://github.com/hi2gage/BuildSignal/releases/download/v#{version}/BuildSignal-#{version}.zip"
  name "BuildSignal"
  desc "Analyze Xcode build logs and warnings"
  homepage "https://github.com/hi2gage/BuildSignal"

  depends_on macos: ">= :sonoma"

  app "BuildSignal.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/BuildSignal.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.draftroomstudios.BuildSignal.plist",
  ]
end
