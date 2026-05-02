cask "firefox@nightly" do
  version "152.0a1,2026-05-02-09-31-30"

  language "ca" do
    sha256 "8082e47dea83bdab7109c1962ce5002fd429280c39e82133da68a5b9e68528e5"
    "ca"
  end
  language "cs" do
    sha256 "d7afa58403ded376779e18e9e812b7c5aae7ea6706aad167dc3121d8cd4a3611"
    "cs"
  end
  language "de" do
    sha256 "10e7253cac8ad570e39d281131fe8561582e0e3e95fb4e283efcd0e6ed37e0f6"
    "de"
  end
  language "en-CA" do
    sha256 "9a0f62b6586063d89b3a7bba6600a4a0a2b565a0768eb91ff6343ee180bb927c"
    "en-CA"
  end
  language "en-GB" do
    sha256 "72c19caea558cc97d9134909decfe381892182b712054c145920db1de460a301"
    "en-GB"
  end
  language "en", default: true do
    sha256 "7f5372304b66dcf6798339798a2554baa1f0ff1d921f3b89dd066baf4ab05254"
    "en-US"
  end
  language "es" do
    sha256 "5e8e1f7e82fd6d95f6ed37b0e043539a52a87e6dd39301d051f41178fb30b452"
    "es-ES"
  end
  language "fr" do
    sha256 "0f8f63cef3a152f223c10343dcd58ac201559e817d18cbb6ed33c6135ee9b448"
    "fr"
  end
  language "it" do
    sha256 "22c39b9dfb5350a96ccbd91f6574f804b72c2f2c8bbc4438e480b46e14f323cd"
    "it"
  end
  language "ja" do
    sha256 "6eb79c9d9a748f9400f5db2f0189625b20ccad3d05de5890fff41587b61b97fc"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "0d40a55c4582d07d553694f44198d92b22a7a1fa3d53519de3c2f74ecc3d5373"
    "ko"
  end
  language "nl" do
    sha256 "8718e7cdeb036c42a50ce1d33637ddb5792210d50342f76ffee81eaf6ead4680"
    "nl"
  end
  language "pt-BR" do
    sha256 "a4ab5f6a0f77b313677d0c645c5508f5cc5587cee97e83ab50e0cf9f37db5426"
    "pt-BR"
  end
  language "ru" do
    sha256 "09729fd19a5f467e3372119c23f71f90cb090cba59cd70162ea7097e4eb04249"
    "ru"
  end
  language "uk" do
    sha256 "46bc11ea501e7b36a832dd2cf5d223a99d87b5b56d61861b1bd96c1cb6385409"
    "uk"
  end
  language "zh-TW" do
    sha256 "1cf7ab203b40fa9349bd6661d2b6822fb4b62da93d0cc50ab9135edc60571a4f"
    "zh-TW"
  end
  language "zh" do
    sha256 "1240206b18b53911e4ca2dbcf1d36ec21c94992ef817559aeb9fa8789c9fc349"
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
