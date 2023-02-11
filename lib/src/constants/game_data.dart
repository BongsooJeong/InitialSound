const gameRawData = [
  "00000",
  "movie",
  "우리 생애 최고의 순간",
  "00001",
  "kpop",
  "YES or YES: TWICE (트와이스) ",
  "00002",
  "kpop",
  "갈색머리: 윤건 ",
  "00003",
  "movie",
  "탄생",
  "00004",
  "drama",
  "대박부동산",
  "00005",
  "proverb",
  "건드리지 않은 벌이 쏠까",
  "00006",
  "drama",
  "신분을 숨겨라",
  "00007",
  "kpop",
  "그런 일은: 박화요비 ",
  "00008",
  "movie",
  "명탐정 코난: 천공의 난파선",
  "00009",
  "kpop",
  "눈의 꽃: 박효신 ",
  "00010",
  "drama",
  "임협 헬퍼",
  "00011",
  "kpop",
  "백설공주를 사랑한 일곱번째 난장이: 쿨 (COOL) ",
  "00012",
  "kpop",
  "Give It To Me: 씨스타 ",
  "00013",
  "proverb",
  "사위는 백년 손이요 며느리는 종신 식구라",
  "00014",
  "kpop",
  "Into the I-LAND: 아이유 ",
  "00015",
  "drama",
  "기쁜 소식",
  "00016",
  "movie",
  "럭키",
  "00017",
  "kpop",
  "여수 밤바다: 버스커 버스커 ",
  "00018",
  "movie",
  "손님",
  "00019",
  "movie",
  "다빈치 코드",
  "00020",
  "kpop",
  "Hip Song: 비 ",
  "00021",
  "movie",
  "레터스 투 줄리엣",
  "00022",
  "drama",
  "색소폰과 찹쌀떡",
  "00023",
  "drama",
  "그녀가 돌아왔다",
  "00024",
  "kpop",
  "못해 (Feat. 美): 포맨 (4MEN) ",
  "00025",
  "drama",
  "N을 위하여",
  "00026",
  "kpop",
  "약속(Narration 강경헌): god ",
  "00027",
  "kpop",
  "Ring My Bell (Feat. 나얼 Of Brown Eyed Soul): 다이나믹 듀오 ",
  "00028",
  "movie",
  "스위치",
  "00029",
  "drama",
  "어쩌다 발견한 하루",
  "00030",
  "kpop",
  "삐삐: 아이유 ",
  "00031",
  "kpop",
  "좋아: 민서 (MINSEO), 윤종신 ",
  "00032",
  "kpop",
  "밤편지: 아이유 ",
  "00033",
  "movie",
  "그림자 살인",
  "00034",
  "kpop",
  "꼭!: 김건모 ",
  "00035",
  "movie",
  "범죄와의 전쟁: 나쁜놈들 전성시대",
  "00036",
  "kpop",
  "사랑인가 봐: 멜로망스 ",
  "00037",
  "drama",
  "발칙하게 고고",
  "00038",
  "movie",
  "우주전쟁",
  "00039",
  "movie",
  "육혈포 강도단",
  "00040",
  "kpop",
  "Alcohol-Free: TWICE (트와이스) ",
  "00041",
  "kpop",
  "취중고백: 김민석 (멜로망스) ",
  "00042",
  "movie",
  "앰뷸런스",
  "00043",
  "movie",
  "댄싱퀸",
  "00044",
  "movie",
  "쩨쩨한 로맨스",
  "00045",
  "kpop",
  "Escape: 엄정화 ",
  "00046",
  "kpop",
  "벚꽃 엔딩: 버스커 버스커 ",
  "00047",
  "drama",
  "아소카",
  "00048",
  "proverb",
  "전 정이 구만리 같다",
  "00049",
  "kpop",
  "Hug: 동방신기 (TVXQ!) ",
  "00050",
  "movie",
  "이스케이프 룸 2: 노 웨이 아웃",
  "00051",
  "drama",
  "다함께 차차차",
  "00052",
  "drama",
  "엄브렐러 아카데미",
  "00053",
  "movie",
  "아수라",
  "00054",
  "drama",
  "아머드 사우루스",
  "00055",
  "drama",
  "녹비홍수",
  "00056",
  "drama",
  "아르곤(MBC)",
  "00057",
  "proverb",
  "콩 심은 데 콩나고 팥 심은 데 팥난다",
  "00058",
  "drama",
  "군자맹",
  "00059",
  "kpop",
  "서쪽 하늘: 울랄라세션 ",
  "00060",
  "proverb",
  "값도 모르고 싸다고 한다",
  "00061",
  "drama",
  "루카: 더 비기닝",
  "00062",
  "drama",
  "예이 미! 주연 런던 팁튼",
  "00063",
  "drama",
  "리얼:타임:러브 PART 1",
  "00064",
  "proverb",
  "젖 먹던 힘이 다 든다",
  "00065",
  "kpop",
  "가시나: 선미 ",
  "00066",
  "movie",
  "나를 찾아줘",
  "00067",
  "movie",
  "논스톱",
  "00068",
  "kpop",
  "19금 니가 알던 내가 아냐 (Prod. By GRAY): 사이먼 도미닉, ONE, 지투 (G2), BewhY (비와이) ",
  "00069",
  "drama",
  "마지스카 학원 4",
  "00070",
  "drama",
  "보스를 지켜라",
  "00072",
  "movie",
  "엑스맨 탄생: 울버린",
  "00073",
  "proverb",
  "마음은 굴뚝같다",
  "00074",
  "movie",
  "미션임파서블:고스트프로토콜",
  "00075",
  "kpop",
  "내 입술... 따뜻한 커피처럼: 샵 ",
  "00076",
  "movie",
  "고양이: 죽음을 보는 두 개의 눈",
  "00077",
  "movie",
  "언더 워터",
  "00078",
  "drama",
  "외과의사 봉달희",
  "00079",
  "proverb",
  "동네 송아지는 커도 송아지란다",
  "00080",
  "drama",
  "약속(2000년 드라마)",
  "00081",
  "drama",
  "유리구두",
  "00082",
  "kpop",
  "우리 헤어지자: 이승기 ",
  "00083",
  "drama",
  "기예르모 델 토로의 호기심의 방",
  "00084",
  "kpop",
  "가슴아 그만해: 엠씨더맥스 (M.C the MAX) ",
  "00085",
  "kpop",
  "니가 있어야 할 곳: god ",
  "00086",
  "proverb",
  "한 귀로 듣고 한 귀로 흘린다",
  "00087",
  "movie",
  "기억의 밤",
  "00088",
  "drama",
  "대진제국 3",
  "00089",
  "drama",
  "더 바이블",
  "00090",
  "movie",
  "아메리칸 스나이퍼",
  "00091",
  "drama",
  "머니게임(tvN)",
  "00092",
  "drama",
  "눈으로 말해요",
  "00093",
  "movie",
  "부당거래",
  "00094",
  "drama",
  "로맨스가 필요해 2012",
  "00095",
  "drama",
  "설련화",
  "00096",
  "kpop",
  "Tonight: 홍경민 ",
  "00097",
  "kpop",
  "Officially Missing You, Too: 긱스 (Geeks), 소유 (SOYOU) ",
  "00098",
  "movie",
  "디워",
  "00099",
  "kpop",
  "고백: 양다일 ",
  "00100",
  "drama",
  "아직 최선을 다하지 않았을 뿐",
  "00101",
  "drama",
  "디데이",
  "00102",
  "movie",
  "제이슨 본",
  "00103",
  "kpop",
  "죽을만큼..: 오종혁 ",
  "00104",
  "drama",
  "국가대표 와이프",
  "00105",
  "movie",
  "23 아이덴티티",
  "00106",
  "drama",
  "원피스",
  "00107",
  "movie",
  "시크릿",
  "00108",
  "kpop",
  "하루: 김범수 ",
  "00109",
  "kpop",
  "천애 (For You): 이지훈 ",
  "00110",
  "kpop",
  "비: 폴킴 ",
  "00111",
  "proverb",
  "가마 속의 콩도 삶아야 먹는다",
  "00112",
  "movie",
  "그레이트 월",
  "00113",
  "proverb",
  "재주는 곰이 넘고 돈은 왕서방이 받는다",
  "00114",
  "drama",
  "울트라 세븐 X",
  "00115",
  "kpop",
  "그리움을 사랑한 가시나무: 테이 ",
  "00116",
  "drama",
  "돈의 화신",
  "00117",
  "drama",
  "사랑하기 좋은 날",
  "00118",
  "movie",
  "토르: 러브 앤 썬더",
  "00119",
  "drama",
  "2009 외인구단",
  "00120",
  "proverb",
  "물이 아니면 건너지 말고, 인정이 아니면 사귀지 말라",
  "00121",
  "kpop",
  "별처럼: 케이윌 ",
  "00122",
  "proverb",
  "개살구가 먼저 익는다",
  "00123",
  "kpop",
  "부메랑: 김건모 ",
  "00124",
  "movie",
  "연애의 온도",
  "00125",
  "kpop",
  "Indian Boy (Feat. 장근이, B.I): MC몽 ",
  "00126",
  "drama",
  "대왕 세종",
  "00127",
  "movie",
  "스파이더맨: 노 웨이 홈",
  "00128",
  "kpop",
  "떠나간다: 노을 ",
  "00129",
  "drama",
  "내 뒤에 테리우스",
  "00130",
  "kpop",
  "오래된 노래: 스탠딩 에그 ",
  "00131",
  "drama",
  "디 오퍼",
  "00132",
  "movie",
  "놉",
  "00133",
  "kpop",
  "strawberry moon: 아이유 ",
  "00134",
  "movie",
  "몬스터 vs 에이리언",
  "00135",
  "kpop",
  "봄이 좋냐??: 10CM ",
  "00136",
  "movie",
  "기적",
  "00137",
  "kpop",
  "My Darling (End): 버즈 ",
  "00138",
  "movie",
  "트랜스포터-라스트 미션",
  "00139",
  "kpop",
  "연가: 유승준 ",
  "00140",
  "kpop",
  "Honeymoon: 유엔 ",
  "00141",
  "movie",
  "우아한 거짓말",
  "00142",
  "kpop",
  "Must Have Love: SG 워너비, 브라운아이드걸스 ",
  "00143",
  "kpop",
  "Shine: 슈가 ",
  "00144",
  "drama",
  "변호사 쉬헐크",
  "00145",
  "proverb",
  "아가리가 광주리만 해도 말을 못한다",
  "00146",
  "drama",
  "덱스터",
  "00147",
  "drama",
  "교도관 나오키",
  "00148",
  "movie",
  "레드 라이딩 후드",
  "00149",
  "drama",
  "미스코리아",
  "00150",
  "kpop",
  "구르미 그린 달빛: 거미 ",
  "00151",
  "drama",
  "꾸미는 사랑에는 이유가 있어",
  "00152",
  "drama",
  "스포트라이트",
  "00153",
  "drama",
  "난 왜 아빠랑 성이 달라?",
  "00154",
  "movie",
  "조커",
  "00155",
  "proverb",
  "귀에 걸면 귀걸이 코에 걸면 코걸이",
  "00156",
  "kpop",
  "늦은 밤 너의 집 앞 골목길에서: 노을 ",
  "00157",
  "movie",
  "극장판 엉덩이 탐정: 수플레 섬의 비밀",
  "00158",
  "kpop",
  "이바보: 원더걸스 ",
  "00159",
  "proverb",
  "이 없으면 잇몸으로 산다",
  "00160",
  "movie",
  "조이",
  "00161",
  "proverb",
  "열 손가락을 깨물어 안 아픈 손가락 없다",
  "00162",
  "drama",
  "미세스 캅",
  "00163",
  "kpop",
  "외국인의 고백: AKMU (악뮤) ",
  "00164",
  "kpop",
  "Paris (Feat. Jisun of Loveholic): 에픽하이 (EPIK HIGH) ",
  "00165",
  "proverb",
  "잔솔밭에서 바늘 찾기다",
  "00166",
  "kpop",
  "사랑이 올까요 (With 백지영): 마이티 마우스, 백지영 ",
  "00167",
  "kpop",
  "개미와 베짱이: 유리상자 ",
  "00168",
  "movie",
  "보스 베이비 2",
  "00169",
  "kpop",
  "정말 사랑했을까: 브라운 아이드 소울 ",
  "00170",
  "movie",
  "범블비",
  "00171",
  "drama",
  "내 눈에 콩깍지",
  "00172",
  "drama",
  "블랙의 신부",
  "00173",
  "movie",
  "아이스 에이지 3: 공룡시대",
  "00174",
  "kpop",
  "아무래도 난: 주시크 (Joosiq) ",
  "00175",
  "movie",
  "너의 결혼식",
  "00176",
  "proverb",
  "길고 짧은 것은 대어 보아야 한다",
  "00177",
  "kpop",
  "19금 나 이런사람이야: DJ DOC ",
  "00178",
  "movie",
  "마이 웨이",
  "00179",
  "proverb",
  "번갯불에 콩볶아 먹겠다",
  "00180",
  "drama",
  "꽃미남 라면가게",
  "00181",
  "movie",
  "특별수사: 사형수의 편지",
  "00182",
  "movie",
  "뜨거운 피",
  "00183",
  "kpop",
  "나쁜 여자야: FTISLAND (FT아일랜드) ",
  "00184",
  "drama",
  "니가 깜짝 놀랄만한 얘기를 들려주마",
  "00185",
  "proverb",
  "산 밑 집에 방앗공이가 논다",
  "00186",
  "kpop",
  "19금 BORN HATER (Feat. 빈지노, 버벌진트, B.I, MINO, BOBBY): 에픽하이 (EPIK HIGH) ",
  "00187",
  "kpop",
  "끝: 싸이 (PSY) ",
  "00188",
  "drama",
  "갑동이",
  "00189",
  "kpop",
  "주저하는 연인들을 위해: 잔나비 ",
  "00190",
  "drama",
  "여자가 두번 화장할 때",
  "00191",
  "kpop",
  "I Promise You: 원티드, 이정 ",
  "00192",
  "kpop",
  "아무도 모르게 (Prod. by MC몽): 치타 (CHEETAH), 에일리(Ailee) ",
  "00193",
  "kpop",
  "시간을 달려서 (Rough): 여자친구 (GFRIEND) ",
  "00194",
  "kpop",
  "러시안 룰렛 (Russian Roulette): Red Velvet (레드벨벳) ",
  "00195",
  "drama",
  "마지스카 학원 3",
  "00196",
  "kpop",
  "하루도 그대를 사랑하지 않은 적이 없었다: 임창정 ",
  "00197",
  "kpop",
  "최고의 행운: 첸 (CHEN) ",
  "00198",
  "drama",
  "그래서 저는 픽했습니다",
  "00199",
  "drama",
  "머독 미스터리",
  "00200",
  "kpop",
  "Lie (Radio Ver.): 박화요비 ",
  "00201",
  "drama",
  "기묘한 이야기(시즌 3)",
  "00202",
  "movie",
  "우리 형",
  "00203",
  "kpop",
  "사뿐사뿐: AOA ",
  "00204",
  "drama",
  "구여친클럽",
  "00205",
  "movie",
  "말레피센트",
  "00206",
  "kpop",
  "사랑이라 쓰고 아픔이라 부른다: 서인영 ",
  "00207",
  "movie",
  "인질",
  "00208",
  "kpop",
  "내 목소리 들리니: 벤 ",
  "00209",
  "movie",
  "가장 보통의 연애",
  "00210",
  "movie",
  "외계+인 1부",
  "00211",
  "kpop",
  "어떻게 이별까지 사랑하겠어, 널 사랑하는 거지: AKMU (악뮤) ",
  "00212",
  "kpop",
  "헤어져줘서 고마워: 벤 ",
  "00213",
  "proverb",
  "겸손도 지나치면 믿지 못한다",
  "00214",
  "proverb",
  "세 살 버릇 여든까지 간다",
  "00215",
  "drama",
  "미스 마:복수의 여신",
  "00216",
  "kpop",
  "봄날: 아이 ",
  "00217",
  "kpop",
  "Let Me Dance: 렉시 ",
  "00218",
  "kpop",
  "Mr. Chu (On Stage): Apink (에이핑크) ",
  "00219",
  "movie",
  "공작",
  "00220",
  "kpop",
  "흔한 이별: 허각 ",
  "00221",
  "drama",
  "울트라맨 데커",
  "00222",
  "kpop",
  "그대 돌아오면..: 거미 ",
  "00223",
  "drama",
  "태양속으로",
  "00224",
  "movie",
  "어쌔신 크리드",
  "00225",
  "movie",
  "너의 췌장을 먹고 싶어",
  "00226",
  "drama",
  "금혼령 조선 혼인 금지령",
  "00227",
  "drama",
  "무미랑전기",
  "00228",
  "movie",
  "로건",
  "00229",
  "drama",
  "전체 27개 문서",
  "00230",
  "kpop",
  "빌었어: 창모 (CHANGMO) ",
  "00231",
  "proverb",
  "똥누고 밑 안 씻은 것 같다",
  "00232",
  "drama",
  "나의 너에게",
  "00233",
  "movie",
  "지.아이.조 2",
  "00234",
  "movie",
  "극장판 뽀로로와 친구들: 바이러스를 없애줘!",
  "00235",
  "drama",
  "외교관 쿠로다 코사쿠",
  "00236",
  "drama",
  "뜻밖의 히어로즈",
  "00237",
  "kpop",
  "바빠 (Bad Boy): 씨스타 ",
  "00238",
  "kpop",
  "사랑..다 거짓말: 린 ",
  "00239",
  "kpop",
  "아이스크림: MC몽 ",
  "00240",
  "drama",
  "마이티 덕스: 게임 체인저",
  "00241",
  "kpop",
  "출국 (出國): 하림 ",
  "00242",
  "movie",
  "신의 한 수",
  "00243",
  "movie",
  "황해",
  "00244",
  "movie",
  "샌 안드레아스",
  "00245",
  "drama",
  "고슴도치(베스트극장)",
  "00246",
  "kpop",
  "사랑하자: SG 워너비 ",
  "00247",
  "movie",
  "장수상회",
  "00248",
  "proverb",
  "호랑이 담배 필 적",
  "00249",
  "kpop",
  "Hello Hello: FTISLAND (FT아일랜드) ",
  "00250",
  "drama",
  "우주전대 큐레인저",
  "00251",
  "kpop",
  "겨울사랑: The One (더원) ",
  "00252",
  "drama",
  "신의 퀴즈",
  "00253",
  "kpop",
  "좋니: 윤종신 ",
  "00254",
  "proverb",
  "미운 놈 떡 하나 더 준다",
  "00255",
  "drama",
  "내 첫사랑을 너에게 바친다",
  "00256",
  "movie",
  "부라더",
  "00257",
  "kpop",
  "바보: 박효신 ",
  "00258",
  "kpop",
  "떠난 너: 김현정 ",
  "00259",
  "kpop",
  "이별후애(愛): 린애 ",
  "00260",
  "drama",
  "갤럭시 프로젝트",
  "00261",
  "kpop",
  "둘만의 세상으로 가: Crush ",
  "00262",
  "drama",
  "루머의 루머의 루머",
  "00263",
  "proverb",
  "검은 고양이 눈감듯 한다",
  "00264",
  "drama",
  "가면라이더 드라이브",
  "00265",
  "drama",
  "펀치(SBS)",
  "00266",
  "kpop",
  "너 하나야: 포맨 (4MEN) ",
  "00267",
  "kpop",
  "Feeling: 김종국 ",
  "00268",
  "drama",
  "더 게임: 0시를 향하여",
  "00269",
  "movie",
  "나인",
  "00270",
  "movie",
  "타잔 3D",
  "00271",
  "kpop",
  "이 소설의 끝을 다시 써보려 해: 한동근 ",
  "00272",
  "movie",
  "도가니",
  "00273",
  "movie",
  "스타트렉 비욘드",
  "00274",
  "kpop",
  "너의 의미 (Feat. 김창완): 아이유 ",
  "00275",
  "kpop",
  "소나기 (주르르루): 버스커 버스커 ",
  "00276",
  "drama",
  "디셉션",
  "00277",
  "movie",
  "터닝메카드W: 블랙미러의 부활",
  "00278",
  "kpop",
  "사랑했어요 (Feat. 데니안): SG 워너비 ",
  "00279",
  "movie",
  "에베레스트",
  "00280",
  "kpop",
  "새 사랑: 송하예 ",
  "00281",
  "kpop",
  "Gee: 소녀시대 (GIRLS GENERATION) ",
  "00282",
  "movie",
  "맨 인 더 다크",
  "00283",
  "movie",
  "앨빈과 슈퍼밴드2",
  "00284",
  "kpop",
  "사랑과 전쟁 (Narr. 하하): 다비치 ",
  "00285",
  "proverb",
  "잔고기가 가시는 세다",
  "00286",
  "movie",
  "메리와 마녀의 꽃",
  "00287",
  "drama",
  "굿 와이프",
  "00288",
  "movie",
  "고장난 론",
  "00289",
  "kpop",
  "LATATA: (여자)아이들 ",
  "00290",
  "drama",
  "사랑찬가",
  "00291",
  "drama",
  "건담 빌드 리얼",
  "00292",
  "movie",
  "조선명탐정 : 사라진 놉의 딸",
  "00293",
  "movie",
  "은밀하게 위대하게",
  "00294",
  "movie",
  "악의 연대기",
  "00295",
  "kpop",
  "너의 모든 순간: 성시경 ",
  "00296",
  "kpop",
  "사랑을 원해: 쿨 (COOL) ",
  "00297",
  "kpop",
  "MY BAG: (여자)아이들 ",
  "00298",
  "movie",
  "슈퍼 배드",
  "00299",
  "kpop",
  "전화 한 번 못하니 (Feat. 미스에스 태혜영): 왁스 ",
  "00300",
  "drama",
  "더 폴리티션",
  "00301",
  "movie",
  "셔터 아일랜드",
  "00302",
  "drama",
  "블러드라인",
  "00303",
  "proverb",
  "아비만한 자식이 없다",
  "00304",
  "drama",
  "빌런즈",
  "00305",
  "kpop",
  "Love: 브라운아이드걸스 ",
  "00306",
  "drama",
  "결혼합시다(MBC)",
  "00307",
  "drama",
  "헬로! 발바리",
  "00308",
  "kpop",
  "View: SHINee (샤이니) ",
  "00309",
  "kpop",
  "안좋을때 들으면 더 안좋은 노래: 형돈이와 대준이 ",
  "00310",
  "movie",
  "공공의 적 2",
  "00311",
  "movie",
  "카3: 새로운 도전",
  "00312",
  "movie",
  "사냥",
  "00313",
  "movie",
  "리오",
  "00314",
  "drama",
  "우리가족 마법사",
  "00315",
  "movie",
  "마녀(魔女) Part2. The Other One",
  "00316",
  "movie",
  "삼총사 3D",
  "00317",
  "proverb",
  "모난 돌이 정 맞는다",
  "00318",
  "movie",
  "모비우스",
  "00319",
  "drama",
  "60일 지정생존자",
  "00320",
  "drama",
  "두부 프로레슬링",
  "00321",
  "movie",
  "과속스캔들",
  "00322",
  "kpop",
  "까만안경 (Feat. Day Light): 이루, Daylight ",
  "00323",
  "drama",
  "파워레인저 와일드포스",
  "00324",
  "drama",
  "더 캡처",
  "00325",
  "drama",
  "수리검전대 닌닌저",
  "00326",
  "kpop",
  "흩어진 나날들: 박효신 ",
  "00327",
  "proverb",
  "형만한 아우 없다",
  "00328",
  "drama",
  "그래서 나는 안티팬과 결혼했다",
  "00329",
  "kpop",
  "토요일밤에: 손담비 ",
  "00330",
  "drama",
  "슬기로운 생활 시리즈",
  "00331",
  "movie",
  "모가디슈",
  "00332",
  "drama",
  "사건번호 113",
  "00333",
  "movie",
  "페르시아의 왕자: 시간의 모래",
  "00334",
  "movie",
  "신비아파트: 금빛 도깨비와 비밀의 동굴",
  "00335",
  "kpop",
  "Hype boy: NewJeans ",
  "00336",
  "drama",
  "드롭아웃",
  "00337",
  "movie",
  "대호",
  "00338",
  "drama",
  "일타 스캔들",
  "00339",
  "kpop",
  "Top Girl: 지나 ",
  "00340",
  "drama",
  "대한민국 변호사",
  "00341",
  "movie",
  "엔더스 게임",
  "00342",
  "kpop",
  "빚: 이수영 ",
  "00343",
  "movie",
  "침묵",
  "00344",
  "proverb",
  "끝도 갓도 없다",
  "00345",
  "proverb",
  "우선 먹기는 곶감이 달다",
  "00346",
  "kpop",
  "미워도 좋아: 별 ",
  "00347",
  "kpop",
  "일년이면: 휘성 (Realslow) ",
  "00348",
  "kpop",
  "가슴이 아려와: 란 (RAN) ",
  "00349",
  "drama",
  "리치 맨 푸어 우먼",
  "00350",
  "proverb",
  "첫 술에 배부르랴",
  "00351",
  "kpop",
  "사랑의 숲에서 길을 잃다 (Feat. 임창정): 제드 ",
  "00352",
  "kpop",
  "아마두 (feat.우원재, 김효은, 넉살, Huckleberry P): 염따, 딥플로우, 팔로알토 (Paloalto), The Quiett, 사이먼 도미닉 ",
  "00353",
  "drama",
  "너는 나의 봄",
  "00354",
  "drama",
  "인사이더",
  "00355",
  "drama",
  "최후의 변호인",
  "00356",
  "movie",
  "캐리와 슈퍼콜라",
  "00357",
  "drama",
  "오버 더 레인보우",
  "00358",
  "kpop",
  "아름다운 밤이야: 비스트 ",
  "00359",
  "kpop",
  "유리 (唯俚 - 비록 슬퍼진다 하더라도): 김정훈 ",
  "00360",
  "movie",
  "남과 여",
  "00361",
  "movie",
  "스텝 업 3D",
  "00362",
  "drama",
  "도둑놈 도둑님",
  "00363",
  "drama",
  "비질란테",
  "00364",
  "kpop",
  "제자리 걸음: 김종국 ",
  "00365",
  "drama",
  "미미쿠스",
  "00366",
  "proverb",
  "아는 길도 물어 가자",
  "00367",
  "drama",
  "전차남",
  "00368",
  "movie",
  "김종욱 찾기",
  "00369",
  "kpop",
  "주문-MIROTIC (Clean Ver.): 동방신기 (TVXQ!) ",
  "00370",
  "movie",
  "메리다와 마법의 숲",
  "00371",
  "movie",
  "젠틀맨",
  "00372",
  "drama",
  "다섯 손가락",
  "00373",
  "drama",
  "두 번째 남편",
  "00374",
  "kpop",
  "After LIKE: IVE (아이브) ",
  "00375",
  "kpop",
  "Its Raining: 비 ",
  "00376",
  "kpop",
  "헤어지러 가는 길 (Feat. 조권): 임정희 ",
  "00377",
  "kpop",
  "이노래: 2am ",
  "00378",
  "movie",
  "소스 코드",
  "00379",
  "movie",
  "제보자",
  "00380",
  "movie",
  "토르: 라그나로크",
  "00381",
  "kpop",
  "바코드 (Prod. GroovyRoom): 김하온 (HAON), 빈첸 ",
  "00382",
  "kpop",
  "너도 그냥 날 놓아주면 돼: 윤건 ",
  "00383",
  "drama",
  "친구 우리들의 전설",
  "00384",
  "kpop",
  "클래식: KCM ",
  "00385",
  "proverb",
  "제 배가 부르면 종 배고픈 줄 모른다",
  "00386",
  "drama",
  "오로라 공주",
  "00387",
  "movie",
  "컨저링3: 악마가 시켰다",
  "00388",
  "drama",
  "벼락맞은 문방구 2",
  "00389",
  "proverb",
  "장부가 칼을 빼었다가 다시 꽂나?",
  "00390",
  "kpop",
  "HER: 블락비 (Block B) ",
  "00391",
  "movie",
  "닌자터틀 : 어둠의 히어로",
  "00392",
  "kpop",
  "너의 곁으로: 조성모 ",
  "00393",
  "movie",
  "아더 크리스마스",
  "00394",
  "drama",
  "로드 넘버 원",
  "00395",
  "movie",
  "위자: 저주의 시작",
  "00396",
  "drama",
  "내 곁에 있어",
  "00397",
  "movie",
  "신들의 전쟁",
  "00398",
  "movie",
  "컨저링",
  "00399",
  "kpop",
  "어떤가요: 박화요비 ",
  "00400",
  "movie",
  "이스케이프 플랜",
  "00401",
  "drama",
  "미스 몬테크리스토",
  "00402",
  "proverb",
  "죽도 밥도 안 된다",
  "00403",
  "movie",
  "맨발의 꿈",
  "00404",
  "drama",
  "슈퍼대디 열",
  "00405",
  "kpop",
  "운전만해 (We Ride): 브레이브걸스 ",
  "00406",
  "movie",
  "브이아이피",
  "00407",
  "proverb",
  "어질병이 지랄병 된다",
  "00408",
  "proverb",
  "집에서 새는 바가지는 들에 가도 샌다",
  "00409",
  "drama",
  "래치드",
  "00410",
  "kpop",
  "Sweety: 샵 ",
  "00411",
  "movie",
  "극장판 주술회전 0",
  "00412",
  "drama",
  "복면검사",
  "00413",
  "movie",
  "곡성",
  "00414",
  "movie",
  "나는 전설이다",
  "00415",
  "kpop",
  "오늘 밤 (Feat. 배치기): 린 ",
  "00416",
  "movie",
  "스타워즈: 라스트 제다이",
  "00417",
  "drama",
  "7급 공무원",
  "00418",
  "movie",
  "천재 강아지 미스터 피바디",
  "00419",
  "proverb",
  "참새가 죽어도 짹한다",
  "00420",
  "movie",
  "덕혜옹주",
  "00421",
  "drama",
  "신화(SBS)",
  "00422",
  "kpop",
  "멋쟁이 신사: YG Family ",
  "00423",
  "movie",
  "대배우",
  "00424",
  "drama",
  "더 뮤지컬",
  "00425",
  "movie",
  "분노의 질주: 홉스&쇼",
  "00426",
  "kpop",
  "만약에 말야 (전우성 Solo): 노을 ",
  "00427",
  "drama",
  "대군 - 사랑을 그리다",
  "00428",
  "proverb",
  "거지 발싸게 같다",
  "00429",
  "drama",
  "아들 녀석들",
  "00430",
  "kpop",
  "Boogie On & On: 빈지노 (Beenzino) ",
  "00431",
  "movie",
  "인천상륙작전",
  "00432",
  "proverb",
  "부자는 망해도 삼 년 먹을 것이 있다",
  "00433",
  "movie",
  "신세계",
  "00434",
  "kpop",
  "Breathe: 미쓰에이 ",
  "00435",
  "drama",
  "모테키",
  "00436",
  "drama",
  "링크: 먹고 사랑하라 죽이게",
  "00437",
  "proverb",
  "도깨비 장난 같다",
  "00438",
  "drama",
  "그 남자 오수",
  "00439",
  "drama",
  "달이 뜨는 강",
  "00440",
  "kpop",
  "아니: 거미 ",
  "00441",
  "movie",
  "터미네이터: 다크 페이트",
  "00442",
  "kpop",
  "요즘 바쁜가봐: 2BIC(투빅) ",
  "00443",
  "drama",
  "산부인과",
  "00444",
  "kpop",
  "또 다시 사랑: 임창정 ",
  "00445",
  "drama",
  "아름다운 그",
  "00446",
  "kpop",
  "CAFE: BIGBANG (빅뱅) ",
  "00447",
  "movie",
  "베놈",
  "00448",
  "drama",
  "신사의 품격",
  "00449",
  "movie",
  "원피스 필름 골드",
  "00450",
  "movie",
  "노무현입니다",
  "00451",
  "drama",
  "그리고 베를린에서",
  "00452",
  "kpop",
  "가시리: SG 워너비, KCM ",
  "00453",
  "movie",
  "밤의 여왕",
  "00454",
  "movie",
  "고질라 VS. 콩",
  "00455",
  "drama",
  "결혼해주세요",
  "00456",
  "kpop",
  "안녕: 폴킴 ",
  "00457",
  "movie",
  "마파도",
  "00458",
  "movie",
  "터보",
  "00459",
  "kpop",
  "화 (Feat. 진실 Of Mad Soul Child) (Fire): 매드클라운 ",
  "00460",
  "kpop",
  "연애특강 (FEAT. 한예슬): 마이티 마우스 ",
  "00461",
  "kpop",
  "맨정신: BIGBANG (빅뱅) ",
  "00462",
  "kpop",
  "벚꽃 엔딩: 버스커 버스커 ",
  "00463",
  "proverb",
  "비단 옷 입고 밤 길 걷기",
  "00464",
  "drama",
  "스파이",
  "00465",
  "movie",
  "아이스 에이지 4: 대륙 이동설",
  "00466",
  "movie",
  "친구 2",
  "00467",
  "drama",
  "막돼먹은 영애씨 시즌14",
  "00468",
  "movie",
  "서복",
  "00469",
  "drama",
  "내 딸 금사월",
  "00470",
  "proverb",
  "장구치는 놈 따로 있고 고개 까딱이는 놈 따로 있나?",
  "00471",
  "movie",
  "수퍼 소닉2",
  "00472",
  "kpop",
  "한여름날의 꿈 (Duet With 옥주현): SG 워너비 ",
  "00473",
  "kpop",
  "Touch My Body: 씨스타 ",
  "00474",
  "proverb",
  "하룻밤을 자도 만리장성을 쌓는다",
  "00475",
  "drama",
  "장미의 전쟁(MBC)",
  "00476",
  "movie",
  "킹스 스피치",
  "00477",
  "movie",
  "링컨 차를 타는 변호사",
  "00478",
  "kpop",
  "IDOL: 방탄소년단 ",
  "00479",
  "proverb",
  "동네북이냐",
  "00480",
  "drama",
  "웨스트월드",
  "00481",
  "kpop",
  "그녀가 웃잖아....: 김형중 ",
  "00482",
  "kpop",
  "좋아: 민서 (MINSEO), 윤종신 ",
  "00483",
  "movie",
  "킹스맨: 퍼스트 에이전트",
  "00484",
  "drama",
  "아임 홈",
  "00485",
  "movie",
  "도리를 찾아서",
  "00486",
  "movie",
  "돈의 맛",
  "00487",
  "kpop",
  "시간이 흐른 뒤 (As Time Goes By): 윤미래 ",
  "00488",
  "drama",
  "불새 2020",
  "00489",
  "kpop",
  "부탁: 김원준 ",
  "00490",
  "movie",
  "유체이탈자",
  "00491",
  "kpop",
  "정말로 사랑한다면: 버스커 버스커 ",
  "00492",
  "kpop",
  "다시 만난 세계 (Into The New World): 소녀시대 (GIRLS GENERATION) ",
  "00493",
  "movie",
  "데시벨",
  "00494",
  "movie",
  "마담 뺑덕",
  "00495",
  "drama",
  "맏이(JTBC)",
  "00496",
  "movie",
  "무뢰한",
  "00497",
  "movie",
  "강릉",
  "00498",
  "drama",
  "학교 2021",
  "00499",
  "kpop",
  "당신은 모르실거야 (CF - LIG 핑클편): 핑클 (Fin.K.L) ",
  "00500",
  "movie",
  "콩: 스컬 아일랜드",
  "00501",
  "drama",
  "브리저튼",
  "00502",
  "movie",
  "마법사의 제자",
  "00503",
  "proverb",
  "고생 끝에 낙이 있다",
  "00504",
  "drama",
  "닥터 차정숙",
  "00505",
  "kpop",
  "통증: 거미 ",
  "00506",
  "kpop",
  "보라빛 밤 (pporappippam): 선미 ",
  "00507",
  "movie",
  "슈퍼 에이트",
  "00508",
  "kpop",
  "Ice Cream Cake: Red Velvet (레드벨벳) ",
  "00509",
  "drama",
  "결혼계약",
  "00510",
  "proverb",
  "가자니 태산이요 돌아서자니 숭산이라",
  "00511",
  "movie",
  "호빗: 다섯 군대 전투",
  "00512",
  "kpop",
  "What is Love?: TWICE (트와이스) ",
  "00513",
  "kpop",
  "보름달 (Feat. Lena): 선미 ",
  "00514",
  "movie",
  "리멤버",
  "00515",
  "movie",
  "동주",
  "00516",
  "proverb",
  "모처럼 태수가 되니 턱이 떨어진다",
  "00517",
  "drama",
  "부탁해요 캡틴",
  "00518",
  "kpop",
  "오랜만이야: 임창정 ",
  "00519",
  "kpop",
  "비와 당신: 이무진 ",
  "00520",
  "drama",
  "노다메 칸타빌레",
  "00521",
  "kpop",
  "취향저격: iKON ",
  "00522",
  "drama",
  "몽화록",
  "00523",
  "kpop",
  "지 상세정보 페이지 이동:  편지",
  "00524",
  "movie",
  "청담보살",
  "00525",
  "kpop",
  "화장을 고치고: 왁스 ",
  "00526",
  "proverb",
  "산이 높아야 골이 깊다",
  "00527",
  "movie",
  "슬로우 비디오",
  "00528",
  "movie",
  "내부자들: 디 오리지널",
  "00529",
  "kpop",
  "분홍신: 아이유 ",
  "00530",
  "movie",
  "토탈 리콜",
  "00531",
  "movie",
  "더 배트맨",
  "00532",
  "kpop",
  "이제 나만 믿어요: 임영웅 ",
  "00533",
  "proverb",
  "물에 빠진 새앙쥐",
  "00534",
  "kpop",
  "소년이여: G-DRAGON ",
  "00535",
  "drama",
  "소원을 말해봐",
  "00536",
  "movie",
  "빅매치",
  "00537",
  "drama",
  "스캔들: 매우 충격적이고 부도덕한 사건",
  "00538",
  "kpop",
  "가슴으로 외쳐 (Rap Feat. Rhymer): 먼데이 키즈 (Monday Kiz) ",
  "00539",
  "drama",
  "떨리는 가슴",
  "00540",
  "drama",
  "더 킹 : 영원의 군주",
  "00541",
  "movie",
  "창궐",
  "00542",
  "drama",
  "디보스",
  "00543",
  "drama",
  "미생물",
  "00544",
  "movie",
  "방자전",
  "00545",
  "kpop",
  "기억상실: 거미 ",
  "00546",
  "drama",
  "아이돌 마스터.KR",
  "00547",
  "movie",
  "픽셀",
  "00548",
  "kpop",
  "잠이 오질 않네요: 장범준 ",
  "00549",
  "proverb",
  "고양이 쥐 생각",
  "00550",
  "movie",
  "더 임파서블",
  "00551",
  "kpop",
  "와줘..: SE7EN ",
  "00552",
  "kpop",
  "여기까진가요: 플라워 ",
  "00553",
  "drama",
  "찔레꽃(KBS)",
  "00554",
  "movie",
  "내 생애 가장 아름다운 일주일",
  "00555",
  "movie",
  "투모로우",
  "00556",
  "drama",
  "내 아이디는 강남미인",
  "00557",
  "drama",
  "이 연애는 불가항력",
  "00558",
  "movie",
  "7번방의 선물",
  "00559",
  "drama",
  "Dr.깽",
  "00560",
  "drama",
  "황후의 품격",
  "00561",
  "drama",
  "광고천재 이태백",
  "00562",
  "movie",
  "월드 워 Z",
  "00563",
  "kpop",
  "다 줄꺼야: 이승기 ",
  "00564",
  "kpop",
  "우리가 이별할 때 (Duet 백지영): 소울스타 (SOULSTAR) ",
  "00565",
  "kpop",
  "Counting Stars (Feat. Beenzino): BEO (비오) ",
  "00566",
  "kpop",
  "삐삐: 아이유 ",
  "00567",
  "drama",
  "내 인생의 단비",
  "00568",
  "drama",
  "익스팬스",
  "00569",
  "drama",
  "연인들",
  "00570",
  "drama",
  "화려한 시절",
  "00571",
  "kpop",
  "A Real Man: 스윙스, 에일리(Ailee) ",
  "00572",
  "movie",
  "메가마인드",
  "00573",
  "movie",
  "해피 데스데이",
  "00574",
  "movie",
  "레전드 오브 타잔",
  "00575",
  "kpop",
  "그대 돌아오면..: 거미 ",
  "00576",
  "movie",
  "블랙 팬서: 와칸다 포에버",
  "00577",
  "drama",
  "찬란한 유산",
  "00578",
  "proverb",
  "나귀는 제 귀 큰 줄을 모른다",
  "00579",
  "proverb",
  "비는 데는 무쇠도 녹는다",
  "00580",
  "movie",
  "쥬라기 월드: 도미니언",
  "00581",
  "proverb",
  "관 짜놓고 죽기를 기다린다",
  "00582",
  "movie",
  "순정",
  "00583",
  "kpop",
  "열 (Feat. Tablo): 이정(J.Lee) ",
  "00584",
  "kpop",
  "Officially Missing You, Too: 긱스 (Geeks), 소유 (SOYOU) ",
  "00585",
  "proverb",
  "가는 말에도 채찍질을 한다",
  "00586",
  "proverb",
  "누워 떡 먹기",
  "00587",
  "proverb",
  "꼬리가 길면 밟힌다",
  "00588",
  "movie",
  "언차티드",
  "00589",
  "kpop",
  "한번 단 한번: SE7EN ",
  "00590",
  "drama",
  "가면라이더 히비키",
  "00591",
  "drama",
  "무법 변호사",
  "00592",
  "drama",
  "에덴의 동쪽",
  "00593",
  "kpop",
  "Sea Of Love: 플라이 투 더 스카이 ",
  "00594",
  "movie",
  "눈의 여왕5: 스노우 프린세스와 미러랜드의 비밀",
  "00595",
  "kpop",
  "Wanna: 카라 ",
  "00596",
  "kpop",
  "Boo: 아이유 ",
  "00597",
  "movie",
  "어린왕자",
  "00598",
  "movie",
  "스텝 업: 올 인",
  "00599",
  "movie",
  "앵커",
  "00600",
  "proverb",
  "떡 줄 사람은 생각하지도 않는데 김칫국부터 마신다",
  "00601",
  "movie",
  "시동",
  "00602",
  "kpop",
  "Loving U (러빙유): 씨스타 ",
  "00603",
  "kpop",
  "봄날: 방탄소년단 ",
  "00604",
  "movie",
  "컨저링 2",
  "00605",
  "movie",
  "도둑들",
  "00606",
  "movie",
  "계춘할망",
  "00607",
  "movie",
  "파파로티",
  "00608",
  "drama",
  "굿바이 미스터 블랙",
  "00609",
  "kpop",
  "Brand New: 신화 ",
  "00610",
  "kpop",
  "나를 봐: 이정(J.Lee) ",
  "00611",
  "proverb",
  "늙은이 아이 된다",
  "00612",
  "drama",
  "마녀식당으로 오세요",
  "00613",
  "drama",
  "마이너리티 리포트",
  "00614",
  "proverb",
  "거짓말은 새끼를 친다",
  "00615",
  "drama",
  "스마일 어게인",
  "00616",
  "movie",
  "악녀",
  "00617",
  "proverb",
  "입이 여럿이면 무쇠도 녹인다",
  "00618",
  "drama",
  "공작도시",
  "00619",
  "proverb",
  "모진 놈 옆에 있다가 벼락 맞는다",
  "00620",
  "drama",
  "비밀의 여자",
  "00621",
  "proverb",
  "오뉴월 하루 볕이 무섭다",
  "00622",
  "kpop",
  "Good Day (Feat. 팔로알토) (Prod. 코드 쿤스트): pH-1, 키드밀리 (Kid Milli), 루피 (Loopy) ",
  "00623",
  "movie",
  "몬스터 호텔",
  "00624",
  "kpop",
  "ID; Peace B: 보아 (BoA) ",
  "00625",
  "drama",
  "아메리칸 호러 스토리/시즌 1",
  "00626",
  "drama",
  "그리고 아무도 없었다(2016년 드라마)",
  "00627",
  "movie",
  "의형제",
  "00628",
  "drama",
  "날 녹여주오",
  "00629",
  "kpop",
  "BAAAM (Feat. Muzie Of UV): 다이나믹 듀오 ",
  "00630",
  "drama",
  "여왕의 교실",
  "00631",
  "proverb",
  "기운이 세면 소가 왕 노릇할까",
  "00632",
  "kpop",
  "멋진헛간: 오대천왕 (정형돈, 밴드 혁오) ",
  "00633",
  "movie",
  "테이큰 2",
  "00634",
  "kpop",
  "로보트: 서태지 ",
  "00635",
  "drama",
  "내일도 맑음",
  "00636",
  "movie",
  "킹콩",
  "00637",
  "movie",
  "맘마미아!",
  "00638",
  "kpop",
  "있어줘요: 장덕철 ",
  "00639",
  "proverb",
  "때리는 시어머니 보다 말리는 시누이가 더 밉다",
  "00640",
  "kpop",
  "그리워하다: 비투비 ",
  "00641",
  "kpop",
  "공감 (Feat. 서영은): 정준영 ",
  "00642",
  "drama",
  "폭룡전대 아바레인저",
  "00643",
  "kpop",
  "Heart Shaker: TWICE (트와이스) ",
  "00644",
  "drama",
  "아메리칸즈",
  "00645",
  "drama",
  "마블 디펜더스",
  "00646",
  "kpop",
  "LOVE DIVE: IVE (아이브) ",
  "00647",
  "proverb",
  "서울 가서 김서방 집 찾기",
  "00648",
  "movie",
  "라스트 갓파더",
  "00649",
  "kpop",
  "I My Me Mine: 4minute ",
  "00650",
  "movie",
  "공자 춘추전국시대",
  "00651",
  "movie",
  "발레리안: 천 개 행성의 도시",
  "00652",
  "drama",
  "온리유",
  "00653",
  "kpop",
  "고백: 이승철 ",
  "00654",
  "proverb",
  "값 싼 것이 비지떡",
  "00655",
  "movie",
  "백야행",
  "00656",
  "movie",
  "스카이스크래퍼",
  "00657",
  "proverb",
  "벌거벗고 환도 찬다",
  "00658",
  "kpop",
  "끝사랑: 김범수 ",
  "00659",
  "movie",
  "블랙 스완",
  "00660",
  "proverb",
  "돈 떨어지자 입맛 난다",
  "00661",
  "movie",
  "써로게이트",
  "00662",
  "proverb",
  "임도 보고 뽕도 딴다",
  "00663",
  "movie",
  "찌라시: 위험한 소문",
  "00664",
  "movie",
  "루카",
  "00665",
  "kpop",
  "Ordinary People: SG 워너비 ",
  "00666",
  "kpop",
  "오늘따라 보고싶어서 그래: 다비치 ",
  "00667",
  "kpop",
  "나 어떡해: 베이비복스 ",
  "00668",
  "movie",
  "닌자 어쌔신",
  "00669",
  "kpop",
  "센치해: WINNER ",
  "00670",
  "kpop",
  "아가씨와 건달들: 쿨 (COOL) ",
  "00671",
  "drama",
  "독신천하",
  "00672",
  "movie",
  "동감",
  "00673",
  "drama",
  "새 엄마",
  "00674",
  "kpop",
  "쏘쏘: 백아연 ",
  "00675",
  "kpop",
  "너라고 (Its You): SUPER JUNIOR (슈퍼주니어) ",
  "00676",
  "movie",
  "캡틴 마블",
  "00677",
  "movie",
  "빅",
  "00678",
  "kpop",
  "안녕: 이소라 ",
  "00679",
  "movie",
  "아이들...",
  "00680",
  "movie",
  "더 박스",
  "00681",
  "drama",
  "매일 그대와",
  "00682",
  "drama",
  "남자의 향기",
  "00683",
  "drama",
  "황금빛 내 인생",
  "00684",
  "proverb",
  "호박에 침주기",
  "00685",
  "movie",
  "탐정 : 더 비기닝",
  "00686",
  "movie",
  "보이스",
  "00687",
  "drama",
  "마인드헌터",
  "00688",
  "kpop",
  "기도: 정일영 ",
  "00689",
  "drama",
  "거짓말의 거짓말",
  "00690",
  "movie",
  "투사부일체",
  "00691",
  "kpop",
  "너를 만나: 폴킴 ",
  "00692",
  "kpop",
  "붉은 노을: BIGBANG (빅뱅) ",
  "00693",
  "kpop",
  "내가 아니라도: 주호 ",
  "00694",
  "kpop",
  "Music: 바다 (BADA) ",
  "00695",
  "proverb",
  "공연한 제사 지내고 어물값에 졸린다",
  "00696",
  "drama",
  "슬픔이여 안녕",
  "00697",
  "movie",
  "성난 변호사",
  "00698",
  "kpop",
  "Mr. Flower: 조성모 ",
  "00699",
  "drama",
  "너 미워! 줄리엣",
  "00700",
  "proverb",
  "그 아비에 그 아들",
  "00701",
  "kpop",
  "그 남자 그 여자: 포맨 (4MEN), 미(MIIII) ",
  "00702",
  "proverb",
  "남이 장에 간다고 하니 거름지고 나선다",
  "00703",
  "drama",
  "나만의 당신",
  "00704",
  "drama",
  "아줌마가 간다",
  "00705",
  "drama",
  "소풍가는 여자",
  "00706",
  "movie",
  "미쓰백",
  "00707",
  "drama",
  "단팥빵",
  "00708",
  "drama",
  "울트라맨 블레이저",
  "00709",
  "movie",
  "새미의 어드벤쳐 2",
  "00710",
  "movie",
  "프리 가이",
  "00711",
  "drama",
  "검법남녀",
  "00712",
  "movie",
  "우리들의 행복한 시간",
  "00713",
  "movie",
  "분노의 질주: 언리미티드",
  "00714",
  "kpop",
  "하루 하루: BIGBANG (빅뱅) ",
  "00715",
  "proverb",
  "참고 사는 것이 인생이다",
  "00716",
  "movie",
  "2012",
  "00717",
  "kpop",
  "빨개요: 현아 ",
  "00718",
  "drama",
  "달의 연인 - 보보경심 려",
  "00719",
  "kpop",
  "그 여름을 틀어줘: 싹쓰리 (유두래곤, 린다G, 비룡) ",
  "00720",
  "drama",
  "보석비빔밥",
  "00721",
  "kpop",
  "다시 난, 여기: 백예린 (Yerin Baek) ",
  "00722",
  "kpop",
  "사랑이었다 (Feat. 루나 of f(x)): 지코 (ZICO) ",
  "00723",
  "kpop",
  "솔직하게 말해서 나: 김나영 ",
  "00724",
  "movie",
  "프린스 챠밍",
  "00725",
  "movie",
  "반가운 살인자",
  "00726",
  "movie",
  "스파이",
  "00727",
  "drama",
  "라이프",
  "00728",
  "proverb",
  "잘 되면 제 탓이요 못되면 조상 탓이다",
  "00729",
  "movie",
  "화이트 하우스 다운",
  "00730",
  "movie",
  "하루",
  "00731",
  "movie",
  "어바웃 타임",
  "00732",
  "drama",
  "로봇이 아니야",
  "00733",
  "kpop",
  "오늘부터 우리는 (Me Gustas Tu): 여자친구 (GFRIEND) ",
  "00734",
  "movie",
  "증인",
  "00735",
  "kpop",
  "싫다: 백지영 ",
  "00736",
  "kpop",
  "사랑하나요!?: 이승환 ",
  "00737",
  "movie",
  "신이 보낸 사람",
  "00738",
  "kpop",
  "오늘도 빛나는 너에게 (To You My Light) (Feat.이라온): 마크툽 (MAKTUB) ",
  "00739",
  "kpop",
  "바람기억: 나얼 ",
  "00740",
  "movie",
  "불릿 트레인",
  "00741",
  "movie",
  "버닝",
  "00742",
  "drama",
  "이두나!",
  "00743",
  "drama",
  "원한 해결 사무소",
  "00744",
  "movie",
  "감시자들",
  "00745",
  "kpop",
  "기억을 걷는 시간: 넬 (NELL) ",
  "00746",
  "movie",
  "임금님의 사건수첩",
  "00747",
  "drama",
  "소방서 옆 경찰서",
  "00748",
  "drama",
  "마사지 탐정 죠",
  "00749",
  "drama",
  "경경일상",
  "00750",
  "movie",
  "독전",
  "00751",
  "movie",
  "핑크퐁 시네마 콘서트 2: 원더스타 콘서트 대작전",
  "00752",
  "movie",
  "내 머리 속의 지우개",
  "00753",
  "movie",
  "브레이킹 던 part2",
  "00754",
  "movie",
  "방가? 방가!",
  "00755",
  "proverb",
  "삼십육계에 줄행랑이 제일이다",
  "00756",
  "drama",
  "대연애~나를 잊을 너와",
  "00757",
  "movie",
  "신과함께-인과 연",
  "00758",
  "kpop",
  "와: 이정현 ",
  "00759",
  "drama",
  "그 땅에는 신이 없다 - Godless",
  "00760",
  "drama",
  "굿 닥터",
  "00761",
  "drama",
  "결혼백서",
  "00762",
  "drama",
  "지금도 마로니에는",
  "00763",
  "drama",
  "너를 기억해",
  "00764",
  "drama",
  "다시 첫사랑",
  "00765",
  "kpop",
  "너를 위해: 임재범 ",
  "00766",
  "drama",
  "나쁜엄마",
  "00767",
  "kpop",
  "별이 빛나는 밤: 마마무 (Mamamoo) ",
  "00768",
  "movie",
  "엑스맨: 데이즈 오브 퓨처 패스트",
  "00769",
  "drama",
  "학교 3",
  "00770",
  "proverb",
  "소매 긴 김에 춤춘다",
  "00771",
  "drama",
  "사랑을 예약하세요",
  "00772",
  "drama",
  "오늘의 웹툰",
  "00773",
  "drama",
  "그녀의 사생활",
  "00774",
  "kpop",
  "크레용 (Crayon): G-DRAGON ",
  "00775",
  "drama",
  "백스테이지",
  "00776",
  "movie",
  "마음이2",
  "00777",
  "movie",
  "분노의 질주: 더 오리지널",
  "00778",
  "drama",
  "일지매(2008년 드라마)",
  "00779",
  "drama",
  "호크아이",
  "00780",
  "proverb",
  "꿩 잡는 것이 매다",
  "00781",
  "movie",
  "고령화 가족",
  "00782",
  "movie",
  "분노의 질주: 더 세븐",
  "00783",
  "movie",
  "로그 원: 스타워즈 스토리",
  "00784",
  "drama",
  "내일은 맑음(2000년 드라마)",
  "00785",
  "movie",
  "오늘 밤, 세계에서 이 사랑이 사라진다 해도",
  "00786",
  "kpop",
  "폭풍: SG 워너비 ",
  "00787",
  "kpop",
  "19금 냉탕에 상어 (Feat. 블랙넛): 수퍼비 (SUPERBEE) ",
  "00788",
  "kpop",
  "Artist: 지코 (ZICO) ",
  "00789",
  "kpop",
  "괜찮아 사랑이야: 다비치 ",
  "00790",
  "movie",
  "애나벨 : 인형의 주인",
  "00791",
  "kpop",
  "세 사람 (With 성시경): 토이 ",
  "00792",
  "drama",
  "밤에 피는 꽃",
  "00793",
  "proverb",
  "말은 할수록 늘고, 되질은 할수록 준다",
  "00794",
  "movie",
  "오블리비언",
  "00795",
  "drama",
  "신센구미!",
  "00796",
  "drama",
  "오징어 게임",
  "00797",
  "movie",
  "다이 하드 4 : 죽어도 산다",
  "00798",
  "drama",
  "수사반장 1963",
  "00799",
  "drama",
  "가두리횟집",
  "00800",
  "proverb",
  "나이 이길 장사 없다",
  "00801",
  "drama",
  "매직키드 마수리",
  "00802",
  "kpop",
  "숨: 박효신 ",
  "00803",
  "movie",
  "이상한 나라의 앨리스",
  "00804",
  "kpop",
  "Apple (Feat. 박재범): 가인 ",
  "00805",
  "movie",
  "신데렐라",
  "00806",
  "drama",
  "나와 그녀와 그녀가 사는 길",
  "00807",
  "proverb",
  "자식 겉 낳지 속은 못 낳는다",
  "00808",
  "drama",
  "명랑소녀 성공기",
  "00809",
  "movie",
  "엘리시움",
  "00810",
  "movie",
  "시간 여행자의 아내",
  "00811",
  "drama",
  "도로시를 찾아라",
  "00812",
  "kpop",
  "내 손을 잡아: 아이유 ",
  "00813",
  "proverb",
  "드문드문 걸어도 황소걸음이다",
  "00814",
  "drama",
  "다운튼 애비",
  "00815",
  "movie",
  "볼트",
  "00816",
  "kpop",
  "사랑 먼지: 버블 시스터즈 ",
  "00817",
  "drama",
  "미스 리플리",
  "00818",
  "drama",
  "무림학교",
  "00819",
  "kpop",
  "이러지마 제발 (Please Dont...): 케이윌 ",
  "00820",
  "proverb",
  "내 발등의 불을 꺼야 아비 발등의 불을 끈다",
  "00821",
  "movie",
  "장산범",
  "00822",
  "drama",
  "서른 아홉",
  "00823",
  "kpop",
  "Give Love: AKMU (악뮤) ",
  "00824",
  "kpop",
  "삐리빠빠: 나르샤 (Brown Eyed Girls) ",
  "00825",
  "kpop",
  "너를 사랑해: 윤미래 ",
  "00826",
  "drama",
  "나쁜사랑",
  "00827",
  "kpop",
  "어떻게 지내: Crush ",
  "00828",
  "drama",
  "사랑의 28법칙",
  "00829",
  "kpop",
  "포장마차: 황인욱 ",
  "00830",
  "movie",
  "좋은 친구들",
  "00831",
  "drama",
  "논스톱5",
  "00832",
  "drama",
  "구미호뎐",
  "00833",
  "proverb",
  "젊어 고생은 사서도 한다",
  "00834",
  "movie",
  "장르만 로맨스",
  "00835",
  "movie",
  "소셜 네트워크",
  "00836",
  "drama",
  "내셔널 트레져: 숨겨진 이야기",
  "00837",
  "movie",
  "그래비티",
  "00838",
  "drama",
  "고교처세왕",
  "00839",
  "drama",
  "내 사위의 여자",
  "00840",
  "kpop",
  "보통날: god ",
  "00841",
  "drama",
  "보통의 연애",
  "00842",
  "kpop",
  "나를 외치다: 마야 ",
  "00843",
  "drama",
  "부암동 복수자들",
  "00844",
  "kpop",
  "너를 만나: 폴킴 ",
  "00845",
  "proverb",
  "오리보고 십리 간다",
  "00846",
  "proverb",
  "구관이 명관이다",
  "00847",
  "movie",
  "가디언의 전설",
  "00848",
  "movie",
  "토이 스토리 3",
  "00849",
  "movie",
  "우리는 형제입니다",
  "00850",
  "drama",
  "아이좀비",
  "00851",
  "kpop",
  "나만 안되는 연애: 볼빨간사춘기 ",
  "00852",
  "drama",
  "농부사관학교 2",
  "00853",
  "kpop",
  "한여름밤의 꿀: San E (산이), 레이나 (Raina) ",
  "00854",
  "drama",
  "블러드",
  "00855",
  "drama",
  "편의점 샛별이",
  "00856",
  "drama",
  "홍국영",
  "00857",
  "movie",
  "바다 탐험대 옥토넛 : 탐험선 대작전",
  "00858",
  "kpop",
  "1,2,3,4 (원,투,쓰리,포): 이하이 ",
  "00859",
  "movie",
  "캡틴 아메리카: 시빌 워",
  "00860",
  "movie",
  "인셉션",
  "00861",
  "drama",
  "올드미스 다이어리",
  "00862",
  "drama",
  "너의 시간 속으로",
  "00863",
  "movie",
  "스파이럴",
  "00864",
  "drama",
  "스틸러: 일곱 개의 조선통보",
  "00865",
  "movie",
  "라야와 마지막 드래곤",
  "00866",
  "drama",
  "멋진 친구들 2",
  "00867",
  "movie",
  "극장판 안녕 자두야",
  "00868",
  "kpop",
  "술이 달다 (Feat. Crush): 에픽하이 (EPIK HIGH) ",
  "00869",
  "drama",
  "유리의 성(2008)",
  "00870",
  "drama",
  "간니발",
  "00871",
  "kpop",
  "호랑수월가: 탑현 ",
  "00872",
  "kpop",
  "거북이: 다비치 ",
  "00873",
  "movie",
  "공범",
  "00874",
  "proverb",
  "도둑집 개는 짖지 않는다",
  "00875",
  "drama",
  "아내와 여자",
  "00876",
  "drama",
  "사랑은 노래를 타고",
  "00877",
  "kpop",
  "그대는 눈물겹다: 엠씨더맥스 (M.C the MAX) ",
  "00878",
  "drama",
  "보라! 데보라",
  "00879",
  "drama",
  "나기의 휴식",
  "00880",
  "kpop",
  "기다렸다 가: 다이나믹 듀오, 첸 (CHEN) ",
  "00881",
  "proverb",
  "비단 옷을 입으면 어깨가 올라간다",
  "00882",
  "drama",
  "1%의 어떤 것(2003)",
  "00883",
  "kpop",
  "친구라도 될 걸 그랬어: 거미 ",
  "00884",
  "movie",
  "아바타",
  "00885",
  "movie",
  "여고괴담 5",
  "00886",
  "movie",
  "고산자, 대동여지도",
  "00887",
  "proverb",
  "물불을 가리지 않는다",
  "00888",
  "drama",
  "당신과 나의 거리 63피트",
  "00889",
  "proverb",
  "꿩 먹고 알 먹는다",
  "00890",
  "movie",
  "베스트셀러",
  "00891",
  "drama",
  "크리스마스에 눈이 올까요?",
  "00892",
  "kpop",
  "동경: 박효신 ",
  "00893",
  "drama",
  "베이비(이탈리아 드라마)",
  "00894",
  "proverb",
  "하늘보고 침뱉기다",
  "00895",
  "drama",
  "몬스타",
  "00896",
  "drama",
  "구경이",
  "00897",
  "proverb",
  "화약을 지고 불에 들어간다",
  "00898",
  "kpop",
  "체념 後(후): 빅마마 ",
  "00899",
  "drama",
  "국민사형투표",
  "00900",
  "kpop",
  "Ah Yeah: EXID ",
  "00901",
  "kpop",
  "우연히 봄: 로꼬, 유주 (YUJU) ",
  "00902",
  "drama",
  "내일도 칸타빌레",
  "00903",
  "movie",
  "인생은 뷰티풀: 비타돌체",
  "00904",
  "drama",
  "시작의 노래",
  "00905",
  "kpop",
  "나의 사춘기에게: 볼빨간사춘기 ",
  "00906",
  "kpop",
  "풍변기곡(風變旗曲): 룰라 ",
  "00907",
  "kpop",
  "놀러와: 러브홀릭 ",
  "00908",
  "movie",
  "널 기다리며",
  "00909",
  "drama",
  "변호사들",
  "00910",
  "kpop",
  "안녕이란 말 대신: 비 ",
  "00911",
  "drama",
  "마이걸",
  "00912",
  "kpop",
  "UPT Paradoxxx: 업타운 ",
  "00913",
  "drama",
  "마녀의 발견",
  "00914",
  "drama",
  "칼잡이 오수정",
  "00915",
  "drama",
  "러브 어게인",
  "00916",
  "kpop",
  "나에게로 떠나는 여행: 버즈 ",
  "00917",
  "kpop",
  "Bravo, My Life!: 봄여름가을겨울 ",
  "00918",
  "drama",
  "그대 웃어요",
  "00919",
  "movie",
  "짱구는 못말려 극장판: 나의 이사 이야기 선인장 대습격",
  "00920",
  "movie",
  "몬스터 대학교",
  "00921",
  "movie",
  "퍼시 잭슨과 괴물의 바다",
  "00922",
  "movie",
  "꾼",
  "00923",
  "proverb",
  "가까운 남이 먼 친척보다 낫다",
  "00924",
  "drama",
  "그녀는 예뻤다",
  "00925",
  "drama",
  "연애조작단; 시라노",
  "00926",
  "movie",
  "올빼미",
  "00927",
  "kpop",
  "Back To The Real Life: 윤상 ",
  "00928",
  "movie",
  "PMC: 더 벙커",
  "00929",
  "drama",
  "하얀거탑",
  "00930",
  "movie",
  "아저씨",
  "00931",
  "movie",
  "남자사용설명서",
  "00932",
  "proverb",
  "나라 하나에 임금이 셋이다",
  "00933",
  "movie",
  "엑스맨: 퍼스트 클래스",
  "00934",
  "movie",
  "파라노말 액티비티",
  "00936",
  "drama",
  "신부와 아빠",
  "00937",
  "kpop",
  "그대 내게 다시: 럼블피쉬 ",
  "00938",
  "movie",
  "적인걸: 측천무후의 비밀",
  "00939",
  "movie",
  "익스펜더블",
  "00940",
  "kpop",
  "모든 날, 모든 순간 (Every day, Every Moment): 폴킴 ",
  "00941",
  "proverb",
  "족제비도 낯짝이 있다",
  "00942",
  "movie",
  "여배우들",
  "00943",
  "drama",
  "나는 네가 지난 여름에 한 일을 알고 있다",
  "00944",
  "kpop",
  "Goodbye: 이수영 ",
  "00945",
  "movie",
  "더 킬러: 죽어도 되는 아이",
  "00946",
  "kpop",
  "Windy: 유진 ",
  "00947",
  "kpop",
  "So Fresh (Feat. 김태우) (위대한 캣츠비 OST 삽입곡): MC몽 ",
  "00948",
  "movie",
  "그것",
  "00949",
  "drama",
  "조강지처 클럽(SBS)",
  "00950",
  "movie",
  "아바타 리마스터링",
  "00951",
  "kpop",
  "발자국: 먼데이 키즈 (Monday Kiz) ",
  "00952",
  "movie",
  "타이탄",
  "00953",
  "proverb",
  "노루 잠자듯 한다",
  "00954",
  "drama",
  "여왕의 교실(MBC)",
  "00955",
  "drama",
  "사랑해서 남주나",
  "00956",
  "kpop",
  "Sixth Sense: 브라운아이드걸스 ",
  "00957",
  "drama",
  "상류사회",
  "00958",
  "kpop",
  "배운게 사랑이라: 디셈버 ",
  "00959",
  "drama",
  "팔콘과 윈터 솔져",
  "00960",
  "movie",
  "화이트: 저주의 멜로디",
  "00961",
  "kpop",
  "가슴이 뛴다: 케이윌 ",
  "00962",
  "kpop",
  "그대가 그대를: 이승환 ",
  "00963",
  "proverb",
  "썩어도 준치",
  "00964",
  "movie",
  "회사원",
  "00965",
  "drama",
  "첫사랑(SBS)",
  "00966",
  "kpop",
  "우린 어쩌다 헤어진 걸까: 허각 ",
  "00967",
  "drama",
  "가을에 만난 남자",
  "00968",
  "drama",
  "연인(2006년 드라마)",
  "00969",
  "kpop",
  "Blueming: 아이유 ",
  "00970",
  "movie",
  "헝거게임: 모킹제이",
  "00971",
  "proverb",
  "산 호랑이 눈썹",
  "00972",
  "movie",
  "무적자",
  "00973",
  "movie",
  "소녀괴담",
  "00974",
  "movie",
  "박열",
  "00975",
  "drama",
  "베리 잉글리시 스캔들",
  "00976",
  "movie",
  "압꾸정",
  "00977",
  "movie",
  "레지던트 이블: 파멸의 날",
  "00978",
  "movie",
  "슈렉2",
  "00979",
  "movie",
  "화차",
  "00980",
  "proverb",
  "저녁 굶은 시어미 꼴 같다",
  "00981",
  "proverb",
  "뜨고도 못 보는 당달 봉사",
  "00982",
  "drama",
  "겨우 서른",
  "00983",
  "drama",
  "천년지애",
  "00984",
  "kpop",
  "후회는 없어 (Feat. 베이지): 노블레스 ",
  "00985",
  "movie",
  "마다가스카 2",
  "00986",
  "movie",
  "닥터 스트레인지",
  "00987",
  "movie",
  "나의 사랑 나의 신부",
  "00988",
  "movie",
  "개구쟁이 스머프 2",
  "00989",
  "proverb",
  "냉수 먹고 된똥 눈다",
  "00990",
  "drama",
  "착한여자 백일홍",
  "00991",
  "proverb",
  "학도 아니고 봉도 아니고",
  "00992",
  "movie",
  "퍼시픽 림: 업라이징",
  "00993",
  "drama",
  "이별에 대처하는 우리의 자세",
  "00994",
  "movie",
  "차우",
  "00995",
  "kpop",
  "사건의 지평선: 윤하 (YOUNHA) ",
  "00996",
  "movie",
  "한반도",
  "00997",
  "drama",
  "루루공주",
  "00998",
  "drama",
  "최강칠우",
  "00999",
  "proverb",
  "좁쌀영감이다",
];