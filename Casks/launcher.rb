cask "launcher" do
  version "1.2.1"
  sha256 "0781d75d1d1b0191585d9bdb7bfeb099fc36c266185dcfaea847a24f168c77b6"

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
