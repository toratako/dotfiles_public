// Save browsing history
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearOnShutdown.openWindows", false);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
user_pref("privacy.clearSiteData.browsingHistoryAndDownloads", false);
user_pref("privacy.clearHistory.browsingHistoryAndDownloads", false);
user_pref("browser.privatebrowsing.autostart", false);

// Something
user_pref("browser.chrome.site_icons", true);
user_pref("browser.sessionstore.max_tabs_undo", 50);
user_pref("browser.sessionstore.resume_from_crash", true);

// Use system's DoH so disable Firefox's TRR
user_pref("network.trr.mode", 5);

// Enable search suggestions
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.suggest.searches", true);

// Using light theme is painful
user_pref("privacy.resistFingerprinting", false);
user_pref("privacy.resistFingerprinting.pbmode", false);
user_pref("browser.display.use_system_colors", true);

// Always use default download location
user_pref("browser.download.useDownloadDir", true);
user_pref("browser.download.folderList", 1);
user_pref("browser.download.always_ask_before_handling_new_types", false);
user_pref("browser.download.alwaysOpenPanel", true);
