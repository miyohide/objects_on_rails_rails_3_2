# これは何か？

* このページは横浜タネマキさんで毎週土曜日の朝に開催している『Objects on Rails』読書会の私的なメモです。
* また、ソースコードはRails 3.2でサンプルアプリの実装例です。

# 読書会メモ

## 2013年11月16日（土）第3回読書会
### 実施範囲
* P29の「Aside: subject and let」からP42の「Object Trees and Lone Wolves」の前まで1

### 所感
* `subject`と`let`はRSpecから持ってきたもの。MiniTestの新しいバージョンか、Ruby 1.9.3から使える。
  * この本ではあまり`subject`と`let`を使っていない。
  * 本文中で「After I completed most of the examples in this text ...」とあるので、本のものはこのまんまにしているのかな。
* P30の Posts vs. Entriesの話。
  * Postには色々な種類がありえる（写真とかビデオとか）ので、それを満たすために、`blog.new_post`としたほうがよい。
  * idが分かってしまった場合、第三者のPostを更新出来てしまう。
  * ここの理論がよく分からない。
* P32のList12はちょっとやり過ぎな感がある。
* P33のpublishについて。実際に扱うドメインと合わせてメソッド名を決めるというものの好例。
* MiniTestのMockは書きにくい気がする。ゆとりで済みません。
* P40のActiveModel::NamingのextendとActiveModel::Conversionのincludeについて。Rails3においてはpersisted?はお約束的に書く必要があったが、Rails4からはinclude ActiveModel::Modelが出てきてこれだけでOKとなった。
* P42のListing 32でのグローバル変数の使い道はすごく違和感がある。気持ち悪い。

## 2013年11月9日（土）第2回読書会
### 実施範囲
* P19の「About the approach」からP29の「Aside: subject and let」の前まで。

### 所感
* Introductionは英語の文章に四苦八苦。とりあえず、前にわからない文章で止まるのではなく、前に進めていくことにする。
* この本のアプローチとしてはTDDで。しかしながら、Unitテストレベルまでで留めている。Cucumberを使った受け入れテストのようなものは付録Bを参照とのこと。
* 本文中に出ている"deluxe edition"はPDFでダウンロード出来る奴のもの。ソースコードもついているけど、コミット単位が本に記載のものとは違う感じ。
* P20に書かれているブロックの使い分け（ブレースとdo...end）について紹介されていた[エントリ](http://onestepback.org/index.cgi/Tech/Ruby/BraceVsDoEnd.rdoc)は非常に参考になる。
* P22からソースコードが出てきて、ちょっとホッとする。
* プロジェクト名が「bloog」になっている。これの説明が直後のNoteにかかれているけど、それは単にネーミングが悪いんじゃないだろうか。
  * →それについてはP30の「Posts vs. Entries」に書かれているような気がする。
* P23のBlogクラスについて。app/modelsの下に置いているけど、この時点ではActiveRecord::Baseを継承していない。
* P27にて突然出てきた#new_postメソッド。このメソッドをわざわざ作る意味がよく分からない。
  * →あとで説明があるんじゃないかな。P30の部分がそうかもしれない。
* P28の#new_postメソッドに対するテストコードについて。OpenStructを使ってスタブのようなものを作っているのが興味深い。
* P29の#new_postメソッドの実装はもう少し違う書き方ができるような気がする。

## 2013年10月19日（土）第1回読書会
### 実施範囲

* ContentsからIntroductionのWhat this is notまで

### 所感

* まだ本文には入っていないので、「こんなこと書かれているんだな。」と感触を覚えただけ。
* 英語のハードルが高いので、事前に予習をして丁寧に読んでいきたい。

