FactoryBot.define do
  factory :channel do
    id { 1 }
    link { 'https://www.ruby-lang.org/en/feeds/news.rss' }
  end

  factory :item do
    before(:create) { FactoryBot.create(:channel) }
    id { 1 }
    channel_id { 1 }
    guid { 'https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/' }
    title { 'Ruby 3.0.1 Released' }
    link { 'https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/' }
    description { '<p>Ruby 3.0.1 has been released.</p>\n\n<p>This release includes security fixes.\nPlease check the topics below for details.</p>\n\n<ul>\n  <li><a href=\"/en/news/2021/04/05/xml-round-trip-vulnerability-in-rexml-cve-2021-28965/\">CVE-2021-28965: XML round-trip vulnerability in REXML</a></li>\n  <li><a href=\"/en/news/2021/04/05/tempfile-path-traversal-on-windows-cve-2021-28966/\">CVE-2021-28966: Path traversal in Tempfile on Windows</a></li>\n</ul>\n\n<p>See the <a href=\"https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1\">commit logs</a> for details.</p>\n\n<h2>Download</h2>\n\n<ul>\n  <li>\n    <p><a href=\"https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.gz\">https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.gz</a></p>\n\n    <div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>SIZE: 19664598\nSHA1: 60c72f3e501a3be9616385cad3e48bc89d6150a1\nSHA256: 369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727\nSHA512: cb81db2c9b698cf8159b2ca6507f4c7f171e4eb387f5730c4b658ed632b7900a169808e6fbec0ee80598d937030ad5d9c56b63a2a339373ec5d9e1c06b7661d0\n</code></pre></div>    </div>\n  </li>\n  <li>\n    <p><a href=\"https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.xz\">https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.xz</a></p>\n\n    <div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>SIZE: 14486780\nSHA1: 3c5443960fe860ff7055bc02a4793140b9fb9b28\nSHA256: d06bccd382d03724b69f674bc46cd6957ba08ed07522694ce44b9e8ffc9c48e2\nSHA512: 97d2e883656060846b304368d9d836e2f3ef39859c36171c9398a0573818e4ed75bfd7460f901a9553f7f53518c505327a66e74f83704a881469f5ac61fe13d7\n</code></pre></div>    </div>\n  </li>\n  <li>\n    <p><a href=\"https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.zip\">https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.zip</a></p>\n\n    <div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>SIZE: 24014727\nSHA1: 311164da8f68abb58f8590356bf492fc2ab80192\nSHA256: c8703c33904c79613a41a750cc62d210c3c57fec0728476d66b0a9031a499d68\nSHA512: 395cdbd7fd42f0d2b42208c390db7ac2ed8d3e247d9b7fdaa43347a815b108a3680cbebf2ab8f05ec468ff02c832e2f3c1399e616f0f3e3016f6a6e894811b01\n</code></pre></div>    </div>\n  </li>\n</ul>\n\n<h2>Release Comment</h2>\n\n<p>Many committers, developers, and users who provided bug reports helped us make this release.\nThanks for their contributions.</p>\n\n<p>Posted by naruse on 5 Apr 2021</p>' }
    pub_date { 'Mon, 05 Apr 2021 12:00:00.000000000 UTC +00:00' }
  end
end
