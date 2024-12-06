private "_vehicleArray";

_vehicleArray = createHashMapFromArray [
	["side", east],
	["infSquad", (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfAssault")],
	["infTeam", (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")],
	["mrap", "O_MRAP_02_F"],
	["mrapArmed", "O_MRAP_02_hmg_F"],
	["lightTransport", "O_LSV_02_unarmed_F"],
	["transportTruck", "O_Truck_03_covered_F"],
	["ifv", "O_APC_Wheeled_02_rcws_v2_F"],
	["tank", "O_MBT_02_cannon_F"]
];

missionNamespace setVariable ["SPD_vehicles_OPF_F", _vehicleArray, true];
