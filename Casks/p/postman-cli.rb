cask "postman-cli" do
  arch arm: "osx_arm64", intel: "osx64"

  version "1.35.0"
  sha256 arm:   "d2fb945076b22be98920a5cbc54ea6df0fbe5ddd927aefb2fc0b09a94490198d",
         intel: "c62b7c7dbd62dfe5f84a6af93d8f5245ebd8face2f12b12168d9fbaf7aaa94a8"

  url "https://dl-cli.pstmn.io/download/version/#{version}/#{arch}",
      verified: "dl-cli.pstmn.io/download/"
  name "Postman CLI"
  desc "CLI for command-line API management on Postman"
  homepage "https://www.postman.com/downloads/"

  livecheck do
    url "https://dl-cli.pstmn.io/api/version/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  binary "postman-cli", target: "postman"

  zap trash: "~/.postman"
end
