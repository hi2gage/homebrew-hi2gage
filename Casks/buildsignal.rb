cask "buildsignal" do
  version "0.0.6"
  sha256 "8dba80c325ccee55401ea46be9cdee0e796900c32443757db2478c94fd4282fe"

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
