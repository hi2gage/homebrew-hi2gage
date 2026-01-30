cask "buildsignal" do
  version "0.0.3"
  sha256 "50a2821f4a0deda3606ceefbd869b794ef6a4fdd9b06c841315ad64f60dcafd6"

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
