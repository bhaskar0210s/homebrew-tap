cask "launcher" do
  version "1.1.0"
  sha256 "23625308fb2b01dd2b17a4f4cb73ab691c4c044aea7db5ac99a556f40784b8b4"

  url "https://github.com/bhaskar0210s/launcher/releases/download/v#{version}/Launcher.dmg"
  name "Launcher"
  desc "Small, fast app launcher with a calculator"
  homepage "https://github.com/bhaskar0210s/launcher"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Launcher.app"

  # Launcher isn't notarized by Apple. Without the quarantine flag that Homebrew puts on downloads, macOS opens it
  # without asking whether it is free of malware.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Launcher.app"]
  end

  uninstall signal: [["TERM", "app.launcher.Launcher"]]

  caveats "Open Launcher once from Applications. After that, press ⌘Space to open it and ⌘, in it to add your apps."

  zap trash: [
    "~/Library/Preferences/app.launcher.Launcher.plist",
  ]
end
