[객체]
oInit
	초기화 용 객체입니다. 현재 예제에서는 꼭 필요한 건 아니지만 확장성을 고려하여 넣어두었습니다.

oPlayer
	사람이 키보드로 조작할 수 있는 객체입니다. 키보드 입력을 함수로 받고 이동합니다.
	모든 작동은 스텝 이벤트에서 이루어집니다. 자세한 설명은 코드를 참조하세요.

oBlock
	Solid(고체) 객체로서 플레이어가 밟고 다닐 수 있는 발판을 담당합니다.

[룸]
roomInit
	초기화 용 룸입니다. oInit만이 배치되있습니다. 현재 예제에서는 꼭 필요한 건 아니지만 확장성을 고려하여 넣어두었습니다.
	다른 룸들은 이 룸의 속성을 상속받아서 뷰 설정과 크기를 통일할 수 있습니다.

roomMain
	블록과 플레이어가 배치된 주 룸입니다.
