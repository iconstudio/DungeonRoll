/// @description 정십이면체 좌표
dodecahedron_dihedral_angle = arccos(-1 / sqrt(5)) + 30
dodecahedron_point = array_create(20, [])
dodecahedron_point[00] = [1, 1, 1]
dodecahedron_point[01] = [golden_ratio_reverse, 0, golden_ratio] // blue
dodecahedron_point[02] = [1, -1, 1]
dodecahedron_point[03] = [golden_ratio, -golden_ratio_reverse, 0] // pink
dodecahedron_point[04] = [golden_ratio, golden_ratio_reverse, 0] // pink

dodecahedron_point[05] = [1, 1, -1]
dodecahedron_point[06] = [golden_ratio_reverse, 0, -golden_ratio] // blue
dodecahedron_point[07] = [1, -1, -1]

dodecahedron_point[08] = [-golden_ratio_reverse, 0, -golden_ratio] // blue
dodecahedron_point[09] = [-1, -1, -1]
dodecahedron_point[10] = [0, -golden_ratio, -golden_ratio_reverse] // green
dodecahedron_point[11] = [0, -golden_ratio, golden_ratio_reverse] // green

dodecahedron_point[12] = [-golden_ratio, -golden_ratio_reverse, 0] // pink
dodecahedron_point[13] = [-1, -1, 1]

dodecahedron_point[14] = [-golden_ratio, golden_ratio_reverse, 0] // pink
dodecahedron_point[15] = [-1, 1, 1]
dodecahedron_point[16] = [-golden_ratio_reverse, 0, golden_ratio] // blue

dodecahedron_point[17] = [-1, 1, -1]
dodecahedron_point[18] = [0, golden_ratio, -golden_ratio_reverse] // green
dodecahedron_point[19] = [0, golden_ratio, golden_ratio_reverse] // green
