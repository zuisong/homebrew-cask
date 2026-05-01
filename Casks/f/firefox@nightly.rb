cask "firefox@nightly" do
  version "152.0a1,2026-04-30-21-29-29"

  language "ca" do
    sha256 "4b1ab025dc0e3a2c5af11d532ca0f7e52e67638cded89aa7a933333df07f2e98"
    "ca"
  end
  language "cs" do
    sha256 "d64414f21b7af748113f73a4d82b07d2e7d20a98f59352894a0c4be651798644"
    "cs"
  end
  language "de" do
    sha256 "d55304e17545283eeea72835216cbbddabb92e46a179a6ba3846407364a642c9"
    "de"
  end
  language "en-CA" do
    sha256 "5dd01c3ca66d6abdcc0fc61bd50bd1c37ffbb6201680a135c3de01ba8bcfcb07"
    "en-CA"
  end
  language "en-GB" do
    sha256 "50dc55f0b6ae8b008844249cf985bf1f9d462b2070c9134b97bb02561741d100"
    "en-GB"
  end
  language "en", default: true do
    sha256 "0dc568a2785d514caa10ffe6ed2a850d72d46430e94194a0efee1531af9ab810"
    "en-US"
  end
  language "es" do
    sha256 "daf6e76527f50ef412754da94a2e3acc567f129219826f3dac403264cadf4c0c"
    "es-ES"
  end
  language "fr" do
    sha256 "8b3997090a52de85dfb36f85842ea8c5487d42ba7e8498c62ad66f1c09c7658d"
    "fr"
  end
  language "it" do
    sha256 "810da7b383df01ea1cd6ff63c204a8a48e7449620a0b6c79e725f00f6953ed38"
    "it"
  end
  language "ja" do
    sha256 "9c93d15136b75c2714785abe457c2407d3416ad1a7fb504ad54742d1c9d0be6a"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "6ff4766ad773dcd3ef6e13b76235f5814cba27bbc62ad58e6b4f0ec412910086"
    "ko"
  end
  language "nl" do
    sha256 "404c2d566951f8c24d8a8ead66e906989f8c2687850ecdde34fa353be1cabfc5"
    "nl"
  end
  language "pt-BR" do
    sha256 "f90141512a2946f5894aa3638ea9b8b56d9b5904b7fc76572258a4a541e93106"
    "pt-BR"
  end
  language "ru" do
    sha256 "a862633d73babe06e00abe1a74d6702259b43286b3417193df2105ee7bbe9490"
    "ru"
  end
  language "uk" do
    sha256 "b15e65cf5a15dbb8bb121437e09737f0dbf84906bcb4bb2f5c2c1e99f935da66"
    "uk"
  end
  language "zh-TW" do
    sha256 "2f5d3df855119fc2884d92316804729c24e3b5fb37b5f517dd3ce3127a5cd12d"
    "zh-TW"
  end
  language "zh" do
    sha256 "979382f0fc57ca96799830813df1cc15485cabfcc174117c38863a61f786d314"
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
