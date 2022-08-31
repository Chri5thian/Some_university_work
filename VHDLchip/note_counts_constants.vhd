library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
package notes_counts is

	constant note_on_48 : integer := 74;	--1/255 is duty cycle
	constant note_on_49 : integer := 138;	--6/255 is duty cycle
	constant note_on_50 : integer := 202;	--11/255 is duty cycle
	constant note_on_51 : integer := 266;	--16/255 is duty cycle
	constant note_on_52 : integer := 329;	--21/255 is duty cycle
	constant note_on_53 : integer := 393;	--27/255 is duty cycle
	constant note_on_54 : integer := 457;	--32/255 is duty cycle
	constant note_on_55 : integer := 521;	--37/255 is duty cycle
	constant note_on_56 : integer := 585;	--42/255 is duty cycle
	constant note_on_57 : integer := 648;	--47/255 is duty cycle
	constant note_on_58 : integer := 712;	--53/255 is duty cycle
	constant note_on_59 : integer := 776;	--58/255 is duty cycle
	constant note_on_60 : integer := 840;	--63/255 is duty cycle
	constant note_on_61 : integer := 904;	--68/255 is duty cycle
	constant note_on_62 : integer := 968;	--73/255 is duty cycle
	constant note_on_63 : integer := 1031;	--79/255 is duty cycle
	constant note_on_64 : integer := 1095;	--84/255 is duty cycle
	constant note_on_65 : integer := 1159;	--89/255 is duty cycle
	constant note_on_66 : integer := 1223;	--94/255 is duty cycle
	constant note_on_67 : integer := 1287;	--99/255 is duty cycle
	constant note_on_68 : integer := 1351;	--105/255 is duty cycle
	constant note_on_69 : integer := 1414;	--110/255 is duty cycle
	constant note_on_70 : integer := 1478;	--115/255 is duty cycle
	constant note_on_71 : integer := 1542;	--120/255 is duty cycle
	constant note_on_72 : integer := 1606;	--126/255 is duty cycle
	constant note_off_48 : integer := 1643;	--129/255 is duty cycle
	constant note_off_49 : integer := 1706;	--134/255 is duty cycle
	constant note_off_50 : integer := 1770;	--139/255 is duty cycle
	constant note_off_51 : integer := 1834;	--144/255 is duty cycle
	constant note_off_52 : integer := 1898;	--149/255 is duty cycle
	constant note_off_53 : integer := 1962;	--155/255 is duty cycle
	constant note_off_54 : integer := 2026;	--160/255 is duty cycle
	constant note_off_55 : integer := 2089;	--165/255 is duty cycle
	constant note_off_56 : integer := 2153;	--170/255 is duty cycle
	constant note_off_57 : integer := 2217;	--175/255 is duty cycle
	constant note_off_58 : integer := 2281;	--181/255 is duty cycle
	constant note_off_59 : integer := 2345;	--186/255 is duty cycle
	constant note_off_60 : integer := 2409;	--191/255 is duty cycle
	constant note_off_61 : integer := 2472;	--196/255 is duty cycle
	constant note_off_62 : integer := 2536;	--201/255 is duty cycle
	constant note_off_63 : integer := 2600;	--207/255 is duty cycle
	constant note_off_64 : integer := 2664;	--212/255 is duty cycle
	constant note_off_65 : integer := 2728;	--217/255 is duty cycle
	constant note_off_66 : integer := 2792;	--222/255 is duty cycle
	constant note_off_67 : integer := 2855;	--227/255 is duty cycle
	constant note_off_68 : integer := 2919;	--233/255 is duty cycle
	constant note_off_69 : integer := 2983;	--238/255 is duty cycle
	constant note_off_70 : integer := 3047;	--243/255 is duty cycle
	constant note_off_71 : integer := 3111;	--248/255 is duty cycle
	constant note_off_72 : integer := 3175;	--254/255 is duty cycle
end notes_counts;
package body notes_counts is
end notes_counts;
