/// @description 메뉴 열거
draw_set_font(fontEditorMenu)
// 주 메뉴: [0항목의 제목, 1제목 너비, 2설명, 3콜백, 4항목의 전체 너비, 5제목이 그려질 x 좌표]
// 보조 메뉴: [0항목의 제목, 1아이콘, 2콜백, 3아이콘의 너비, 4항목의 전체 너비, 5항목의 x 좌표]
editor_menu_add("선택", "마우스 커서", -1)
editor_menu_add("노드", "노드 추가 및 삭제하기", -1)
var menu_sprite = editor_menu_add("스프라이트", "스프라이트 배치하기", -1)
editor_submenu_add(menu_sprite, "스프라이트 배치", -1, -1)
editor_submenu_add(menu_sprite, "테마 변경", -1, -1)
var menu_doodad = editor_menu_add("장식물", "장식물 배치하기", -1)
editor_submenu_add(menu_doodad, "장식물 배치", -1, -1)
editor_submenu_add(menu_doodad, "장식물 변경", -1, -1)
var menu_instance = editor_menu_add("개체", "개체 배치하기", -1)
editor_submenu_add(menu_instance, "개체 배치", -1, -1)
editor_submenu_add(menu_instance, "개체 변경", -1, -1)
var menu_setting = editor_menu_add("설정", "설정", -1)
editor_submenu_add(menu_setting, "격자 끄기", -1, -1)
editor_submenu_add(menu_setting, "반전", -1, -1)
editor_submenu_add(menu_setting, "노랑", -1, -1)
editor_submenu_add(menu_setting, "빨강", -1, -1)
editor_submenu_add(menu_setting, "하양", -1, -1)
draw_set_font(fontEditor)
