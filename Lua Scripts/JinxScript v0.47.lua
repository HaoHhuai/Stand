util.require_natives("3095a", "g")
native_invoker.accept_bools_as_ints(true)

local joaat, toast, yield, draw_debug_text, reverse_joaat = util.joaat, util.toast, util.yield, util.draw_debug_text, util.reverse_joaat

local CWeaponDamageEventTrigger = memory.rip(memory.scan("E8 ? ? ? ? 44 8B 65 80 41 FF C7") + 1)
local ppCNetworkObjectMgr__sm_Instance = memory.rip(memory.scan("48 8B 0D ? ? ? ? 45 33 C0 E8 ? ? ? ? 48 8B F8") + 3) -- credit to sapphire

local hamburgerMdl = joaat("xs_prop_hamburgher_wl")
local spikeStripMdl = joaat("xs_prop_arena_spikes_02a")
local speedUpMdl = joaat("stt_prop_track_speedup")
local slowDownMdl = joaat("stt_prop_track_slowdown")
local blockOrbMdl = joaat("h4_prop_h4_garage_door_01a")
local blockOrbMdlSign = joaat("xm_prop_x17_screens_02a_07")
local monster = joaat("h4_prop_h4_loch_monster")
local broomstick = joaat("prop_tool_broom")
local glitchObjMdl = joaat("prop_ld_ferris_wheel")
local glitchVehMdl = joaat("prop_ld_ferris_wheel")
local glitchedForcefieldMdl = joaat("p_spinning_anus_s")
local windmill = joaat("prop_windmill_01")
local oppressor = joaat("oppressor2")
local khanjali = joaat("khanjali")
local rallytruck = joaat("rallytruck")
local mule5 = joaat("mule5")
local towtruckMdl = joaat("towtruck3")
local disableScriptedMusic = "GLOBAL_KILL_MUSIC"
local disableAmbientSounds = "CHARACTER_CHANGE_IN_SKY_SCENE"
local disableRadioEmitters = "DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE"
local disableVehicleAudio = "MP_CAR_MOD_SHOP"
local disableWeatherNoise = "PROLOGUE_MUTE_SPRINKLERS"

local GlobalplayerBD = 2657921
local GlobalplayerBD_FM_2 = 1845263
local GlobalplayerBD_FM_3 = 1886967

enum Labels begin
	CMDOTH = -1974706693,
	BLIPNFND = -1331937481,
	DT_T = -766393174,
	PLYNVEH = 1067523721,
	STNDUSR = 1729001290,
	TOOFAST = 1669138996
end

enum DRIVINGMODE begin
	DF_StopForCars					= 1,
	DF_StopForPeds					= 2,
	DF_SwerveAroundAllCars			= 4,
	DF_SteerAroundStationaryCars	= 8,
	DF_SteerAroundPeds				= 16,
	DF_SteerAroundObjects			= 32,
	DF_DontSteerAroundPlayerPed		= 64,
	DF_StopAtLights					= 128,
	DF_GoOffRoadWhenAvoiding		= 256,
	DF_DriveIntoOncomingTraffic		= 512,
	DF_DriveInReverse				= 1024,
	DF_UseWanderFallbackInsteadOfStraightLine = 2048,
	DF_AvoidRestrictedAreas			= 4096,
	DF_PreventBackgroundPathfinding		= 8192,
	DF_AdjustCruiseSpeedBasedOnRoadSpeed = 16384,
	DF_UseShortCutLinks				=  262144,
	DF_ChangeLanesAroundObstructions = 524288,
	DF_UseSwitchedOffNodes			=  2097152,
	DF_PreferNavmeshRoute			=  4194304,
	DF_PlaneTaxiMode				=  8388608,
	DF_ForceStraightLine			= 16777216,
	DF_UseStringPullingAtJunctions	= 33554432,
	DF_AvoidHighways				= 536870912,
	DF_ForceJoinInRoadDirection		= 1073741824
end

enum ENTER_EXIT_VEHICLE_FLAGS begin
	ECF_RESUME_IF_INTERRUPTED = 1,
	ECF_WARP_ENTRY_POINT = 2,
	ECF_JACK_ANYONE = 8,
	ECF_WARP_PED = 16,
	ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP = 64,
	ECF_DONT_CLOSE_DOOR = 256,
	ECF_WARP_IF_DOOR_IS_BLOCKED = 512,
	ECF_JUMP_OUT = 4096,
	ECF_DONT_DEFAULT_WARP_IF_DOOR_BLOCKED = 65536,
	ECF_USE_LEFT_ENTRY = 131072,
	ECF_USE_RIGHT_ENTRY = 262144,
	ECF_JUST_PULL_PED_OUT = 524288,
	ECF_BLOCK_SEAT_SHUFFLING = 1048576,
	ECF_WARP_IF_SHUFFLE_LINK_IS_BLOCKED = 4194304,
	ECF_DONT_JACK_ANYONE = 8388608,
	ECF_WAIT_FOR_ENTRY_POINT_TO_BE_CLEAR = 16777216
end

enum VEHICLE_CLASS begin
	VC_COMPACT = 0,
	VC_SEDAN,
	VC_SUV,
	VC_COUPE,
	VC_MUSCLE,
	VC_SPORT_CLASSIC,
	VC_SPORT,
	VC_SUPER,
	VC_MOTORCYCLE,
	VC_OFF_ROAD,
	VC_INDUSTRIAL,
	VC_UTILITY,
	VC_VAN,
	VC_CYCLE,
	VC_BOAT,
	VC_HELICOPTER,
	VC_PLANE,
	VC_SERVICE,
	VC_EMERGENCY,
	VC_MILITARY,
	VC_COMMERCIAL,
	VC_RAIL,
	VC_OPEN_WHEEL
end

enum EVENT_NAMES begin
	EVENT_NETWORK_SCRIPT_EVENT = 174,
	EVENT_NETWORK_HOST_MIGRATION = 180,
end

enum TransitionState begin
	TRANSITION_STATE_EMPTY = 0,
	TRANSITION_STATE_SP_SWOOP_UP = 1,
	TRANSITION_STATE_MP_SWOOP_UP = 2,
	TRANSITION_STATE_CREATOR_SWOOP_UP = 3,
	TRANSITION_STATE_PRE_HUD_CHECKS = 4,
	TRANSITION_STATE_WAIT_HUD_EXIT = 5,
	TRANSITION_STATE_WAIT_FOR_SUMMON = 6,
	TRANSITION_STATE_SP_SWOOP_DOWN = 7,
	TRANSITION_STATE_MP_SWOOP_DOWN = 8,
	TRANSITION_STATE_CANCEL_JOINING = 9,
	TRANSITION_STATE_RETRY_LOADING = 10,
	TRANSITION_STATE_RETRY_LOADING_SLOT_1 = 11,
	TRANSITION_STATE_RETRY_LOADING_SLOT_2 = 12,
	TRANSITION_STATE_RETRY_LOADING_SLOT_3 = 13,
	TRANSITION_STATE_RETRY_LOADING_SLOT_4 = 14,
	TRANSITION_STATE_WAIT_ON_INVITE = 15,
	TRANSITION_STATE_PREJOINING_FM_SESSION_CHECKS = 16,
	TRANSITION_STATE_LOOK_FOR_FRESH_JOIN_FM = 17,
	TRANSITION_STATE_LOOK_TO_JOIN_ANOTHER_SESSION_FM = 18,
	TRANSITION_STATE_CONFIRM_FM_SESSION_JOINING = 19,
	TRANSITION_STATE_WAIT_JOIN_FM_SESSION = 20,
	TRANSITION_STATE_CREATION_ENTER_SESSION = 21,
	TRANSITION_STATE_PRE_FM_LAUNCH_SCRIPT = 22,
	TRANSITION_STATE_FM_TEAMFULL_CHECK = 23,
	TRANSITION_STATE_START_FM_LAUNCH_SCRIPT = 24,
	TRANSITION_STATE_FM_TRANSITION_CREATE_PLAYER = 25,
	TRANSITION_STATE_IS_FM_AND_TRANSITION_READY = 26,
	TRANSITION_STATE_FM_SWOOP_DOWN = 27,
	TRANSITION_STATE_POST_BINK_VIDEO_WARP = 28,
	TRANSITION_STATE_FM_FINAL_SETUP_PLAYER = 29,
	TRANSITION_STATE_MOVE_FM_TO_RUNNING_STATE = 30,
	TRANSITION_STATE_FM_HOW_TO_TERMINATE = 31,
	TRANSITION_STATE_START_CREATOR_PRE_LAUNCH_SCRIPT_CHECK = 32,
	TRANSITION_STATE_START_CREATOR_LAUNCH_SCRIPT = 33,
	TRANSITION_STATE_CREATOR_TRANSITION_CREATE_PLAYER = 34,
	TRANSITION_STATE_IS_CREATOR_AND_TRANSITION_READY = 35,
	TRANSITION_STATE_CREATOR_SWOOP_DOWN = 36,
	TRANSITION_STATE_CREATOR_FINAL_SETUP_PLAYER = 37,
	TRANSITION_STATE_MOVE_CREATOR_TO_RUNNING_STATE = 38,
	TRANSITION_STATE_PREJOINING_TESTBED_SESSION_CHECKS = 39,
	TRANSITION_STATE_LOOK_FOR_FRESH_JOIN_TESTBED = 40,
	TRANSITION_STATE_LOOK_FOR_FRESH_HOST_TESTBED = 41,
	TRANSITION_STATE_LOOK_TO_JOIN_ANOTHER_SESSION_TESTBED = 42,
	TRANSITION_STATE_LOOK_TO_HOST_SESSION_TESTBED = 43,
	TRANSITION_STATE_CONFIRM_TESTBED_SESSION_JOINING = 44,
	TRANSITION_STATE_WAIT_JOIN_TESTBED_SESSION = 45,
	TRANSITION_STATE_START_TESTBED_LAUNCH_SCRIPT = 46,
	TRANSITION_STATE_TESTBED_TRANSITION_CREATE_PLAYER = 47,
	TRANSITION_STATE_IS_TESTBED_AND_TRANSITION_READY = 48,
	TRANSITION_STATE_TESTBED_SWOOP_DOWN = 49,
	TRANSITION_STATE_TESTBED_FINAL_SETUP_PLAYER = 50,
	TRANSITION_STATE_MOVE_TESTBED_TO_RUNNING_STATE = 51,
	TRANSITION_STATE_TESTBED_HOW_TO_TERMINATE = 52,
	TRANSITION_STATE_QUIT_CURRENT_SESSION_PROMPT = 53,
	TRANSITION_STATE_WAIT_FOR_TRANSITION_SESSION_TO_SETUP = 54,
	TRANSITION_STATE_TERMINATE_SP = 55,
	TRANSITION_STATE_WAIT_TERMINATE_SP = 56,
	TRANSITION_STATE_KICK_TERMINATE_SESSION = 57,
	TRANSITION_STATE_TERMINATE_SESSION = 58,
	TRANSITION_STATE_WAIT_TERMINATE_SESSION = 59,
	TRANSITION_STATE_TERMINATE_SESSION_AND_HOLD = 60,
	TRANSITION_STATE_TERMINATE_SESSION_AND_MOVE_INTO_HOLDING_STATE = 61,
	TRANSITION_STATE_TEAM_SWAPPING_CHECKS = 62,
	TRANSITION_STATE_RETURN_TO_SINGLEPLAYER = 63,
	TRANSITION_STATE_WAIT_FOR_SINGLEPLAYER_TO_START = 64,
	TRANSITION_STATE_WAITING_FOR_EXTERNAL_TERMINATION_CALL = 65,
	TRANSITION_STATE_TERMINATE_MAINTRANSITION = 66,
	TRANSITION_STATE_WAIT_FOR_DIRTY_LOAD_CONFIRM = 67,
	TRANSITION_STATE_DLC_INTRO_BINK = 68,
	TRANSITION_STATE_SPAWN_INTO_PERSONAL_VEHICLE = 69
end

local spawned_objects = {}
local function bitTest(bits, place)
	return (bits & (1 << place)) != 0
end

local function setBit(addr: number, bit: number)
	memory.write_int(addr, memory.read_int(addr) | 1 << bit)
end

local function clearBit(addr: number, bit: number)
	memory.write_int(addr, memory.read_int(addr) ~ 1 << bit)
end

local function isPlayerUsingOrbitalCannon(playerID)
	return bitTest(memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463) + 424)), 0) -- Global_2657921[PLAYER::PLAYER_ID() /*463*/].f_424
end

local function isPlayerRidingRollerCoaster(playerID)
	return bitTest(memory.read_int(memory.script_global(GlobalplayerBD_FM_2 + 1 + (playerID * 877) + 873)), 15) -- Global_1845263[PLAYER::PLAYER_ID() /*877*/].f_873)
end

local function isPlayerSolicitingProstitute(playerID)
	return memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463) + 428)) != 0 -- Global_2657921[PLAYER::PLAYER_ID() /*463*/].f_428
end

local function isPlayerUsingBallisticEquipment(playerID)
	return memory.script_global(GlobalplayerBD_FM_3 + 1 + (playerID * 609) + 586) -- Global_1886967[PLAYER::PLAYER_ID() /*609*/].f_586
end

local function getPlayerCurrentInterior(playerID)
	return memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463) + 245)) -- Global_2657921[bVar0 /*463*/].f_245
end

local function getPlayerCurrentShop(playerID)
	return memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463) + 246)) -- Global_2657921[bVar0 /*463*/].f_246
end

local function getPlayerProperty()
	return memory.script_global(GlobalplayerBD_FM_2 + 1 + (players.user() * 877) + 267 + 34)  -- Global_1845263[PLAYER::PLAYER_ID() /*877*/].f_267.f_34)
end

local function getPlayerInteriorID()
	return memory.script_global(GlobalplayerBD + 1 + (players.user() * 463) + 73 + 6) -- Global_2657921[bParam0 /*463*/].f_73.f_6
end

local function getPlayerInteriorPos()
	return memory.script_global(GlobalplayerBD + 1 + (players.user() * 463) + 73 + 7) -- Global_2657921[bParam0 /*463*/].f_73.f_7
end

local function isFreemodeActive(playerID)
	return NETWORK_IS_PLAYER_A_PARTICIPANT_ON_SCRIPT(playerID, "freemode", -1)
end

local function getTransitionState()
	return memory.read_int(memory.script_global(1575008))  
end

local getTransitionStateName
do
	local names <const> = TransitionState:vkmap()
	function getTransitionStateName(transitionState) -- credit to sapphire for this function
		return names[transitionState]:sub(18)
	end
end

local function isPlayerInInterior(playerID)
	return not (GET_INTERIOR_GROUP_ID(getPlayerCurrentInterior(playerID)) != 0 or getPlayerCurrentInterior(playerID) == 0)
end

local function callVirtualFunction(pObject: int, iPosition: int, ...args) -- credit to sapphire for these 3 functions too 
	for i, arg in args do
		if type(arg) == "boolean" then
			args[i] = arg ? 1 : 0
		end
	end
	return util.call_foreign_function(memory.read_long(memory.read_long(pObject) + 8 * iPosition), pObject, table.unpack(args))
end

local function unregisterNetworkedEntity(pEntity: int): void
	callVirtualFunction(memory.read_long(ppCNetworkObjectMgr__sm_Instance), 6, memory.read_long(pEntity + 0xD0), 15)
end

local deleteEntityLocally
do
	local m = memory.alloc_int()
	function deleteEntityLocally(entity: int): void 
		local pEntity = entities.handle_to_pointer(entity)
		if pEntity == 0 then
			return
		end
		unregisterNetworkedEntity(pEntity)
		m:writeInt(entity)
		DELETE_ENTITY(m)
	end
end

local function isNetPlayerOk(playerID, assert_playing = false, assert_done_transition = true)
	if not NETWORK_IS_PLAYER_ACTIVE(playerID) then return false end
	if assert_playing and not IS_PLAYER_PLAYING(playerID) then return false end
	if assert_done_transition then
		if playerID == memory.read_int(memory.script_global(2672741 + 3)) then
			return memory.read_int(memory.script_global(2672741 + 2)) != 0
		elseif memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463))) != 4 then -- Global_2657921[iVar0 /*463*/] != 4
			return false
		end
	end
	return true
end

local function isPlayerGodmode(playerID)
	local pos = players.get_position(playerID)
	if isNetPlayerOk(playerID, true, true) and players.is_godmode(playerID) and not isPlayerInInterior(playerID) and not NETWORK_IS_PLAYER_IN_MP_CUTSCENE(playerID) 
	and isFreemodeActive(playerID) and not players.is_using_rc_vehicle(playerID) and not isPlayerRidingRollerCoaster(playerID) and pos.z > 0.0 then
		return true
	end
	return false
end

local function getSeatPedIsIn(ped)
	local vehicle = GET_VEHICLE_PED_IS_USING(ped)
	if vehicle == 0 then
		return nil
	end
	local num_of_seats = GET_VEHICLE_MODEL_NUMBER_OF_SEATS(GET_ENTITY_MODEL(vehicle))
	for i = -1, num_of_seats - 1 do
		local ped_in_seat = GET_PED_IN_VEHICLE_SEAT(vehicle, i)
		if ped_in_seat == ped then
			return i
		end
	end
end

local function isPlayerMoving(playerID)
	return #NETWORK_GET_LAST_VEL_RECEIVED_OVER_NETWORK(GET_PLAYER_PED_SCRIPT_INDEX(playerID)) != 0
end

local function isDetectionPresent(playerID, detection)
	if players.exists(playerID) and menu.player_root(playerID):isValid() then
		for menu.player_root(playerID):getChildren() as cmd do
			if cmd:getType() == COMMAND_LIST_CUSTOM_SPECIAL_MEANING and cmd:refByRelPath(detection):isValid() and players.exists(playerID) then
				return true
			end
		end
	end
	return false
end
 
local function isPlatePatternLegit(plate)
	return string.match(plate, "%d%d%a%a%a%d%d%d") != nil
end

local function loadWeaponAsset(weaponName)
	local projectile = joaat(weaponName)
	while not HAS_WEAPON_ASSET_LOADED(projectile) do
		REQUEST_WEAPON_ASSET(projectile, 31, 1)
		yield()
	end
	return projectile
end

local function loadPtfxAsset(assetName)
	if not HAS_NAMED_PTFX_ASSET_LOADED(assetName) then
		REQUEST_NAMED_PTFX_ASSET(assetName)
		while not HAS_NAMED_PTFX_ASSET_LOADED(assetName) do
			yield()
		end
	end
end

local function requestAnimDict(hash)
	REQUEST_ANIM_DICT(hash)
	while not HAS_ANIM_DICT_LOADED(hash) do
		yield()
	end
end

local function nullCheck(text_string)
	return (text_string == "NULL" or text_string == nil) ? "" : text_string
end

local function getTeamID(playerID)
	if not isNetPlayerOk(playerID) or not NETWORK_IS_SESSION_ACTIVE() or util.is_session_transition_active() then return end
	local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	local net_obj = memory.read_long(entities.handle_to_pointer(ped) + 0xD0)
	local teamID = memory.read_byte(net_obj + 0x469)
	if net_obj != 0 and teamID != 6 then
		return teamID
	end
end

local function getInstanceID(playerID)
	if not isNetPlayerOk(playerID) or not NETWORK_IS_SESSION_ACTIVE() or util.is_session_transition_active() then return end
	local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	local net_obj = memory.read_long(entities.handle_to_pointer(ped) + 0xD0)
	local instanceID = memory.read_byte(net_obj + 0x46A)
	if net_obj != 0 and instanceID != 64 then
		return instanceID
	end
end

local randomPeds = {
	joaat("a_f_y_topless_01"),
	joaat("s_m_m_movalien_01"),
	joaat("s_m_y_mime"), 
	joaat("u_m_y_militarybum"),
	joaat("a_m_y_indian_01"),
	joaat("s_m_y_clown_01"),
	joaat("u_m_y_burgerdrug_01")
}

local function createRandomPed(pos)
	local mdlHash = randomPeds[math.random(#randomPeds)]
	util.request_model(mdlHash)
	return entities.create_ped(26, mdlHash, pos, 0)
end

local function triggerDistanceBasedTeleport(playerID, scriptEvent)
	local invisibility = menu.ref_by_path("Self>Appearance>Invisibility")
	local joinOrg = menu.ref_by_rel_path(menu.player_root(playerID), "Join CEO/MC")
	local timer = util.current_time_millis() + 1000
	joinOrg.value = true
	repeat
		if util.current_time_millis() > timer then
			joinOrg.value = false
			return
		end
		yield()
	until players.get_boss(players.user()) != -1
	timer = util.current_time_millis() + 1000
	local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	local pos = players.get_position(players.user())
	local pPos = players.get_position(playerID)
	pPos.z -= 10
	invisibility:setState("Locally Visible")
	SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), pPos, false, false, false)
	repeat
		if util.current_time_millis() > timer then
			joinOrg.value = false
			invisibility:setState("Disabled")
			SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), pos, false, false, false)
			return
		end
		yield()
	until DOES_ENTITY_EXIST(ped)
	yield(50)
	yield(50)
	util.trigger_script_event( 1 << playerID, scriptEvent)
	SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), pos, false, false, false)
	invisibility:setState("Disabled")
	joinOrg.value = false
end

local function doesVehicleHaveImaniTech(vehicle_model)
	switch vehicle_model do
	case joaat("deity"):
	case joaat("granger2"):
	case joaat("buffalo4"):
	case joaat("jubilee"):
	case joaat("patriot3"):
	case joaat("champion"):
	case joaat("greenwood"):
	case joaat("omnisegt"):
	case joaat("virtue"):
	case joaat("r300"):
	case joaat("stingertt"):
	case joaat("buffalo5"):
	case joaat("coureur"):
	case joaat("monstrociti"):
	case joaat("ruiner2"):
		return true
	end
	return false
end

local attack_weapons = {
	584646201,
	961495388,
	317205821,
	324215364,
	911657153,
	1119849093,
	1834241177,
	2138347493,
	1672152130,
	-608341376,
	-86904375,
	-1075685676,
	-1466123874,
	-1355376991,
	-1312131151,
	-581044007,
	-538741184,
	-102973651,
}

