private "_vehicleArray";

_vehicleArray = createHashMapFromArray [
	["side", east],
	["infSquad", (configfile >> "CfgGroups" >> "East" >> "OPF_TURA_lxWS" >> "Infantry" >> "O_Tura_InfSquad_lxWS")],
	["infTeam", (configfile >> "CfgGroups" >> "East" >> "OPF_TURA_lxWS" >> "Infantry" >> "O_Tura_InfTeam_lxWS")],
	["mrap", "O_Tura_Offroad_armor_lxWS"],
	["mrapArmed", "O_Tura_Offroad_armor_armed_lxWS"],
	["lightTransport", "O_Tura_Offroad_armor_lxWS"],
	["transportTruck", "C_Van_02_transport_F"],
	["ifv", "Aegis_O_Tura_APC_Wheeled_04_export_F"],
	["tank", "Aegis_O_Tura_APC_Wheeled_04_export_F"]
];

missionNamespace setVariable ["SPD_vehicles_OPF_TURA_lxWS", _vehicleArray, true];
