/*
	Author: spuds1411

	Description:
		Initialises the selected object as an object that can be loaded into ViV capable vehicles.

	Parameter(s):
		0: Object - Object to add to the logistics system

	Returns:
		Boolean

	Examples:
		[crate1] call SPD_fnc_logisticsInit;
*/

params ["_objectToLoad"];


_loadActionCode = {
	params ["_objectToLoad"];
	_vehiclesList = (getPos _objectToLoad) nearEntities [["Car", "Armored", "Air"], 25];
	_vehiclesList = _vehiclesList - [_objectToLoad];

	if (count _vehiclesList < 1) exitWith {hint "There are no vehicles within 25 meters"};
 
	_sortedVehicles = [_vehiclesList, [], {getPos _objectToLoad distance _x}, "ASCEND"] call BIS_fnc_sortBy;
	_logisticsVehicle = _sortedVehicles select 0;

	if ((_logisticsVehicle canVehicleCargo _objectToLoad) select 0) then {
    	_logisticsVehicle setVehicleCargo _objectToLoad;
		hint "Object loaded into nearest vehicle";
	} else {
		if ((_logisticsVehicle canVehicleCargo _objectToLoad) select 1) then {
			hint "Target vehicle is full";
		} else {
			hint "This vehicle can't load cargo";
		};
	};
};

_objectToLoad addAction ["Load into Nearest", _loadActionCode, [_objectToLoad], 1.5, false, true, "", "true", 5];

true;