local weapon_stuff = {
	{"烟花", "weapon_firework"}, 
	{"原子能枪", "weapon_raypistol"},
	{"邪恶冥王", "weapon_raycarbine"},
	{"天基炮", "weapon_railgun"},
	{"红色激光", "vehicle_weapon_enemy_laser"},
	{"绿色激光", "vehicle_weapon_player_laser"},
	{"天煞机炮", "vehicle_weapon_player_lazer"},
	{"火箭炮", "weapon_rpg"},
	{"制导火箭炮", "weapon_hominglauncher"},
	{"脉冲发射器", "weapon_emplauncher"},
	{"信号枪", "weapon_flaregun"},
	{"霰弹枪", "weapon_bullpupshotgun"},
	{"电击枪", "weapon_stungun"},
	{"烟雾枪", "weapon_smokegrenade"},
}

local proofs = {
	bullet = {name="子弹",on=false},
	fire = {name="着火",on=false},
	explosion = {name="爆炸",on=false},
	collision = {name="碰撞",on=false},
	melee = {name="近战",on=false},
	steam = {name="蒸汽",on=false},
	drown = {name="溺水",on=false},
}

local modded_weapons = {
	"weapon_railgun",
	"weapon_stungun",
	"weapon_digiscanner",
}

local veh_things = {
	"brickade2",
	"hauler",
	"hauler2",
	"manchez3",
	"terbyte",
	"minitank",
	"rcbandito",
	"phantom3"
}

local doors = {
	"v_ilev_ml_door1",
	"v_ilev_ta_door",
	"v_ilev_247door",
	"v_ilev_247door_r",
	"v_ilev_lostdoor",
	"v_ilev_bs_door",
	"v_ilev_cs_door01",
	"v_ilev_cs_door01_r",
	"v_ilev_gc_door03",
	"v_ilev_gc_door04",
	"v_ilev_clothmiddoor",
	"v_ilev_clothmiddoor",
	"prop_shop_front_door_l",
	"prop_shop_front_door_r",
	"prop_com_ls_door_01",
	"v_ilev_carmod3door",
}

local object_stuff = {
	{util.joaat("prop_ld_ferris_wheel"), "摩天轮"},
	{util.joaat("p_spinning_anus_s"), "飞碟"},
	{util.joaat("prop_windmill_01"), "风车"},
	{util.joaat("prop_staticmixer_01"), "水泥搅拌器"},
	{util.joaat("prop_towercrane_02a"), "塔式起重机"},
	{util.joaat("des_scaffolding_root"), "手脚架"},
	{util.joaat("stt_prop_stunt_bowling_ball"), "大保龄球"},
	{util.joaat("stt_prop_stunt_soccer_ball"), "大足球"},
	{util.joaat("prop_juicestand"), "大橙球"},
	{util.joaat("stt_prop_stunt_jump_l"), "特技坡道"},
}

local vehicle_classes = {
  "小轿车",
  "轿车",
  "SUV",
  "轿跑",
  "肌肉",
  "经典",
  "跑车",
  "超跑",
  "摩托",
  "越野",
  "工业",
  "公用",
  "货车",
  "电动",
  "船",
  "直升机",
  "飞机",
  "服务",
  "紧急",
  "军队",
  "商业",
  "火车",
  "开轮"
}

local locations = {
  {"安全空间[挂机房]", {x=-158.71494, y=-982.75885, z=149.13135}},
  {"外星人实验室", {x=-1869.5039, y=3749.7612, z=-99.84549}},
  {"酷刑室", {x=147.170, y=-2201.804, z=4.688}},
  {"采矿隧道", {x=-595.48505, y=2086.4502, z=131.38136}},
  {"欧米茄车库", {x=2330.2573, y=2572.3005, z=46.679367}},
  {"50载具车库", {x=520.0, y=-2625.0, z=-50.0}},
  {"服务器群", {x=2474.0847, y=-332.58887, z=92.9927}},
  {"角色创建", {x=402.91586, y=-998.5701, z=-99.004074}},
  {"生命侵略者大楼", {x=-1082.8595, y=-254.774, z=37.763317}},
  {"竞速结束动画的车库", {x=405.9228, y=-954.1149, z=-99.6627}},
  {"被摧毁的医院", {x=304.03894, y=-590.3037, z=43.291893}},
  {"竞技场内部", {x=-256.92334, y=-2024.9717, z=30.145584}},
  {"喜剧俱乐部", {x=-430.00974, y=261.3437, z=83.00648}},
  {"录音A工作室", {x=-1010.6883, y=-49.127754, z=-99.40313}},
  {"不夜城", {x=-1394.8816, y=-599.7526, z=30.319544}},
  {"赌场看门人的房子", {x=-110.20285, y=-8.6156025, z=70.51957}},
  {"心理医生的房子", {x=-1913.8342, y=-574.5799, z=11.435149}},
  {"杜根的房子", {x=1395.2512, y=1141.6833, z=114.63437}},
  {"弗洛伊德的公寓", {x=-1156.5099, y=-1519.0894, z=10.632717}},
  {"麦克的房子", {x=-813.8814, y=179.07889, z=72.15914}},
  {"小富的房子(旧)", {x=-14.239959, y=-1439.6913, z=31.101551}},
  {"小富的房子(新)", {x=7.3125067, y=537.3615, z=176.02803}},
  {"老崔的房车", {x=1974.1617, y=3819.032, z=33.436287}},
  {"莱斯特的房子", {x=1273.898, y=-1719.304, z=54.771}},
  {"莱斯特的纺织厂", {x=713.5684, y=-963.64795, z=30.39534}},
  {"莱斯特的办公室", {x=707.2138, y=-965.5549, z=30.412853}},
  {"冰毒实验室", {x=1391.773, y=3608.716, z=38.942}},
  {"致幻剂实验室", {x=484.69, y=-2625.36, z=-49.0}},
  {"停尸房实验室", {x=495.0, y=-2560.0, z=-50.0}},
  {"人道实验室", {x=3625.743, y=3743.653, z=28.69009}},
  {"汽车旅馆", {x=152.2605, y=-1004.471, z=-99.024}},
  {"警察局", {x=443.4068, y=-983.256, z=30.689589}},
  {"银行金库", {x=263.39627, y=214.39891, z=101.68336}},
  {"布莱恩县银行", {x=-109.77874, y=6464.8945, z=31.626724}}, -- credit to fluidware for telling me about this one
  {"龙舌兰酒吧", {x=-564.4645, y=275.5777, z=83.074585}},
  {"废弃修理厂", {x=485.46396, y=-1315.0614, z=29.2141}},
  {"失落摩托帮", {x=980.8098, y=-101.96038, z=74.84504}},
  {"万杰利科珠宝店", {x=-629.9367, y=-236.41296, z=38.057056}},
  {"机场休息室", {x=-913.8656, y=-2527.106, z=36.331566}},
  {"停尸房", {x=240.94368, y=-1379.0645, z=33.74177}},
  {"联合储蓄", {x=1.298771, y=-700.96967, z=16.131021}},
  {"桑库多堡垒瞭望塔", {x=-2357.9187, y=3249.689, z=101.45073}},
  {"事务所大楼", {x=-1118.0181, y=-77.93254, z=-98.99977}},
  {"事务所车库", {x=-1071.0494, y=-71.898506, z=-94.59982}},
  {"恐霸内部", {x=-1421.015, y=-3012.587, z=-80.000}},
  {"地堡内部", {x=899.5518,y=-3246.038, z=-98.04907}},
  {"IAA办公室", {x=128.20, y=-617.39, z=206.04}},
  {"FIB顶楼", {x=135.94359, y=-749.4102, z=258.152}},
  {"FIB47楼", {x=134.5835, y=-766.486, z=234.152}},
  {"FIB49楼", {x=134.635, y=-765.831, z=242.152}},
  {"肥鸡机顶", {x=-31.007448, y=6317.047, z=40.04039}},
  {"脱衣舞俱乐部DJ位", {x=121.398254, y=-1281.0024, z=29.480522}},
}

local lscCoords = {
	v3(-356.09048, -134.77142, 40.012955),
	v3(723.11597, -1088.8312, 23.232006),
	v3(-1145.8977, -1991.1444, 14.18357),
	v3(1182.3055, 2645.2324, 38.63961),
	v3(108.85017, 6617.877, 32.673054),
}

local missionEndTeleports = {
  [4] = "沙滩海岸",
  [7] = "龙舌兰酒吧",
  [8] = "机场一层",
  [9] = "黄色杰克酒吧",
  [10] = "牛肉屋",
  [11] = "汉堡店",
  [13] = "水果市场",
  [25] = "莱斯特仓库",
  [28] = "本尼店",
  [31] = "沙滩海岸船屋",
  [42] = "高速美食餐厅",
  [56] = "佩立托湾",
  [58] = "葡萄籽机场",
  [59] = "佩立托湾武器店",
  [60] = "机场二层",
  [66] = "天文台",
  [68] = "赌场",
  [72] = "赌场屋顶",
  [87] = "玛德拉索",
  [90] = "天堂岛码头",
  [91] = "佩罗码头",
  [97] = "乡村俱乐部",
  [114] = "乞力耶德山"
}
local interiorTpList = {
	[70] = "地堡", -- 70 thru 80 are bunkers
	[81] = "机动作战中心",
	[83] = "机库", -- 83 thru 87 are hangars
	[88] = "复仇者",
	[89] = "设施", -- 89 thru 97 are facilities
	[102] = "夜总会车库",-- 102 thru 111 are garages
	[117] = "恐霸",
	[122] = "竞技场",
	[123] = "赌场",
	[124] = "顶层公寓",
	[128] = "街机铺", -- 128 thru 133 are garages
	[146] = "夜总会",
	[147] = "虎鲸",
	[149] = "改装铺", -- 149 thru 153 are auto shops
	[155] = "事务所",
	[159] = "迷幻剂",
	[160] = "怪胎店",
	[161] = "日蚀大道车库",
	[164] = "废品场",
}

local colors = {
	{-1, "默认"},
	{1, "白"},
	{27, "红"},
	{26, "蓝"},
	{18, "绿"},
	{37, "青"},
	{21, "紫"},
	{24, "洋红"},
	{30, "粉红"},
	{45, "淡粉"},
	{46, "青绿"},
	{12, "黄"},
	{15, "橙"},
}

local warnings = {
	joaat("NT_INV"),
	joaat("NT_INV_FREE"),
	joaat("NT_INV_PARTY_INVITE"),
	joaat("NT_INV_PARTY_INVITE_MP"),
	joaat("NT_INV_PARTY_INVITE_MP_SAVE"),
	joaat("NT_INV_PARTY_INVITE_SAVE"),
	joaat("NT_INV_MP_SAVE"),
	joaat("NT_INV_SP_SAVE"),
}

local transactionWarnings = {
	joaat("CTALERT_F"),
	joaat("CTALERT_F_1"),
	joaat("CTALERT_F_2"),
	joaat("CTALERT_F_3"),
	joaat("CTALERT_F_4"),
}

local scripts = {
	"valentineRpReward2",
	"main_persistent",
	"cellphone_controller",
	"shop_controller",
	"stats_controller",
	"timershud",
	"am_npc_invites",
	"fm_maintain_cloud_header_data"
}

local categories = {
	[0] = "近战武器",
	"投掷物",
	"手枪",
	"机枪",
	"步枪",
	"霰弹枪",
	"狙击步枪",
	"重型武器"
}


local values = {
	[1] = 50,
	[2] = 88,
	[3] = 160,
	[4] = 208,
}

local bones = {31086, 24816, 40269, 45509, 0, 51826, 58271}
local plates = {" PR1NCE ", " PR2NCE "}

local my_root = menu.my_root()
local self = my_root:list("自我选项")
local audio = my_root:list("声音选项")
local graphics  = my_root:list("图效选项")
local online = my_root:list("在线选项")
local lobby = my_root:list("玩家选项")
local missions = menu.list(menu.my_root(), "任务选项")
local vehicles = my_root:list("载具选项")
local weapons = my_root:list("武器选项")
local detections = my_root:list("检测选项", {}, "可能会掉帧")
local modder_detections = detections:list("作弊检测")
local normal_detections = detections:list("正常检测")
local protections = my_root:list("保护选项")
local funfeatures = my_root:list("趣味选项")
local teleport = my_root:list("传送选项")



self:toggle_loop("立即起身", {}, "", function()
	SET_PED_CONFIG_FLAG(players.user_ped(), 227, IS_PLAYER_PLAYING(players.user()))
end)

self:toggle("禁用雷达", {"noradar"}, "", function(toggled)
	DISPLAY_RADAR(not toggled)
end)

self:toggle("防止溺水", {}, "防止溺水", function(toggled)
	SET_PED_CONFIG_FLAG(players.user_ped(), 3, not toggled)
end)

self:action("特殊传送", {"smoothtp"}, "", function()
	if not IS_WAYPOINT_ACTIVE() then
		toast(lang.get_localised(BLIPNFND))
		return
	end

	local waypoint = GET_BLIP_INFO_ID_COORD(GET_FIRST_BLIP_INFO_ID(GET_WAYPOINT_BLIP_ENUM_ID()))
	local vehicle = GET_VEHICLE_PED_IS_USING(players.user_ped())

	local ground = false
	repeat
		ground, waypoint.z = util.get_ground_z(waypoint.x, waypoint.y)
		yield()
	until ground

	menu.trigger_commands("invisibility on")

	if vehicle != 0 then
		SET_ENTITY_VISIBLE(vehicle, false)
	end

	SWITCH_TO_MULTI_FIRSTPART(players.user_ped(), 8, 1)
	BEGIN_TEXT_COMMAND_BUSYSPINNER_ON("PM_WAIT")
	END_TEXT_COMMAND_BUSYSPINNER_ON(4)

	repeat
		yield()
	until IS_SWITCH_TO_MULTI_FIRSTPART_FINISHED()

	if vehicle == 0 then
		SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), waypoint, false, false, false)
	else
		SET_ENTITY_VISIBLE(vehicle, false)
		SET_ENTITY_COORDS_NO_OFFSET(vehicle, waypoint, false, false, false)
	end

	SWITCH_TO_MULTI_SECONDPART(players.user_ped())
	ALLOW_PLAYER_SWITCH_OUTRO() 

	repeat
		yield()
	until not IS_PLAYER_SWITCH_IN_PROGRESS()
	
	if vehicle == 0 then
		NETWORK_FADE_IN_ENTITY(players.user_ped(), true, true)
	else
		NETWORK_FADE_IN_ENTITY(vehicle, true, 1)
		NETWORK_FADE_IN_ENTITY(players.user_ped(), true, true)
		SET_ENTITY_VISIBLE(vehicle, true)
	end
	
	menu.trigger_commands("invisibility off")
	BUSYSPINNER_OFF()
end)

self:toggle("牛鲨睾酮", {"bstmode"}, "没有画效和音效", function(toggled)
	SET_PLAYER_WEAPON_DAMAGE_MODIFIER(players.user(), toggled ? 1.44 : 0.72)
	SET_PLAYER_MELEE_WEAPON_DAMAGE_MODIFIER(players.user(), toggled ? 2.0 : 1.0)
	SET_PLAYER_MELEE_WEAPON_DEFENSE_MODIFIER(players.user(), toggled ? 0.5 : 1.0)
end)

self:toggle_loop("快速翻滚", {"fastroll"}, "", function()
	STAT_SET_INT(joaat($"mp{util.get_char_slot()}_shooting_ability"), 200, true)
end)

self:toggle_loop("友好路人", {"friendlyai"}, "使NPC无法瞄准你", function()
	SET_PED_RESET_FLAG(players.user_ped(), 124, true)
end)

