/*
	Author: spuds1411

	Description:
		Initializes all ungrouped civilians as hostages

	Parameter(s):
		None

	Returns:
		Boolean

	Examples:
		[] call SPD_fnc_civilianInit;
*/

{
	if ((count units group _x) == 1) then {
		removeAllActions _x;
		_x disableAI "MOVE";
		_x switchMove "ApanPknlMstpSnonWnonDnon_G01";
		_x addAction ["Detain", {
			_unit = _this select 3 select 0;
			_unit switchMove "ApanPknlMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon";
			sleep 0.966;
			_unit switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
			sleep 1;
			_unit switchMove "AmovPercMstpSsurWnonDnon";
			removeAllActions _unit;
		}, [_x], 1.5, true, true, "", "", 2];

		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			removeAllActions _unit;
		}];
	};
} forEach units civilian;
true;
