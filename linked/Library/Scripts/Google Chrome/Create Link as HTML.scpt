JsOsaDAS1.001.00bplist00�Vscript_var chrome = Application('Google Chrome');
var activeTab = chrome.windows[0].activeTab();
var title = activeTab.title();
var url = activeTab.url();

chrome.includeStandardAdditions = true;
chrome.setTheClipboardTo('<a href="' + url + '">' + title + '</a>');                               jscr  ��ޭ