audio:toggle_loop("禁用脚步", {"disablefootsteps"}, "禁用脚步声", function() -- not using the native here because I think extra looks better (I'm autistic)
	local pPed = entities.handle_to_pointer(players.user_ped())
	if pPed == 0 then return end
	local pedFootstepsEventsEnabled = memory.read_byte(pPed + 0xC26)
	local pedClothEventsEnabled = memory.read_byte(pPed + 0xC27)
	if pedFootstepsEventsEnabled == 1 or pedClothEventsEnabled == 1 then 
		memory.write_byte(pPed + 0xC26, 0)
		memory.write_byte(pPed + 0xC27, 0)
	end
end, function()
	local pPed = entities.handle_to_pointer(players.user_ped())
	memory.write_byte(pPed + 0xC26, 1)
	memory.write_byte(pPed + 0xC27, 1)
end)

audio:toggle_loop("禁用警告", {"disablewastedsound"}, "", function() 
	if memory.read_int(memory.script_global(2707352)) == 0 then -- AUDIO::PLAY_SOUND_FRONTEND(-1, "Wasted", "POWER_PLAY_General_Soundset", true);
		memory.write_int(memory.script_global(2707352), 1)
	end
end, function()
	memory.write_int(memory.script_global(2707352), 0)
end)

audio:toggle_loop("禁用尖叫", {"disablepedscreams"}, "禁用尖叫声", function()
	for entities.get_all_peds_as_handles() as ped do
		if ped != players.user_ped() then
			DISABLE_PED_PAIN_AUDIO(ped, true)
		end
	end
end)

audio:toggle_loop("禁用对话", {"disablepedspeech"}, "禁用讲话声", function()
	for entities.get_all_peds_as_handles() as ped do
		if IS_ANY_SPEECH_PLAYING(ped) and ped != players.user_ped() and not getPlayerCurrentShop(players.user()) != -1 then
			STOP_CURRENT_PLAYING_SPEECH(ped)
		end
	end
end)

audio:toggle_loop("禁用对话", {"disablepedspeech"}, "禁用店主讲话声", function()
	for entities.get_all_peds_as_handles() as ped do
		if IS_ANY_SPEECH_PLAYING(ped) and ped != players.user_ped() and getPlayerCurrentShop(players.user()) != -1 then -- shitty method, idc, cry about it.
			STOP_CURRENT_PLAYING_SPEECH(ped)
		end
	end
end)

audio:toggle_loop("禁用提示", {"disablefreemodemusic"}, "禁用由任务或帮派攻击等引起的音效", function()
	if AUDIO_IS_MUSIC_PLAYING() and not NETWORK_IS_ACTIVITY_SESSION() then
		TRIGGER_MUSIC_EVENT(disableScriptedMusic)
	end
end)

audio:toggle_loop("禁用背景", {"disableambientsounds"}, "禁用背景噪音 例如警报器 远处的喇叭声 手提钻 鸟类 蟋蟀等", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENE(disableAmbientSounds) return end
	if not IS_AUDIO_SCENE_ACTIVE(disableAmbientSounds) then
		START_AUDIO_SCENE(disableAmbientSounds)
	end
end, function()
	STOP_AUDIO_SCENE(disableAmbientSounds)
end)

local disableRadioEmittersList = audio:list("禁用音乐", {}, "禁用从音箱 室内 载具等发出的音乐")
disableRadioEmittersList:toggle_loop("室内", {"disableradioemitters"}, "仅在室内时禁用音乐", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENE(disableRadioEmitters) return end
	if getPlayerCurrentInterior(players.user()) != 0 then 
		if not IS_AUDIO_SCENE_ACTIVE(disableRadioEmitters) then
			START_AUDIO_SCENE(disableRadioEmitters) -- MP_POSITIONED_RADIO_MUTE_SCENE didnt want to work in story mode
		end
	else
		STOP_AUDIO_SCENE(disableRadioEmitters)
	end
end, function()
	STOP_AUDIO_SCENE(disableRadioEmitters)
end)

disableRadioEmittersList:toggle_loop("户外", {"disableradioemitters"}, "仅在室外时禁用音乐", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENE(disableRadioEmitters) return end
	if getPlayerCurrentInterior(players.user()) == 0 then 
		if not IS_AUDIO_SCENE_ACTIVE(disableRadioEmitters) then
			START_AUDIO_SCENE(disableRadioEmitters)
		end
	else
		STOP_AUDIO_SCENE(disableRadioEmitters)
	end
end, function()
	STOP_AUDIO_SCENE(disableRadioEmitters)
end)

audio:toggle("禁用警笛", {"disablesirens"}, "禁用自由模式下听到的远处警笛声", function(toggled)
	DISTANT_COP_CAR_SIRENS(not toggled)
end)

audio:toggle_loop("禁用载具", {"disablevehicleaudio"}, "静音除自己之外的所有载具的声音", function()
	if util.is_session_transition_active() or getPlayerCurrentShop(players.user()) != -1 then STOP_AUDIO_SCENE(disableVehicleAudio) return end
	if not IS_AUDIO_SCENE_ACTIVE(disableVehicleAudio) then
		START_AUDIO_SCENE(disableVehicleAudio)
	end
end, function()
	STOP_AUDIO_SCENE(disableVehicleAudio)
end)

audio:toggle_loop("禁用警报", {"disablevehiclealarms"}, "禁用载具警报声", function()
	for entities.get_all_vehicles_as_handles() as vehicle do 
		if IS_VEHICLE_ALARM_ACTIVATED(vehicle) then
			SET_VEHICLE_ALARM(vehicle, false)
		end
		if vehicle ~= entities.get_user_vehicle_as_handle() then
			RELEASE_SCRIPT_GUID_FROM_ENTITY(vehicle)
		end
	end
end)

local disableWeatherNoiseList = audio:list("禁用噪音", {}, "禁用不同类型的天气自然噪音")
disableWeatherNoiseList:toggle_loop("禁用风声", {"disablewind"}, "", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENE(disableWeatherNoise) return end
	if GET_RAIN_LEVEL() > 0.0 then return end
	if not IS_AUDIO_SCENE_ACTIVE(disableWeatherNoise) then
		START_AUDIO_SCENE(disableWeatherNoise)
	end
end, function()
	STOP_AUDIO_SCENES()
end)

disableWeatherNoiseList:toggle_loop("禁用雨声", {"disablelightrain"}, "禁用雨声", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENES(disableWeatherNoise) return end
	local rainLevel = math.ceil(GET_RAIN_LEVEL() * 10) /10
	if GET_RAIN_LEVEL() < 0.5 and GET_RAIN_LEVEL() > 0.0 then
		if not IS_AUDIO_SCENE_ACTIVE(disableWeatherNoise) then
			START_AUDIO_SCENE(disableWeatherNoise)
		end
	end
end, function()
	STOP_AUDIO_SCENES()
end)

disableWeatherNoiseList:toggle_loop("禁用雨声", {"disableheavyrain"}, "禁用大雨声", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENE(disableWeatherNoise) return end
	if GET_PREV_WEATHER_TYPE_HASH_NAME() != joaat("thunder") and GET_RAIN_LEVEL() > 0.5 then
		if not IS_AUDIO_SCENE_ACTIVE(disableWeatherNoise) then
			START_AUDIO_SCENE(disableWeatherNoise)
		end
	end
end, function()
	STOP_AUDIO_SCENES()
end)

disableWeatherNoiseList:toggle_loop("禁用雷声", {"disablethunder"}, "", function()
	if util.is_session_transition_active() then STOP_AUDIO_SCENE(disableWeatherNoise) return end
	if GET_PREV_WEATHER_TYPE_HASH_NAME() == joaat("thunder") then
		if not IS_AUDIO_SCENE_ACTIVE(disableWeatherNoise) then
			START_AUDIO_SCENE(disableWeatherNoise)
		end
	end
end, function()
	STOP_AUDIO_SCENES()
end)

audio:toggle_loop("禁用通知", {"disablefrontendaudio"}, '禁用自由模式事件开始时的通知声音或是手机等 注意 如果想听到菜单声音 请按O并选择状态关联', function()
	GET_SOUND_ID()
end, function()
	for i = 0, 99 do
		RELEASE_SOUND_ID(i)
	end
end)

graphics:toggle_loop("禁用画效", {"disablepostfx"}, "", function() 
	ANIMPOSTFX_STOP_ALL()
end)

graphics:toggle_loop("电闪雷鸣", {"forcelightning"}, "", function()
	FORCE_LIGHTNING_FLASH()
	yield(math.random(1000, 5000))
end)

local rainIntensity = graphics:slider_float("降雨强度", {"rainintensity"}, "", -1, 100, -1, 1, function(value)
	SET_RAIN(value / 100)
end)
menu.add_value_replacement(rainIntensity, -1, "默认")
menu.add_value_replacement(rainIntensity, 0, "无雨")

local snowIntensity = graphics:slider_float("降雪强度", {"snowintensity"}, "注意 这仅在当前天气类型为下雪时有效", -1, 100, -1, 1, function(value)
	SET_SNOW(value / 100)
end)
menu.add_value_replacement(snowIntensity, -1, "默认")
menu.add_value_replacement(snowIntensity, 0, "无雪")

local windSpeed = graphics:slider_float("风力强度", {"windspeed"}, "这会产生水坑等", -1, 100, -1, 1, function(value)
	SET_WIND(value / 100)
end)
menu.add_value_replacement(windSpeed, -1, "默认")
menu.add_value_replacement(windSpeed, 0, "无风")

online:toggle_loop("骷髅标志", {"juggernaut"}, "在地图上所有玩家显示骷髅头标志 重要提示 这会阻止某些东西工作 我已尽力将问题最小化", function()
	local minigunHash = joaat("weapon_minigun")
	local vehicle = GET_VEHICLE_PED_IS_USING(players.user_ped())
	if not isNetPlayerOk(players.user()) then return end
	if NETWORK_IS_ACTIVITY_SESSION() or NETWORK_IS_PLAYER_IN_MP_CUTSCENE(players.user()) or getPlayerCurrentInterior(players.user()) != 0 or getPlayerCurrentShop(players.user()) != -1 then 
		memory.write_int(isPlayerUsingBallisticEquipment(players.user()), 0)
		return 
	end
	
	for lscCoords as lscDoorCoords do
		if v3.distance(players.get_position(players.user()), lscDoorCoords) < 15.0 and vehicle != 0 then
			memory.write_int(isPlayerUsingBallisticEquipment(players.user()), 0)
			return
		end
	end

	if memory.read_int(isPlayerUsingBallisticEquipment(players.user())) == 0 then
		memory.write_int(isPlayerUsingBallisticEquipment(players.user()), minigunHash)
	end
end, function()
	memory.write_int(isPlayerUsingBallisticEquipment(players.user()), 0)
end)

local spoofBlip = online:list("虚假位置")
local blipX = 0.00
spoofBlip:slider_float("X", {"spoofedx"}, "", 0, 1000000, 0, 1, function(x_pos)
	blipX = x_pos/100
end)

local blipY = 0.00
spoofBlip:slider_float("Y", {"spoofedy"}, "", 0, 1000000, 0, 1, function(y_pos)
	blipY = y_pos/100
end)

local blipZ = 0.00
spoofBlip:slider_float("Z", {"spoofedz"}, "", -20000, 270000, 0, 1, function(z_pos)
	blipZ = z_pos/100
end)

spoofBlip:toggle_loop("启用", {}, "", function()
	memory.write_int(getPlayerInteriorID(), 1)
	v3.set(getPlayerInteriorPos(), blipX, blipY, blipZ)
end, function()
	memory.write_int(getPlayerInteriorID(), -1)
	v3.set(getPlayerInteriorPos(), players.get_position(players.user()))
end)


local spoofApartment = online:list("虚假公寓", {}, "注意 这可能会导致公寓邀请无效 具体取决于ID")
local apartmentID = -1
spoofApartmentID = spoofApartment:slider("公寓ID", {"apartmentid"}, "", -2147483647, 2147483647, -1, 1, function(value)
	apartmentID = value
end)
menu.add_value_replacement(spoofApartmentID, -1, "默认")

spoofApartment:toggle_loop("启用", {}, "", function()
	if not isNetPlayerOk(players.user(), true, true) then return end
	memory.write_int(getPlayerProperty(), isNetPlayerOk(players.user(), true, true) ? apartmentID : -1)
end, function() 
	memory.write_int(getPlayerProperty(), -1) -- this will be improved at a later date, its fine for now.
end)

local overrideChatColor = online:list("更改颜色", {}, "更改聊天中自己ID颜色 本地可见")
local chatColor = 45
overrideChatColor:list_select("颜色", {}, "", colors, chatColor, function(color)
	chatColor = color
end)

overrideChatColor:toggle_loop("更改", {}, "", function()
	OVERRIDE_MP_TEXT_CHAT_COLOR(1, chatColor)
end, function()
	OVERRIDE_MP_TEXT_CHAT_COLOR(0, chatColor)
end)


local overrideHudColor = online:list("更改颜色", {}, "改变武器轮和其他一些东西的颜色")
local hudColor = 45
overrideHudColor:list_select("颜色", {}, "", colors, chatColor, function(color)
	hudColor = color
end)

overrideHudColor:toggle_loop("更改", {}, "", function()
	SET_CUSTOM_MP_HUD_COLOR(hudColor)
end)


online:toggle_loop("过渡状态", {}, "在右下角显示当前的过渡状态", function()
	if util.is_session_transition_active() then
		BEGIN_TEXT_COMMAND_BUSYSPINNER_ON("STRING")
		ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(getTransitionStateName(getTransitionState()))
		END_TEXT_COMMAND_BUSYSPINNER_ON(5)
	else
		BUSYSPINNER_OFF()
	end
end, function()
	BUSYSPINNER_OFF()
end)

online:toggle_loop("禁用帮助", {}, "禁用帮助文本", function() 
	HIDE_HELP_TEXT_THIS_FRAME()
end)


local auto_accept = online:list("自动接受")
auto_accept:toggle_loop("自动加入", {}, "", function() 
	local msgHash = GET_WARNING_SCREEN_MESSAGE_HASH()
	for warnings as hash do
		if msgHash == hash then
			SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
			yield()
			yield()
		end
	end
end)

auto_accept:toggle_loop("交易错误", {}, "", function() 
	local msgHash = GET_WARNING_SCREEN_MESSAGE_HASH()
	for transactionWarnings as hash do
		if msgHash == hash then
			SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
			yield()
			yield()
		end
	end
end)


online:toggle("阻止自瞄", {}, "阻止玩家使用自瞄锁定你", function(toggled)
	SET_PED_CAN_BE_TARGETTED(players.user_ped(), not toggled)
end)

online:toggle_loop("领取悬赏", {"autoclaimbounties"}, "自动领取自己的赏金", function()
	local bounty = players.get_bounty(players.user())
	if bounty != nil then
		repeat
			menu.trigger_commands("removebounty")
			yield(1000)
			bounty = players.get_bounty(players.user())
		until bounty == nil
		toast("已领取自己的赏金 :D")
	end
end)

online:toggle_loop("载具权限", {"accesslockedvehicles"}, "设置为载具使用权没有任何人", function()
	for players.list() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		if GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, players.user()) then
			SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, players.user(), false)
			SET_DONT_ALLOW_PLAYER_TO_ENTER_VEHICLE_IF_LOCKED_FOR_PLAYER(players.user(), false)
		end
	end
end)

online:toggle_loop("阻止劫持", {}, "", function()
	if not IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then return end
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_CONFIG_FLAG(ped, 342, true)
	end
end)

local tutorial_session_list = lobby:list("指导战局", {}, "在你的战局中创建一个战局 互相不同步 某些Stand功能可能无法使用")
local lockedTutorialSession
lockedTutorialSession = tutorial_session_list:toggle("创建", {""}, "创建其他人无法加入的指导战局", function(toggled)
	(toggled ? NETWORK_START_SOLO_TUTORIAL_SESSION : NETWORK_END_TUTORIAL_SESSION)()
end)

playerTutorialSessionList = tutorial_session_list:list("列表")
local playerTutorialSession = playerTutorialSessionList:list_action("玩家", {}, "列出大厅中正在进行指导战局的所有玩家", {}, function(playerID)
	local team = getTeamID(playerID)
	local instance = getInstanceID(playerID)
	if team == nil or instance == nil then return end
	NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION(team, instance)
	repeat
		yield()
	until getTeamID(playerID) != team or getInstanceID(playerID) != instance or not players.exists(playerID)
	NETWORK_END_TUTORIAL_SESSION()
end)

util.create_tick_handler(function()
	local tutorialPlayers = {}
	for players.list_except() as playerID do
		if getTeamID(playerID) != nil and getInstanceID(playerID) != nil then
			tutorialPlayers[#tutorialPlayers + 1] = {playerID, players.get_name(playerID)}
		end
	end
	menu.set_list_action_options(playerTutorialSession, tutorialPlayers)
	yield(1000)
end)

playerTutorialSessionList:action("退出", {"exittutorialsession"}, "退出当前指导战局", function()
	if not NETWORK_IS_IN_TUTORIAL_SESSION() then
		toast("无指导战局 :/")
		return
	end
	NETWORK_END_TUTORIAL_SESSION()
end)

tutorial_session = tutorial_session_list:list("创建指导课程")
local team = 0
tutorial_session:slider("团队", {"teamid"}, "", 0, 2, 0, 1, function(value)
	team = value
end)
local instance_id = 0
tutorial_session:slider("实例 ID", {"instanceid"}, "", 0, 63, 0, 1, function(value)
	instance_id = value
end)

local tutorialSession
tutorialSession = tutorial_session:toggle_loop("进入指导课程", {}, "", function()
	if lockedTutorialSession.value then 
		toast("不能同时启用 :/") 
		tutorialSession.value = false
		return 
	end
	local teamID = team
	NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION(teamID, instance_id)
	while teamID == team do
		yield()
	end
end, function()
	NETWORK_END_TUTORIAL_SESSION()
end)

local orbital = lobby:list("反天基炮")
local spoofOrbital = orbital:list("虚假位置")
local spoofOrbPly = spoofOrbital:list("虚假他人位置")

local playerList = {}
playerList[players.user()] = {players.user(), players.get_name(players.user())}
local selectedPlayer = players.user()
local spoofOrb = spoofOrbPly:list_select("位置", {}, "选择一名玩家", playerList, players.user(), function(playerID)
	selectedPlayer = playerID
end)

util.create_tick_handler(function()
	playerList = {}
	for players.list_except() as playerID do
		playerList[#playerList + 1] = {playerID, players.get_name(playerID)}
	end
	menu.set_list_action_options(spoofOrb, playerList)
	yield(1000)
end)

local positonSpoofing = menu.ref_by_path("Online>Spoofing>Position Spoofing>Position Spoofing")
local spoofedPos = menu.ref_by_path("Online>Spoofing>Position Spoofing>Spoofed Position")
local invisibility = menu.ref_by_path("Self>Appearance>Invisibility")
spoofOrbPly:toggle_loop("启用", {}, "", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(selectedPlayer)
		if isPlayerUsingOrbitalCannon(playerID) then
			invisibility:setState("Locally Visible")
			positonSpoofing.value = true
			repeat
				pos.z -= 190
				spoofedPos:trigger(pos:toString())
				pos = players.get_position(selectedPlayer)
				yield()
			until not isPlayerUsingOrbitalCannon(playerID) or not players.exists(playerID)
			invisibility:setState("Disabled")
			positonSpoofing.value = false
		end
	end
end, function()
	invisibility:setState("Disabled")
	positonSpoofing.value = false
end)

local spoofedX = 0.00
spoofOrbital:slider_float("X", {"spoofedx"}, "", 0, 1000000, 0, 1, function(x_pos)
	spoofedX = x_pos/100
end)

local spoofedY = 0.00
spoofOrbital:slider_float("Y", {"spoofedy"}, "", 0, 1000000, 0, 1, function(y_pos)
	spoofedY = y_pos/100
end)

local spoofedZ = 0.00
spoofOrbital:slider_float("Z", {"spoofedz"}, "", -20000, 270000, 0, 1, function(z_pos)
	spoofedZ = z_pos/100
end)

spoofOrbital:toggle_loop("启用", {}, "", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if isPlayerUsingOrbitalCannon(playerID) and GET_IS_TASK_ACTIVE(ped, 135) then
			positonSpoofing.value = true
			menu.trigger_commands("spoofedposition " .. spoofedX .. "," .. spoofedY .. "," .. spoofedZ)
			repeat
				yield()
			until not isPlayerUsingOrbitalCannon(playerID) or not players.exists(playerID)
			positonSpoofing.value = false
		end
	end
end)

orbital:toggle_loop("封闭室门", {"blockorb"}, "生成物体阻挡对方进入天基炮室", function() -- credit to lance, just cleaned it up a bit.
	util.request_model(blockOrbMdl)
	util.request_model(blockOrbMdlSign)
	if orbObj == nil or not DOES_ENTITY_EXIST(orbObj) then
		orbObj = entities.create_object(blockOrbMdl, v3(335.9, 4833.9, -59.0))
		orbSign = entities.create_object(blockOrbMdlSign, v3(335.9, 4834, -57.0))
		entities.set_can_migrate(orbObj, false)
		entities.set_can_migrate(orbSign, false)
		SET_ENTITY_HEADING(orbObj, 125.0)
		SET_ENTITY_HEADING(orbSign, 125.0)
		FREEZE_ENTITY_POSITION(orbObj, true)
		SET_ENTITY_NO_COLLISION_ENTITY(players.user_ped(), orbObj, false)
		SET_ENTITY_ROTATION(orbSign, -25.0, 0.0, 125.0, 2, true)
	end
	yield(50)
end, function()
	if orbObj != nil then
		entities.delete(orbObj)
	end
	if orbSign != nil then
		entities.delete(orbSign)
	end
end)

local annoy = orbital:list("闪烁延迟", {}, "")
local orbDelay = 1000
annoy:list_select("延迟", {}, "天基炮使用者看你名字的闪烁速度", {{1000, "慢"}, {500, "中"}, {100, "快"}}, orbDelay, function(value)
	orbDelay = value
end)

local annoy_tgl
annoy_tgl = annoy:toggle_loop("启用", {}, "", function()
	for players.list_except(true) as playerID do
	   if isPlayerUsingOrbitalCannon(playerID) then
			repeat
				SET_REMOTE_PLAYER_AS_GHOST(playerID, true)
				yield(orbDelay)
				SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
				yield(orbDelay)
			until not isPlayerUsingOrbitalCannon(playerID) or not players.exists(playerID)
			SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
		end
	end
end)

local ghostOrb = orbital:list("幽灵模式")
ghostOrb:toggle_loop("总是", {"ghostorb"}, "自动幽灵化使用天基炮的玩家", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local cam_dist = v3.distance(players.get_position(players.user()), players.get_cam_pos(playerID))
		if isPlayerUsingOrbitalCannon(playerID) and GET_IS_TASK_ACTIVE(ped, 135) then
			SET_REMOTE_PLAYER_AS_GHOST(playerID, true)
			repeat
				yield()
			until not isPlayerUsingOrbitalCannon(playerID)
			SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
		end
	end
end, function()
	for players.list_except(true) as playerID do
		SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
	end
end)

ghostOrb:toggle_loop("被瞄准时", {}, "被瞄准时自动幽灵使用天基炮瞄准你的玩家", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(players.user())
		local distance = v3.distance(pos, v3.setZ(players.get_cam_pos(playerID), pos.z))
		if isPlayerUsingOrbitalCannon(playerID) and distance < 25.0 and not isPlayerInInterior(players.user()) then
			SET_REMOTE_PLAYER_AS_GHOST(playerID, true)
			repeat
				yield()
			until not isPlayerUsingOrbitalCannon(playerID)
			SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
		end
	end
end, function()
	for players.list_except(true) as playerID do
		SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
	end
end)

orbital:toggle_loop("自动幽灵", {"ghostmoddedorbs"}, "反击作弊天基炮 自动幽灵使用天基炮瞄准你的玩家", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local cam_dist = v3.distance(players.get_position(players.user()), players.get_cam_pos(playerID))
		if isPlayerUsingOrbitalCannon(playerID) and not GET_IS_TASK_ACTIVE(ped, 135) then
			SET_REMOTE_PLAYER_AS_GHOST(playerID, true)
			repeat
				yield()
			until not isPlayerUsingOrbitalCannon(playerID)
			SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
		end
	end
end, function()
	for players.list_except(true) as playerID do
		SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
	end
end)

local drawOrbitalCannon = orbital:list("显示天基")
local orbColor = {r = 255/255, g = 0, b = 255/255, a = 0}
drawOrbitalCannon:colour("颜色", {"markercolor"}, "单击以选择一种颜色", orbColor, true, function(value)
	orbColor = value 
end)

drawOrbitalCannon:toggle_loop("位置", {}, "", function()
	for players.list_except() as playerID do
		if isPlayerUsingOrbitalCannon(playerID) then
			local cam = players.get_cam_pos(playerID)
			local rot, dir =  v3(), v3()
			local ground
			ground, cam.z = util.get_ground_z(cam.x, cam.y)
			if not ground then continue end
			local cam_dist = v3.distance(cam, players.get_cam_pos(playerID))
			DRAW_MARKER(28, cam, rot, dir, 1.0, 1.0, cam_dist, math.floor(orbColor.r * 255), math.floor(orbColor.g * 255), math.floor(orbColor.b * 255), 105, false, false)
		end
	end
end)

local rp_loop = lobby:list("经验循环", {}, "对战局每个人循环经验")
local level = 120
rp_loop:slider("目标值", {"maxlevellobby"}, "", 1, 8000, 120, 1, function(val)
	level = val
end)

local delay = 5
rpLoopAll = rp_loop:slider("延迟", {"loopdelaylobby"}, '人多的战局不要设置成最快 可能有问题', 0, 2500, 5, 5, function(val)
	delay = val
end)
menu.add_value_replacement(rpLoopAll, 0, "最快（阅读说明）")
menu.add_value_replacement(rpLoopAll, 5, "默认")

local function triggerCollectibleLoop(playerID, i)
	if players.get_rank(playerID) >= level then return end
	util.trigger_script_event(1 << playerID, {968269233, players.user(), 4, i, 1, 1, 1})
end

local lobbyRPLoop
lobbyRPLoop = rp_loop:toggle_loop("启用", {"rplooplobby"}, "对战局中的每个人启用经验循环", function()
	if not isNetPlayerOk(players.user(), true, true) then
		lobbyRPLoop.value = false
		return
	end
	for players.list_except(true) as playerID do
		if players.is_marked_as_modder(playerID) or players.get_weapon_damage_modifier(playerID) == 1 or not isNetPlayerOk(playerID) or players.get_rank(playerID) >= level then continue end
		if delay == 0 then
			for i = 20, 24 do
				triggerCollectibleLoop(playerID, i)
			end
		elseif delay == 5 then
			triggerCollectibleLoop(playerID, math.random(20, 24)) -- limiting the amount of script events sent to prevent a fatal error
		else
			for i = 20, 24 do
				triggerCollectibleLoop(playerID, i)
			end
			yield(delay)
		end
	end	
end)

lobby:action("劫持所有", {"hijackall"}, "劫持全部载具", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		if DOES_ENTITY_EXIST(ped) and IS_PED_IN_ANY_VEHICLE(ped, false) then
			menu.trigger_commands($"hijack {players.get_name(playerID)}")
		end
	end
end)

lobby:toggle_loop("锁定所有", {"lockall"}, "锁定所有载具", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_TRYING_TO_ENTER(ped)
		if not GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID) then
			SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID, true)
		end
	end
end)


lobby:toggle_loop("干扰导弹", {"annoy"}, "", function()
	for _, playerID in players.list_except() do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		if GET_IS_TASK_ACTIVE(ped, 199) then
			SET_VEHICLE_HOMING_LOCKEDONTO_STATE(vehicle, 1)
		end
	end
end)

local horny = lobby:list("击杀招妓")
local horny_counter = 0
horny:toggle_loop("惩治", {}, "杀死试图招妓的好色玩家", function()
	local timer = util.current_time_millis() + 2500
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		if isPlayerSolicitingProstitute(playerID) then
			repeat
				if util.current_time_millis() > timer then
					timer = util.current_time_millis() + 2500
					return
				end
				menu.trigger_commands($"kill {players.get_name(playerID)}")
				yield()
			until IS_PLAYER_DEAD(ped)
			toast($"击杀 {players.get_name(playerID)} 因为太饥渴了")
			timer = util.current_time_millis() + 2500
		end
	end
end)

