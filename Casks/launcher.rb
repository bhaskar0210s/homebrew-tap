cask "launcher" do
  version "1.0.0"
  sha256 "9453fe1463da4c34850c63797033a0b6945a8a138530efc0d8f4e41a7dcd209c"

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
