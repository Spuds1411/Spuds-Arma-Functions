private "_vehicleArray";

_vehicleArray = createHashMapFromArray [
	["side", independent],
	["infSquad", (configfile >> "CfgGroups" >> "Indep" >> "IND_G_F" >> "Infantry" >> "I_G_InfSquad_Assault")],
	["infTeam", (configfile >> "CfgGroups" >> "Indep" >> "IND_G_F" >> "Infantry" >> "I_G_InfTeam_Light")],
	["mrap", "I_G_Offroad_01_F"],
	["mrapArmed", "I_G_Offroad_01_armed_F"],
	["lightTransport", "I_G_Van_01_transport_F"],
	["transportTruck", "I_G_Van_02_transport_F"],
	["ifv", "I_G_Offroad_01_armed_F"],
	["tank", "I_G_Offroad_01_armed_F"]
];

missionNamespace setVariable ["SPD_vehicles_IND_G_F", _vehicleArray, true];
