private "_vehicleArray";

_vehicleArray = createHashMapFromArray [
	["side", west],
	["infSquad", (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfAssault")],
	["infTeam", (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")],
	["mrap", "B_MRAP_01_F"],
	["mrapArmed", "B_MRAP_01_hmg_F"],
	["lightTransport", "B_LSV_01_unarmed_F"],
	["transportTruck", "B_Truck_01_covered_F"],
	["ifv", "B_APC_Wheeled_01_cannon_F"],
	["tank", "B_MBT_01_cannon_F"]
];

missionNamespace setVariable ["SPD_vehicles_BLU_F", _vehicleArray, true];
