cask "rustrover" do
  arch arm: "-aarch64"

  version "2025.1.4,251.26094.152"
  sha256 arm:   "9f56484888e6b33a034b4d1354a22929b6c701da3da2032ec2b3864b6c973550",
         intel: "c445a87bb152f4486c1e85236778a18dd3b4a3d5cd3e3abc6a2fdd6632dd04a7"

  url "https://download.jetbrains.com/rustrover/RustRover-#{version.csv.first}#{arch}.dmg"
  name "RustRover"
  desc "Rust IDE"
  homepage "https://www.jetbrains.com/rust/"

  livecheck do
    url "https://data.services.jetbrains.com/products/releases?code=RR&latest=true&type=release"
    strategy :json do |json|
      json["RR"]&.map do |release|
        version = release["version"]
        build = release["build"]
        next if version.blank? || build.blank?

        "#{version},#{build}"
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "RustRover.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/rustrover.wrapper.sh"
  binary shimscript, target: "rustrover"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/RustRover.app/Contents/MacOS/rustrover' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/JetBrains/RustRover#{version.major_minor}",
    "~/Library/Caches/JetBrains/RustRover#{version.major_minor}",
    "~/Library/Logs/JetBrains/RustRover#{version.major_minor}",
    "~/Library/Preferences/com.jetbrains.rustrover.plist",
    "~/Library/Saved Application State/com.jetbrains.rustrover.savedState",
  ]
end
