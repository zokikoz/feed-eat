# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Channel.delete_all
Channel.create!(link: 'https://www.ruby-lang.org/en/feeds/news.rss')
Channel.create!(link: 'https://weblog.rubyonrails.org/feed/atom.xml')

Item.delete_all
Item.create!(channel_id: 1, guid: 'https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/',
             title: 'Ruby 3.0.1 Released', link: 'https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/',
             description: '<p>Ruby 3.0.1 has been released.</p>\n\n<p>This release includes security fixes.\nPlease check the topics below for details.</p>\n\n<ul>\n  <li><a href=\"/en/news/2021/04/05/xml-round-trip-vulnerability-in-rexml-cve-2021-28965/\">CVE-2021-28965: XML round-trip vulnerability in REXML</a></li>\n  <li><a href=\"/en/news/2021/04/05/tempfile-path-traversal-on-windows-cve-2021-28966/\">CVE-2021-28966: Path traversal in Tempfile on Windows</a></li>\n</ul>\n\n<p>See the <a href=\"https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1\">commit logs</a> for details.</p>\n\n<h2>Download</h2>\n\n<ul>\n  <li>\n    <p><a href=\"https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.gz\">https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.gz</a></p>\n\n    <div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>SIZE: 19664598\nSHA1: 60c72f3e501a3be9616385cad3e48bc89d6150a1\nSHA256: 369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727\nSHA512: cb81db2c9b698cf8159b2ca6507f4c7f171e4eb387f5730c4b658ed632b7900a169808e6fbec0ee80598d937030ad5d9c56b63a2a339373ec5d9e1c06b7661d0\n</code></pre></div>    </div>\n  </li>\n  <li>\n    <p><a href=\"https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.xz\">https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.xz</a></p>\n\n    <div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>SIZE: 14486780\nSHA1: 3c5443960fe860ff7055bc02a4793140b9fb9b28\nSHA256: d06bccd382d03724b69f674bc46cd6957ba08ed07522694ce44b9e8ffc9c48e2\nSHA512: 97d2e883656060846b304368d9d836e2f3ef39859c36171c9398a0573818e4ed75bfd7460f901a9553f7f53518c505327a66e74f83704a881469f5ac61fe13d7\n</code></pre></div>    </div>\n  </li>\n  <li>\n    <p><a href=\"https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.zip\">https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.zip</a></p>\n\n    <div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>SIZE: 24014727\nSHA1: 311164da8f68abb58f8590356bf492fc2ab80192\nSHA256: c8703c33904c79613a41a750cc62d210c3c57fec0728476d66b0a9031a499d68\nSHA512: 395cdbd7fd42f0d2b42208c390db7ac2ed8d3e247d9b7fdaa43347a815b108a3680cbebf2ab8f05ec468ff02c832e2f3c1399e616f0f3e3016f6a6e894811b01\n</code></pre></div>    </div>\n  </li>\n</ul>\n\n<h2>Release Comment</h2>\n\n<p>Many committers, developers, and users who provided bug reports helped us make this release.\nThanks for their contributions.</p>\n\n<p>Posted by naruse on 5 Apr 2021</p>',
             pub_date: 'Mon, 05 Apr 2021 12:00:00.000000000 UTC +00:00')

Item.create!(channel_id: 2, guid: 'https://weblog.rubyonrails.org/2021/2/17/Rails-6-1-3-has-been-released',
             title: 'Rails 6.1.3 has been released',
             link: 'https://weblog.rubyonrails.org/2021/2/17/Rails-6-1-3-has-been-released/',
             description: '<p>Hi everyone,</p>\n\n<p>I am happy to announce that Rails 6.1.3 has been released.</p>\n\n<h2 id=\"changes-since-612\">CHANGES since 6.1.2</h2>\n\n<p>To view the changes for each gem, please read the changelogs on GitHub:</p>\n<ul>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/actioncable/CHANGELOG.md\">Action Cable CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/actionmailbox/CHANGELOG.md\">Action Mailbox CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/actionmailer/CHANGELOG.md\">Action Mailer CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/actionpack/CHANGELOG.md\">Action Pack CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/actiontext/CHANGELOG.md\">Action Text CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/actionview/CHANGELOG.md\">Action View CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/activejob/CHANGELOG.md\">Active Job CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/activemodel/CHANGELOG.md\">Active Model CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/activerecord/CHANGELOG.md\">Active Record CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/activestorage/CHANGELOG.md\">Active Storage CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/activesupport/CHANGELOG.md\">Active Support CHANGELOG</a></li>\n  <li><a href=\"https://github.com/rails/rails/blob/v6.1.3/railties/CHANGELOG.md\">Railties CHANGELOG</a></li>\n</ul>\n\n<p>To see a summary of changes, please read the release on GitHub:</p>\n\n<p><a href=\"https://github.com/rails/rails/releases/tag/v6.1.3\">6.1.3 CHANGELOG</a></p>\n\n<p><em>Full listing</em></p>\n\n<p>To see the full list of changes, <a href=\"https://github.com/rails/rails/compare/v6.1.2...v6.1.3\">check out all the commits on\nGitHub</a>.</p>\n\n<h2 id=\"sha-256\">SHA-256</h2>\n\n<p>If you’d like to verify that your gem is the same as the one I’ve uploaded,\nplease use these SHA-256 hashes.</p>\n\n<p>Here are the checksums for 6.1.3:</p>\n\n<div class=\"language-plaintext highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>$ shasum -a 256 *-6.1.3.gem\n3bc59df7dfa5bebda5fb50dd52df7f8bac824bbcb209353b9d3bd0fa000debb1  actioncable-6.1.3.gem\nb7291919c0b89c4c1aef58fe8dd265f94332929d4ff938919cc011db89b86273  actionmailbox-6.1.3.gem\n49ad423587cde9032ae01ca209ea52cda6b689a192e27663ba23626e58252c52  actionmailer-6.1.3.gem\n05ef482bcaa6390de3518468aaa199c4c13c32e7eba7462e2b2cd23fb5f21e0c  actionpack-6.1.3.gem\n0f436e5d135f5c1324d534cf66961482593051343575d0dffa4b03223bf96412  actiontext-6.1.3.gem\n857fa724c5470f79e245978b13feba877e41d8bb367c4aca0b2d9eb85460b3e8  actionview-6.1.3.gem\naed2cbf9396239f2766e75cd72e47ad361b7ed4f1ce0ad65d7b441a60046ad9c  activejob-6.1.3.gem\ne02c3751e0768bf4732d2ca9595628fc5edcb2e429ff625eff2d3406402ea81e  activemodel-6.1.3.gem\n7ac74827f02bbd01be23cae93b8fcb22e77b2e9557b62813e231354ef536790e  activerecord-6.1.3.gem\n91342af6501c5d37a8d401c99520c69da1ff27086b7c1f6f6ff5235ee2da7d3e  activestorage-6.1.3.gem\n1009ad0f8a8bd3f752b59b25f60bf4dbb59ab115537d68a6f785a347cc6a4401  activesupport-6.1.3.gem\n7f097f7c565c7ce6c9a0c07345c3af61f9776d65b9bee2fda72718a53db3aa41  rails-6.1.3.gem\n2a133eeb9b2b19530ce049716268ae74c508e7cd7b0489c602983dc75af10599  railties-6.1.3.gem\n</code></pre></div></div>\n\n<p>As always, huge thanks to the many contributors who helped with this release.</p>',
             pub_date: 'Wed, 17 Feb 2021 18:45:27.000000000 UTC +00:00')
