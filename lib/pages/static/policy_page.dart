import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapako02/component/cp_list.dart';
import 'package:mapako02/component/footer.dart';
import 'package:mapako02/component/header.dart';

class PolicyPage extends StatefulWidget{
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

//プライバシーポリシーページ
class _PolicyPageState extends State<PolicyPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationHead(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTitle('MAPAKO プライバシーポリシー'),
                ListContents(
                    '1. 当社が取得する情報およびその取得方法',
                    '1.1 利用者から直接取得する情報\n'
                    '当社は、利用者が当社のサービスの登録手続を行う場合、以下の情報を提供していただく場合があります。\n\n'
                    '(a)年齢または生年月日\n'
                    '(b)氏名、ユーザー名またはニックネーム\n'
                    '(c)メールアドレス\n'
                    '(d)アカウントへのアクセス者の本人確認に必要なパスワード等のその他の情報\n'
                    '(e)ユーザープロフィール（プロフィール画像、サービスのユーザー名またはニックネーム、性別、SNS上のプロフィールへのリンクその他利用者がプロフィールとして記載する情報、ユーザーID）\n'
                    '(f)当社がアプリまたはウェブサイトにおいて取得すると定めた情報\n'
                    '(g)その他当社が指定する利用者に関する情報\n\n'
                    '1.2 端末情報\n'
                    '利用者が端末または携帯端末上で当社のサービスを利用する場合、当社は、端末識別子、携帯端末識別子およびIPアドレスを取得する場合があります。また、当社は、利用者が端末に関連づけた名前、端末の種類、電話番号、国、およびユーザー名、もしくはメールアドレスなど、利用者が提供することを選択したその他のあらゆる情報を取得する場合があります。\n\n'
                    '1.3 位置情報\n'
                    '利用者が端末または携帯端末上で当社のアプリを利用し、そこで位置情報を提供することを認めた場合、当社は、利用者の現在地に関する情報を取得することがあります。\n\n'
                    '1.4 カスタマーサポートに関連する情報\n'
                    '当社カスタマーサポートチームのサポートを受ける場合、利用者が提供する連絡先情報（通常は氏名とメールアドレスですがこれらに限られません）、サービス上のアクティビティに関する情報、およびユーザーID番号を取得、保管することがあります。また、サポートの際のやり取りおよびその中に含まれる情報も保管することがあります。\n\n'
                    '1.5 利用者のアクションに関する情報\n'
                    '利用者が当社のサービスを利用する際、直接当社に提供した情報および当社のサービスを提供している第三者サービス提供者を通じて提供した情報を当社は取得、保管することがあります。利用者のサービスご利用状況、他の利用者との交流に関する情報も取得することがあります。情報の大部分は、当社のアプリおよびウェブサイト上で行われたアクションを記録するサーバー上のファイルであるログファイルを使用して取得、保管します。\n\n'
                    '1.6 コミュニケーション機能\n'
                    '利用者が当社のサービス上において、他の利用者とコミュニケーションを取り、情報（テキスト、ユーザープロフィール、メッセージ、写真、画像、音声、ビデオ、アプリケーションその他の情報コンテンツを含みます）を共有する一定の活動に参加した場合、当社は、これらのコミュニケーションの情報のアーカイブを記録、保管することがあります。\n\n'
                    '1.7 クッキー等を利用した情報取得\n'
                    '当社のサービスにアクセスする際、当社は下記の特定の技術情報を取得します。当社および当社の代理となるサービス提供者はログファイルおよびトラッキング技術を使用し、クッキー、IPアドレス、端末の種類、携帯端末識別子、ブラウザの種類、ブラウザの言語、参照ページおよび出口ページ、プラットフォームの種類、クリック数、ドメイン名、ランディングページ、ページ閲覧数およびページの閲覧順序、各ページのURL、特定のページの閲覧時間、アプリもしくはウェブサイトの状況および当社のアプリもしくはウェブサイトにおけるアクティビティを行った日時、およびその他の情報を取得、分析します。内部での使用を目的とし、これらの情報を利用者のユーザーID番号と関連付ける場合もあります。また、当社は、(i) 特定のページの閲覧の有無、もしくはメールの開封の有無を確認するためのウェブビーコン、(ii) 特定のプロモーションメッセージから既存の利用者を除外する、新規インストール元を特定する、もしくは他のウェブサイト上で利用者に広告を提供することによって、より効果的に広告を打つことが可能となるトラッキングピクセルを含むその他の技術を使用する場合もあります。\n\n'
                    '1.8 外部サービスとの連携により取得する情報\n'
                    '外部サービスで利用者が利用するIDおよびその他外部サービスのプライバシー設定により利用者が連携先に開示を認めた情報を取得することがあります。'
                ),
                ListContents(
                    '2. 取得した情報の利用',
                    '当社は、取得した利用者の情報を以下の目的のために利用します。\n\n'
                    '(a)当社の商品・サービスの提供のため\n'
                    '(b)料金請求、課金計算のため\n'
                    '(c)本人確認、認証サービスのため\n'
                    '(d)アンケートの実施のため\n'
                    '(e)懸賞、キャンペーンの実施のため\n'
                    '(f)ポイント加算およびポイント交換のため\n'
                    '(g)マーケティング調査、統計、分析のため\n'
                    '(h)システムメンテナンス、不具合対応のため\n'
                    '(i)ご購入に関するご連絡ならびに当社の規約、条件およびポリシーの変更などの重要な通知をお送りするため\n'
                    '(j)広告の配信およびその成果確認のため\n'
                    '(k)技術サポートの提供、利用者からの問い合わせ対応のため\n'
                    '(l)当社のアプリ、ウェブサイト、サービス、コンテンツおよび広告の開発、提供、メンテナンスおよび向上に役立てるため\n'
                    '(m)ターゲットを絞った当社または第三者の商品またはサービスの広告の開発、提供のため\n'
                    '(n)不正行為もしくは違法となる可能性のある行為を防止し、利用規約を施行するため\n'
                    '(o)その他当社の各サービスにおいて定める目的のため'
                ),
                ListContents(
                    '3. 情報の共有・第三者提供',
                    '当社は、以下の場合、利用者の情報を第三者と共有することがあります。\n\n'
                    '(a)利用者の同意を得た場合\n'
                    '当社は、利用者の同意を得た場合、利用者の情報（個人情報の場合もあります）を第三者である会社、組織、個人に提供することがあります。\n\n'
                    '(b)第三者サービス提供者との共有\n'
                    '支払処理、データ分析、メール送信、ホスティングサービス、カスタマーサービスなどを当社の代理で行うサービスを提供する第三者、または、当社のマーケティングのサポートを行う第三者に対して利用者の情報を提供します。すべての第三者サービス提供者に対して、開示情報の機密を保持し、当社の代理でサービスを提供する以外の目的に利用者の情報を使用しないように指示するものとします。\n\n'
                    '(c)外部サービスとの連携のための共有\n'
                    '当社は、Facebook、Googleアカウントその他の外部サービスとの連携または外部サービスを利用した認証にあたり、当該外部サービス運営会社に利用者の情報を提供することがあります。\n\n'
                    '(d)第三者広告主との共有\n'
                    '当社は、(i) 特定の技術情報（IPアドレス、携帯端末識別子を含む）、(ii) 個人を特定できない統計情報、(iii) 個人を特定できないサービスの利用に関する情報を第三者広告主と共有することがあります。利用者は、このような情報を当社または第三者広告主が利用者傾向分析、人口統計分析、ウェブ分析のため、また、利用者に行動ターゲティング広告と呼ばれる広告のために使用することに同意します。\n\n'
                    '(e)法律上の理由\n'
                    '利用者の居住国内外において、法律、規則、法的手続または公的もしくは政府機関からの要求により、当社が利用者の個人情報を開示することが必要になる場合があります。当社は、国家安全保障、法の執行またはその他の公益の実現のために必要または適切であると判断した場合、利用者に関する情報を公開することがあります。当社は、当社の利用規約の執行、当社の運営もしくは利用者の保護のために、開示が合理的に必要であると判断する場合、利用者に関する情報を開示することがあります。\n\n'
                    '(f)売却または合併\n'
                    '組織再編、合併または譲渡に際し、当社が取得した個人情報の全部または一部を関係者に移転することがあります。',
                ),
                ListContents(
                  '4. 個人情報の保護',
                  '当社は、利用者の個人情報の紛失、盗用、悪用、不正アクセス、開示、改ざんおよび破壊を防ぐための、合理的な、管理上の、技術的および物理的措置を講じています。\n\n'
                  '利用者の個人情報の安全性を保持するため、当社は従業員にプライバシーおよび安全性のガイドラインを伝達し、社内でのプライバシー保護対策を徹底しています。'
                ),
                ListContents(
                    '5. 個人情報へのアクセス',
                    '当社が法律または正当な事業目的のために当該データの保存を要求されない限り、当社に不正確なデータの訂正またはデータの削除を要請するために、利用者がアクセスできるように、当社は商業的に合理的な努力をします。\n\n'
                    '情報が誤っている場合、すぐに更新または削除する方法を利用者に提供するように、当社は誠実に努力します。ただし、正当なビジネス上または法律上の目的で当該情報を保持する必要がある場合を除きます。\n\n'
                    '利用者からの要請に対応する前に、本人確認をお願いすることがあります。\n\n'
                    '当社は、不合理に繰り返し行われる要請、過度の技術的努力を要する要請、他者のプライバシーを害する虞のある要請、著しく非現実的な要請または当該アクセスについて適用される法律により別段要求されない要請については、お断りすることがございます。',
                ),
                ListContents(
                    '6. お子様',
                    '当社のサービスは原則として13歳未満のお子様を対象としておらず、そうしたお子様から個人を特定できる情報を意図的に取得することはありません。何らかの事情で弊社が13歳未満のお子様からその親の同意なく個人を特定できる情報を取得してしまった場合は、その情報を弊社の記録から迅速に削除するための適切な措置を行います。'
                ),
                ListContents('7. 取得した情報の廃棄','取得した個人情報は、当社による通常の事業運営に照らして、合理的に不要と判断される時点で廃棄します。'),
                ListContents('8. プライバシーに関するお問い合わせ','当社のプライバシーポリシーに関する質問やお問い合わせは、当社(info@barneyz.com)にご連絡ください。ただし、アプリまたはウェブサイトに問合せ方法が定められている場合は、その記載が優先します。'),
                ListContents('9. プライバシーポリシーの変更','当社は、プライバシーポリシーを随時更新することがあります。プライバシーポリシーの重要な変更は、最新のプライバシーポリシーとともに当社のウェブサイトに掲示します。プライバシーポリシーの変更は、当社がウェブサイト上またはアプリ内に掲載した時点から適用されるものとします。'),
                ListConclusion('最終更新日：2021年8月3日'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ApplicationFoot(),
    );
  }
}