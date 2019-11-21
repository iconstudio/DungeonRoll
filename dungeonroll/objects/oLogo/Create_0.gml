/// @description 로고와 저작권 표시
loading_continues = true
loading_interrupt_msg = -1

if global.flag_is_mobile and global.network_available {
	if GooglePlayServices_Status() != GooglePlayServices_SUCCESS
		GooglePlayServices_Init() 

	var google_available = GooglePlayServices_Status()
	switch google_available {
		case GooglePlayServices_SERVICE_VERSION_UPDATE_REQUIRED:
			loading_interrupt_msg = show_message_async("Google Player Service의 업데이트가 필요합니다.\nPlay Store에서 업데이트 해주세요.")
			loading_continues = false
		break

		case GooglePlayServices_SERVICE_DISABLED:
			loading_interrupt_msg = show_message_async("Google Player Service가 비활성화 돼있습니다.")
			loading_continues = false
		break

		case GooglePlayServices_SERVICE_MISSING:
			loading_interrupt_msg = show_message_async("Google Player Service API를 찾을 수 없습니다.")
			loading_continues = false
		break

		case GooglePlayServices_SERVICE_INVALID:
			loading_interrupt_msg = show_message_async("설치된 Google Player Service의 버전이 올바르지 않습니다.")
			loading_continues = false
		break

		case GooglePlayServices_SUCCESS:
			achievement_login()

			global.platformservice_available = achievement_login_status()
		break

		default:
		break
	}
}

alarm[0] = 1