horny:toggle_loop("羞辱", {}, "在聊天中取笑对方来羞辱试图招妓的好色玩家", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		if isPlayerSolicitingProstitute(playerID) then
			chat.send_message($"{players.get_name(playerID)} is horny and about to have sex with a prostitute. Lets make fun of this bozo! HAHA, loser!", false, true, true)
			repeat
				yield()
			until isPlayerSolicitingProstitute(playerID)
		end
	end
end)

local reversed_messages = {}
local reverse_msg = false
chat.on_message(function(packet_sender, message_sender, text, team_chat)
	if reverse_msg and message_sender != players.user() and not reversed_messages[text] then -- prevent message spam
		chat.send_message(string.reverse(text), false, true, true)
		reversed_messages[text] = {timestamp = os.time()}
	end
end)

lobby:toggle("复述聊天", {}, "", function(toggled)
	reverse_msg = toggled
end)

local messageTimeout = 5
util.create_tick_handler(function()
	for msg, messageData in reversed_messages do
		if os.time() - messageData.timestamp > messageTimeout then
			reversed_messages[msg] = nil
		end
	end
end)

missions:action("杀死所有", {}, "", function()
	local counter = 0
	for entities.get_all_peds_as_handles() as ped do
		if GET_BLIP_COLOUR(GET_BLIP_FROM_ENTITY(ped)) == 1 or GET_IS_TASK_ACTIVE(ped, 352) then -- shitty way to go about it but hey, it works (most of the time).
			SET_ENTITY_HEALTH(ped, 0, 0, 0)
			counter += 1
			yield()
		end
	end
	toast(counter == 0 ? "没有发现敌人 :/" : $"击杀 {tostring(counter)} 敌人")
end)

missions:action("传拾取物", {}, "", function()
	local counter = 0
	local pos = players.get_position(players.user())
	for entities.get_all_pickups_as_handles() as pickup do
		SET_ENTITY_COORDS(pickup, pos, false, false, false, false)
		counter += 1
		yield()
	end
	toast(counter == 0 ? "无拾取物 :/" : $"传送 {tostring(counter)} 拾取物")
end)

local pedSeeingRange = missions:list("视野范围")
local pedHearingRange = missions:list("听觉范围")
local pedIdRange = missions:list("识别范围")

local seeingRange = 60.0
local seeingRangeSlider = pedSeeingRange:slider_float("范围", {"seeingrange"}, "行人可以看到你的范围", 0, 10000, 6000, 100, function(value)
	seeingRange = value/100
end)
menu.add_value_replacement(seeingRangeSlider, 6000, "默认")

pedSeeingRange:toggle_loop("启用", {}, "", function()
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_SEEING_RANGE(ped, seeingRange)
	end
end, function()
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_SEEING_RANGE(ped, 60.0)
	end
end)

local hearingRange = 60.0
local hearingRangeSlider = pedHearingRange:slider_float("范围", {"hearingrange"}, "", 0, 10000, 6000, 100, function(value)
	hearingRange = value/100
end)
menu.add_value_replacement(hearingRangeSlider, 6000, "默认")

pedHearingRange:toggle_loop("启用", {}, "", function()
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_HEARING_RANGE(ped, hearingRange)
	end
end, function()
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_HEARING_RANGE(ped, 60.0)
	end
end)

local idRange = 20.0
local idRangeSlider = pedIdRange:slider_float("范围", {"idrange"}, "行人可以识别你的范围。", 0, 10000, 2000, 100, function(value)
	idRange = value/100
end)
menu.add_value_replacement(idRangeSlider, 2000, "默认")

pedIdRange:toggle_loop("启动", {}, "", function()
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_ID_RANGE(ped, idRange)
	end
end, function()
	for entities.get_all_peds_as_handles() as ped do
		SET_PED_ID_RANGE(ped, 20.0)
	end
end)

weapons:toggle_loop("一枪双发", {"doubletap"}, "打一枪射出两发子弹", function()
	if IS_PED_SHOOTING(players.user_ped()) then
		FORCE_PED_AI_AND_ANIMATION_UPDATE(players.user_ped())
	end
end)

weapons:toggle_loop("持续自瞄", {"aimbotall"}, "", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pPed =  entities.handle_to_pointer(ped)
		local pedPtr = entities.handle_to_pointer(players.user_ped())
		local wpn = GET_SELECTED_PED_WEAPON(players.user_ped())
		local dmg = GET_WEAPON_DAMAGE(wpn, 0)
		if IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), ped) and IS_PED_SHOOTING(players.user_ped()) and not IS_ENTITY_A_GHOST(ped) then
			boneIndex = bones[math.random(#bones)]
			local boneCoords = GET_PED_BONE_COORDS(ped, boneIndex, 0.0, 0.0, 0.0)
			util.call_foreign_function(CWeaponDamageEventTrigger, pedPtr, pPed, boneCoords, 0, 1, wpn, dmg, 0, 0, 1 << 0 | 1 << 9 | 1 << 19, 0, 0, 0, 0, 0, 0, 0, 0.0)
		end
	end
end)

local modifier = 1.00
weapons:slider_float("伤害修改", {"meleedamage"}, "", 100, 1000, 100, 10, function(value)
	modifier = value / 100
	SET_PLAYER_MELEE_WEAPON_DAMAGE_MODIFIER(players.user(), modifier)
end)

weapons:toggle_loop("锁定范围", {}, "导弹锁定范围和自动瞄准设置为最大", function()
	SET_PLAYER_LOCKON_RANGE_OVERRIDE(players.user(), 99999999.0)
end)

weapons:toggle_loop("射程扩展", {}, "将武器射程扩展到 250 米", function()
	SET_PED_RESET_FLAG(players.user_ped(), 95, GET_MAX_RANGE_OF_CURRENT_PED_WEAPON(players.user_ped()) < 250.0)
end)

local changeBulletProjectile = weapons:list("更改子弹", {}, "")
for id, data in weapon_stuff do
	local name = data[1]
	local weaponName = data[2]
	local bulletProjectile
	bulletProjectile = changeBulletProjectile:toggle_loop(name, {}, "", function()
		local weapon = loadWeaponAsset(weaponName)
		local wpn = GET_SELECTED_PED_WEAPON(players.user_ped())
		local shotDelay = GET_WEAPON_TIME_BETWEEN_SHOTS(wpn)
		local inst = v3.new()
		if IS_PED_SHOOTING(players.user_ped()) and IS_PLAYER_FREE_AIMING(players.user()) then
			if not GET_PED_LAST_WEAPON_IMPACT_COORD(players.user_ped(), memory.addrof(inst)) then
				v3.set(inst,GET_FINAL_RENDERED_CAM_ROT(2))
				local tmp = v3.toDir(inst)
				v3.set(inst, v3.get(tmp))
				v3.mul(inst, 1000)
				v3.set(tmp, GET_FINAL_RENDERED_CAM_COORD())
				v3.add(inst, tmp)
			end
			local x, y, z = v3.get(inst)
			local wpEnt = GET_CURRENT_PED_WEAPON_ENTITY_INDEX(players.user_ped(), 0)
			local wpCoords = GET_ENTITY_BONE_POSTION(wpEnt, GET_ENTITY_BONE_INDEX_BY_NAME(wpEnt, "gun_muzzle"))
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS(wpCoords, x, y, z, 1, true, weapon, players.user_ped(), true, false, 1000.0)
			yield(shotDelay * 1000)
		end
	end, function()
		local pos = players.get_position(players.user())
		CLEAR_AREA_OF_PROJECTILES(pos, 999999.0, 0)
	end)
end


weapons:toggle_loop("快速切枪", {"fasthands"}, "", function()
	if GET_IS_TASK_ACTIVE(players.user_ped(), 56) then
		FORCE_PED_AI_AND_ANIMATION_UPDATE(players.user_ped())
	end
end)

weapons:toggle_loop("锁定玩家", {}, "允许使用制导发射器锁定玩家", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		ADD_PLAYER_TARGETABLE_ENTITY(players.user(), ped)
		SET_ENTITY_IS_TARGET_PRIORITY(ped, false, 400.0)    
	end
end, function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		REMOVE_PLAYER_TARGETABLE_ENTITY(players.user(), ped)
	end
end)

local nitrous = vehicles:list("载具氮气", {}, "注意 可能其他玩家也可以看到这一点")
local durationMod = 1.0
nitrous:slider_float("持续值", {"duration"}, "氮持续的秒数", 100, 1000, 300, 50, function(value)
	durationMod = value/300 -- this seems to be the exact conversion for converting the float to seconds
end)

local powerMod = 1.5
nitrous:slider_float("功率值", {"multiplier"}, "", 100, 1000, 150, 50, function(value)
	powerMod = value/100
end)

local rechargeMod = 2.0
nitrous:slider_float("加载值", {"rechargetime"}, "可能会根据持续时间而变化", 100, 1000, 200, 50, function(value)
	rechargeMod = value/100
end)

nitrous:toggle("喇叭氮气", {}, "", function(toggled)
	_SET_VEHICLE_USE_HORN_BUTTON_FOR_NITROUS(toggled)
end)

nitrous:toggle_loop("禁用氮气", {}, "松开W键时禁用氮气", function(toggled)
	local vehicle = entities.get_user_vehicle_as_handle()
	if IS_CONTROL_JUST_RELEASED(0, 71) and IS_NITROUS_ACTIVE(vehicle) then
		SET_OVERRIDE_NITROUS_LEVEL(vehicle, false, durationMod, powerMod, rechargeMod, false) -- SET_NITROUS_IS_ACTIVE didnt wanna work here cus gay
	end
end)

nitrous:toggle_loop("禁用空中", {}, "在空中禁用", function(toggled)
	local vehicle = entities.get_user_vehicle_as_handle()
	if IS_ENTITY_IN_AIR(vehicle) then
		SET_OVERRIDE_NITROUS_LEVEL(vehicle, false, durationMod, powerMod, rechargeMod, false) -- SET_NITROUS_IS_ACTIVE didnt wanna work here cus gay
	end
end)

local clearedNitrous = false
nitrous:toggle_loop("启用", {"nitrous"}, "默认按钮是X", function()
	if GET_HAS_ROCKET_BOOST(entities.get_user_vehicle_as_handle()) then return end
	if not clearedNitrous then
		CLEAR_NITROUS(entities.get_user_vehicle_as_handle()) -- clearing nitrous on feature startup because the bar doesn't go down if enabled while full.
		clearedNitrous = true
		return
	else
		loadPtfxAsset("veh_xs_vehicle_mods")
		local vehicle = entities.get_user_vehicle_as_handle()
		SET_OVERRIDE_NITROUS_LEVEL(vehicle, true, durationMod, powerMod, rechargeMod, false)
		if not IS_NITROUS_ACTIVE(vehicle) then
			SET_NITROUS_IS_ACTIVE(vehicle, false) -- disable the nitrous ptfx when not active, removing the ptfx still left the lights from the ptfx behind
			return
		end
	end
end, function()
	SET_OVERRIDE_NITROUS_LEVEL(entities.get_user_vehicle_as_handle(), false, 0.0, 0.0, 0.0, false)
	clearedNitrous = false
end)


local antilag = vehicles:list("载具音爆", {}, "")
local antilagDelay = 100
antilag:slider("延迟值", {"antilagdelay"}, "排气管音爆的时间间隔", 0, 1000, 100, 10, function(amount)
	antilagDelay = amount
end)

local random = false
antilag:toggle("随机化", {}, "随机排气管音爆的时间间隔", function(toggled)
	random = toggled
end)

antilag:toggle_loop("启用", {"antilag"}, "启动你的引擎按空格来使用 仅在载具静止时有效 本地可见", function()
	local veh = entities.get_user_vehicle_as_pointer()
	if veh == 0 then return end
	local gear = entities.get_current_gear(veh)
	local rpm = entities.get_rpm(veh)
	if IS_CONTROL_PRESSED(0, 22) and IS_CONTROL_PRESSED(0, 71) then
		entities.set_rpm(veh, 0.9)
		yield(random ? math.random(100, antilagDelay) : antilagDelay)
		entities.set_rpm(veh, 0.1)
	end
end)

local flamethrowerTune = vehicles:list("载具尾焰", {}, "先启用氮气 注意 可能其他玩家也可以看到")
flamethrowerTune:toggle_loop("发动时", {}, "", function()
	loadPtfxAsset("veh_xs_vehicle_mods")
	local vehPtr = entities.get_user_vehicle_as_pointer()
	local vehHandle = entities.get_user_vehicle_as_handle()
	if vehPtr == 0 then return end
	if entities.get_rpm(vehPtr) == 1.0 then
		SET_NITROUS_IS_ACTIVE(vehHandle, true)
	end
end)

flamethrowerTune:toggle_loop("降档时", {}, "", function()
	loadPtfxAsset("veh_xs_vehicle_mods")
	local vehPtr = entities.get_user_vehicle_as_pointer()
	local vehHandle = entities.get_user_vehicle_as_handle()
	if vehPtr == 0 then return end
	local prevGear = entities.get_current_gear(vehPtr)
	yield()
	yield()
	local curGear = entities.get_current_gear(vehPtr)
	if curGear < prevGear then
		for i = 0, 25 do
			SET_NITROUS_IS_ACTIVE(vehHandle, true)
			yield()
		end
	end
end)

flamethrowerTune:toggle_loop("升档时", {}, "", function()
	loadPtfxAsset("veh_xs_vehicle_mods")
	local vehPtr = entities.get_user_vehicle_as_pointer()
	local vehHandle = entities.get_user_vehicle_as_handle()
	if vehPtr == 0 then return end
	local prevGear = entities.get_current_gear(vehPtr)
	yield()
	yield()
	local curGear = entities.get_current_gear(vehPtr)
	if curGear > prevGear then
		for i = 0, 25 do
			SET_NITROUS_IS_ACTIVE(vehHandle, true)
			yield()
		end
	end
end)

flamethrowerTune:toggle_loop("加速时", {}, "", function()
	loadPtfxAsset("veh_xs_vehicle_mods")
	local vehicle = entities.get_user_vehicle_as_handle()
	SET_NITROUS_IS_ACTIVE(vehicle, IS_CONTROL_PRESSED(0, 71))
end)

flamethrowerTune:toggle_loop("总是", {}, "", function()
	loadPtfxAsset("veh_xs_vehicle_mods")
	local vehicle = entities.get_user_vehicle_as_handle()
	SET_NITROUS_IS_ACTIVE(vehicle, true)
end)

-- todo: add rpm based option

local wheelie = vehicles:list("载具前轮")
local wheelie_val = 0.3
wheelie:slider_float("翘起值", {"wheeliepower"}, "", 10, 100, 30, 5, function(value)
	wheelie_val = value / 100
end)

local vehicleWheelie
vehicleWheelie = wheelie:toggle_loop("启用", {}, "按Ctrl和W 翘起前轮", function()
	local vehicleModel = players.get_vehicle_model(players.user())
	if not IS_THIS_MODEL_A_CAR(vehicleModel) and not IS_THIS_MODEL_AN_AMPHIBIOUS_CAR(vehicleModel) then 
		toast("不适用于此类载具 :/")
		vehicleWheelie.value = false
		return 
	end
	local CAutomobile = entities.get_user_vehicle_as_pointer()
	if CAutomobile == 0 then return end
	local CHandlingData = entities.vehicle_get_handling(CAutomobile)
	memory.write_float(CHandlingData + 0x00EC, IS_CONTROL_PRESSED(0, 71) and IS_CONTROL_PRESSED(0, 280) ? -wheelie_val : 0.5)
end)

local clumsiness = vehicles:list("载具翻滚", {}, "使载具轻松滚动")
local clumsy_val = 0.3
clumsiness:slider_float("翻滚值", {"clumsinessvalue"}, "", 10, 100, 30, 5, function(value)
	clumsy_val = value / 100
end)

local vehicleClumsiness
vehicleClumsiness = clumsiness:toggle_loop("启用", {"vehicleclumsiness"}, "", function()
	local vehicleModel = players.get_vehicle_model(players.user())
	if not IS_THIS_MODEL_A_CAR(vehicleModel) and not IS_THIS_MODEL_AN_AMPHIBIOUS_CAR(vehicleModel) then 
		toast("不适用于此类载具 :/")
		vehicleClumsiness.value = false
		return 
	end
	local CAutomobile = entities.get_user_vehicle_as_pointer()
	if CAutomobile == 0 then return end
	local CHandlingData = entities.vehicle_get_handling(CAutomobile)
	local veh_speed = (GET_ENTITY_SPEED(entities.get_user_vehicle_as_handle())* 2.236936)
	memory.write_float(CHandlingData + 0x00EC, IS_CONTROL_PRESSED(0, 266) or IS_CONTROL_PRESSED(0, 267) ? -clumsy_val : 0.5)
end, function()
	local CAutomobile = entities.get_user_vehicle_as_pointer()
	if CAutomobile == 0 then return end
	local CHandlingData = entities.vehicle_get_handling(CAutomobile)
	memory.write_float(CHandlingData + 0x00EC, 0.5)
end)


local engine_sound = vehicles:list("载具声音", {}, "注意 某些发动机声音可能会影响你的载具加速")
local vehicle_class = {}
local ignore_duplicates = {} 
for util.get_vehicles() as vehicle do
	local name = util.get_label_text(vehicle.name)
	local hash = joaat(vehicle.name)
	local veh_class = GET_VEHICLE_CLASS_FROM_NAME(hash)

	if ignore_class or name == "NULL" or ignore_duplicates[name] or (not IS_THIS_MODEL_A_CAR(hash) and not IS_THIS_MODEL_A_BIKE(hash) and not IS_THIS_MODEL_A_QUADBIKE(hash)) then 
		continue 
	end
	if not vehicle_class[veh_class] then
		vehicle_class[veh_class] = engine_sound:list(util.get_label_text($"VEH_CLASS_{veh_class}"))
	end
	ignore_duplicates[name] = true
	engine_sound.action(vehicle_class[veh_class], name, {$"engine {name}"}, "", function()
		SET_RADIO_TO_STATION_NAME("OFF") -- the radio kept changing for some reason so this should fix that
		FORCE_USE_AUDIO_GAME_OBJECT(entities.get_user_vehicle_as_handle(), vehicle.name)
		yield(100)
		SET_RADIO_TO_STATION_NAME("OFF") -- sometimes it doesn't turn off
	end)
end

local radio = true
vehicles:toggle_loop("载具电台", {""}, "进入载具时关闭电台", function()
	if not IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then 
		radio = true 
		return 
	end
	
	if GET_PLAYER_RADIO_STATION_NAME() != "OFF" and radio then
		yield(100)
		SET_RADIO_TO_STATION_NAME("OFF")
		radio = false
	end
end)

vehicles:toggle_loop("载具火箭", {"vehiclerockets"}, "按鼠标左键开火", function()
	local wpn = joaat("vehicle_weapon_tank")
	local vehicle = entities.get_user_vehicle_as_handle()
	local offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS
	local leftStart = offset(vehicle, -1.25, 0.5, 0.35)
	local leftEnd = offset(vehicle, -1.25, 100.0, 0.35)
	local rightStart = offset(vehicle, 1.25, 0.5, 0.35)
	local rightEnd = offset(vehicle, 1.25, 100.0, 0.35)
	if IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) and not GET_IS_TASK_ACTIVE(players.user_ped(), 199) and IS_CONTROL_JUST_RELEASED(0, 69) and not IS_CONTROL_PRESSED(0, 68) then
		SHOOT_SINGLE_BULLET_BETWEEN_COORDS(leftStart, leftEnd, 0, true, wpn, players.user_ped(), true, false, 5.0)
		SHOOT_SINGLE_BULLET_BETWEEN_COORDS(rightStart, rightEnd, 0, true, wpn, players.user_ped(), true, false, 5.0)
	end
end)

vehicles:toggle_loop("载具车门", {}, "当上车权限设置为无人时 模仿灭世2000的车门把手电击锁", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pPed =  entities.handle_to_pointer(ped)
		local pedPtr = entities.handle_to_pointer(players.user_ped())
		local vehicle = entities.get_user_vehicle_as_handle()
		local isPersonalVehicle = DECOR_GET_INT(vehicle, "Player_Vehicle") != 0
		local boneCoords = GET_PED_BONE_COORDS(ped, 0xFCD9, v3())
		if GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID) and GET_VEHICLE_PED_IS_TRYING_TO_ENTER(ped) == vehicle and isPersonalVehicle and IS_THIS_MODEL_A_CAR(GET_ENTITY_MODEL(vehicle)) then
			if HAS_ANIM_EVENT_FIRED(ped, -1526509349) then
				util.call_foreign_function(CWeaponDamageEventTrigger, pedPtr, pPed, boneCoords, 0, 1, joaat("weapon_stungun_mp"), 1.0, 0, 0, 1 << 0 | 1 << 19, 0, 0, 0, 0, 0, 0, 0, 0.0)
				yield(1000)
			end
		end
	end
end)

local veh_jump = vehicles:list("载具跳跃")
local jumpForce = 25.00
veh_jump:slider_float("跳跃值", {"jumpiness"}, "", 0, 10000, 2500, 100, function(value)
	jumpForce = value / 100
end)

