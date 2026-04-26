cask "firefox@nightly" do
  version "152.0a1,2026-04-26-08-44-40"

  language "ca" do
    sha256 "f34c9f4153b4a01914bdbea71fa3eebeab64a5715a274f1881342c8a3589754e"
    "ca"
  end
  language "cs" do
    sha256 "aad37d5ee7a9d2a1df92d1fa94a2a1b69520e1cb275dc0f0681f4bc712f8dff4"
    "cs"
  end
  language "de" do
    sha256 "16f46404f844ce296d2d4db641b0c10e64379c3f27211e936f979e5948481096"
    "de"
  end
  language "en-CA" do
    sha256 "9fdd61c964033dba737f8a7f7c9ddf9ea7478e2440cb3d0557562f8f1c249908"
    "en-CA"
  end
  language "en-GB" do
    sha256 "f84dbe02cb54725b3816933e24a55070d94b89ac25ac2c29a8c3ac2e801610a5"
    "en-GB"
  end
  language "en", default: true do
    sha256 "d5f02f5b443f583c7480cc45efda974973e6acc265df7162c105f3dbeb58d582"
    "en-US"
  end
  language "es" do
    sha256 "1812368dda9d66ec798f73ad94420a1c07e2f8f3c198664af305345c3e68d3a8"
    "es-ES"
  end
  language "fr" do
    sha256 "fa1505acafefc37feb539e01cfcc2f26245565ff4f0cd913861ff15feba3cc0e"
    "fr"
  end
  language "it" do
    sha256 "1aa42e5af554656506a72bf9cb6fc9bc9c2a98913b64ad0a2970542ee47f25d2"
    "it"
  end
  language "ja" do
    sha256 "a5539fe1e796de06202271755c172d03e3a0255bd0e1f79e11a9a500e9cc3e5a"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "61722e5afe08c5368d5a97ee251c472dc48373e4dba989d6e4f0f570ad7efcd8"
    "ko"
  end
  language "nl" do
    sha256 "0ccd84a85e3d6f1e1ffc3b52032574d84913d11238d217eb51b7a2c4ffaa7e61"
    "nl"
  end
  language "pt-BR" do
    sha256 "e5993cb77152e8968a180ac12e7c851c29a8ce298afa8940c30cd556cefebb8e"
    "pt-BR"
  end
  language "ru" do
    sha256 "84a47714e8a1d13a690f5befd5d4ce59fb2bc8077bb949f228f0e8bf819646ec"
    "ru"
  end
  language "uk" do
    sha256 "2e4ba931d28d0b899ef1a77d03088f820bb23a62bdb2dd9711ce2ae4b10e74b5"
    "uk"
  end
  language "zh-TW" do
    sha256 "24c666ed90cfe59b76e52e31c7ea4cefe1987e20a5b66f3fe5caa35b040682e1"
    "zh-TW"
  end
  language "zh" do
    sha256 "13c65dd5b27c2bd1843227532ce7dbda9562769c920204b2f6b76ccf5e19757e"
    "zh-CN"
  end

  url "https://ftp.mozilla.org/pub/firefox/nightly/#{version.csv.second.split("-").first}/#{version.csv.second.split("-").second}/#{version.csv.second}-mozilla-central#{"-l10n" if language != "en-US"}/firefox-#{version.csv.first}.#{language}.mac.dmg"
  name "Mozilla Firefox Nightly"
  desc "Web browser"
  homepage "https://www.mozilla.org/firefox/channel/desktop/#nightly"

  livecheck do
    url "https://product-details.mozilla.org/1.0/firefox_versions.json"
    regex(%r{/(\d+(?:[._-]\d+)+)[^/]*/firefox}i)
    strategy :json do |json, regex|
      version = json["FIREFOX_NIGHTLY"]
      next if version.blank?

      content = Homebrew::Livecheck::Strategy.page_content("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-#{version}.en-US.mac.buildhub.json")
      next if content[:content].blank?

      build_json = Homebrew::Livecheck::Strategy::Json.parse_json(content[:content])
      build = build_json.dig("download", "url")&.[](regex, 1)
      next if build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Firefox Nightly.app"

  zap trash: [
        "/Library/Logs/DiagnosticReports/firefox_*",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.firefox.sfl*",
        "~/Library/Application Support/CrashReporter/firefox_*",
        "~/Library/Application Support/Firefox",
        "~/Library/Caches/Firefox",
        "~/Library/Caches/Mozilla/updates/Applications/Firefox",
        "~/Library/Caches/org.mozilla.firefox",
        "~/Library/Preferences/org.mozilla.firefox.plist",
        "~/Library/Saved Application State/org.mozilla.firefox.savedState",
        "~/Library/WebKit/org.mozilla.firefox",
      ],
      rmdir: [
        "~/Library/Application Support/Mozilla", #  May also contain non-Firefox data
        "~/Library/Caches/Mozilla",
        "~/Library/Caches/Mozilla/updates",
        "~/Library/Caches/Mozilla/updates/Applications",
      ]
end
