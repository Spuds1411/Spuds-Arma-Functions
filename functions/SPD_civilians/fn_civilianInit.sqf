/*
	Author: spuds1411

	Description:
		Initializes the civilian as a "hostage" of sorts

	Parameter(s):
		0: Object - Civilain unit to run the script on

	Returns:
		Boolean

	Examples:
		[civilian_1] call SPD_fnc_civilianInit;
*/

params [
	["_unit", objNull, [objNull]]
];

[_unit, "MOVE"] remoteExec ["disableAI", 2];
[_unit, ["ApanPknlMstpSnonWnonDnon_G01"]] remoteExec ["switchMove", 2];
[_unit, ["Detain", {
	_unit = _this select 3 select 0;
	[_unit, ["ApanPknlMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon"]] remoteExec ["switchMove", 2];
	sleep 0.966;
	[_unit, ["AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"]] remoteExec ["switchMove", 2];
	sleep 1;
	[_unit, ["AmovPercMstpSsurWnonDnon"]] remoteExec ["switchMove", 2];
	removeAllActions _unit;
}, [_unit], 1.5, true, true, "", "", 2]] remoteExec ["addAction", 2];

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	removeAllActions _unit;
}];

true;
