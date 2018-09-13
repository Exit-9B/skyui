﻿import Shared.Platforms;

class skyui.defines.Input
{
	static var DEVICE_KEYBOARD: Number	= 0;
	static var DEVICE_MOUSE: Number		= 1;
	static var DEVICE_GAMEPAD: Number	= 2;

	static var CONTEXT_GAMEPLAY: Number		= 0;
	static var CONTEXT_MENUMODE: Number		= 1;
	static var CONTEXT_CONSOLE: Number		= 2;
	static var CONTEXT_ITEMMENU: Number		= 3;
	static var CONTEXT_INVENTORY: Number	= 4;
	static var CONTEXT_DEBUGTEXT: Number	= 5;
	static var CONTEXT_FAVORITES: Number	= 6;
	static var CONTEXT_MAP: Number			= 7;
	static var CONTEXT_STATS: Number		= 8;
	static var CONTEXT_CURSOR: Number		= 9;
	static var CONTEXT_BOOK: Number			= 10;
	static var CONTEXT_DEBUGOVERLAY: Number	= 11;
	static var CONTEXT_JOURNAL: Number		= 12;
	static var CONTEXT_TFCMODE: Number		= 13;
	static var CONTEXT_MAPDEBUG: Number		= 14;
	static var CONTEXT_LOCKPICKING: Number	= 15;
	static var CONTEXT_FAVOR: Number		= 16;

	// Controlmap
	static var ChargeItem	= {name: "ChargeItem", context: CONTEXT_INVENTORY};
	static var XButton		= {name: "XButton", context: CONTEXT_ITEMMENU};
	static var YButton		= {name: "YButton", context: CONTEXT_ITEMMENU};
	static var Wait			= {name: "Wait", context: CONTEXT_GAMEPLAY};
	static var Jump			= {name: "Jump", context: CONTEXT_GAMEPLAY};
	static var Sprint		= {name: "Sprint", context: CONTEXT_GAMEPLAY};
	static var Shout		= {name: "Shout", context: CONTEXT_GAMEPLAY};
	static var Activate		= {name: "Activate", context: CONTEXT_GAMEPLAY};
	static var ReadyWeapon	= {name: "Ready Weapon", context: CONTEXT_GAMEPLAY};
	static var TogglePOV	= {name: "Toggle POV", context: CONTEXT_GAMEPLAY};
	static var Accept		= {name: "Accept", context: CONTEXT_MENUMODE};
	static var Cancel		= {name: "Cancel", context: CONTEXT_MENUMODE};
	static var JournalXButton	= {name: "XButton", context: CONTEXT_JOURNAL};
	static var JournalYButton	= {name: "YButton", context: CONTEXT_JOURNAL};

	// Custom
	static var LeftRight: Array = [
		{name: "Left", context: CONTEXT_MENUMODE},
		{name: "Right", context: CONTEXT_MENUMODE}
	];
	static var Equip: Array = [
		{name: "RightEquip", context: CONTEXT_ITEMMENU},
		{name: "LeftEquip", context: CONTEXT_ITEMMENU}
	];
	static var SortColumn = [
		{keyCode: 274},
		{keyCode: 275}
	];
	static var SortOrder	= {keyCode: 272};

	// Raw
	static var GamepadBack	= {keyCode: 271};
	static var Enter		= {keyCode: 28};
	static var Tab			= {keyCode: 15};
	static var Shift		= {keyCode: 42};
	static var Space		= {keyCode: 57};
	static var Alt			= {keyCode: 56};


	//----------------------------------------------------------------------
	// Utility functions
	//
	// This is for picking the right ButtonArt given a map and a platform enum.
	// It expect the same format the vanilla game uses to specify keys.
	// This makes it relatively straighforward to port changes over.
	//
	// It's a bit unfortunate that functions are making it into a "defines"
	// namespace. I'm not sure if there is a better home for it ATM.
	//---------------------------------------------------------------------
	static function pickButtonArt(a_platform: Number, buttonNames: Object): String
	{
		switch(a_platform) {

   		case Shared.Platforms.CONTROLLER_PC:
   			return buttonNames["PCArt"];

   		case Shared.Platforms.CONTROLLER_PCGAMEPAD:
   		case Shared.Platforms.CONTROLLER_DURANGO:
   		case Shared.Platforms.CONTROLLER_ORBIS:
   			return buttonNames["XBoxArt"];

   		case Shared.Platforms.CONTROLLER_VIVE:
   		case Shared.Platforms.CONTROLLER_VIVE_KNUCKLES:
   			return buttonNames["ViveArt"];

   		case Shared.Platforms.CONTROLLER_ORBIS_MOVE:
   			return buttonNames["MoveArt"];

   		case Shared.Platforms.CONTROLLER_OCULUS:
   			return buttonNames["OculusArt"];

   		case Shared.Platforms.CONTROLLER_WINDOWS_MR:
   			return buttonNames["WindowsMRArt"];

   		default:
   			return buttonNames["XBoxArt"];
		}
	}

	static function pickControls(a_platform: Number, buttonNames: Object): Object
	{
		return {namedKey: pickButtonArt(a_platform, buttonNames)};
	}
}
