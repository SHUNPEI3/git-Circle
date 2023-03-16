# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@test.com',
  password: 'aaaaaa',
)

end_users = EndUser.create!(
  [
    {email: 'sample1@sample.com', password: 'aaaaaa', last_name: '田中', first_name: '太郎', last_name_kana: 'タナカ', first_name_kana: 'タロウ', nickname: 'たなやん', sex: 1, age: 25, activity_area: 14, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
    {email: 'sample2@sample.com', password: 'aaaaaa', last_name: '佐藤', first_name: '二郎', last_name_kana: 'サトウ', first_name_kana: 'ジロウ', nickname: 'さとちゃん', sex: 1, age: 30, activity_area: 13, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
    {email: 'sample3@sample.com', password: 'aaaaaa', last_name: '山田', first_name: '花子', last_name_kana: 'ヤマダ', first_name_kana: 'ハナコ', nickname: 'やまちゃん', sex: 2, age: 27, activity_area: 27, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")},
    {email: 'sample4@sample.com', password: 'aaaaaa', last_name: '二階堂', first_name: 'リコ', last_name_kana: 'ニカイドウ', first_name_kana: 'リコ', nickname: 'リコ', sex: 2, age: 29, activity_area: 14, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")},
    {email: 'sample5@sample.com', password: 'aaaaaa', last_name: '松本', first_name: '淳', last_name_kana: 'マツモト', first_name_kana: 'アツシ', nickname: 'アツシ', sex: 1, age: 20, activity_area: 0, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.png"), filename:"sample-user5.png")},
    {email: 'sample6@sample.com', password: 'aaaaaa', last_name: '高橋', first_name: '哲也', last_name_kana: 'タカハシ', first_name_kana: 'テツヤ', nickname: 'てっちゃん', sex: 1, age: 35, activity_area: 0, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.png"), filename:"sample-user6.png")},
    {email: 'sample7@sample.com', password: 'aaaaaa', last_name: '小松', first_name: 'さやか', last_name_kana: 'コマツ', first_name_kana: 'サヤカ', nickname: 'saya', sex: 2, age: 31, activity_area: 13, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.png"), filename:"sample-user7.png")},
    {email: 'sample8@sample.com', password: 'aaaaaa', last_name: '西田', first_name: '陽菜', last_name_kana: 'ニシダ', first_name_kana: 'ハルナ', nickname: 'チョコ', sex: 2, age: 20, activity_area: 1, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.png"), filename:"sample-user8.png")},
    {email: 'sample9@sample.com', password: 'aaaaaa', last_name: 'ピーター', first_name: 'リード', last_name_kana: 'ピーター', first_name_kana: 'リード', nickname: 'ピーター', sex: 0, age: 35, activity_area: 0, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.png"), filename:"sample-user9.png")},
    {email: 'sample10@sample.com', password: 'aaaaaa', last_name: '吉田', first_name: '翔太', last_name_kana: 'ヨシダ', first_name_kana: 'ショウタ', nickname: 'よっしー', sex: 1, age: 28, activity_area: 0, introduction: 'よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.png"), filename:"sample-user10.png")},

  ]
)

personal_tags = PersonalTag.create!(
  [
    {name: 'DMM'},
    {name: '受講生'},
    {name: 'インドア派'},
    {name: 'アウトドア派'},
    {name: 'フットサル'},
    {name: 'ランニング'},
    {name: 'バイク'},
    {name: '食べるのが好き'},
    {name: '友達募集中'},
    {name: 'ゲーム好き'},
    {name: '猫派'},
    {name: '音楽鑑賞'},
    {name: '旅行行きたい'},
    {name: '人見知り'},
    {name: '海外出身'},
    {name: 'アクティブ'},
    {name: 'お笑い大好き'},
    {name: '趣味：車'},
    {name: '趣味：ドライブ'},
  ]
)

UserPersonalTag.create!(
  [
    {end_user_id: end_users[0].id, personal_tag_id: personal_tags[0].id},
    {end_user_id: end_users[0].id, personal_tag_id: personal_tags[1].id},
    {end_user_id: end_users[0].id, personal_tag_id: personal_tags[2].id},
    {end_user_id: end_users[1].id, personal_tag_id: personal_tags[3].id},
    {end_user_id: end_users[1].id, personal_tag_id: personal_tags[4].id},
    {end_user_id: end_users[1].id, personal_tag_id: personal_tags[5].id},
    {end_user_id: end_users[1].id, personal_tag_id: personal_tags[6].id},
    {end_user_id: end_users[2].id, personal_tag_id: personal_tags[7].id},
    {end_user_id: end_users[2].id, personal_tag_id: personal_tags[2].id},
    {end_user_id: end_users[3].id, personal_tag_id: personal_tags[7].id},
    {end_user_id: end_users[3].id, personal_tag_id: personal_tags[9].id},
    {end_user_id: end_users[3].id, personal_tag_id: personal_tags[10].id},
    {end_user_id: end_users[4].id, personal_tag_id: personal_tags[0].id},
    {end_user_id: end_users[4].id, personal_tag_id: personal_tags[1].id},
    {end_user_id: end_users[5].id, personal_tag_id: personal_tags[11].id},
    {end_user_id: end_users[5].id, personal_tag_id: personal_tags[12].id},
    {end_user_id: end_users[6].id, personal_tag_id: personal_tags[8].id},
    {end_user_id: end_users[7].id, personal_tag_id: personal_tags[2].id},
    {end_user_id: end_users[7].id, personal_tag_id: personal_tags[8].id},
    {end_user_id: end_users[7].id, personal_tag_id: personal_tags[13].id},
    {end_user_id: end_users[8].id, personal_tag_id: personal_tags[14].id},
    {end_user_id: end_users[8].id, personal_tag_id: personal_tags[15].id},
    {end_user_id: end_users[8].id, personal_tag_id: personal_tags[16].id},
    {end_user_id: end_users[9].id, personal_tag_id: personal_tags[17].id},
    {end_user_id: end_users[9].id, personal_tag_id: personal_tags[18].id},
  ]
)

categories = Category.create!(
  [
    {name: 'Sports'},
    {name: 'Hobbies & Leisure'},
    {name: 'Arts & Entertainment'},
    {name: 'Books & Literature'},
    {name: 'Games'},
    {name: 'Jobs & Education'},
    {name: 'Food & Drink'},
    {name: 'Computers & Electronics'},
    {name: 'Beauty & Fitness'},
    {name: 'People & Society'},
    {name: 'Pets & Animals'},
    {name: 'Online Communities'},
  ]
)

communities = Community.create!(
  [
    {name: '映画同好会',             owner_id: end_users[0].id, category_id: categories[2].id, introduction: "こちらが映画が好きな人の集まりです！\n各トピックへは1度と言わず何度も足を運んで是非とも書き込みやイイネ！を残して下さるとうれしいです。\nネタバレは原則、禁止です。", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community1.jpg"), filename:"sample-community1.jpg")},
    {name: '麻雀初心者クラブ',       owner_id: end_users[0].id, category_id: categories[4].id, introduction: "投稿に目を止めていただき誠にありがとうございます！\n本グループはノーレート（金銭のやり取り無し）での麻雀を開催しております。\n初心者の方、中級者、上級者、誰でも大歓迎なので、少しでも興味がありましたらご参加をお待ちしています！", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community2.jpg"), filename:"sample-community2.jpg")},
    {name: 'フットサル部',           owner_id: end_users[1].id, category_id: categories[0].id, introduction: "こんにちは！フットサルサークルですっっ!!\n経験者も初心者も、男子も女子も、みんなで楽しく練習してます！！\n友達いっぱいほしい方、体動かしたい方、サークルというものに興味ある方はぜひ来てください！！！", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community3.png"), filename:"sample-community3.png")},
    {name: '読書好きの人が集まる場', owner_id: end_users[3].id, category_id: categories[3].id, introduction: "本を読むコトが好きな人～☆\n\n自分が読んだ本を紹介しあいましょ☆\n\n自分が感じた感情を共有しあいましょ☆\n\nそして自分が次に読む本を探しましょ☆\n\n気軽にどんどん書き込んでください☆\n\n他にも本・読書に関するイベント・情報・活動なら何でも幾らでも立ててください☆", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community4.png"), filename:"sample-community4.png")},
    {name: 'ゲーム部',               owner_id: end_users[3].id, category_id: categories[4].id, introduction: "ゲームの情報をタイトルごと掲載していくコミュニティです。\n掲載希望タイトルのリクエストも募集しておりますので、お気軽にご参加ください☆ \n\n【お願い】\n・他者や他ハード・ソフト等に対する誹謗中傷行為、その他迷惑行為はお辞めください。\n・当コミュニティの情報には【噂】などの未確定情報も含まれている場合があります。情報のお取扱は自己責任でお願いいたします。"},
    {name: '猫カフェ行き隊',         owner_id: end_users[3].id, category_id: categories[10].id, introduction: "休日に集まって猫カフェに行ってます！\nおすすめの場所なども共有しているので、興味のある方はぜひ、ご参加ください！！", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community5.jpg"), filename:"sample-community5.jpg")},
    {name: '秘湯・名湯を巡る',       owner_id: end_users[5].id, category_id: categories[1].id, introduction: "なかなか行けない、場所も仲間と楽しく、巡りましょう～\n参加人数が多い時は、貸切バスを用意します、近くの観光地も乗り換えなしで、らくらく新宿発着です！\nこれから始動です、みなさんご一緒にいかがでしょうか？？", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community6.png"), filename:"sample-community6.png")},
    {name: 'そうだ、京都に行こう',   owner_id: end_users[6].id, category_id: categories[1].id, introduction: "ガイドブックにはない情報満載\nくちコミ『京都』総合コミュニティ!\n古都京都。 それは雅とノスタルジックと神秘を内包する町。 明暗…陰陽のコントラストを内包する町。 文化・歴史と祭りと学生の町京都。また食文化も奥深い。 ここはそんな京都に惹かれる人のコミュニティです。\n\n気楽にコミュニティに参加してください。", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community7.jpg"), filename:"sample-community7.jpg")},
    {name: 'ボードゲーム会',         owner_id: end_users[7].id, category_id: categories[4].id, introduction: "国産から海外のものまで、真剣になっちゃうものから、笑っちゃうようなものまで何でもあります！\n\n男性のほかに、女性の主催者もいますので、女性の方も安心してご参加くださいね！\n\nボードゲーム自体初めての方も、月に何回もボードゲームをやってる方も、本イベント初参加の方も、参加されたことのある方も、みんなで楽しくやりましょう！", community_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community8.jpg"), filename:"sample-community8.jpg")},
  ]
)

CommunityUser.create!(
  [
    {end_user_id: end_users[0].id, community_id: communities[0].id},
    {end_user_id: end_users[0].id, community_id: communities[1].id},
    {end_user_id: end_users[0].id, community_id: communities[4].id},
    {end_user_id: end_users[0].id, community_id: communities[8].id},
    {end_user_id: end_users[1].id, community_id: communities[2].id},
    {end_user_id: end_users[1].id, community_id: communities[6].id},
    {end_user_id: end_users[2].id, community_id: communities[0].id},
    {end_user_id: end_users[3].id, community_id: communities[0].id},
    {end_user_id: end_users[3].id, community_id: communities[3].id},
    {end_user_id: end_users[3].id, community_id: communities[4].id},
    {end_user_id: end_users[3].id, community_id: communities[5].id},
    {end_user_id: end_users[5].id, community_id: communities[6].id},
    {end_user_id: end_users[5].id, community_id: communities[7].id},
    {end_user_id: end_users[6].id, community_id: communities[5].id},
    {end_user_id: end_users[6].id, community_id: communities[7].id},
    {end_user_id: end_users[7].id, community_id: communities[0].id},
    {end_user_id: end_users[7].id, community_id: communities[3].id},
    {end_user_id: end_users[7].id, community_id: communities[8].id},
    {end_user_id: end_users[8].id, community_id: communities[2].id},
    {end_user_id: end_users[8].id, community_id: communities[6].id},
    {end_user_id: end_users[8].id, community_id: communities[7].id},
    {end_user_id: end_users[9].id, community_id: communities[7].id},

  ]
)

CommunityDetail.create!(
  [
    {community_id: communities[0].id, max_join_number: nil, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[1].id, max_join_number: nil, sex_limit: nil, activity_area_limit: nil, age_min_limit: 20, age_max_limit: nil},
    {community_id: communities[2].id, max_join_number: 10, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[3].id, max_join_number: 5, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[4].id, max_join_number: nil, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[5].id, max_join_number: nil, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[6].id, max_join_number: nil, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[7].id, max_join_number: nil, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},
    {community_id: communities[8].id, max_join_number: 8, sex_limit: nil, activity_area_limit: nil, age_min_limit: nil, age_max_limit: nil},

  ]
)

tags = Tag.create!(
  [
    {name: '映画'},
    {name: 'インドア'},
    {name: '麻雀'},
    {name: '初心者'},
    {name: 'フットサル'},
    {name: 'アウトドア'},
    {name: 'スポーツ'},
    {name: '読書'},
    {name: 'ゲーム'},
    {name: '動物'},
    {name: '猫'},
    {name: '温泉'},
    {name: '旅行'},
    {name: 'まったりと'},

  ]
)

CommunityTag.create!(
  [
    {community_id: communities[0].id, tag_id: tags[0].id},
    {community_id: communities[0].id, tag_id: tags[1].id},
    {community_id: communities[1].id, tag_id: tags[2].id},
    {community_id: communities[1].id, tag_id: tags[3].id},
    {community_id: communities[2].id, tag_id: tags[4].id},
    {community_id: communities[2].id, tag_id: tags[5].id},
    {community_id: communities[2].id, tag_id: tags[6].id},
    {community_id: communities[3].id, tag_id: tags[1].id},
    {community_id: communities[3].id, tag_id: tags[7].id},
    {community_id: communities[4].id, tag_id: tags[8].id},
    {community_id: communities[5].id, tag_id: tags[9].id},
    {community_id: communities[5].id, tag_id: tags[10].id},
    {community_id: communities[6].id, tag_id: tags[11].id},
    {community_id: communities[6].id, tag_id: tags[12].id},
    {community_id: communities[6].id, tag_id: tags[13].id},
    {community_id: communities[7].id, tag_id: tags[12].id},
    {community_id: communities[8].id, tag_id: tags[1].id},
    {community_id: communities[8].id, tag_id: tags[8].id},

  ]
)

topics = Topic.create!(
  [
    {end_user_id: end_users[0].id, community_id: communities[0].id, title: '今日観た映画 part1', body: "みなさんが観た映画のタイトルと感想を共有する場です。\n劇場でも自宅観賞でも。"},
    {end_user_id: end_users[0].id, community_id: communities[0].id, title: '今日観た映画 part2', body: "みなさんが観た映画のタイトルと感想を共有する場です。\n劇場でも自宅観賞でも。"},
    {end_user_id: end_users[3].id, community_id: communities[0].id, title: '一緒に映画行ってくれる人募集!', body: "よく行く映画館は○○シネマズです\n一人で行くこと多いのですが、誰かよかったら一緒に行ってください\nみなさんも映画行く時はここで共に行ってくれる人をどんどん募集してください"},
    {end_user_id: end_users[3].id, community_id: communities[0].id, title: 'おすすめの映画ありますか？', body: 'これから公開される映画で気になる作品や、面白そうな作品を教えて下さい！'},
    {end_user_id: end_users[0].id, community_id: communities[1].id, title: '【麻雀初心者倶楽部の使い方】', body: "麻雀初心者倶楽部の簡単な使い方説明です。\n\n基本的には自由に使っていただいて構いません！\n\n↓よくある流れ↓\n1.グループ内で声をかける。\n例　来週か再来週に麻雀打ちませんか〜？\n2.希望の人数が集まったら、トピックス一覧の右上にある「新規投稿」からイベントを作成！\n（イベント作成は指示に従えばOK！参加メンバーでトークを行うのに必要です。）\n3.イベント専用のトークルームにて場所や日時を決めて麻雀開始です！\n\n※参加する側の人は声かけに対して返信した後、イベント参加リンクをタッチして、「イベントに参加する」を押してください。\n\n以上が大まかな流れです。\n特にきまりはないので、自由に使ってください！"},
    {end_user_id: end_users[0].id, community_id: communities[1].id, title: '面子募集してます！', body: "はじめまして！今から○○で麻雀したいとおもっているんですが一名面子が足りません。緩く楽しくできる方いましたら一緒に囲みませんか？\n\nコメントお待ちしております！"},
    {end_user_id: end_users[1].id, community_id: communities[2].id, title: '参加メンバー募集のお知らせ', body: "主に土曜日の19:00-21:00で○○で活動しています。\n\n経験や年齢は問いませんので、楽しくやりたい方、興味がある方は連絡をお願いします(＾ｰ^)ノ"},
    {end_user_id: end_users[1].id, community_id: communities[2].id, title: '○月○日にフットサルします(^o^)', body: "15時から○○でフットサルします(^o^)。\n\n初心者大歓迎なので一緒に楽しみませんか？？\n\nご連絡お待ちしています。"},
    {end_user_id: end_users[7].id, community_id: communities[3].id, title: '心に残った言葉、フレーズ', body: "心に残る言葉、フレーズが本にはあるもの\n\n本の中で皆様の心に残った言葉、フレーズ、せりふでもいいです。\n\n教えてください。"},
    {end_user_id: end_users[3].id, community_id: communities[3].id, title: '○月○日(○)　休日の読書会　開催します', body: "文芸書に特化した読書会です。\n\nレンタルルームで、心置きなく本の話をしましょう。"},
    {end_user_id: end_users[3].id, community_id: communities[5].id, title: '○○に猫カフェオープン！', body: "情報共有です。興味のある方はぜひ行ってみてください！"},
    {end_user_id: end_users[3].id, community_id: communities[5].id, title: '理想の猫カフェについて教えて下さい', body: "将来猫カフェを開きたいと思い、色々勉強中なのですが、猫カフェによく行ってらっしゃる方たちの、率直な個人的なご意見を参考にさせて頂きたく、色んなご意見をお伺いしてみたいと思いました。\n\n今や全く珍しくなくなった猫カフェですが、みなさんが理想とする猫カフェ、これから、こんな猫カフェが出来たら行ってみたい…と思うのは、どんなお店ですか？"},
    {end_user_id: end_users[5].id, community_id: communities[6].id, title: '○○県の温泉巡り', body: "○○県にある温泉に入ったよ！\n\nって人！報告待ってます！"},
    {end_user_id: end_users[1].id, community_id: communities[6].id, title: '○○県の温泉巡り', body: "○○県にある温泉に入ったよ！\n\nって人！報告待ってます！"},
    {end_user_id: end_users[8].id, community_id: communities[6].id, title: '○○県の温泉巡り', body: "○○県にある温泉に入ったよ！\n\nって人！報告待ってます！"},
    {end_user_id: end_users[5].id, community_id: communities[6].id, title: '温泉仲間になりませんか　同行者　募集しています！', body: "秘湯・名湯を巡る旅。\n一人じゃなかなか行けないけど仲間が居ればってことはないですか？\n\nそんな気持ちをお持ちの仲間だってたくさんいてるんじゃないでしょうかと言う事でコミュ作成してみました。\n\n何処に？　いつごろ？　予算は？そんな感じで募集しちゃいましょう"},
    {end_user_id: end_users[8].id, community_id: communities[7].id, title: '京都で行きたいところ part1', body: "行きたいところを好きかって書くところ。\n行きたいところ教えてください。こだわりをぶつけてください。\n\nかかれたところが、知っているところなら情報ください。"},
    {end_user_id: end_users[5].id, community_id: communities[7].id, title: '◆京都グルメ情報 part1', body: "京都の食は奥が深い。\n京都らしいおいしさを持つ穴場の情報。"},
    {end_user_id: end_users[6].id, community_id: communities[7].id, title: '◆京都おすすめカフェ&スイーツ part1', body: "京都にあるカフェで「ここオススメ」とか「こんなのがあるよ」といった情報あれば知りたいです。\n因みに僕は二条通り沿いにある「cafe ○○○」がよかったです。"},
    {end_user_id: end_users[7].id, community_id: communities[8].id, title: 'メンバー募集トピック', body: "ボードゲームで遊びたいけど、メンバーが足りないという人はここを使ってメンバーを募集しませんか？\n\n　１．募集する地域、予定するゲーム等を書いて希望を募る。\n　２．人数が集まって、開催のめどが立ったら場所、日付などを決めてイベントをたてる。\n\n　こんな流れで、お願いします。"},
    {end_user_id: end_users[7].id, community_id: communities[8].id, title: '【初心者歓迎】○○のボードゲームカフェで遊ぼう！', body: "【イベントの概要】\n○○駅近くのボードゲームカフェで遊ぶイベントを開催します✨\nボードゲームで友達作りしませんか？🤝\n休日のお昼に5時間たっぷり遊べます！\n初心者でも楽しめる100種類以上のボードゲームをご用意しております🙆‍♂️\n初参加、初心者の方大歓迎です！！\n初参加でも仲間外れができないようにしっかりフォローさせてもらいます👍\nわかりやすくゲームの説明をしますのでぜひお気軽にご参加ください！😊"},
    {end_user_id: end_users[0].id, community_id: communities[8].id, title: 'ボードゲームの日記を書いたら報告するトピック', body: "【イベントの概要】\n・こんなゲームをやりました\n・とあるボードゲームの考察を書いてみた\n・ボードゲームイベント参加報告\n・自作ボードゲームについて️\n\nなどなど、ボードゲーム関連の日記を書いたら報告するトピ"},
  ]
)

topic_commments = TopicComment.create!(
  [
    {end_user_id: end_users[0].id, community_id: communities[0].id, topic_id: topics[0].id, comment: 'テネットを見ました'},
    {end_user_id: end_users[3].id, community_id: communities[0].id, topic_id: topics[1].id, comment: 'ジュラシックパークを見ました！'},
    {end_user_id: end_users[2].id, community_id: communities[0].id, topic_id: topics[3].id, comment: 'コンフィデンスマンシリーズがおすすめです！'},
    {end_user_id: end_users[8].id, community_id: communities[2].id, topic_id: topics[6].id, comment: '参加できます！'},
    {end_user_id: end_users[1].id, community_id: communities[2].id, topic_id: topics[7].id, comment: '参加できます！'},
    {end_user_id: end_users[3].id, community_id: communities[3].id, topic_id: topics[8].id, comment: "人は、自分の姿はわからないものだ。しかし、わかっていなければ自分の状態を言語化することができない。他人から指摘されたことを自分で納得し、修正し、自分の言葉で説明するところまでいけないと、自分のものになったとはいえない。本当にその部分を直そうと思うのであれば、自分で気づいて自分で努力するしかない。そのためにも、しつこいくらい質問を繰り返し、言語化する癖をつけるしかないと思う。\n\n『最高のコーチは、教えない。』／吉井理人"},
    {end_user_id: end_users[6].id, community_id: communities[5].id, topic_id: topics[10].id, comment: '情報共有ありがとうございます'},
    {end_user_id: end_users[6].id, community_id: communities[5].id, topic_id: topics[11].id, comment: '私の場合は猫好きな人の中でも、いろんな意味でマニアックなので、あまり参考にならないかもしれませんが、いろんな純血種がいてほしいです。見るだけならペットショップでも見れますけど、触れ合うと性格や気性もわかりやすいので。あと、お食事メニューが充実してると嬉しいです。冷凍ものとかじゃなく、手作りでオリジナリティがあるものだといいですね。'},
    {end_user_id: end_users[3].id, community_id: communities[5].id, topic_id: topics[11].id, comment: '返信ありがとうございます！　参考になりました'},
    {end_user_id: end_users[5].id, community_id: communities[6].id, topic_id: topics[15].id, comment: 'ひとり旅で今日明日と○○にいます！初めてでちょっと不安に‥同じくひとり旅で、○○に滞在されている方いらっしゃいましたら、ご飯や観光ご一緒しませんか？車無いので難しいかもしれませんが…よろしくお願いします'},
    {end_user_id: end_users[6].id, community_id: communities[7].id, topic_id: topics[16].id, comment: '清水寺  観光時間（目安）：約1時間～  「清水寺」は、開創778年という古都・京都の中でも長い歴史を誇るお寺です。必見ポイントは、高さ13mの「清水の舞台」。実際に立って四季折々の風景を眺めたり、下から見上げたりと、ここでしか見られない風景を堪能しましょう。朱色の「仁王門」や高さ約31mの「三重塔」、「清水寺」という名前の由来となった清めの水が流れる「音羽の瀧」なども見逃せません。'},
    {end_user_id: end_users[6].id, community_id: communities[7].id, topic_id: topics[16].id, comment: '産寧坂  観光時間（目安）：約15分～  「三年坂」とも呼ばれる「産寧坂」は、石畳の路地の脇に伝統的な店構えの土産物店や家屋が立ち並ぶエリアです。通り過ぎてしまえばあっという間ですが、高台寺などの寺院へと続く道中には和菓子店や漬物店、京扇子を扱うお店ほか、立ち寄りたくなるスポットが目白押し。カメラを構える人の姿も多く、古都の雰囲気を存分に楽しめます。'},
    {end_user_id: end_users[6].id, community_id: communities[7].id, topic_id: topics[17].id, comment: '伏見稲荷の近く。蛙吉。フレンチ懐石かな。見た目も可愛く味もよいです。量は少なめかな。こじんまりとしたお店。'},
    {end_user_id: end_users[6].id, community_id: communities[7].id, topic_id: topics[17].id, comment: '京都、上鳥羽 お蕎麦屋さん、ミュラー。おいしかったです。蕎麦湯ものみやすかった。また行きたいお店。'},
    {end_user_id: end_users[6].id, community_id: communities[7].id, topic_id: topics[18].id, comment: '嵯峨野にある「こい茶屋デセール」で可愛らしいスィーツを食べました。庭園の紅葉も綺麗で、お座敷は貸切状態なんでのんびりできました。'},
    {end_user_id: end_users[6].id, community_id: communities[7].id, topic_id: topics[18].id, comment: '京都祇園にあるカフェ、BLUE FIR TREE（ブルーファーツリー）さんの幻のホットケーキです。ハート型で可愛く、暑さも5㎝位あります。'},
    {end_user_id: end_users[0].id, community_id: communities[8].id, topic_id: topics[19].id, comment: '了解です！！'},
    {end_user_id: end_users[0].id, community_id: communities[8].id, topic_id: topics[20].id, comment: 'いいですね！参加したいです！'},
    {end_user_id: end_users[7].id, community_id: communities[8].id, topic_id: topics[20].id, comment: '返信  ありがとうございます！よろしくお願いします！'},

  ]
)

Relationship.create!(
  [
    {following_id: end_users[0].id, follower_id: end_users[1].id},
    {following_id: end_users[0].id, follower_id: end_users[3].id},
    {following_id: end_users[0].id, follower_id: end_users[4].id},
    {following_id: end_users[0].id, follower_id: end_users[5].id},
    {following_id: end_users[0].id, follower_id: end_users[6].id},
    {following_id: end_users[1].id, follower_id: end_users[8].id},
    {following_id: end_users[2].id, follower_id: end_users[3].id},
    {following_id: end_users[3].id, follower_id: end_users[0].id},
    {following_id: end_users[3].id, follower_id: end_users[2].id},
    {following_id: end_users[3].id, follower_id: end_users[7].id},
    {following_id: end_users[4].id, follower_id: end_users[0].id},
    {following_id: end_users[6].id, follower_id: end_users[0].id},
    {following_id: end_users[7].id, follower_id: end_users[6].id},
    {following_id: end_users[9].id, follower_id: end_users[5].id},

  ]
)

Bookmark.create!(
  [
    {end_user_id: end_users[0].id, topic_id: topics[0].id},
    {end_user_id: end_users[0].id, topic_id: topics[1].id},
    {end_user_id: end_users[1].id, topic_id: topics[2].id},

  ]
)

Good.create!(
  [
    {end_user_id: end_users[0].id, topic_comment_id: topic_commments[0].id},
  ]
)

