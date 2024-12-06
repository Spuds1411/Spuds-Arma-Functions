private "_vehicleArray";

_vehicleArray = createHashMapFromArray [
	["side", independent],
	["infSquad", (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")],
	["infTeam", (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfTeam")],
	["mrap", "I_MRAP_03_F"],
	["mrapArmed", "I_MRAP_03_hmg_F"],
	["lightTransport", "I_Truck_02_covered_F"],
	["transportTruck", "I_Truck_02_covered_F"],
	["ifv", "I_APC_Wheeled_03_cannon_F"],
	["tank", "I_MBT_03_cannon_F"]
];

missionNamespace setVariable ["SPD_vehicles_IND_F", _vehicleArray, true];
