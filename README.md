# これは何か？

* このページは横浜タネマキさんで毎週土曜日の朝に開催している『Objects on Rails』読書会の私的なメモです。
* また、ソースコードはRails 3.2でサンプルアプリの実装例です。

# 読書会メモ

## 2013年12月21日（土）第6回読書会
### 実施範囲

* P55の第一段落「... while still having sensible built-in defaults for those dependencies.」からP60まで。

### 所感

* `publish`メソッドが引数に`clock`を取るようになったおかげで、過去日付や未来日付の`Post`も実装可能となった。
* Listing 47ではOpenStructを使ってモックの役割を果たすfixed_clockを作っている。
* Listing 48ではDelayClockというクラスを使って、遅延投稿機能を実装している。
* P56から始まる「Injecting only the dependencies we neeed」がよく分からない。
  * いきなり`@post_class`が出てくるんだけど、こいつは何者？
  * `@post_source`を導入した理由を述べているみたい。
    * `Post.new`をoverrideするのは他のテストへの影響が大きいため。
    * 理由2.が分からない・・・
  * `blog.post_source = -> { new_post }`で新しい`Post`のインスタンスを表すことができるのが楽ってことを言いたいのかな。
* P57では`post_source`はFactory patternのfactoryであると書かれている。ま、これはそうだよね、ということで納得。
* P60で`add_entry`では`entries`を`@entries`に変更している。
  * `entries`をメソッドとして定義したため。

## 2013年12月14日（土）第5回読書会
### 実施範囲

* P46の「Getting the tests running again」からP55の第一段落「... while still having sensible built-in defaults for those dependencies.」まで。

### 所感

* テストっていつ壊れたんだろう。
  * P40でPostクラスに対して、ActiveModel::Namingをextendして、ActiveModel::Conversionをincludeしているので、ここで落ちている。
* P46のListing 35ではからのActiveModel::NamingとActiveModel::Conversionを設定している。が、この本の主眼としてこの方法は取らずに、自分でstubをつくろうとするのがListing 36。
* P49ではタイムスタンプの導入。
* P50に書かれているが、MiniTestが標準で持っているモックは機能不足なので、今回はrrを導入することにした。
* P52のListing 43にて、beforeに対してたくさん事前準備が書かれている。P53にてそのことに言及されており、大体はTimecopなどの時間を上書きするライブラリを使うことになるのだが、この本では別のアプローチを取るようだ。
* P54からはDependency Injection。依存性の注入。言葉はよく聞くけど、よく分かっていない。コンポーネント間の依存関係を排除し、外部の設定ファイルから注入できるようにするってことらしい。今回は、時刻情報がそれなのかな。

## 2013年11月30日（土）第4回読書会
### 実施範囲

* P42の「Object Trees and Lone Wolves」からP46の「Getting the tests running again」

### 所感
* コードがなくて、技術の概念とか考え方について書かれている部分は、英語だと辛い。
* ここでは、Postクラスのインスタンスを直接操作するのではなく、木構造をベースにした設計をするとオブジェクト指向開発ではよいって事が言いたいのかなと。
* Postクラスのインスタンスを直接操作する方法（ここでは、Lone wolf（一人で行動するタイプ）って呼んでいる）方法だと、flight risk（逃亡のおそれ、今回の例だと、オブジェクトの親子関係がバラバラに成ってしまうってことか？）があるし、テストもスタブの生成など色々面倒くさいので、よろしくないって読み取った。

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