veh_jump:toggle_loop("启用", {"vehiclejump"}, "按空格键跳跃", function()
	local vehicle = entities.get_user_vehicle_as_handle()
	if vehicle != 0 and DOES_ENTITY_EXIST(vehicle) and IS_CONTROL_JUST_RELEASED(0, 102) then
		APPLY_FORCE_TO_ENTITY(vehicle, 1, 0.0, jumpForce/1.5, jumpForce, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
		repeat
			yield()
		until not IS_ENTITY_IN_AIR(vehicle)
	end
end)

vehicles:toggle("载具室灯", {}, "", function(toggled)
	SET_VEHICLE_FORCE_INTERIORLIGHT(entities.get_user_vehicle_as_handle(), toggled)
end)

local deformation = 1.00
vehicles:slider_float("载具变形", {"deformation"}, "", 0, 10000, 100, 100, function(value)
	deformation = value / 100
	menu.trigger_commands($"vhdeformationmult {deformation}")
end)

vehicles:toggle_loop("载具加速", {""}, "", function()
	if not GET_IS_VEHICLE_ENGINE_RUNNING(entities.get_user_vehicle_as_handle()) and GET_IS_TASK_ACTIVE(players.user_ped(), 150) then
		FORCE_PED_AI_AND_ANIMATION_UPDATE(players.user_ped())
	end
end)

vehicles:toggle_loop("载具进出", {"fastvehicleenter"}, "加快进出载具速度", function()
	if (GET_IS_TASK_ACTIVE(players.user_ped(), 160) or GET_IS_TASK_ACTIVE(players.user_ped(), 167) or GET_IS_TASK_ACTIVE(players.user_ped(), 165)) and not GET_IS_TASK_ACTIVE(players.user_ped(), 195) then
		FORCE_PED_AI_AND_ANIMATION_UPDATE(players.user_ped())
	end
end)

vehicles:toggle_loop("载具解除", {""}, "下车时自动解除载具无敌", function()
	if not GET_ENTITY_CAN_BE_DAMAGED(entities.get_user_vehicle_as_handle()) then
		if not IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then
			SET_ENTITY_CAN_BE_DAMAGED(GET_VEHICLE_PED_IS_IN(players.user_ped(), true), true)
		end
	end
end)

vehicles:toggle_loop("载具自瞄", {"vehicleaimbotall"}, "载具导弹瞄准玩家", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pedDistance = v3.distance(players.get_position(players.user()), players.get_position(playerID))
		if not IS_PLAYER_DEAD(ped) and IS_CONTROL_PRESSED(0, 70) and pedDistance < 250.0 and not players.is_in_interior(playerID) and GET_VEHICLE_HOMING_LOCKON_STATE(entities.get_user_vehicle_as_handle()) == 0 then
			SET_VEHICLE_SHOOT_AT_TARGET(players.user_ped(), ped, players.get_position(playerID))
		end
	end
end)

local godmode_detection = false
modder_detections:toggle("检测无敌", {}, "", function(toggled)
	godmode_detection = toggled
end)

local time_since_last_move = 0
util.create_thread(function()
	while true do
		if godmode_detection then
			local timer = util.current_time_millis() + 5000
			for players.list_except(true) as playerID do
				if isPlayerGodmode(playerID) and not isDetectionPresent(playerID, "无敌") then
					repeat
						if not isPlayerMoving(playerID) and time_since_last_move >= 3 or not players.exists(playerID) or not isPlayerGodmode(playerID) or not isNetPlayerOk(players.user()) or not isFreemodeActive(playerID) or players.is_using_rc_vehicle(playerID) then
							time_since_last_move = 0
							timer = util.current_time_millis() + 5000
							break
						end
						yield(1000)
						time_since_last_move = not isPlayerMoving(playerID) ? time_since_last_move + 1 : 0
					until util.current_time_millis() > timer
					if util.current_time_millis() > timer and players.exists(playerID) and isFreemodeActive(playerID) then
						players.add_detection(playerID, "无敌", TOAST_ALL, 100)
						timer = util.current_time_millis() + 5000
						break
					end
				end    
			end
		end
		yield()
	end 
end)

util.create_thread(function()
	while true do
		if godmode_detection then
			for players.list_except(true) as playerID do
				if isPlayerGodmode(playerID) and players.is_visible(playerID) then
					draw_debug_text($"{players.get_name(playerID)} 无敌")
				end
			end
		end
		yield()
	end
end)

modder_detections:toggle_loop("检测载具", {}, "检测载具无敌", function()
	if NETWORK_IS_ACTIVITY_SESSION() then return end
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		if not isPlayerInInterior(playerID) and (getPlayerCurrentInterior(playerID) == 0 or GET_INTERIOR_GROUP_ID(getPlayerCurrentInterior(playerID)) != 0) and getPlayerCurrentShop(playerID) == -1 and not GET_ENTITY_CAN_BE_DAMAGED(vehicle) and isNetPlayerOk(playerID) and playerID == driver and pos.z > 0.0 then
			draw_debug_text($"{players.get_name(driver)} 载具无敌")
		end
	end 
end)

do
	local cached_player_data = {}
	modder_detections:toggle_loop("检测传送", {}, "检测玩家是否传送到你", function(toggled)
		if NETWORK_IS_ACTIVITY_SESSION() or not isNetPlayerOk(players.user()) then return end
		for players.list_except(true) as playerID do
			local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
			local veh = GET_VEHICLE_PED_IS_IN(ped) == entities.get_user_vehicle_as_handle()
			if not cached_player_data[playerID] then
				cached_player_data[playerID] = { pos = players.get_position(playerID), interior = getPlayerCurrentInterior(playerID) }
				continue
			end

			local cachedData = cached_player_data[playerID]
			local cur_interior = getPlayerCurrentInterior(playerID)
			local cur_pos = players.get_position(playerID)
			local my_pos = players.get_position(players.user())
			local distance_between_tp = v3.distance(cachedData.pos, cur_pos)
			local vehicle = GET_VEHICLE_PED_IS_USING(ped)
			local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
			
			if not isPlayerInInterior(playerID) and not veh and playerID ~= players.user() then
				if distance_between_tp > 30.0 and cachedData.interior == cur_interior and playerID ~= players.user() and driver ~= players.user() then
					if IS_PED_IN_ANY_VEHICLE(ped) and v3.distance(cur_pos, my_pos) < 10.0 then
						if not isDetectionPresent(driver, "传送") and players.exists(playerID) then
							players.add_detection(driver, "传送", TOAST_ALL, 75)
						end
					else
						if not isDetectionPresent(playerID, "传送") and v3.distance(cur_pos, my_pos) < 5.0 and players.exists(playerID) then
							players.add_detection(playerID, "传送", TOAST_ALL, 75)
						end
					end
				end
			end
			cachedData.pos = cur_pos
			cachedData.interior = cur_interior
			cached_player_data[playerID] = cachedData
		end
		yield(50)
	end)

	players.on_leave(function(playerID)
		cached_player_data[playerID] = nil
	end)
end

modder_detections:toggle_loop("检测加速", {}, "", function()
	if NETWORK_IS_ACTIVITY_SESSION() then return end
	for players.list_except(true) as playerID do
		if not IS_PED_IN_ANY_VEHICLE(GET_PLAYER_PED_SCRIPT_INDEX(playerID)) then continue end
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local veh_speed = (GET_ENTITY_SPEED(vehicle)* 2.236936)
		local veh_class = GET_VEHICLE_CLASS(vehicle)
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		local pVehicle = entities.handle_to_pointer(vehicle)
		local owner = entities.get_owner(pVehicle)
		local veh_model = players.get_vehicle_model(playerID)
		local veh_brand = nullCheck(util.get_label_text(GET_MAKE_NAME_FROM_VEHICLE_MODEL(veh_model)))
		local veh_name = util.get_label_text(GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(veh_model))
		local est_speed = GET_VEHICLE_ESTIMATED_MAX_SPEED(vehicle)
		local est_model_speed = GET_VEHICLE_MODEL_ESTIMATED_MAX_SPEED(players.get_vehicle_model(playerID))
		local mdl_accel = GET_VEHICLE_MODEL_ACCELERATION(players.get_vehicle_model(playerID))
		local veh_accel = GET_VEHICLE_ACCELERATION(vehicle)
		if est_speed > (est_model_speed + 11) and veh_accel > (mdl_accel * 1.2) then
			continue
		end
		if veh_class != 15 and veh_class != 16 and veh_speed >= 200 and (players.get_vehicle_model(playerID) != joaat("oppressor") and players.get_vehicle_model(playerID) != joaat("oppressor2")) and playerID == driver then
			if owner != playerID then 
				repeat
					yield() -- cooldown incase they are launched by a modder
				until veh_speed < 200
				return
			end
			if not isDetectionPresent(driver, "加速") then
				players.add_detection(driver, "加速", TOAST_ALL, 75)
				break
			end
		end
	end
	yield(100)
end)

modder_detections:toggle_loop("检测天基", {}, "检测作弊天基炮", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if isPlayerUsingOrbitalCannon(playerID) and not GET_IS_TASK_ACTIVE(ped, 135) and isNetPlayerOk(playerID) and not IS_PLAYER_DEAD(playerID) and not isDetectionPresent(playerID, "Modded Orbital Cannon") then
			players.add_detection(playerID, "作弊天基炮", TOAST_ALL, 100)
			break
		end
	end
end)

modder_detections:toggle_loop("检测生成", {}, "检测驾驶生成载具", function()
	if NETWORK_IS_ACTIVITY_SESSION() then return end
	for players.list_except(true) as playerID do
		if not IS_PED_IN_ANY_VEHICLE(GET_PLAYER_PED_SCRIPT_INDEX(playerID)) then continue end
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local hash = players.get_vehicle_model(playerID)
		local plateText = GET_VEHICLE_NUMBER_PLATE_TEXT(vehicle)
		local bitset = DECOR_GET_INT(vehicle, "MPBitset")
		local plyveh = DECOR_GET_INT(vehicle, "Player_Vehicle")
		local pegasusveh = DECOR_GET_BOOL(vehicle, "CreatedByPegasus")
		local script = GET_ENTITY_SCRIPT(vehicle, 0)
		if script == nil then continue end

		if players.get_vehicle_model(playerID) ~= 0 and not GET_IS_TASK_ACTIVE(ped, 160) and isNetPlayerOk(players.user()) and players.exists(playerID) then
			local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
			if players.exists(driver) and not pegasusveh and playerID == driver then
				if (table.contains(scripts, script) or plateText == "46EEK572") and plyveh == 0 then
					draw_debug_text($"{players.get_name(driver)} 生成载具 [模型: {reverse_joaat(players.get_vehicle_model(playerID))}]")
				end
			end
		end
	end
end)

modder_detections:toggle_loop("检测车牌", {}, "检测修改车牌", function()
	if NETWORK_IS_ACTIVITY_SESSION() then return end
	for players.list_except(true) as playerID do
		if not IS_PED_IN_ANY_VEHICLE(GET_PLAYER_PED_SCRIPT_INDEX(playerID)) then continue end
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local plateText = GET_VEHICLE_NUMBER_PLATE_TEXT(vehicle)
		local bitset = DECOR_GET_INT(vehicle, "MPBitset")
		local pegasusveh = DECOR_GET_BOOL(vehicle, "CreatedByPegasus")
		local plyveh = DECOR_GET_INT(vehicle, "Player_Vehicle")
		local bitset_things = {8, 3072, 10240, 11264, 1048576, 16777216}
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		for bitset_things as bitsets do
			if bitset == bitsets then
				continue
			end
		end
		if plateText == " PR1NCE " or plateText == " PR2NCE " or plateText != "M1NDFUL " then
			continue
		end
		if plateText != nil and players.exists(driver) and not isPlatePatternLegit(plateText) and plyveh == 0 and not pegasusveh and playerID == driver then
			draw_debug_text($"{players.get_name(driver)} 修改车牌 [{plateText}]")
		end
	end
end)

modder_detections:toggle_loop("检测锁定", {}, "检测使用防锁定的玩家", function()
	local timer = util.current_time_millis() + 10000 -- compensating for player latency and vehicle chaff
	if NETWORK_IS_ACTIVITY_SESSION() then return end
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_IN(ped)
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		local bitset = DECOR_GET_INT(vehicle, "MPBitset")
		local vehicleMdl = reverse_joaat(players.get_vehicle_model(playerID))
		local bitset_things = {2048, 3072, 10240, 11264, 11272, 33792} -- the game sets some vehicles not targetable that are parts of fm activities
		for bitset_things as bitsets do
			if bitset == bitsets then
				return
			end
		end

		if not IS_PED_IN_ANY_VEHICLE(ped) or (not doesVehicleHaveImaniTech(vehicle) and GET_VEHICLE_MOD(vehicle, 44) == 1) then 
			continue 
		end

		local bAllowHomingMissileLockon = memory.read_byte(entities.handle_to_pointer(vehicle) + 0xAEE)
		if bAllowHomingMissileLockon == 0 and not isDetectionPresent(playerID, "防锁定") and playerID == driver then
			repeat
				if bAllowHomingMissileLockon == 1 then
					timer = util.current_time_millis() + 10000
					return
				end
				yield()
			until util.current_time_millis() > timer
			if bAllowHomingMissileLockon == 0 then
				players.add_detection(playerID, "防锁定", TOAST_ALL, 75)
				timer = util.current_time_millis() + 10000
				break
			end
		else
			timer = util.current_time_millis() + 10000
		end
	end
	yield(100)
end)

local ignored_vehs = {}
modder_detections:toggle_loop("检测车速", {}, "检测修改发动机功率或最高速度的人", function()
	local timer = util.current_time_millis() + 2500
	if NETWORK_IS_ACTIVITY_SESSION(true) then return end
	for players.list_except(true) as playerID do
		if not IS_PED_IN_ANY_VEHICLE(GET_PLAYER_PED_SCRIPT_INDEX(playerID)) then continue end
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_IN(ped)
		local veh_model = players.get_vehicle_model(playerID)
		local veh_brand = nullCheck(util.get_label_text(GET_MAKE_NAME_FROM_VEHICLE_MODEL(veh_model)))
		local veh_name = util.get_label_text(GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(veh_model))
		local est_speed = GET_VEHICLE_ESTIMATED_MAX_SPEED(vehicle)
		local est_model_speed = GET_VEHICLE_MODEL_ESTIMATED_MAX_SPEED(players.get_vehicle_model(playerID))
		local mdl_accel = GET_VEHICLE_MODEL_ACCELERATION(players.get_vehicle_model(playerID))
		local veh_accel = GET_VEHICLE_ACCELERATION(vehicle)
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		local pVehicle = entities.handle_to_pointer(vehicle)
		local plyveh = DECOR_GET_INT(vehicle, "Player_Vehicle")
		local owner = entities.get_owner(pVehicle)
		local veh_class = vehicle_classes[GET_VEHICLE_CLASS(vehicle) + 1]
		local dumbVehicleMdls = {"vivanite", "dilletante", "dilletante2", "inductor", "inductor2", "flatbed", "surge", "khamelion", "surfer", "surfer2", "surfer3"} -- fuck these dumb cars

		if not ignored and owner != playerID and driver == playerID and est_speed > (est_model_speed + 6) then
			ignored_vehs[vehicle] = true
			continue
		end

		if ignored and est_speed < (est_model_speed + 6) then
			ignored_vehs[vehicle] = false
			continue
		end

		for dumbVehicleMdls as dumbVehs do
			if players.get_vehicle_model(playerID) == joaat(dumbVehs) then
				ignored_vehs[vehicle] = true
				continue
			end
		end
		
		if veh_brand ~= "" then
			veh_name = $"{veh_brand} {veh_name}"
		end

		local ignored = ignored_vehs[vehicle]
		if not isDetectionPresent(playerID, "修改车速") and not isPlayerInInterior(playerID) then
			if est_model_speed > 1.0 and not ignored and est_speed > (est_model_speed + 6) and veh_accel > (mdl_accel * 1.3) and playerID == driver then
				repeat
					yield()
				until util.current_time_millis() > timer -- for some reason the game doesnt properly calculate speed for a while. this delay seems to be good
				toast($"[检测信息] \n实体所有者: {players.get_name(driver)} \n模型: {veh_name} \n类型: {veh_class} \n游戏预计速度: {ROUND(est_model_speed * 2.236936)} MPH \n当前预计速度: {ROUND((est_speed * 2.236936) * 1.2)} MPH")
				players.add_detection(playerID, "修改车速", TOAST_ALL, 75)
				ignored_vehs[vehicle] = true
				break
			end
		end
	end
	yield(100)
end)

do
	local cachedModData = {}
	local cachedVehData = {}
	modder_detections:toggle_loop("检测升级", {}, "检测在修车店外为自己或他人的载具升级的玩家", function(toggled)
		for players.list_except(true) as playerID do
			local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
			if not IS_PED_IN_ANY_VEHICLE(ped, false) then
				if cachedModData[playerID] then
					cachedModData[playerID] = nil
				end
				continue
			end

			local veh = GET_VEHICLE_PED_IS_IN(ped)
			local pVehicle = entities.handle_to_pointer(veh)
			local pos = players.get_position(playerID)
			local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(veh, -1))

			local current_vehicle_mods = {}
			if not cachedModData[playerID] then
				cachedModData[playerID] = { veh_mods = {} }
				for i = 0, 49 do
					cachedModData[playerID].veh_mods[i] = GET_VEHICLE_MOD(veh, i)
				end
				continue
			end
			yield(100)
			if not cachedVehData[playerID] then
				cachedVehData[playerID] = GET_VEHICLE_PED_IS_IN(ped)
				continue
			end	

			local cachedData = cachedModData[playerID]
			local cachedVehicle = cachedVehData[playerID]

			local curVeh =  GET_VEHICLE_PED_IS_IN(ped)

			if curVeh == cachedVehicle then
				for i = 0, 49 do
					local mod = GET_VEHICLE_MOD(veh, i)
					if cachedData.veh_mods[i] ~= mod and driver == playerID and not isPlayerInInterior(playerID) and pos.z > 0.0 and GET_VEHICLE_PED_IS_IN(ped) == veh and players.exists(playerID) then
						if not isDetectionPresent(entities.get_owner(pVehicle), "载具升级") then
							players.add_detection(entities.get_owner(pVehicle), "载具升级", TOAST_ALL, 100)
							break
						end
					end
					cachedData.veh_mods[i] = mod
				end
			end
			cachedModData[playerID] = cachedData
			cachedVehData[playerID] = curVeh
		end
		yield(100)
	end)
	players.on_leave(function(playerID)
		cachedModData[playerID] = nil
		cachedVehData[playerID] = nil
	end)
end

do
	local cachedVehHealth = {}
	local cachedVeh = {}
	modder_detections:toggle_loop("检测维修", {}, "", function(toggled)
		for players.list_except(true) as playerID do
			local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
			if not IS_PED_IN_ANY_VEHICLE(ped, false) then
				if cachedVehHealth[playerID] then
					cachedVehHealth[playerID] = nil
				end
				continue
			end

			local veh = GET_VEHICLE_PED_IS_IN(ped)
			local pVehicle = entities.handle_to_pointer(veh)
			local pos = players.get_position(playerID)
			local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(veh, -1))

			if not cachedVehHealth[playerID] then
				cachedVehHealth[playerID] = GET_ENTITY_HEALTH(veh)
				continue
			end

			if not cachedVeh[playerID] then
				cachedVeh[playerID] = GET_VEHICLE_PED_IS_IN(ped)
				continue
			end	

			local cachedHealth = cachedVehHealth[playerID]
			local cachedVehicle = cachedVeh[playerID]
			
			local curVehHealth = GET_ENTITY_HEALTH(veh)
			local curVeh =  GET_VEHICLE_PED_IS_IN(ped)

			if curVeh == cachedVehicle then
				if curVehHealth > cachedHealth and not isPlayerInInterior(playerID) and IS_ENTITY_VISIBLE(veh) and IS_ENTITY_VISIBLE(ped) and pos.z > 0.0 and driver == playerID and not NETWORK_IS_PLAYER_IN_MP_CUTSCENE(playerID) and GET_VEHICLE_PED_IS_IN(ped) == veh and players.exists(playerID) then
					if not isDetectionPresent(entities.get_owner(pVehicle), "载具维修") then
						players.add_detection(entities.get_owner(pVehicle), "载具维修", TOAST_ALL, 100)
					end
				end
			end
			cachedVehHealth[playerID] = curVehHealth
			cachedVeh[playerID] = curVeh
		end
		yield(100)
	end)
	players.on_leave(function(playerID)
		cachedVehHealth[playerID] = nil
		cachedVeh[playerID] = nil
	end)
end

modder_detections:toggle_loop("检测主机", {}, "检测将脚本主机交给其他玩家或在过渡期间拿脚本主机的人", function()
	if not isNetPlayerOk(players.user()) then return end
	local data = memory.alloc(56 * 8)
	for queue = 0, 2 do
		for index = 0, GET_NUMBER_OF_EVENTS(queue) - 1 do
			local event = GET_EVENT_AT_INDEX(queue, index)
			if event == EVENT_NETWORK_HOST_MIGRATION then
				if not GET_EVENT_DATA(queue, index, data, 2) then
					break
				end
				if memory.read_int(data) == GET_ID_OF_THIS_THREAD() and memory.read_int(data + 8) != players.user() then
					if not isDetectionPresent(memory.read_int(data + 8), "脚本主机") then
						local modded_sh = memory.read_int(data + 8)
						yield(500)
						local current_sh = players.get_script_host()
						yield(500)
						local new_new_sh = players.get_script_host()
						if new_new_sh != current_sh and current_sh != modded_sh then continue end -- to prevent people from getting false flagged if a retard spams script host on everyone
						if not isNetPlayerOk(current_sh) then
							if modded_sh != current_sh and modded_sh != -1 then
								if not isNetPlayerOk(modded_sh) then
									players.add_detection(modded_sh, "脚本主机", TOAST_ALL, 100)
									toast($"{players.get_name(modded_sh)} 刚刚中断了战局 :/")
									break
								end
							else
								players.add_detection(current_sh, "脚本主机", TOAST_ALL, 100)
								toast($"{players.get_name(current_sh)} 刚刚中断了战局 :/")
							end
						else
							if modded_sh != current_sh then
								players.add_detection(modded_sh, "脚本主机", TOAST_ALL, 100)
							end
						end
					end
				end
			end
		end
	end
end)

