xyzzy リリースノート
====================

  * バージョン: 0.2.2.236
  * リリース日: 2012-03-29
  * ホームページ: <http://xyzzy-022.github.com>


はじめに
--------

2304。

亀井さんによる最後のバージョン (0.2.2.235) がリリースされてから、
有志による 0.2.2 系列最初のバージョン (0.2.2.236) がリリースされるまでに
かかった日数であり、また `(expt 48 2)` でもあります。

xyzzy 0.2.2.236 では 22 件の機能追加と、17 件のバグ修正を
行なっています。これらの修正は 9 人の有志の手により行われました。

0.2.2.236 は 0.2.2.235 との互換性を重視したバージョンです。
今まで利用してきた拡張はそのまま動作することを期待してもよいでしょう。


インストール
------------

インストーラはありませんので zip を展開するだけです。
インストールから初期設定までは以下を参照してください。

  * [QuickTour - XyzzyWiki](http://xyzzy.s53.xrea.com/wiki/index.php?QuickTour)


アップデート
------------

以下の手順で 0.2.2.235 からアップデートしてください。

  1. 0.2.2.235 のバックアップ取得
  2. 0.2.2.236 を上書き
  3. $XYZZY/html を削除 ($XYZZY/docs/old に移動しています)
  4. xyzzy.wxp を削除
  5. xyzzy.exe 起動

lisp/ 配下や etc/ 配下をカスタマイズしている場合は
上書き後に再度カスタマイズをお願いします。


機能追加
--------

  * `mode-line-format` に `%/` を追加しました。(#26, mumurik)

    `%/` はカーソル位置がバッファ全体の何% の位置にあるかを表示します。

  * `mode-line-format` と `title-bar-format` に `%$` を追加しました。(#164, x022235)

    `%$` は xyzzy のプロセス ID を表示します。

  * Windows 7 のジャンプリストに少し対応しました。(#31, x022235)

    xyzyz に関連付けたファイルをダブルクリックして開いた場合などに
    ジャンプリストの最近使ったファイルに追加されます。

    xyzzy 内から `C-x f` などで開いた場合はジャンプリストには反映されませんが
    今後対応予定です。

  * ショートカット作成ダイアログを追加しました。(#154, x022235)

    ジャンプリストを利用するにはここで作成したショートカットを
    タスクバーに登録するようにしてください。

  * エアロスナップでウィンドウサイズを変更した場合もサイズを覚えるようになりました。(#153, x022235)

    0.2.2.235 ではエアロスナップでウィンドウサイズを変更すると、xyzzy 再起動後に
    スナップ前のサイズに戻ってしまっていました。

    「共通設定」→「さまざま」→「エアロスナップで変更した場合も保存」をチェックすることで
    スナップ後の位置を復元するようになります。

  * コマンドライン引数の -f オプションでパッケージ指定に対応しました。(#171, x022235)

    `xyzzy.exe -f pkg:pkg-function` という形式でパッケージ内の関数を実行できます。

  * `sql-mode` で以下の機能を追加しました。(#178, x022235)
    * SQL 92 の 「--」で始まる 1 行コメントに対応しました。
    * キーワードの補完に対応しました。(`M-Tab`)

  * キーワードファイル更新しました。(#46, x022235)
    * etc/C
      * C99 に対応しました。
    * etc/C++
      * C++ 11 に対応しました。
    * etc/C#
      * C# 5.0 に対応しました。
    * etc/CSS, etc/CSS3/*
      * CSS level 2, CSS level 3 に対応しました。
      * `css-mode` のデフォルトを CSS3 に更新しました。
        * `*css-level*` でデフォルト値を設定可能です。
        * `css2-mode`, `css3-mode` で切り替えることも可能です。
      * CSS3 のキーワードファイルはモジュールごとに分かれているので
        `*css3-keyword-files*` で読み込むモジュールをカスタマイズ可能です。
    * etc/HTML5
      * HTML5 に対応しました。
      * `<!DOCTYPE html>` の場合に自動的に HTML5 キーワードが有効になります。
      * `html+-mode` を使っている場合は以下の設定をすることで HTML5 キーワードを利用できます。

        ```lisp
        ;; html+-mode で HTML5 キーワードを利用する
        (in-package :editor)
        (setq *html+-use-html-kwd* t)
        (in-package :user)
        ;autoload を使わない場合は *html+-use-html-kwd* 設定後にロードする
        ;(require "html+-mode")
        ```

      * 新規の HTML ファイルを作成した時に自動的に HTML5 キーワードを有効にしたい場合は
        以下の設定をしてください。

        ```lisp
        (setq *html-default-doctype* "HTML5.0")
        ```

    * etc/Perl
      * Perl 5.10 に対応しました。
    * etc/Java
      * Java 5.0 で追加されたキーワードに対応しました。
    * etc/Pascal
      * 色々追加しました。
    * etc/Sql, etc/Sql-NonStd/*
      * 色々追加しました。
      * DBMS 固有のキーワードを追加しました。
        SQLServer, Oracle, MySQL, PostgreSQL 用のキーワードを標準で用意してあります。
      * DBMS 固有のキーワードを利用したい場合は、`*sql-keyword-file*` に利用したい
        キーワードファイルをリストで設定してください。

        ```lisp
        (setq *sql-keyword-file* '("SQL" "Sql-NonStd/Oracle"))
        (setq *sql-keyword-file* '("SQL" "Sql-NonStd/SQLServer"))
        (setq *sql-keyword-file* '("SQL" "Sql-NonStd/MySQL"))
        (setq *sql-keyword-file* '("SQL" "Sql-NonStd/PostgreSQL"))
        ```

  * calc-mode で人生、宇宙、すべての答えを計算できるようになりました。(#180, x022235)


バグ修正
--------

  * ウィンドウを分割していない状態で `scroll-other-window` などを実行した場合の
    エラーメッセージを改善しました。(#6, prtnog)

  * x64 マシンで c:/Windows/sytem32/drivers/etc/hosts が開けない問題を修正しました。(#4, x022235)

    また、C:/Windows/SysWoW64/drivers/etc ディレクトリを作成しておくことで
    C:/Windows/System32/drivers/ から etc/ の補完ができまるようになります。

  * xyzzy Lisp が長時間応答がなくなった場合でも `C-g` が効くようになりました。(#19, mumurik)

  * マルチディスプレイ利用時にツールチップやダイアログが常にプライマリモニタに
    表示される問題を修正しました。(#56, x022235)

  * マルチディスプレイ利用時にプライマリモニタ以外で xyzzy を終了すると
    次回起動後にウィンドウ位置が正しく復元されない問題を修正しました。(#56, x022235)

  * タグファイル作成時の初期ディレクトリを XTAGS ファイルから取得するようになりました。(#125, southly)

    例えば $XYZZY/ でタグファイルを作成しておくと、$XYZZY/ 配下のファイルを開いて
    タグファイルを作成ダイアログを開くと自動的に $XYZZY/ がデフォルトの
    ディレクトリとして表示されます。

  * カーソルが単語の末尾にあるときに辞書を引くとその単語を調べるようになりました。(#141, x022235)

    調べたい単語を入力して `C-c e` とすると入力した単語を辞書で引きます。


開発者向け機能追加
------------------

  * `lisp-mode` でマクロをインデントするときに、`&body` の位置から
    自動的にインデント位置を決定するようになりました。(#8, youz)

    `ed:lisp-indent-hook` が設定されていない場合のみ動作します。

  * `lisp-mode` でパッケージ名の補完ができるようになりました。(#144, x022235)

    シンボルを一つも export していないパッケージは補完候補に表示されません。

  * reference.xml を同梱しました。(#12, x022235)

    0.2.2.236 で追加した API は記述済みです。

  * lisp キーワードファイルを同梱しました。(#22, x022235)

    0.2.2.236 で追加した API は記述済みです。

  * `*features*` に `:widnows-8`  `:windows-7`  `:windows-vista` を追加しました。(#23, x022235)

    OS ごとに処理を変えたい場合は `(featurep :windows-7)` などと出来ます。
    また、`#+` と `#-` を使った読み込み時条件分岐 (Read Time Conditionals) でも利用できます。

  * `*features*` に `:x86`  `:x64`  `:ia64`  `:wow64` を追加しました。(#24, x022235)

    マシンアーキテクチャごとに処理を変えたい場合に利用できます。

  * `defpackage` に `:documentation` を追加しました。(#38, x022235)

    ドキュメントを取得するには `(documentation (find-package :foo) t)` とします。

  * SHA2 を計算する以下の関数を追加しました。(#39, x022235)
    * `si:sha-224`
    * `si:sha-256`
    * `si:sha-384`
    * `si:sha-512`

  * HMAC-SHA2 を計算する以下の関数を追加しました。(#40, x022235)
    * `si:hmac-sha-224`
    * `si:hmac-sha-256`
    * `si:hmac-sha-384`
    * `si:hmac-sha-512`

  * GUID を作成する以下の API を追加しました。(#162, x022235)
    * `si:uuid-create`

  * プロセス ID を取得する以下の API を追加しました。(#164, x022235)
    * `si:getpid`

  * ユニットテスト フレームワークを追加しました。(#5, bowbow99)

  * zlib 1.2.6 へ更新しました。(#155, x022235)


開発者向けバグ修正
------------------

  * `list-all-packages` がコピーを返すようになりました。(#7, youz)

  * `defstruct` の以下のバグを修正しました。(#36, x022235)
    * `print-function` が事前に定義されていないとエラーになる
    * 継承した `print-function` があるとバイトコンパイルできない
    * `print-function` を再定義しても反映されない
    * デフォルトのコンストラクタが必ず作られる
    * コンストラクタの引数の割り当てがおかしい
    * コンストラクタで引数を指定すると、スロット定義の初期値が無視される

  * `defpackage` の以下のバグを修正しました。 (#37, x022235)
    * `:shadowing-import-from` 2 つと `:shadow` を書くとエラー
    * パッケージが見つからない場合のエラーメッセージが不正

  * 他のパッケージから `import` したシンボルを `export` すると補完候補が重複する
    問題を修正しました。(#143, x022235)

  * ファイルとソケットに対する `si:*stream-column` が誤った値を返す問題を修正しました。(#166, x022235)

  * `format` 書式のバグを修正しました。(#2, southly)

    ```lisp
    (format nil "~0,1T")
    ""                         ; 0.2.2.235
    " "                        ; 0.2.2.236

    (format nil "~VT" nil)
    Vパラメータの型が不正です  ; 0.2.2.235
    " "                        ; 0.2.2.236

    (format nil "~,,VF" 3 pi)
    "3.141592653589793d0"      ; 0.2.2.235
    "3141.592653589793"        ; 0.2.2.236

    (format nil "~10g" 1.23456d+38)
    "^@^@^@^@^@^@    "                              ; 0.2.2.235
    "123456000000000000000000000000000000000.0    " ; 0.2.2.236

    (format nil "~E" 123.45)
    "123.45"                   ; 0.2.2.235
    "1.2345e+2"                ; 0.2.2.236

    (format nil "~@F" 123.45)
    "123.45"                   ; 0.2.2.235
    "+123.45"                  ; 0.2.2.236

    (format nil "~16,10,'*,'-,2:R" #x123abc)
    パラメータが多すぎます     ; 0.2.2.235
    "**12-3a-bc"               ; 0.2.2.236
    ```


Common Lisp との互換性向上
--------------------------

  * Common Lisp 互換の文字を追加しました。(#35, x022235)

    ```
    Common Lisp    xyzzy Lisp    char-code
    --------------------------------------
    #\Backspace    #\C-h                 8
    #\Tab          #\TAB                 9
    #\Newline      #\LFD                10
    #\Linefeed     #\LFD                10
    #\Page         #\C-l                12
    #\Return       #\RET                13
    #\Space        #\SPC                32
    #\Rubout       #\DEL               127
    ```

  * `machine-type`, `machine-version`, `machine-instance` を追加しました。(#41, x022235)
    * `machine-instance` は `ed:machine-name` と同じ値を返します。
    * `machine-type`, `machine-version` などもあまり利用することはないと思いますが、
      CL のライブラリを移植しやすくするために追加しました。

  * `lisp-implementation-version`, `lisp-implementation-type` を追加しました。(#42, x022235)
    * `software-version`, `software-type` と同じ値を返します。
    * CL のライブラリを移植しやすくするために追加しました。

  * repl 変数名を lisp パッケージから `export` しました。(#147, x022235)

    xl-repl と rx を組み合わせた場合にロード順によってはエラーになる問題を
    回避するための修正です。
    (<https://github.com/youz/xl-repl/issues/3>)


注意事項
--------

  * NetInstaller で入手可能な以下のパッケージは 0.2.2.236 では
    本体に同梱しています。インストールすると古いファイルで上書きされるので
    インストールしないようにしてください。

    ```
    reference.txt                      2007.12.25     2007/12/25 01:28  | 2007.12.25     2007/12/25 01:28
    keyword file                       2007.12.25     2007/12/25 01:27  | 2007.12.25     2007/12/25 01:27
    reference.chm                      2007.12.25     2007/12/25 01:25  | 2007.12.25     2007/12/25 01:25
    reference.xml                      2007.12.25     2007/12/25 01:23  | 2007.12.25     2007/12/25 01:23
    ```

既知の問題
----------

  * format の `~n@A` 書式がバグっている

    このバグの修正は影響範囲が大きいので修正されません。

    ```lisp
    (format nil "~10@A" "hoge")
    "hoge      "                   ; 0.2.2.235, 0.2.2.236
    "      hoge"                   ; 本来の仕様
    ```

  * software-type, software-version が CL と異なる (#169)
  * NULL 文字をインクリメンタル検索しようとすると落ちる (#152)
  * :typeがlistかvectorで:namedじゃない構造体でtypepがおかしい (#138)
  * ローカル関数で (setf READER) (#137)
  * dualウィンドウモードでfilerのディレクトリ指定が動かない (#130)
  * c-modeでマクロの継続行のインデントがおかしい (#127)
  * クリップボードにコピーするとxyzzyが固まる場合がある (#113)
  * C-u 999 C-g 後にメニュー操作でエラー (#111)
  * Vista 以降で再変換 (C-c C-c) が動作しない (#101)
  * ファイル保存時にパーミッションを保存 (#96)
  * ole で responseBody, responseStream を取得できない (#68)
  * ole-for-each で ie.Document.all の IEnum を取得できない (#67)
  * ole-create-event-sink に TypeLib のファイル名を明示的に指定しないとエラーになる (#66)
  * 巨大な文字列に対する正規表現マッチがすごい遅い (#65)
  * load 時の *readtable* がファイルローカルではない (#64)
  * setf の最適化に bug (#63)
  * handler-case で :no-error を指定してコンパイルするとエラー (#62)
  * labels の lambda-list 内の init-form で同じ labels 式で定義したローカル関数を呼び出してると、コンパイルで挙動が変わる (#61)
  * si:binhex-decode で落ちる (#45)
  * multiframe: 画面端の折り返しがウィンドウ単位でちゃんと動くようにする変更を取り込む (#25)
  * siteinit.l が sjis 以外で書かれていた場合に対応 (#11)
  * multiframe: cpp-syntax の修正を取り込む (#10)

謝辞
----

約 6 年ぶりにリリースされる xyzzy はこの 0.2.2.236 だけではありません。
既に以下の派生バージョンがリリースされています。

  * マルチフレーム機能に対応した [0.2.3 系列]
  * ユニコード対応を進めている [xyzzy+]

また、NANRI 氏が 2008 年から [xyzzy.src] にて継続的にバグ修正をおこなって
くれています。

0.2.2.236 はこれらのプロジェクトから多くの刺激とコードを得て作成されました。
謝意に代えて 0.2.2.236 をリリースさせて頂きます。

  [0.2.3 系列]: https://bitbucket.org/mumurik/xyzzy/wiki/Home
  [xyzzy+]: http://xyzzy.codeplex.com/
  [xyzzy.src]: https://github.com/southly/xyzzy.src

----

複数の派生版が存在することに混乱する人がいるかもしれません。
とっとと統合しろと思う人がいるかもしれません。

ですが、多様性は善です。

多様性は競争を促し、競争は進化を促します。
xyzzy がこれからも進化していくためにもこれらの多様性は必要です。

協調できるとこは協調し、競争すべきところでは競争しながらお互いに進んでいくのが
6 年のブランクを取り戻すためには丁度よいと思います。

なお、拡張 Lisp の作者さんの中には複数の派生版への対応に悩む人もいるかも知れません。
その人には以下のプロジェクトを紹介しておきます。

  * [拡張のメンテとか - XyzzyWiki](http://xyzzy.s53.xrea.com/wiki/index.php?%B3%C8%C4%A5%A4%CE%A5%E1%A5%F3%A5%C6%A4%C8%A4%AB)
  * [xyzzy-ext](https://github.com/xyzzy-ext)


さいごに
--------

最後になりましたが xyzzy を作成し、0.2.2.235 でフリーなソフトウェアから
なんとなく OSS ライセンスに変えてリリースして頂いた亀井氏に感謝します。

以上へなちょこメンテナではありますが、今後ともやる気のなさを引き継ぎつつ
開発を継続していきたいと思います。


`(provide "xyzzy")`