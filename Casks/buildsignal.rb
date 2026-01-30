cask "buildsignal" do
  version "0.0.1"
  sha256 "584cc4eb56ea86c3ba4aeade294436965e1b6e3df6a921f2c498f7142b110f19"

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
