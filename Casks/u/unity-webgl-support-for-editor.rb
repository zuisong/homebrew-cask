cask "unity-webgl-support-for-editor" do
  version "2023.1.16f1,e5ad54273a6f"
  sha256 "a66f575b40f26c89833eefe96c537c396ecb33965711c31ce8d4b03b02ce908b"

  url "https://download.unity3d.com/download_unity/#{version.csv.second}/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-#{version.csv.first}.pkg",
      verified: "download.unity3d.com/download_unity/"
  name "Unity WebGL Build Support"
  desc "WebGL target support for Unity"
  homepage "https://unity.com/products"

  livecheck do
    url "https://public-cdn.cloud.unity3d.com/hub/prod/releases-darwin.json"
    regex(%r{
        /download_unity/(\h+)/MacEditorTargetInstaller
        /UnitySetup-WebGL-Support-for-Editor-(\d+(?:\.\d+)+[a-z]*\d*)\.pkg
      }ix)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[1]},#{match[0]}" }
    end
  end

  depends_on cask: "unity"

  pkg "UnitySetup-WebGL-Support-for-Editor-#{version.csv.first}.pkg"

  uninstall pkgutil: "com.unity3d.WebGLSupport"
end
