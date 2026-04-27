cask "firefox@nightly" do
  version "152.0a1,2026-04-27-08-37-11"

  language "ca" do
    sha256 "c65244d4a020ca51714f44421a101920d3f580031962c5996a7e8dce8da23a1b"
    "ca"
  end
  language "cs" do
    sha256 "24dde09099036cc68febadf44c348187f5b54b0c18e7d71a0bcd1ca8cab211a6"
    "cs"
  end
  language "de" do
    sha256 "11a1c7095d47b79c5894c53e6d58c17f2561961119422daac7a15f1613070f17"
    "de"
  end
  language "en-CA" do
    sha256 "2c8d884ed3765ed865699b27749697ca0e86f080e63b1354559079baa6ef0508"
    "en-CA"
  end
  language "en-GB" do
    sha256 "361fd738e7aff66093ed3adb18d63456d994a4ade5ab01cdc1708bca86021dc8"
    "en-GB"
  end
  language "en", default: true do
    sha256 "579a79bf34f7c53f0fc82866908a7ec56b9aa3a64be58537c7e8d819c28ec3ca"
    "en-US"
  end
  language "es" do
    sha256 "dce0080f18e252905113aa3870fff4fcf88cda8140c2f39afee6a922a849dd80"
    "es-ES"
  end
  language "fr" do
    sha256 "dd12b0c9341b3775455ad0a60ef9a4844bc09adc5fba727efd5caf7db6664fac"
    "fr"
  end
  language "it" do
    sha256 "d04b75118b4f0f3ae7d37b017e1f1afc1eb14dbe51c4c7fb29e5efba76c0db1b"
    "it"
  end
  language "ja" do
    sha256 "22e8e366412bccc802f72cb98392eb1ca9dfee1a286ba143fd77d9dda1b74c6d"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "ac89b9896b9955c33c43b14ee09b6a02dfa5d0fc8ebe42660bbe8207369c458e"
    "ko"
  end
  language "nl" do
    sha256 "30aefcbfe43f220791e087b495776130ed4782e89e78a410efcad97104385688"
    "nl"
  end
  language "pt-BR" do
    sha256 "b8d2d6e68195a8133f9409b94da7450f15d60bd1b993745691875c3c7cfabe5d"
    "pt-BR"
  end
  language "ru" do
    sha256 "71754369cb33df9da9d3144fcf29c3ce059b215f9773e8f9463c59e66119bc9e"
    "ru"
  end
  language "uk" do
    sha256 "f5f9f9a3d844584ef47ec6d9c1e0192e6fccda51c80c477bf12c5e9a07e01ccf"
    "uk"
  end
  language "zh-TW" do
    sha256 "fe62ac4549ea511c5da89f970a55ba10d7c99997565024c58519348a354b29a0"
    "zh-TW"
  end
  language "zh" do
    sha256 "e071f1081242bec3d09436a3d423281542158e1d961b9a8be6c6e51a1ed41200"
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
