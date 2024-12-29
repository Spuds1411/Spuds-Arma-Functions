/*
	Author: spuds1411

	Description:
		Initializes all single unit grouped civilians as hostages

	Parameter(s):
		None

	Returns:
		Boolean

	Examples:
		N/A
*/

_detainAction = {
	_unit = _this select 3 select 0;
	removeAllActions _unit;
	[_unit, "ApanPknlMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
	sleep 0.966;
	[_unit, "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"] remoteExec ["switchMove", 0];
	sleep 1;
	[_unit, "AmovPercMstpSsurWnonDnon"] remoteExec ["switchMove", 0];
};

{
	if ((count units group _x) == 1) then {
		removeAllActions _x;
		_x disableAI "MOVE";
		_x switchMove "ApanPknlMstpSnonWnonDnon_G01";
		_x addAction ["Detain", _detainAction, [_x], 1.5, true, true, "", "", 2];

		if (isServer) then {
			diag_log text format ["!!! %1: Added MPKilled to %2", diag_frameno toFixed 0, _x];
			_x addMPEventHandler ["MPKilled", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				if (side _killer == west) then {
					removeAllActions _unit;
					systemChat format ["%1 Killed a civilian (%2)", name _killer, name _unit]
					// [format ["%1 Killed a civilian (%2)", name _killer, name _unit]] remoteExec ["systemChat", 2];
				};
			}];
		};
	};
} forEach units civilian;

true;