modder_detections:toggle_loop("检测伤害", {}, "检测Stand检测不到的 修改伤害且反检测的菜单", function()
	local timer = util.current_time_millis() + 5000
	if NETWORK_IS_ACTIVITY_SESSION() then return end
	for players.list_except(true) as playerID do
		local pos = players.get_position(playerID)
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not isDetectionPresent(playerID, "作弊伤害") then
			if isNetPlayerOk(playerID, true, true) and isNetPlayerOk(players.user(), true, true) and (getPlayerCurrentInterior(playerID) == 0 or GET_INTERIOR_GROUP_ID(getPlayerCurrentInterior(playerID)) != 0) and getPlayerCurrentShop(playerID) == -1 and pos.z > 0.0 then
				if players.get_weapon_damage_modifier(playerID) == 1 then
					repeat
						if players.get_weapon_damage_modifier(playerID) != 1 or not players.exists(playerID) then
							timer = util.current_time_millis() + 5000
							break
						end
						yield()
					until util.current_time_millis() > timer
					if util.current_time_millis() > timer then
						yield(1000)
						players.add_detection(playerID, "作弊伤害", TOAST_ALL, 100)
						timer = util.current_time_millis() + 5000
						break
					end
				end
			end
		else
			if players.get_weapon_damage_modifier(playerID) != 1 then
				for menu.player_root(playerID):getChildren() as cmd do
					if cmd:getType() == COMMAND_LIST_CUSTOM_SPECIAL_MEANING then
						cmd:refByRelPath("Damage Modifier"):trigger() -- pop the detection in the case of a false positive. (occurs when freemode fails to reset their damage multiplier back to 0.71 on spawn)
					end
				end
			end
		end
	end
	yield(100)
end)


modder_detections:toggle_loop("检测2T", {}, "检测使用2Take1生成的载具", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local bitset = DECOR_GET_INT(vehicle, "MPBitset")
		local pegasusveh = DECOR_GET_BOOL(vehicle, "CreatedByPegasus")
		if isNetPlayerOk(playerID) and bitset == 1024 and players.get_weapon_damage_modifier(playerID) == 1 and not players.is_godmode(playerID) and not pegasusveh then
			if not isDetectionPresent(playerID, "2Take1") then
				players.add_detection(playerID, "2Take1", TOAST_ALL, 100)
				menu.trigger_commands($"historynote {players.get_name(playerID)} 2Take1 User")
				return
			end
		end
	end
end)

normal_detections:toggle_loop("检测观看", {}, "检测是否有人看你", function()
	for players.list_except() as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local cam_dist = v3.distance(players.get_position(players.user()), players.get_cam_pos(playerID))
		local pedDistance = v3.distance(players.get_position(players.user()), players.get_position(playerID))
		if cam_dist < 15.0 and pedDistance > 30.0 and not IS_PLAYER_DEAD(ped) and not NETWORK_IS_PLAYER_FADING(playerID) and playerID != players.user() or players.get_spectate_target(playerID) == players.user() then
			yield(1000)
			if pedDistance > 35.0 and not isPlayerInInterior(playerID) and not IS_PED_DEAD_OR_DYING(ped) and players.exists(playerID) then
				toast($"{players.get_name(playerID)} 在看你")
				break
			end
		end
	end
	yield(100)
end)

normal_detections:toggle_loop("检测天基", {}, "检测是否有人正在使用天基炮", function()
	for players.list_except(true) as playerID do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(players.user())
		local distance = v3.distance(pos, v3.setZ(players.get_cam_pos(playerID), pos.z))
		if isPlayerUsingOrbitalCannon(playerID) and GET_IS_TASK_ACTIVE(ped, 135) and getPlayerCurrentInterior(playerID) == 269313 then
			draw_debug_text($"{players.get_name(playerID)} 在天基炮处")
		end
		if isPlayerUsingOrbitalCannon(playerID) and GET_IS_TASK_ACTIVE(ped, 135) and distance < 25.0 and not isPlayerInInterior(players.user()) and getPlayerCurrentInterior(playerID) == 269313 then
			toast($"{players.get_name(playerID)} 正在用天基炮瞄准你")
		end
	end
end)

normal_detections:toggle_loop("检测语音", {}, "检测谁在游戏聊天中说话", function()
	for players.list_except() as playerID do
		if NETWORK_IS_PLAYER_TALKING(playerID) then
			draw_debug_text($"{players.get_name(playerID)} is talking")
		end
	end 
end)

normal_detections:toggle_loop("检测睾酮", {}, "如果玩家使用牛鲨睾酮 则会在小地图上方发出通知", function()
	local data = memory.alloc(56 * 8)
	for queue = 0, 2 do
		for index = 0, GET_NUMBER_OF_EVENTS(queue) - 1 do
			local event = GET_EVENT_AT_INDEX(queue, index)
			if event == EVENT_NETWORK_SCRIPT_EVENT then
				if not GET_EVENT_DATA(queue, index, data, 54) then 
					break 
				end
				if memory.read_int(data) == -584633745 then
					local playerID = memory.read_int(data + 1 * 8)
					toast($"{players.get_name(playerID)} 牛鲨睾酮")
				end
			end
		end
	end
end)

local stopSessionScript = menu.ref_by_path("Online>Session>Session Scripts>Hunt the Beast>Stop Script")
local antibeast = protections:list("阻止野兽", {}, "防止为自己和他人进行狩猎野兽活动")
antibeast:toggle_loop("自己", {}, "防止你变成野兽", function()
	if GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("am_hunt_the_Beast")) > 0 then
		local beast = memory.read_int(memory.script_local("am_hunt_the_Beast", 608))
		local gameState = memory.script_local("am_hunt_the_Beast", 601)
		local amLauncherHost = NETWORK_GET_HOST_OF_SCRIPT("am_launcher", -1, 0)
		local huntTheBeastHost = NETWORK_GET_HOST_OF_SCRIPT("am_hunt_the_Beast", -1, 0)
		if beast == players.user() and memory.read_int(gameState) != 3 then
			toast($"阻止狩猎野兽活动 , 可能开始于 {players.get_name(amLauncherHost)}")
			memory.write_int(gameState, 3)
			if huntTheBeastHost != players.user() then
				util.request_script_host("am_hunt_the_Beast")
				repeat
					yield()
				until huntTheBeastHost == players.user()
			end
			stopSessionScript:trigger() -- fallback in case it doesnt end
			return
		end
	end
end)

antibeast:toggle_loop("其他人", {}, "防止其他玩家变成野兽", function()
	if GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("am_hunt_the_Beast")) > 0 then
		local beast = memory.read_int(memory.script_local("am_hunt_the_Beast", 608))
		local gameState = memory.script_local("am_hunt_the_Beast", 601)
		local amLauncherHost = NETWORK_GET_HOST_OF_SCRIPT("am_launcher", -1, 0)
		local huntTheBeastHost = NETWORK_GET_HOST_OF_SCRIPT("am_hunt_the_Beast", -1, 0)
		if beast != players.user() and beast != -1 and memory.read_int(gameState) != 3 then
			toast($"阻止狩猎野兽活动 目标：{players.get_name(beast)}, 可能开始于 {players.get_name(amLauncherHost)}")
			if huntTheBeastHost != players.user() then
				util.request_script_host("am_hunt_the_Beast")
				repeat
					yield()
				until huntTheBeastHost == players.user()
			end
			stopSessionScript:trigger()
			return
		end
	end
end)

local anticage = protections:list("阻止笼子", {}, "阻挡99%的笼子而不破坏游戏")
local alpha = 88
anticage:slider("透明度", {"transparency"}, "", 1, #values, 2, 1, function(amount)
	alpha = values[amount]
end)

local blockingradius = 5.00
anticage:slider_float("半径值", {"blockingradius"}, "检测笼子半径", 100, 2500, 500, 100, function(value)
	blockingradius = value/100
end)

local cleanup = 1
cleanupSlider = anticage:slider("自动删除", {"cleanup"}, "自动删除任何生成的笼子", 1, 2, 1, 1, function(index)
	cleanup = index
end)
menu.add_value_replacement(cleanupSlider, 1, "本地删除")
menu.add_value_replacement(cleanupSlider, 2, "强制删除")

anticage:toggle_loop("启用", {"anticage"}, "", function()
	local user = players.user_ped()
	local vehicle = GET_VEHICLE_PED_IS_USING(user)
	local my_ents = {user, veh}
	for entities.get_all_objects_as_handles() as obj do
		local owner = entities.get_owner(obj)
		if owner == -1 or owner == players.user() then
			RELEASE_SCRIPT_GUID_FROM_ENTITY(obj)
			continue
		end
		local id = NETWORK_GET_NETWORK_ID_FROM_ENTITY(obj)
		SET_GAMEPLAY_CAM_IGNORE_ENTITY_COLLISION_THIS_UPDATE(obj)
		for doors as door do
			if GET_ENTITY_MODEL(obj) == joaat(door) then
				continue
			end
		end
		for my_ents as data do
			if v3.distance(players.get_position(players.user()), GET_ENTITY_COORDS(obj)) <= blockingradius and GET_ENTITY_SCRIPT(obj, 0) != nil then
				if data != 0 then
					if alpha >= 1 then
						SET_ENTITY_NO_COLLISION_ENTITY(obj, data, false)  
						SET_ENTITY_NO_COLLISION_ENTITY(data, obj, false)
						SET_ENTITY_ALPHA(obj, alpha, false)
					elseif cleanup == 1 then
						deleteEntityLocally(obj)
					elseif cleanup == 2 then
						SET_ENTITY_ALPHA(obj, 0, false)
						entities.delete(obj)
					elseif IS_ENTITY_TOUCHING_ENTITY(data, obj) then
						toast($"阻止笼子 {players.get_name(owner)}")
					end
				end
			end
		end
		RELEASE_SCRIPT_GUID_FROM_ENTITY(obj)
	end
end)

local anti_mugger = protections:list("阻止劫匪", {}, "为自己和他人预防抢劫")
anti_mugger:toggle_loop("自己", {}, "防止自己被抢", function()
	if NETWORK_IS_SCRIPT_ACTIVE("am_gang_call", 0, true, 0) then
		local ped_netId = memory.script_local("am_gang_call", 62 + 10 + (0 * 7 + 1))
		local sender = memory.script_local("am_gang_call", 286)
		local target = memory.script_local("am_gang_call", 287)

		util.spoof_script("am_gang_call", function()
			if (memory.read_int(sender) != players.user() and memory.read_int(target) == players.user() 
			and NETWORK_DOES_NETWORK_ID_EXIST(memory.read_int(ped_netId)) 
			and NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(memory.read_int(ped_netId))) then
				local mugger = NET_TO_PED(memory.read_int(ped_netId))
				entities.delete(mugger)
				toast($"阻止抢劫 {players.get_name(memory.read_int(sender))}")
			end
		end)
	end
end)

anti_mugger:toggle_loop("其他人", {}, "防止他人被抢", function()
	if NETWORK_IS_SCRIPT_ACTIVE("am_gang_call", 0, true, 0) then
		local ped_netId = memory.script_local("am_gang_call", 63 + 10 + (0 * 7 + 1))
		local sender = memory.script_local("am_gang_call", 286)
		local target = memory.script_local("am_gang_call", 287)
		
		util.spoof_script("am_gang_call", function()
			if memory.read_int(target) != players.user() and memory.read_int(sender) != players.user()
			and NETWORK_DOES_NETWORK_ID_EXIST(memory.read_int(ped_netId)) 
			and NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(memory.read_int(ped_netId)) then
				local mugger = NET_TO_PED(memory.read_int(ped_netId))
				entities.delete(mugger)
				toast($"阻止抢劫 {players.get_name(memory.read_int(sender))} to {players.get_name(memory.read_int(target))}")
			end
		end)
	end
end)

protections:toggle_loop("阻止劫持", {}, "阻止试图劫持你载具", function()
	local vehicle = entities.get_user_vehicle_as_handle()
	if not IS_PED_IN_VEHICLE(players.user_ped(), vehicle, false) then return end
	for entities.get_all_peds_as_handles() as ped do
		local targetVehicle = GET_VEHICLE_PED_IS_TRYING_TO_ENTER(ped)
		local targetSeat = GET_SEAT_PED_IS_TRYING_TO_ENTER(ped)
		local owner = entities.get_owner(ped)
		if targetVehicle == vehicle and targetSeat == (seat := getSeatPedIsIn(players.user_ped())) and not IS_PED_A_PLAYER(ped) and owner != players.user() then
			entities.delete(ped)
			repeat
				SET_PED_INTO_VEHICLE(players.user_ped(), vehicle, seat)
				yield()
			until getSeatPedIsIn(players.user_ped()) == seat
			toast($"阻止劫持 来自 {players.get_name(owner)}")
			if not isDetectionPresent(owner, "载具劫持") then
				players.add_detection(owner, "载具劫持", TOAST_ALL, 75)
				break
			end
		end
	end
end)

protections:toggle_loop("阻止生成", {"blockmoddedpeds"}, "阻止不合法生成NPC 这将保护你免受许多问题的影响 例如崩溃和恶意攻击", function()
	for entities.get_all_peds_as_handles() as ped do
		local script = GET_ENTITY_SCRIPT(ped, 0)
		local owner = entities.get_owner(ped)
		if table.contains(scripts, script) and owner != players.user() and owner != -1 and ped != randomPed and ped != glitchPed then
			deleteEntityLocally(ped)
			--toast($"[Debug Info] Modded Ped Deleted\nCreated By: {script}\nPed Handle: {ped}\nOwner: {players.get_name(owner)}")
		end
	end
end)

funfeatures:toggle_loop("忍者", {"naruto"}, "", function()
	local dict = "swimming@scuba"
	local name = "dive_glide"
	requestAnimDict(dict)
	if IS_PED_SPRINTING(players.user_ped()) and not IS_ENTITY_PLAYING_ANIM(players.user_ped(), dict, name, 3) and not GET_IS_TASK_ACTIVE(players.user_ped(), 56) and not GET_IS_TASK_ACTIVE(players.user_ped(), 290) then
		TASK_PLAY_ANIM(players.user_ped(), dict, name, 5.0, 2.5, -1, 1|16|32, 1.0, false, false, false)
	elseif IS_ENTITY_PLAYING_ANIM(players.user_ped(), dict, name, 3) and (IS_PED_WALKING(players.user_ped()) or IS_PED_STILL(players.user_ped()) or IS_PED_FALLING(players.user_ped())
	or IS_PED_SWITCHING_WEAPON(players.user_ped()) or IS_PLAYER_FREE_AIMING(players.user()) or IS_PED_RELOADING(players.user_ped()) or IS_PED_JUMPING(players.user_ped())) then
		STOP_ANIM_TASK(players.user_ped(), dict, name, -3.0)
	end
end, function()
	CLEAR_PED_TASKS(players.user_ped())
end)

funfeatures:toggle_loop("大脚", {}, "", function(toggled)
	if IS_PED_SPRINTING(players.user_ped()) then
		REQUEST_CLIP_SET("move_characters@orleans@core@")
		SET_PED_MOVEMENT_CLIPSET(players.user_ped(), "move_characters@orleans@core@", 0.5)
	else
		RESET_PED_MOVEMENT_CLIPSET(players.user_ped(), 1.0)
	end
end, function()
	REMOVE_CLIP_SET("move_characters@orleans@core@")
	RESET_PED_MOVEMENT_CLIPSET(players.user_ped(), 1.0)
end)


funfeatures:action("扫帚", {}, "本地可见", function()
	local reveal_invis = menu.ref_by_path("Online>Reveal Invisible Players")
	if reveal_invis.value then
		toast("请先禁用显示不可见玩家功能")
		return 
	end
	local pos = players.get_position(players.user())
	util.request_model(broomstick)
	util.request_model(oppressor)
	obj = entities.create_object(broomstick, pos)
	veh = entities.create_vehicle(oppressor, pos, 0)
	SET_ENTITY_VISIBLE(veh, false)
	SET_PED_INTO_VEHICLE(players.user_ped(), veh, -1)
	ATTACH_ENTITY_TO_ENTITY(obj, veh, 0, 0.0, 0.0, 0.3, -80.0, 0.0, 0.0, false, false, false, false, 0, true, false) -- thanks to chaos mod for doing the annoying rotation work for me :P
end)

funfeatures:action("水怪", {}, "", function()
	local pos = players.get_position(players.user())
	util.request_model(monster)
	util.request_model(oppressor)
	obj = entities.create_object(monster, pos)
	veh = entities.create_vehicle(oppressor, pos, 0)
	SET_ENTITY_COLLISION(obj, false, false)
	SET_PED_INTO_VEHICLE(players.user_ped(), veh, -1)
	ATTACH_ENTITY_TO_ENTITY(obj, veh, 0, -0.25, -1.0, 1.0, 0.0, 0.0, -90.0, true, false, false, false, 0, true, false)
end)

local headlamp = funfeatures:list("头灯", {}, "本地可见")
local headlampDistance = 25.0
headlamp:slider_float("光距", {"distance"}, "", 100, 100000, 1500, 100, function(value)
	headlampDistance = value / 100
end)

local brightness = 10.0
headlamp:slider_float("亮度", {"brightness"}, "", 100, 10000, 1000, 100, function(value)
	brightness = value / 100
end)

local light_radius = 15.0
headlamp:slider_float("范围", {"radius"}, "", 100, 5000, 2000, 100, function(value)
	light_radius = value / 100
end)

local headlampColor = {r = 1, g = 235/255, b = 190/255, a = 0}
headlamp:colour("颜色", {"headlampcolor"}, "", headlampColor, true, function(value)
	headlampColor = value 
end)

headlamp:toggle_loop("打开", {"headlamp"}, "", function()
	local head_pos = GET_PED_BONE_COORDS(players.user_ped(), 31086, 0.0, 1.0, 0.0)
	local cam_rot = players.get_cam_rot(players.user())
	if not IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
		DRAW_SHADOWED_SPOT_LIGHT(head_pos, cam_rot:toDir(), math.floor(headlampColor.r * 255), math.floor(headlampColor.g * 255), math.floor(headlampColor.b * 255), headlampDistance * 1.5, brightness, 0.0, light_radius, headlampDistance, 0)
	end
end)

funfeatures:toggle("停电", {"poweroutage"}, "", function(toggled)
	SET_ARTIFICIAL_LIGHTS_STATE(toggled)
end)

funfeatures:toggle("断电", {"enableblackout"}, "", function(toggled)
	menu.trigger_commands(toggled ? "time 0" : "syncclock")
	SET_ARTIFICIAL_LIGHTS_STATE(toggled)
	SET_TIMECYCLE_MODIFIER(toggled ? "dlc_island_vault" : "DEFAULT")
end)

local fingerGun = funfeatures:list("指枪", {}, "按B射击 无伤害")
for id, data in weapon_stuff do
	local name = data[1]
	local weaponName = data[2]
	fingerGun:toggle_loop(name, {}, "", function( )
		local projectile = loadWeaponAsset(weaponName)
		if memory.read_int(memory.script_global(4521801 + 930)) == 3 then
			memory.write_int(memory.script_global(4521801 + 935), GET_NETWORK_TIME())
			local inst = v3.new()
			v3.set(inst,GET_FINAL_RENDERED_CAM_ROT(2))
			local tmp = v3.toDir(inst)
			v3.set(inst, v3.get(tmp))
			v3.mul(inst, 1000)
			v3.set(tmp, GET_FINAL_RENDERED_CAM_COORD())
			v3.add(inst, tmp)
			local x, y, z = v3.get(inst)
			local fingerPos = GET_PED_BONE_COORDS(players.user_ped(), 4089, 0.1, 0.0, -0.1)
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(fingerPos, x, y, z, 1, true, projectile, 0, true, false, 500.0, players.user_ped(), 0)
			yield(100)
		end
	end, function()
		local pos = players.get_position(players.user())
		CLEAR_AREA_OF_PROJECTILES(pos, 999999.0, 0)
	end)
end

local petJinx
funfeatures:toggle_loop("宠物", {}, "Jinx", function()
	if not petJinx or not DOES_ENTITY_EXIST(petJinx) then
		local jinx = joaat("a_c_cat_01")
		util.request_model(jinx)
		local pos = players.get_position(players.user())
		petJinx = entities.create_ped(28, jinx, pos, 0)
		entities.set_can_migrate(petJinx, false)
		SET_PED_COMPONENT_VARIATION(petJinx, 0, 0, 1, 0)
		SET_ENTITY_INVINCIBLE(petJinx, true)
	end
	NETWORK_REQUEST_CONTROL_OF_ENTITY(petJinx)
	TASK_FOLLOW_TO_OFFSET_OF_ENTITY(petJinx, players.user_ped(), 0, -0.3, 0, 7.0, -1, 1.5, true)
end, function()
	entities.delete(petJinx)
end)

funfeatures:action("寻找", {}, "Jinx", function()
	local pos = players.get_position(players.user())
	if petJinx != nil then 
		SET_ENTITY_COORDS_NO_OFFSET(petJinx, pos, false, false, false)
	else
		toast("Jinx没有找到 :(")
	end
end)

for locations as data do
	local location_name = data[1]
	local location_coords = data[2]
	teleport:action(location_name, {}, "", function()
		menu.trigger_commands("doors on")
		menu.trigger_commands("nodeathbarriers on")
		SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), location_coords.x, location_coords.y, location_coords.z, false, false, false)
	end)
end

