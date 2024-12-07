/*
	Author: spuds1411

	Description:
		Spawns a counterattack from a position, to another position with multiple levels of attack strength.

	Parameter(s):
		0: String - (optional, default "WEAK") Controls the strength of the attack.
		1: Array - (optional, default [0,0,0]) Position the attack will go to.
		2: (optional, default 1000) can be one of:
			Array - Position the attack spawns at.
			Number - Radius from the position to attack to spawn attack.
		3: String - (optional, default "BLU_F") Faction the attack will use assets from. Given as the Factions classname (MUST be defined under scripts\initFactions).

	Returns:
		Array - Array of vehicles in the counter attack.

	Examples:
		["WEAK", getPos player, 1000, "OPF_F", east] call SPD_fnc_counterAttack;
		["AVERAGE", [4353.37,16523.6,0], [5879.41,16185.8,0], "IND_F", independent] call SPD_fnc_counterAttack;
*/

// vvv Params vvv

params [
	["_strength", "WEAK", [""]],
	["_toPosition", [0,0,0], [[]], 3],
	["_fromPosition", 1000, [[], 0], 3],
	["_faction", "BLU_F", [""]]
];

private "_spawnPos";

// vvv Convert faction classname to variable vvv

_variableKey = format ["SPD_vehicles_%1", _faction];
_vehiclesHashmap = missionNamespace getVariable [_variableKey, ""];

// vvv Are we using an array location or random location within a radius? vvv

private "_isArray";

if (typeName _fromPosition == "ARRAY") then {
	_isArray = true;
} else {
	if (typeName _fromPosition == "SCALAR") then {
		_isArray = false;
	} else {
		hint "That 'From Location' does not exist";
	};
};

// vvv Define faction vehicles vvv

private _side = _vehiclesHashmap get "side";
private _infSquadConfig = _vehiclesHashmap get "infSquad";
private _infTeamConfig = _vehiclesHashmap get "infTeam";
private _mrapClassname = _vehiclesHashmap get "mrap";
private _mrapArmedClassname = _vehiclesHashmap get "mrapArmed";
private _lightTransportClassname = _vehiclesHashmap get "lightTransport";
private _transportTruckClassname = _vehiclesHashmap get "transportTruck";
private _ifvClassname = _vehiclesHashmap get "ifv";
private _tankClassname = _vehiclesHashmap get "tank";

// vvv Spawn vehicles and set them on their way vvv

if (_isArray == false) then {
	_spawnPos = [_toPosition, _fromPosition - 10, _fromPosition + 10, 5] call BIS_fnc_findSafePos;
} else {
	_spawnPos = [_fromPosition, 0, 25, 5] call BIS_fnc_findSafePos;
};

switch (_strength) do {
	case "WEAK": {
		private _transportTruckPos = [_spawnPos, 0, 25, 5] call BIS_fnc_findSafePos;
		private _transportTruckArray = [_transportTruckPos, 0, _transportTruckClassname, _side] call BIS_fnc_spawnVehicle;
		private _transportTruck = _transportTruckArray select 0;
		private _transportTruckCrew = _transportTruckArray select 1;
		private _transportTruckGroup = _transportTruckArray select 2;

		private _transportSquad = [_toPosition, _side, _infSquadConfig] call BIS_fnc_spawnGroup;
		{
			_x moveInCargo _transportTruck;
		} forEach (units _transportSquad);

		[_transportTruckGroup, _toPosition, 0, "TR UNLOAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
		private _returnWaypoint = [_transportTruckGroup, _transportTruckPos, 5, "MOVE", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
		[_transportSquad, _toPosition, 0, "SAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;

		_deleteVehicle = toString {
    		if !(local this) exitWith {};
    		deleteVehicle vehicle this;
    		thisList apply {deleteVehicle _x};
		};

		_returnWaypoint setWaypointStatements ["true", _deleteVehicle];

		private _mrapArmedPos = [_spawnPos, 0, 25, 5] call BIS_fnc_findSafePos;
		private _mrapArmedArray = [_mrapArmedPos, 0, _mrapArmedClassname, _side] call BIS_fnc_spawnVehicle;
		private _mrapArmed = _mrapArmedArray select 0;
		private _mrapArmedCrew = _mrapArmedArray select 1;
		private _mrapArmedGroup = _mrapArmedArray select 2;

		[_mrapArmedGroup, _toPosition, 0, "SAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
		}; 
	case "AVERAGE": {
		private _ifvPos0 = [_spawnPos, 0, 25, 5] call BIS_fnc_findSafePos;
		private _ifvArray0 = [_ifvPos0, 0, _ifvClassname, _side] call BIS_fnc_spawnVehicle;
		private _ifv0 = _ifvArray0 select 0;
		private _ifvCrew0 = _ifvArray0 select 1;
		private _ifvGroup0 = _ifvArray0 select 2;

		private _ifvPos1 = [_spawnPos, 0, 25, 5] call BIS_fnc_findSafePos;
		private _ifvArray1 = [_ifvPos1, 0, _ifvClassname, _side] call BIS_fnc_spawnVehicle;
		private _ifv1 = _ifvArray1 select 0;
		private _ifvCrew1 = _ifvArray1 select 1;
		private _ifvGroup1 = _ifvArray1 select 2;

		[_ifvGroup0, _toPosition, 0, "SAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
		[_ifvGroup1, _toPosition, 0, "SAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
	}; 
	case "STRONG": {
		private _tankPos = [_spawnPos, 0, 25, 5] call BIS_fnc_findSafePos;
		private _tankArray = [_tankPos, 0, _tankClassname, _side] call BIS_fnc_spawnVehicle;
		private _tank = _tankArray select 0;
		private _tankCrew = _tankArray select 1;
		private _tankGroup = _tankArray select 2;

		private _ifvPos = [_spawnPos, 0, 25, 5] call BIS_fnc_findSafePos;
		private _ifvArray = [_ifvPos, 0, _ifvClassname, _side] call BIS_fnc_spawnVehicle;
		private _ifv = _ifvArray select 0;
		private _ifvCrew = _ifvArray select 1;
		private _ifvGroup = _ifvArray select 2;

		[_tankGroup, _toPosition, 0, "SAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
		[_ifvGroup, _toPosition, 0, "SAD", "AWARE", "YELLOW"] call CBA_fnc_addWaypoint;
	};
};
