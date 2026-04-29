cask "firefox@nightly" do
  version "152.0a1,2026-04-28-21-44-21"

  language "ca" do
    sha256 "26b666423a4208d904bd8fe8c85289f51528a65c6507d090db36e5f8d830a9a2"
    "ca"
  end
  language "cs" do
    sha256 "6e5a927208b373afba66d0b747f60865f71f861542b7489342c439a5081ad428"
    "cs"
  end
  language "de" do
    sha256 "39ad1cc32404e33a7587048cb0c73ba91930041d372905189e673708f92946ee"
    "de"
  end
  language "en-CA" do
    sha256 "a8e9427dfbd3aef361208b672772992c92adee3f4b323ea753dad5aa3b7a8e3b"
    "en-CA"
  end
  language "en-GB" do
    sha256 "abb9455e1880947b56803ff051ba2a0e9456d5a8a46dc4d7cb387e6468706fd8"
    "en-GB"
  end
  language "en", default: true do
    sha256 "4e0c91614cabd00d9267d50a79b62f5254ef814f6e5b326e0dc1a40fb6c22a2e"
    "en-US"
  end
  language "es" do
    sha256 "e64ac0578430ce5d2d285b918955701a115bd5eefbbd67553c5e371ffd24f7ae"
    "es-ES"
  end
  language "fr" do
    sha256 "718f66341cf136759b17042fb618ebb5d4eef713546458405adc329800793019"
    "fr"
  end
  language "it" do
    sha256 "3fb7003659dfa92e20e639ee1bd34764a501ff0ced2f3476d2f8fe8e2c1e7d60"
    "it"
  end
  language "ja" do
    sha256 "98a13f579a21e2cd7ca7b67359aadb2f49cbc34ec8dc3773ebff301f711fdbd2"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "7d86096cc1d713ae77362f698ed58a698adf720b0ef859d5a2c6ba86a47f311f"
    "ko"
  end
  language "nl" do
    sha256 "60ee0756580f43891c18992bdfcc49468bf4f23f2493c9599588d2c4fae788b3"
    "nl"
  end
  language "pt-BR" do
    sha256 "66cb23fd38e1b6797b7cedd28990c70a9e28801a03e28503e87e9540f7676135"
    "pt-BR"
  end
  language "ru" do
    sha256 "e4003d463e6678b5086a2318aa05a53338d7ab51cc32ca77cc65699406f1d6dc"
    "ru"
  end
  language "uk" do
    sha256 "8c677f1e254106f24f44df0ce8e2d30ce876137bdf6ea2bd8c00ec459231d01a"
    "uk"
  end
  language "zh-TW" do
    sha256 "c01f196033da2d8df91161bfddd72d160e8f02d52d26616797c045449c74c53f"
    "zh-TW"
  end
  language "zh" do
    sha256 "b3968c7e81e57c34b93320b63e38dd468d74bea70dd966f0a178be689f70c2c4"
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
