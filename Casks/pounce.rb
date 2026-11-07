cask "pounce" do
  version "1.4.0"
  sha256 "be89643e18c596c6bf06c7fef2a28b58bcd27f9cbc63551a5496c31600cdd4fa"

  url "https://github.com/bhaskar0210s/pounce/releases/download/v#{version}/Pounce.dmg"
  name "Pounce"
  desc "Small, fast app launcher with a calculator"
  homepage "https://github.com/bhaskar0210s/pounce"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Pounce.app"

  # Pounce isn't notarized by Apple. Without the quarantine flag that Homebrew puts on downloads, macOS opens it
  # without asking whether it is free of malware.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pounce.app"]
  end

  uninstall signal: [["TERM", "app.pounce.Pounce"]]

  caveats "Open Pounce once from Applications. After that, press ⌘Space to open it and ⌘, in it to add your apps."

  zap trash: [
    "~/Library/Preferences/app.pounce.Pounce.plist",
  ]
end