local function player(playerID) 
	local name = players.get_name(playerID)
	if playerID != players.user() and (name == "Prizuhm" or name == "Iinustechtips" or name == "nullsub") then
		players.add_detection(playerID, "JinxScript Developer", TOAST_ALL, 1)
	end

	if not menu.player_root(playerID):isValid() then return end
	menu.divider(menu.player_root(playerID), "JinxScript")
	local main = menu.list(menu.player_root(playerID), "JinxScript", {"JinxScript"}, "")

	local friendly = main:list("友好", {}, "")
	local griefing = main:list("恶搞", {}, "")
	local antigodmode = main:list("无敌", {}, "")
	local tpPlayer = main:list("传送")
	local miscPlayer = main:list("其他")

	friendly:toggle_loop("宠物小猫", {}, "Jinx", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not petJinxPlyr or not DOES_ENTITY_EXIST(petJinxPlyr) then
			local jinx = joaat("a_c_cat_01")
			util.request_model(jinx)
			local pos = players.get_position(playerID)
			petJinxPlyr = entities.create_ped(28, jinx, pos, 0)
			entities.set_can_migrate(petJinxPlyr, false)
			SET_PED_COMPONENT_VARIATION(petJinxPlyr, 0, 0, 1, 0)
			SET_ENTITY_INVINCIBLE(petJinxPlyr, true)
		end
		TASK_FOLLOW_TO_OFFSET_OF_ENTITY(petJinxPlyr, ped, 0, -0.3, 0, 7.0, -1, 1.5, true)
	end, function()
		entities.delete(petJinxPlyr)
	end)
  
	friendly:toggle_loop("载具火箭", {}, "按喇叭发射火箭", function()
		local wpn = joaat("vehicle_weapon_tank")
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)

		local leftStart = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, -1.25, 0.5, 0.35)
		local leftEnd = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, -1.25, 100.0, 0.35)
		local rightStart = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 1.25, 0.5, 0.35)
		local rightEnd = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 1.25, 100.0, 0.35)
		if not GET_IS_TASK_ACTIVE(ped, 199) and IS_PLAYER_PRESSING_HORN(playerID) then
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS(leftStart, leftEnd, 0, true, wpn, 0, true, false, 5.0)
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS(rightStart, rightEnd, 0, true, wpn, 0, true, false, 5.0)
			repeat
				yield()
			until not IS_PLAYER_PRESSING_HORN(playerID)
		end
	end)

	friendly:action("载具漂移", {"drifttires"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		entities.request_control(vehicle, 2500)
		SET_DRIFT_TYRES(vehicle, true)
	end)

	friendly:toggle_loop("载具填充", {}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		if IS_ROCKET_BOOST_ACTIVE(vehicle) then
			repeat
				yield()
			until not IS_ROCKET_BOOST_ACTIVE(vehicle)
			NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
			SET_ROCKET_BOOST_FILL(vehicle, 100.0)
		end
	end)

	local boostVehFriendly
	boostVehFriendly = friendly:toggle_loop("载具加速", {"hornboost"}, "", function() -- the only functional method that works everytime, applying force doesnt sync well since it requires entity control
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)

		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			boostVehFriendly.value = false
			util.stop_thread()
		end

		util.request_model(speedUpMdl)
		if IS_PLAYER_PRESSING_HORN(playerID) then
			local boostpad = entities.create_object(speedUpMdl, GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, GET_ENTITY_SPEED(vehicle)/2, -3.0), false, false, false)
			SET_ENTITY_VISIBLE(boostpad, false)
			SET_OBJECT_SPEED_BOOST_AMOUNT(boostpad, 100)
			entities.set_can_migrate(boostpad, false)
			yield(500)
			entities.delete(boostpad)
		end
	end)

	local rp_loop_ply = friendly:list("经验循环")
	local levelPly = 120
	rp_loop_ply:slider("目标等级", {"maxlevel"}, "", 1, 8000, 120, 1, function(val)
		levelPly = val
	end)

	local delayPly = 0
	rp_loop_ply:slider("循环延迟", {"loopdelay"}, "", 0, 2500, 0, 10, function(val)
		delayPly = val
	end)

	local rpLoopPlyr
	rpLoopPlyr = rp_loop_ply:toggle_loop("启用", {"rploop"}, $"启用经验循环 {players.get_name(playerID)}", function()
		if players.get_rank(playerID) >= levelPly then 
			toast($"{players.get_name(playerID)} 已达到或高于目标等级 {levelPly}. :)")
			rpLoopPlyr.value = false
			return 
		end
		repeat
			for i = 20, 24 do
				if players.get_rank(playerID) >= levelPly then break end
				util.trigger_script_event(1 << playerID, {968269233, players.user(), 4, i, 1, 1, 1})
				if delayPly > 0 then
					yield(delayPly)
				end
			end
			yield()
		until players.get_rank(playerID) >= levelPly or not rpLoopPlyr.value
		if players.get_rank(playerID) >= levelPly then 
			toast($"{players.get_name(playerID)} 现在处于目标等级 {levelPly}. :)")
			rpLoopPlyr.value = false
			yield()
			yield()
			return 
		end
	end)

	local glitchPlyrRoot = griefing:list("鬼畜玩家")
	glitchPlyrRoot:list_select("物体", {"glitchplayerobj"}, "", object_stuff, object_stuff[1][1], function(mdlHash)
		glitchObjMdl = mdlHash
	end)

	local spawnDelay = 150
	glitchPlyrRoot:slider("重生延迟", {"spawndelay"}, "可能会被标记为作弊者", 50, 3000, 100, 10, function(amount)
		spawnDelay = amount
	end)

	local glitchplayer
	glitchplayer = glitchPlyrRoot:toggle_loop("启用", {"glitchplayer"}, "被带有实体防护的菜单阻止", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)

		if not DOES_ENTITY_EXIST(ped) then
			toast($"{players.get_name(playerID)} 太远 :/")
			glitchvalue = false
			util.stop_thread()
		end

		util.request_model(glitchObjMdl)
		util.request_model(rallytruck)
		local obj = entities.create_object(glitchObjMdl, pos)
		local vehicle = entities.create_vehicle(rallytruck, pos, 0)
		SET_ENTITY_VISIBLE(obj, false)
		SET_ENTITY_VISIBLE(vehicle, false)
		SET_ENTITY_INVINCIBLE(obj, true)
		SET_ENTITY_COLLISION(obj, true, true)
		yield(delay)
		entities.delete(obj)
		entities.delete(vehicle)
		yield(delay)
	end)

	local glitchVehRoot = griefing:list("鬼畜载具")
	glitchVehRoot:list_select("物体", {"glitchvehobj"}, "", object_stuff, object_stuff[1][1], function(mdlHash)
		glitchVehMdl = mdlHash
	end)
	
	local glitchveh
	glitchveh = glitchVehRoot:toggle_loop("启用", {"glitchvehicle"}, "适用于所有菜单 并且不会被任何菜单检测到", function() -- credits to soul reaper for base concept
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = GET_ENTITY_COORDS(ped, false)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local veh_model = players.get_vehicle_model(playerID)
		local seat_count = GET_VEHICLE_MODEL_NUMBER_OF_SEATS(veh_model)
		util.request_model(glitchVehMdl)
		
		if not DOES_ENTITY_EXIST(ped) then
			toast($"{players.get_name(playerID)} 太远 :/")
			glitchveh.value = false
			util.stop_thread() 
		end

		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			glitchveh.value = false
			util.stop_thread() 
		end

		if not ARE_ANY_VEHICLE_SEATS_FREE(vehicle) then
			toast("无座 :/")
			glitchveh.value = false
			util.stop_thread() 
		end

		glitchPed = createRandomPed(pos)
		glitchObj = entities.create_object(glitchVehMdl, pos)
		local things = {glitchPed, glitchObj}
		entities.set_can_migrate(glitchPed, false)
		entities.set_can_migrate(glitchObj, false)
		SET_ENTITY_VISIBLE(glitchObj, false)
		SET_ENTITY_INVINCIBLE(glitchPed, true)
		for i = 0, seat_count -1 do
			if ARE_ANY_VEHICLE_SEATS_FREE(vehicle) then
				local emptyseat = i
				for l = 1, 25 do
					SET_PED_INTO_VEHICLE(glitchPed, vehicle, emptyseat)
					ATTACH_ENTITY_TO_ENTITY(glitchObj, glitchPed, 0, v3(), v3(), false, false, false, false, 0, true, false)
					SET_ENTITY_COLLISION(glitchObj, true, true)
					yield()
				end
			end
		end
		if glitchPed != nil then
			entities.delete(glitchPed) 
		end
		if glitchObj != nil then 
			entities.delete(glitchObj)
		end
	end, function()
		if glitchPed != nil then
			entities.delete(glitchPed) 
		end
		if glitchObj != nil then 
			entities.delete(glitchObj)
		end
	end)

	local glitchforcefield
	glitchforcefield = griefing:toggle_loop("鬼畜立场", {"forcefield"}, "对有实体保护的菜单无效", function()
		util.request_model(glitchedForcefieldMdl)

		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		
		if not DOES_ENTITY_EXIST(ped) then
			toast($"{players.get_name(playerID)} 太远 :/")
			glitchforcefield.value = false
			util.stop_thread()
		end

		if IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast($"{players.get_name(playerID)} 在载具里 :/")
			glitchforcefield.value = false
			util.stop_thread()
		end

		local obj = entities.create_object(glitchedForcefieldMdl, pos)
		SET_ENTITY_VISIBLE(obj, false)
		SET_ENTITY_COLLISION(obj, true, true)
		yield(100)
		entities.delete(obj) 
	end)
	
	local veh_kick = griefing:list("载具劫持")
	veh_kick:action("拖出", {"dragkick"}, "产生一个NPC将他们强行拖出车外", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			return
		end

		local timer = util.current_time_millis() + 2500
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			return 
		end

		local pos = players.get_position(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		local passenger = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -2))
		local seat = getSeatPedIsIn(ped)
		pos.z -= 50

		randomPed = createRandomPed(pos)
		entities.set_can_migrate(randomPed, false)
		SET_ENTITY_INVINCIBLE(randomPed, true)
		SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(randomPed, true)
		SET_PED_CONFIG_FLAG(randomPed, 366, true)
		TASK_ENTER_VEHICLE(randomPed, vehicle, 1000, seat, 1.0, ECF_WARP_ENTRY_POINT | ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP | ECF_JACK_ANYONE | ECF_WARP_PED | ECF_WARP_IF_DOOR_IS_BLOCKED, 0, false)
		if IS_PED_IN_ANY_VEHICLE(ped, false) then
			repeat
				if GET_IS_TASK_ACTIVE(ped, 2) and getSeatPedIsIn(randomPed) == seat then
					repeat
						yield()
					until not GET_IS_TASK_ACTIVE(ped, 2)
				end
				if util.current_time_millis() > timer and getSeatPedIsIn(randomPed) != seat then
					if DECOR_GET_INT(vehicle, "Player_Vehicle") != 0 then
						toast("劫持失败 :/")
					else 
						toast($"劫持失败 {players.get_name(playerID)} 载具 :/")
					end
					entities.delete(randomPed)
					timer = util.current_time_millis() + 2500
					break 
				end
				yield()
			until not IS_PED_IN_ANY_VEHICLE(ped, false)
			entities.delete(randomPed)
			timer = util.current_time_millis() + 2500
		end
	end)

	veh_kick:action("推出", {"shufflekick"}, '在副驾生成NPC推出玩家 每次都有效 除非目标使用无法拖出', function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			return
		end

		local timer = util.current_time_millis() + 2500
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)

		if vehicle == 0 then
			util.toast(lang.get_localised(1067523721):gsub("{}", players.get_name(playerID)))
			return 
		end
		
		if GET_VEHICLE_MODEL_NUMBER_OF_SEATS(GET_ENTITY_MODEL(vehicle)) == 1 then
			util.toast("载具有权限 失败 :/")
			return
		end

		if not IS_VEHICLE_SEAT_FREE(vehicle, -2) then
			util.toast("无座 :/")
			return
		end

		if not CAN_SHUFFLE_SEAT(vehicle, -1) then 
			util.toast("不可换座 :/")
			return
		end

		local randomPed = createRandomPed(pos)
		entities.set_can_migrate(randomPed, false)
		SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(randomPed, true)
		SET_PED_INTO_VEHICLE(randomPed, vehicle, -2)
		TASK_SHUFFLE_TO_NEXT_VEHICLE_SEAT(randomPed, vehicle)
		if IS_PED_IN_ANY_VEHICLE(ped, false) then
			repeat
				if GET_IS_TASK_ACTIVE(ped, 2) then
					timer = util.current_time_millis() + 2500
				end
				if util.current_time_millis() > timer then
					entities.delete(randomPed)
					util.toast("未能坐到驾驶座上 :/")                
					timer = util.current_time_millis() + 2500
					break
				end
				util.yield()
			until not IS_PED_IN_ANY_VEHICLE(ped, false)
		end
		entities.delete(randomPed)
		SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID, true)
	end)
	
	griefing:action("载具劫持", {"hijack"}, "发送NPC劫持对方载具 高延迟玩家可能不起作用", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			return
		end

		local timer = util.current_time_millis() + 2500
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local driver = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
		local passenger = NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(vehicle, -2))
		local drivingStyle = DF_SwerveAroundAllCars | DF_AvoidRestrictedAreas | DF_GoOffRoadWhenAvoiding | DF_SteerAroundObjects | DF_UseShortCutLinks | DF_ChangeLanesAroundObstructions

		if vehicle == 0 then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			return 
		end
		pos.z -= 50
		if not IS_PED_A_PLAYER(GET_PED_IN_VEHICLE_SEAT(vehicle, -1)) then
			toast("劫持成功 :D")
			return 
		end
		randomPed = createRandomPed(pos)
		SET_ENTITY_INVINCIBLE(randomPed, true)
		SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(randomPed, true)
		TASK_ENTER_VEHICLE(randomPed, vehicle, 1000, -1, 1.0, ECF_WARP_ENTRY_POINT | ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP | ECF_JACK_ANYONE | ECF_WARP_PED | ECF_WARP_IF_DOOR_IS_BLOCKED, 0, false)
		SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID, true)
		entities.give_control(randomPed, playerID)
		if IS_PED_IN_ANY_VEHICLE(ped) then
			repeat
				if GET_IS_TASK_ACTIVE(ped, 2) then
					timer = util.current_time_millis() + 2500
				end
				if util.current_time_millis() > timer and IS_PED_IN_ANY_VEHICLE(ped) then
					if DECOR_GET_INT(vehicle, "Player_Vehicle") != 0 then
						toast("载具有权限 失败 :/")
					else 
						toast($"劫持失败 {players.get_name(playerID)} 载具 :/")
					end
					entities.delete(randomPed)
					timer = util.current_time_millis() + 2500
					break 
				end
				yield()
			until not IS_PED_IN_ANY_VEHICLE(ped)
		end
		if getSeatPedIsIn(randomPed) == -1 then
			TASK_VEHICLE_DRIVE_WANDER(randomPed, vehicle, 9999.0, drivingStyle) 
			toast("劫持成功 :D")
			if not GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID) then
				SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID, true)
			end
		end
		yield(1000)
		if not GET_IS_TASK_ACTIVE(randomPed, 151) then
			repeat
				TASK_VEHICLE_DRIVE_WANDER(randomPed, vehicle, 9999.0, drivingStyle) -- giving task again cus doesnt work sometimes
				yield()
			until GET_IS_TASK_ACTIVE(randomPed, 151)
		end
		yield(5000)
		if randomPed != nil and not IS_PED_IN_ANY_VEHICLE(randomPed, false) then -- 2nd check cus sometimes doesnt delete the first time
			entities.delete(randomPed)
		end
	end)

	local tp = false
	griefing:action("载具接管", {"takeover"}, "产生NPC抢车 然后接管 网络不好可能无效", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			return
		end

		local timer = util.current_time_millis() + 2500
		local otr = menu.ref_by_path("Online>Off The Radar")
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local local_pos = players.get_position(players.user())
		local pos = players.get_position(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local cam_pos = players.get_cam_pos(playerID)
		local pedDistance = v3.distance(players.get_position(players.user()), players.get_position(playerID))

		if vehicle == 0 then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			return 
		end
		pos.z -= 50	
		if pedDistance > 100.0 then
			otr.value = true
			FREEZE_ENTITY_POSITION(players.user_ped(), true)
			SET_ENTITY_VISIBLE(players.user_ped(), false)
			SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), cam_pos, false, false, false)
			tp = true
		end
		randomPed = createRandomPed(pos)
		SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(randomPed, true)
		TASK_ENTER_VEHICLE(randomPed, vehicle, 1000, -1, 1.0, ECF_WARP_ENTRY_POINT | ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP | ECF_JACK_ANYONE | ECF_WARP_PED | ECF_WARP_IF_DOOR_IS_BLOCKED, 0, false)
		entities.give_control(randomPed, playerID)
		if getSeatPedIsIn(randomPed) != -1 then
			repeat
				cam_pos = players.get_cam_pos(playerID)
				SET_PED_INTO_VEHICLE(randomPed, vehicle, -1)
				if tp then
					SET_ENTITY_COLLISION(players.user_ped(), false, false)
					SET_ENTITY_VISIBLE(players.user_ped(), false)
					SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), cam_pos, false, false, false)
				end
				if GET_IS_TASK_ACTIVE(ped, 2) then
					timer = util.current_time_millis() + 5000
				end
				if util.current_time_millis() > timer then
					if DECOR_GET_INT(vehicle, "Player_Vehicle") != 0 then
						toast("载具有权限 失败 :/")
					else 
						toast("接管失败 :/")
					end
					if tp then
						FREEZE_ENTITY_POSITION(players.user_ped(), false)
						SET_ENTITY_COLLISION(players.user_ped(), true, true)
						SET_ENTITY_VISIBLE(players.user_ped(), true)
						SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), local_pos, false, false, false)
						tp = false
					end
					otr.value = false
					entities.delete(randomPed)
					timer = util.current_time_millis() + 2500
					return
				end
				yield()
			until getSeatPedIsIn(ped) != -1
			entities.delete(randomPed)
		end
		timer = util.current_time_millis() + 2500
		SET_PED_INTO_VEHICLE(players.user_ped(), vehicle, -1)
		repeat
			if not IS_PED_IN_ANY_VEHICLE(ped, false) and getSeatPedIsIn(ped) != -1 then
				if tp then
					SET_ENTITY_VISIBLE(players.user_ped(), false)
				end
				if util.current_time_millis() > timer then
					if DECOR_GET_INT(vehicle, "Player_Vehicle") != 0 then
						toast("载具有权限 失败 :/")
					else 
						toast("接管失败 :/")
					end
					if tp then
						SET_ENTITY_COLLISION(players.user_ped(), true, true)
						FREEZE_ENTITY_POSITION(players.user_ped(), false)
						SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), local_pos, false, false, false)
						SET_ENTITY_VISIBLE(players.user_ped(), true)
						tp = false
					end
					otr.value = false
					entities.delete(randomPed)
					timer = util.current_time_millis() + 2500
					return
				end
				SET_PED_INTO_VEHICLE(players.user_ped(), vehicle, -1)
			end
			yield()
		until GET_VEHICLE_PED_IS_IN(players.user_ped(), false) == vehicle
		SET_ENTITY_COLLISION(players.user_ped(), true, true)
		FREEZE_ENTITY_POSITION(players.user_ped(), false)
		SET_ENTITY_VISIBLE(players.user_ped(), true)
		otr.value = false
		toast("接管成功 :D")
		timer = util.current_time_millis() + 2500
	end)

	local lockon
	lockon = griefing:toggle_loop("载具声音", {"lockon"}, "仅适用于特定载具 例如武装载具", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			lockon.value = false
			return
		end

		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_IN(ped, false)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			lockon.value = false
			return 
		end

		SET_VEHICLE_HOMING_LOCKEDONTO_STATE(vehicle, 1)
	end)
	
	griefing:action("载具拖走", {"tow"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			return
		end
		local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, 7.0, 0.0)
		util.request_model(towtruckMdl)
		entities.request_control(vehicle, 2500)
		local randomPed = createRandomPed(pos)
		local towtruck = entities.create_vehicle(towtruckMdl, pos, GET_ENTITY_HEADING(vehicle))
		SET_PED_INTO_VEHICLE(randomPed, towtruck, -1)
		ATTACH_VEHICLE_TO_TOW_TRUCK(towtruck, vehicle, false, 90.0, 90.0, -180.0)
		SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(randomPed, true)
		TASK_VEHICLE_DRIVE_WANDER(randomPed, towtruck, 9999.0, DF_SwerveAroundAllCars | DF_AvoidRestrictedAreas | DF_GoOffRoadWhenAvoiding | DF_SteerAroundObjects | DF_UseShortCutLinks | DF_ChangeLanesAroundObstructions) 
	end)
	
	griefing:action("载具尖刺", {"spike"}, "在载具前方生成尖刺带", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			return 
		end
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local height = GET_ENTITY_HEIGHT_ABOVE_GROUND(vehicle)
		if height > 1.0 then 
			toast("载具离地面太高 :/")
			return
		end
		util.request_model(spikeStripMdl)
		local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, GET_ENTITY_SPEED(vehicle)/2, -0.55)
		spikes = entities.create_object(spikeStripMdl, pos)
		SET_ENTITY_HEADING(spikes, GET_ENTITY_HEADING(vehicle) - 180)
		yield(2500)
		entities.delete(spikes)
	end)

	local boostVeh
	boostVeh = griefing:toggle_loop("载具助推", {"boost"}, "利用牛顿物理定律推动载具前进", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		util.request_model(speedUpMdl)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			boostVeh.value = false
			return 
		end
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, GET_ENTITY_SPEED(vehicle)/1.5, -3.0)
		if boostpad == nil or not DOES_ENTITY_EXIST(boostpad) then
			boostpad = entities.create_object(speedUpMdl, pos)
			SET_OBJECT_SPEED_BOOST_AMOUNT(boostpad, 100)
			entities.set_can_migrate(boostpad, false)
		end
		yield(500)
		SET_ENTITY_COORDS_NO_OFFSET(boostpad, pos, false, false, false)
		SET_ENTITY_HEADING(boostpad, GET_ENTITY_HEADING(vehicle) - 90)
	end, function()
		if boostpad != nil then
			entities.delete(boostpad)
		end
	end)
	
	local slowdownVeh
	slowdownVeh = griefing:toggle_loop("载具减速", {"slowdown"}, "绕过牛顿物理定律 让载具以蜗牛般的速度停下来", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		util.request_model(slowDownMdl)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			slowdownVeh.value = false
			return 
		end
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, GET_ENTITY_SPEED(vehicle)/1.5, -3.0)
		if brakepad == nil or not DOES_ENTITY_EXIST(brakepad) then
			brakepad = entities.create_object(slowDownMdl, pos)
			entities.set_can_migrate(brakepad, false)
		end
		yield(500)
		SET_ENTITY_COORDS_NO_OFFSET(brakepad, pos, false, false, false)
		SET_ENTITY_HEADING(brakepad, GET_ENTITY_HEADING(vehicle) - 90)
	end, function()
		if brakepad != nil then
			entities.delete(brakepad)
		end
	end)

	griefing:toggle_loop("发射玩家", {"launch"}, "适用于大多数菜单", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		util.request_model(mule5)
					
		veh = entities.create_vehicle(mule5, GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, 1.0, -3.0), GET_ENTITY_HEADING(ped))
		entities.set_can_migrate(veh, false)
		SET_ENTITY_VISIBLE(veh, false)
		yield(500)
		APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0.0, 1000.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
		yield(2500)
		entities.delete(veh)
		repeat
			yield()
		until GET_ENTITY_SPEED(ped) < 30.0
	end, function()
		if veh != 0 and DOES_ENTITY_EXIST(veh) then 
			entities.delete(veh)
		end
	end)
	
	local vent = {}
	griefing:toggle_loop("摔倒玩家", {"stumble"}, "", function()
		local mdl = joaat("prop_roofvent_06a")
		local pos = players.get_position(playerID)
		pos.z -= 2.4
		util.request_model(mdl)
		local temp_v3 = v3.new(0, 0, 0)
		local middleVent = entities.create_object(mdl, v3(pos.x, pos.y, pos.z))
		SET_ENTITY_VISIBLE(middleVent, false)
		for i = 1, 4 do
			local angle = (i / 4) * 360
			temp_v3.z = angle
			local obj_pos = temp_v3:toDir()
			obj_pos:mul(1.25)
			obj_pos:add(pos)
			vent[i] = entities.create_object(mdl, obj_pos)
			SET_ENTITY_VISIBLE(vent[i], false)
		end
		yield(500)
		entities.delete(middleVent)
		for vent as obj do
			entities.delete(obj)
		end
	end)

	griefing:toggle_loop("乌烟瘴气", {"smoke"}, "用黑烟填满对方的屏幕", function() 
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		REQUEST_NAMED_PTFX_ASSET("scr_as_trans")
		USE_PARTICLE_FX_ASSET("scr_as_trans")
		if ptfx == nil or not DOES_PARTICLE_FX_LOOPED_EXIST(ptfx) then
			ptfx = START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY("scr_as_trans_smoke", ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, false, false, false, 0, 0, 0, 255)
		end
	end, function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		REMOVE_PARTICLE_FX(ptfx)
		REMOVE_NAMED_PTFX_ASSET("scr_as_trans")
	end)

	local gravity = griefing:list("玩家引力", {}, "适用于所有菜单 会被检测到 对无敌玩家无效")
	local gravitateForce = 1.00
	menu.slider_float(gravity, "引力值", {"force"}, "", 0, 100, 100, 10, function(value)
		gravitateForce = value / 100
	end)
 
	gravity:toggle_loop("启用", {"gravitate"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_IN(ped)

		if isPlayerGodmode(playerID) and (not NETWORK_IS_PLAYER_FADING(playerID) and IS_ENTITY_VISIBLE(ped)) and isNetPlayerOk(playerID) and not NETWORK_IS_PLAYER_IN_MP_CUTSCENE(playerID) and not players.is_using_rc_vehicle(playerID) then
			toast($"{players.get_name(playerID)} 无敌 :/")
			gravitate.value = false
			util.stop_thread()
		end
		
		ADD_EXPLOSION(players.get_position(playerID), 29, gravitateForce, false, true, 0.0, true)
	end)
	
	griefing:toggle_loop("随机火箭", {}, "会在地图下产生随机信号弹 使火箭朝随机方向发射", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local groundPos = players.get_position(playerID)

		local ground
		ground, groundPos.z = util.get_ground_z(groundPos.x, groundPos.y)
		if not ground then return end

		groundPos.x += math.random(-50, 50)
		groundPos.y += math.random(-50, 50)
		groundPos.z -= 10

		if IS_PED_SHOOTING(ped) and IS_PED_ARMED(ped, 2) then
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS(groundPos, pos, 0, true, joaat("weapon_flaregun"), players.user_ped(), true, false, 0.0)
		end
	end)
	
	griefing:toggle_loop("自杀火箭", {}, "会让他们的火箭掉头瞄准自己", function()
		local things = {-0.1, 0.1}
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local pos1 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, things[math.random(#things)], -14.0, -2.0)
		local pos2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, 0.0, 0.0)
		if IS_PED_SHOOTING(ped) and IS_PED_ARMED(ped, 2) then
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos1, pos2, 0, true, joaat("weapon_flaregun"), players.user_ped(), true, false, 0.0)
			yield(2500)
			CLEAR_AREA_OF_PROJECTILES(pos, 25.0, 0)
		end
	end)

	griefing:textslider("无限加载", {}, "玩家在接受邀请后将陷入无限加载屏幕", {"游艇", "办公室", "夜总会", "办公室车库", "改装铺", "公寓"}, function(index)
		util.trigger_script_event(1 << playerID, {996099702, playerID, index})
	end)

	griefing:toggle_loop("黑屏加载", {}, "", function()
		local handle = NETWORK_HASH_FROM_PLAYER_HANDLE(playerID)
		util.trigger_script_event(1 << playerID, {-1604421397, players.user(), 1, 4, handle, handle, handle, handle, 1, 1})
		yield(10000)
	end)
	 
	griefing:toggle_loop("动画循环", {}, "", function()
		local handle = NETWORK_HASH_FROM_PLAYER_HANDLE(playerID)
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		util.trigger_script_event(1 << playerID, {-1604421397, players.user(), math.random(0, 114), 4, handle, handle, handle, handle, 1, 1})
		repeat
			yield()
		until IS_ENTITY_VISIBLE(ped)
	end)

	griefing:action("发送动画", {"intro"}, "发送到在线模式新手动画", function()
		local int = memory.read_int(memory.script_global(GlobalplayerBD_FM_3 + 1 + (playerID * 609) + 511)) -- Global_1886967[PLAYER::PLAYER_ID() /*609*/].f_511
		util.trigger_script_event(1 << playerID, {-366707054, players.user(), 20, 0, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, int})
		util.trigger_script_event(1 << playerID, {1757622014, players.user(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
	 end)
	
	local jobs = griefing:list("发送活动")
	local activities = {
		[211] = "飞镖",
		[212] = "高尔夫",
		[215] = "驾校"
	}
	
	for id, activity in activities do
		jobs:action(activity, {activity}, "强迫活动", function()
			local int = memory.read_int(memory.script_global(GlobalplayerBD_FM_3 + 1 + (playerID * 609) + 511))
			util.trigger_script_event(1 << playerID, {-366707054, players.user(), id, 0, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, int})
			util.trigger_script_event(1 << playerID, {1757622014, players.user(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
		end)
	end

	local sendToArcade = griefing:list("发送街机")
	local arcadeGames = {
		[229] = "街头狂飙",
		[230] = "荒地复仇",
		[231] = "毁灭巫师",
		[235] = "太空猴",
		[236] = "Qub3d",
		[237] = "猎头",
	}
	
	for id, gameName in arcadeGames do
		sendToArcade:action(gameName, {}, "", function()
			local int = memory.read_int(memory.script_global(GlobalplayerBD_FM_3 + 1 + (playerID * 609) + 511))
			util.trigger_script_event(1 << playerID, {-366707054, players.user(), id, 0, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, int})
			util.trigger_script_event(1 << playerID, {1757622014, players.user(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
		end)
	end
	griefing:toggle_loop("载具上锁", {"vehiclelock"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_TRYING_TO_ENTER(ped)
		if not GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID) then
			SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, playerID, true)
		end
	end)

	local disableAcceleration
	disableAcceleration = griefing:toggle_loop("禁用加速", {}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			disableAcceleration.value = false
			return 
		end
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local top_speed = GET_VEHICLE_MODEL_ESTIMATED_MAX_SPEED(vehicle)
		entities.request_control(vehicle, 2500)
		SET_VEHICLE_MAX_SPEED(vehicle, 0.1)
	end)

	griefing:action("载具倒置", {"flip"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local rot = GET_ENTITY_ROTATION(vehicle, 2)
		rot.x = 180

		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			return 
		end
		entities.request_control(vehicle, 2500)
		SET_ENTITY_ROTATION(vehicle, rot, 2, false)
	end)

	griefing:toggle_loop("击晕玩家", {"stun"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pPed =  entities.handle_to_pointer(ped)
		local pedPtr = entities.handle_to_pointer(players.user_ped())
		util.call_foreign_function(CWeaponDamageEventTrigger, pedPtr, pPed, pPed + 0x90, 0, 1, joaat("weapon_stungun_mp"), 0.0, 0, 0, 1 << 0 | 1 << 19, 0, 0, 0, 0, 0, 0, 0, 0.0)
	end)

	griefing:toggle("套汉堡车", {"pattywagon"}, "", function(toggled)
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			glitchveh.value = false
			util.stop_thread() 
		end
		local pos = players.get_position(playerID)
		pos.z -= 0.50
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		util.request_model(hamburgerMdl)
		if toggled then
			if IS_PED_IN_ANY_VEHICLE(ped, false) then
				hamburger = entities.create_object(hamburgerMdl, pos)
				SET_ENTITY_COLLISION(hamburger, false, true)
				entities.set_can_migrate(hamburger, false)
				ATTACH_ENTITY_TO_ENTITY(hamburger, vehicle, 0, 0.0, 0.0, -0.50, v3(), false, false, true, false, 0, false, false)
			end
		else
			if hamburger == nil or not DOES_ENTITY_EXIST(hamburger) then
				toast("汉堡包消失 :/")
				return
			end
			entities.delete(hamburger)
		end
	end)
	
	griefing:action("套汉堡包", {"hamburger"}, "汉堡王", function()
		local pos = players.get_position(playerID)
		pos.z -= 0.50
		util.request_model(hamburgerMdl)
		local hamburger = entities.create_object(hamburgerMdl, pos)
		entities.set_can_migrate(hamburger, false)
		yield(60000)
		entities.delete(hamburger)
	end)

	local isPlayerGod = false
	local removeGodmode
	removeGodmode = antigodmode:toggle_loop("移除无敌", {}, lang.get_localised(-748077967), function()
		if not players.is_godmode(playerID) then 
			toast($"{players.get_name(playerID)} 非无敌 :/")
			removeGodmode.value = false
		end
		local timer = util.current_time_millis() + 1000
		if not isPlayerGod then
			repeat
				util.trigger_script_event(1 << playerID, {800157557, players.user(), 225624744, math.random(0, 9999)})
				if util.current_time_millis() > timer then
					toast($"{players.get_name(playerID)} 移除失败 :/")
					removeGodmode.value = false
				end
				yield()
			until not players.is_godmode(playerID)
			isPlayerGod = true
		else
			util.trigger_script_event(1 << playerID, {800157557, players.user(), 225624744, math.random(0, 9999)})
		end
	end)

	antigodmode:action("击杀无敌", {}, lang.get_localised(-748077967), function()
		if not players.is_godmode(playerID) then 
			toast($"{players.get_name(playerID)} 非无敌 :/")
			return 
		end
		local timer = util.current_time_millis() + 1000
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pPed =  entities.handle_to_pointer(ped)
		local pedPtr = entities.handle_to_pointer(players.user_ped())
		repeat
			util.trigger_script_event(1 << playerID, {800157557, players.user(), 225624744, math.random(0, 9999)})
			if util.current_time_millis() > timer then
				toast($"{players.get_name(playerID)} 移除失败 :/")
				return
			end
			yield()
		until not players.is_godmode(playerID)
		for i = 0, 5 do
			util.trigger_script_event(1 << playerID, {800157557, players.user(), 225624744, math.random(0, 9999)})
			util.call_foreign_function(CWeaponDamageEventTrigger, pedPtr, pPed, pPed + 0x90, 0, 1, joaat("weapon_stungun_mp"), 500.0, 0, 0, 1 << 0 | 1 << 4 | 1 << 12 | 1 << 19, 0, 0, 0, 0, 0, 0, 0, 0.0)
			yield()
			yield()
		end
	end)

	antigodmode:action("压扁无敌", {"squish"}, "挤压对方导致死亡 对方开启不可摔倒可能会无效", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)
		local heading =  GET_ENTITY_HEADING(ped)
		util.request_model(khanjali)
		distance = 2.5
		if IS_PED_STILL(ped) then
			distance = 0.0
		end

		local vehicle1 = entities.create_vehicle(khanjali, GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, distance, 2.8), heading)
		local vehicle2 = entities.create_vehicle(khanjali, pos, 0)
		local vehicle3 = entities.create_vehicle(khanjali, pos, 0)
		local vehicle4 = entities.create_vehicle(khanjali, pos, 0)
		local spawned_vehs = {vehicle1, vehicle2, vehicle3, vehicle4}
		for spawned_vehs as vehicle do
			entities.set_can_migrate(vehicle, false)
		end
		ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0.0, 0.0, 3.0, v3(), -180.0, 0, false, true, false, 0, true, false)
		ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0.0, 3.0, 3.0, v3(), -180.0, 0, false, true, false, 0, true, false)
		ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0.0, 3.0, 0.0, v3(), 0.0, 0, false, true, false, 0, true, false)
		SET_ENTITY_VISIBLE(vehicle1, false)
		yield(6000)
		for spawned_vehs as vehicle do
			entities.delete(vehicle)
		end
	end) 

	antigodmode:action("地图杀", {"barrierkill"}, "对开启防止地图杀和高延迟的玩家无效", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pos = players.get_position(playerID)                            
		util.request_model(windmill)
		for i = 0, 5 do
			if IS_PED_WALKING(ped) then
				spawnPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, 0.5, 0.0)
			elseif not IS_PED_WALKING(ped) then
				spawnPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, 1.3, 0.0)
			else
				spawnPos = players.get_position(playerID)
			end
			local obj = entities.create_object(windmill, spawnPos)
			SET_ENTITY_VISIBLE(obj, false)
			SET_ENTITY_INVINCIBLE(obj, true)
			SET_ENTITY_COLLISION(obj, true, true)
			yield(150)
			entities.delete(obj)
		end
	end)

	antigodmode:toggle_loop("移除载具无敌", {}, lang.get_localised(-748077967), function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not IS_PED_IN_ANY_VEHICLE(ped, false) then
			toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(playerID)))
			glitchveh.value = false
			util.stop_thread() 
		end
		local vehicle = GET_VEHICLE_PED_IS_IN(ped, false)
		entities.request_control(vehicle, 2500)
		if IS_PED_IN_ANY_VEHICLE(ped, false) and not IS_PLAYER_DEAD(ped) then
			SET_ENTITY_CAN_BE_DAMAGED(vehicle, true)
			SET_ENTITY_INVINCIBLE(vehicle, false)
			SET_ENTITY_PROOFS(vehicle, false, false, false, false, false, false, false, false)
		end
	end)


	local interiorTP = tpPlayer:list("室内传送", {}, lang.get_localised(-748077967))
	for id, interior in interiorTpList do
		interiorTP:action(interior, {}, "", function()
			util.trigger_script_event(1 << playerID, {-1638522928, players.user(), id, 1, 0, 1, 1130429716, -1001012850, 1106067788, 0, 0, 1, 2123789977, 1, -1})
		end)
	end

	local missionEndTP = tpPlayer:list("其他传送", {}, lang.get_localised(-748077967))
	for id, location in pairs(missionEndTeleports) do
		missionEndTP:action(location, {}, "", function()
			local handle = NETWORK_HASH_FROM_PLAYER_HANDLE(playerID)
			util.trigger_script_event(1 << playerID, {-1604421397, players.user(), id, 4, handle, 0, 0, 0, 1, 1})
		end)
	end

	tpPlayer:action("赌场动画", {}, "", function()
		triggerDistanceBasedTeleport(playerID, {-1951335381, 0, 0})
	end)
 
	tpPlayer:action("佩罗海滩", {}, "", function()
		triggerDistanceBasedTeleport(playerID, {1669592503, players.user(), 0, 0, 4, 0})
	end)
	
	tpPlayer:action("佩里科岛", {}, "", function()
		triggerDistanceBasedTeleport(playerID, {1669592503, players.user(), 0, 0, 3, 1})
	end)
	
	tpPlayer:action("佩里科岛", {}, "", function()
		triggerDistanceBasedTeleport(playerID, {1669592503, players.user(), 0, 0, 5, 1})
	end)

	local aimbor
	aimbor = miscPlayer:toggle_loop("持续自瞄", {"aimbot"}, "", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			aimbor.value = false
			return
		end

		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local pPed =  entities.handle_to_pointer(ped)
		local pedPtr = entities.handle_to_pointer(players.user_ped())
		local wpn = GET_SELECTED_PED_WEAPON(players.user_ped())
		local dmg = GET_WEAPON_DAMAGE(wpn, 0)
		if IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), ped) and IS_PED_SHOOTING(players.user_ped()) and not IS_ENTITY_A_GHOST(ped) then
			boneIndex = bones[math.random(#bones)]
			local boneCoords = GET_PED_BONE_COORDS(ped, boneIndex, 0.0, 0.0, 0.0)
			util.call_foreign_function(CWeaponDamageEventTrigger, pedPtr, pPed, boneCoords, 0, 1, wpn, dmg, 0, 0, 1 << 0 | 1 << 9 | 1 << 19, 0, 0, 0, 0, 0, 0, 0, 0.0)
		end
	end)

	local triggerbor
	triggerbor = miscPlayer:toggle_loop("间歇自瞄", {"triggerbot"}, "使你对战时不被别人怀疑是自瞄", function() -- this is not using CWeaponDamageEventTrigger because we want it to also miss every now and then
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			triggerbor.value = false
		end
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local wpn = GET_SELECTED_PED_WEAPON(players.user_ped())
		local dmg = ROUND(GET_WEAPON_DAMAGE(wpn, 0))
		local shotDelay = GET_WEAPON_TIME_BETWEEN_SHOTS(wpn)
		local wpnEnt = GET_CURRENT_PED_WEAPON_ENTITY_INDEX(players.user_ped(), false)
		local wpnCoords = GET_ENTITY_BONE_POSTION(wpnEnt, GET_ENTITY_BONE_INDEX_BY_NAME(wpnEnt, "gun_muzzle"))
		if GET_ENTITY_ALPHA(ped) < 255 then return end
		if IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), ped) and not IS_PED_RELOADING(players.user_ped()) then
			boneIndex = bones[math.random(#bones)]
			local pos = GET_PED_BONE_COORDS(ped, boneIndex, 0.0, 0.0, 0.0)
			SHOOT_SINGLE_BULLET_BETWEEN_COORDS(wpnCoords, pos, dmg, true, wpn, players.user_ped(), true, false)
			SET_CONTROL_VALUE_NEXT_FRAME(0, 24, 1.0) -- shooting manually after so it has the effect of you shooting to seem more legit despite there being nothing legit about this
			yield(shotDelay * 1000)
		end
	end)

	local vehAimbor
	vehAimbor = miscPlayer:toggle_loop("载具自瞄", {"vehicleaimbot"}, "载具导弹瞄准玩家", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			vehAimbor.value = false
			return
		end
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		if not IS_PLAYER_DEAD(ped) and IS_CONTROL_PRESSED(0, 70) and GET_VEHICLE_HOMING_LOCKON_STATE(entities.get_user_vehicle_as_handle()) == 0 then
			SET_VEHICLE_SHOOT_AT_TARGET(players.user_ped(), ped, players.get_position(playerID))
		end
	end)

	local miscTutorialSession
	miscTutorialSession = miscPlayer:toggle_loop("指导战局", {"entertutorialsession"}, "如果玩家指导战局处于活动状态 则进入玩家指导战局", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			miscTutorialSession.value = false
			return
		end

		if getTeamID(playerID) == nil or getInstanceID(playerID) == nil then 
			toast($"{players.get_name(playerID)} 不在任何指导战局 :/")
			miscTutorialSession.value = false
			return 
		end
		
		if getTeamID(players.user()) != getTeamID(playerID) or getInstanceID(players.user()) != getInstanceID(playerID) then
			NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION(getTeamID(playerID), getInstanceID(playerID))
		end
	end, function()
		if NETWORK_IS_IN_TUTORIAL_SESSION() then
			NETWORK_END_TUTORIAL_SESSION()
		end
	end)

	local ghostPlayer
	ghostPlayer = miscPlayer:toggle_loop("幽灵玩家", {"ghost"}, "", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			ghostPlayer.value = false
			return
		end
		if not players.exists(playerID) then
			ghostPlayer.value = false
			return
		end
		SET_REMOTE_PLAYER_AS_GHOST(playerID, true)
	end, function()
		SET_REMOTE_PLAYER_AS_GHOST(playerID, false)
	end)

	miscPlayer:toggle_loop("显示准线", {"aimlines"}, "", function()
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local weapon_ent = GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped, false)
		local weapon_coords = GET_ENTITY_BONE_POSTION(weapon_ent, GET_ENTITY_BONE_INDEX_BY_NAME(weapon_ent, "gun_muzzle"))
		local inst = v3.new()
		v3.set(inst, players.get_cam_rot(playerID))
		local tmp = v3.toDir(inst)
		v3.set(inst, v3.get(tmp))
		v3.mul(inst, 1000)
		v3.set(tmp, players.get_cam_pos(playerID))
		v3.add(inst, tmp)
		if IS_PLAYER_FREE_AIMING(playerID) then
			DRAW_LINE(weapon_coords, inst, 255, 255, 255, 255)
		end
	end)

	local autoVehTP
	autoVehTP = miscPlayer:toggle_loop("传送驾驶", {"autovehtp"}, "自动传送到玩家载具里", function()
		if playerID == players.user() then 
			toast(lang.get_localised(CMDOTH))
			autoVehTP.value = false
			return
		end

		local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local vehicle = GET_VEHICLE_PED_IS_USING(ped)
		local veh_model = players.get_vehicle_model(playerID)
		local seat_count = GET_VEHICLE_MODEL_NUMBER_OF_SEATS(veh_model)
		if not ARE_ANY_VEHICLE_SEATS_FREE(vehicle) then return end
		if GET_VEHICLE_PED_IS_USING(players.user_ped()) != vehicle then
			for i = 0, seat_count -1 do
				local emptyseat = i
				for l = 1, 25 do
					SET_PED_INTO_VEHICLE(players.user_ped(), vehicle, emptyseat)
				end
			end
		end
	end)
end


players.add_command_hook(player)
