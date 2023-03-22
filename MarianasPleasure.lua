function plotRaceway(Coordinate, Altitude, Speed, Heading, Leg, Coalition, Color, Alpha, LineType, ReadOnly)
	local fix_coordinate = Coordinate
	local altitude = Altitude
	local speed = Speed or 350
	local heading = Heading or 270
	local leg_distance = Leg or 10
	
	local coalition = Coalition or -1
	local color = Color or {1,0,0}
	local alpha = Alpha or 1
	local lineType = LineType or 1
	
	
	speed = UTILS.IasToTas(speed, UTILS.FeetToMeters(altitude), oatcorr)
	
	
	local turn_radius = 0.0211 * speed -3.01
	
	local point_two = fix_coordinate:Translate(UTILS.NMToMeters(leg_distance), heading, true, false)
	local point_three = point_two:Translate(UTILS.NMToMeters(turn_radius)*2, heading - 90, true, false)
	local point_four = fix_coordinate:Translate(UTILS.NMToMeters(turn_radius)*2, heading - 90, true, false)
	local circle_center_fix_four = point_two:Translate(UTILS.NMToMeters(turn_radius), heading - 90, true, false)
	local circle_center_two_three = fix_coordinate:Translate(UTILS.NMToMeters(turn_radius), heading - 90, true, false)
	

	fix_coordinate:LineToAll(point_two, coalition, color, alpha, lineType)
	point_four:LineToAll(point_three, coalition, color, alpha, lineType)
	circle_center_fix_four:CircleToAll(UTILS.NMToMeters(turn_radius), coalition, color, alpha, nil, 0, lineType)--, ReadOnly, Text)
	circle_center_two_three:CircleToAll(UTILS.NMToMeters(turn_radius), coalition, color, alpha, nil, 0, lineType)--, ReadOnly, Text)

end

function getRGB(color)
	local color = color or "red"
	local colorList = {["blue"] = {0,0.5,1},
		["hostile"] = {1,0,0},
		["red"] = {1,0,0},
		["friendly"] = {0,0.71,1},
		["neutral"] = {1,1,1},
		["white"] = {1,1,1},
		["black"] = {0,0,0}
		}
		
		return colorList[color]

end


function plotOrbitCircle(Coordinate, Altitude, Speed, Coalition, Color, Alpha, LineType, ReadOnly)
	local fix_coordinate = Coordinate
	local altitude = Altitude
	local speed = Speed or 350
	
	local coalition = Coalition or -1
	local color = Color or {1,0,0}
	local alpha = Alpha or 1
	local lineType = LineType or 1

	speed = UTILS.IasToTas(speed, UTILS.FeetToMeters(altitude), oatcorr)

	local turn_radius = speed/60/3.14159265359
	
	fix_coordinate:CircleToAll(UTILS.NMToMeters(turn_radius), coalition, color, alpha, nil, 0, lineType)--, ReadOnly, Text)


end


function myRAT()
	local an28 = RAT:New("RAT_An28")
	an28:SetDeparture({"Rota Intl","Antonio B. Won Pat Intl","Saipan Intl","Tinian Intl"})
	an28:SetDestination({"Rota Intl","Antonio B. Won Pat Intl","Saipan Intl","Tinian Intl"})
	an28:ContinueJourney()
	an28:ATC_Messages(false)


	local a320 = RAT:New("RAT_a320")
	a320:SetDeparture({"Rota Intl","Antonio B. Won Pat Intl","Saipan Intl","Tinian Intl"})
	a320:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	--a320:SetTakeoff("air")
	a320:Commute()
	a320:ATC_Messages(false)
	a320:SetFLmin(200)

	local a330 = RAT:New("RAT_a330")
	a330:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	a330:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	a330:Commute()
	a330:ATC_Messages(false)
	a330:SetFLmin(200)
	a330:SetTakeoffAir()

	local a380 = RAT:New("RAT_a380")
	a380:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	a380:SetDestination({"Antonio B. Won Pat Intl","Saipan Intl","Tinian Intl"})
	a380:SetTakeoff("air")
	a380:Commute()
	a380:ATC_Messages(false)
	a380:SetFLmin(200)


	local b757 = RAT:New("RAT_B757")
	b757:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	b757:SetDestination({"Antonio B. Won Pat Intl","Saipan Intl","Tinian Intl"})
	b757:SetTakeoff("air")
	b757:Commute()
	b757:ATC_Messages(false)
	b757:SetFLmin(200)



	local b727 = RAT:New("RAT_B727")
	b727:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	b727:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	b727:Commute()
	b727:ATC_Messages(false)
	b727:SetFLmin(200)
	b727:SetTakeoff("air")

	local b737 = RAT:New("RAT_B737")
	b737:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	b737:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	b737:Commute()
	b737:ATC_Messages(false)
	b737:SetFLmin(200)
	b737:SetTakeoff("air")


	local c5Galaxy = RAT:New("RAT_C5")
	c5Galaxy:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	c5Galaxy:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	c5Galaxy:Commute()
	c5Galaxy:ATC_Messages(false)
	c5Galaxy:SetFLmin(200)
	c5Galaxy:SetTakeoff("air")

	local a400 = RAT:New("RAT_A400")
	a400:SetDeparture({"Andersen AFB"})
	a400:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	a400:Commute()
	a400:ATC_Messages(false)
	a400:SetFLmin(200)

	local c17 = RAT:New("RAT_C17")
	c17:SetDeparture({"Andersen AFB"})
	c17:SetDestination({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	c17:Commute()
	c17:ATC_Messages(false)
	c17:SetFLmin(200)

	local b747 = RAT:New("RAT_B747")
	b747:SetDeparture({"RAT Zone A","RAT Zone B","RAT Zone C","RAT Zone D"})
	b747:SetDestination({"Antonio B. Won Pat Intl","Saipan Intl","Tinian Intl"})
	b747:SetTakeoff("air")
	b747:Commute()
	b747:ATC_Messages(false)
	b747:SetFLmin(200)

	local manager = RATMANAGER:New(4)
	manager:Add(an28, 1)
	manager:Add(c5Galaxy,1)
	manager:Add(a400,0)
	manager:Add(a320,0)
	manager:Add(a330,0)
	manager:Add(a380,0)
	manager:Add(b757,0)
	manager:Add(b727,0)
	manager:Add(b737,0)
	manager:Add(b747,0)
	manager:Add(c17,0)
	manager:Start(10)

end

myRAT()

function myAirwingAndersen()

	-- Airwing Andersen
	airwingAndersen=AIRWING:New("Warehouse Andersen Unit", "Andersen Combined Wing")
	airwingAndersen:SetVerbosity(3)
	airwingAndersen:Start()



	-- Airwing Andersen Squadrons
	VFA151=SQUADRON:New("F-14 Group", 8, "VFA-151 (Vigilantes)")
		:AddMissionCapability({AUFTRAG.Type.GCICAP, AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.CAP})
		:SetCallsign("Ford", 1)
	 airwingAndersen:AddSquadron(VFA151)
	 airwingAndersen:NewPayload(GROUP:FindByName("F-14 Payload AIM-54C"), 6, {AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.GCICAP, AUFTRAG.Type.CAP}, 80)
	 airwingAndersen:NewPayload(GROUP:FindByName("F-14 Payload AIM-7M"), 20, {AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.GCICAP, AUFTRAG.Type.CAP},50)


	VFA120 = SQUADRON:New("P-8A Group", 4, "VFA-120 (Swordfish)")
		:AddMissionCapability({AUFTRAG.Type.RECON})
		:SetCallsign("Chevy", 1)
	 airwingAndersen:AddSquadron(VFA120)
	 airwingAndersen:NewPayload(GROUP:FindByName("P-8A Payload Torpedoes"), 4, {AUFTRAG.Type.RECON},100)

	SQN390 = SQUADRON:New("F-15C Group", 8, "390th Fighter SQN (Crying Eagles)")
		:AddMissionCapability({AUFTRAG.Type.GCICAP, AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.CAP})
		:SetCallsign("Colt", 1)
	 airwingAndersen:AddSquadron(SQN390)
	 airwingAndersen:NewPayload(GROUP:FindByName("F-15C Payload AIM-120"), 6, {AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.GCICAP, AUFTRAG.Type.CAP}, 80)
	 airwingAndersen:NewPayload(GROUP:FindByName("F-15C Payload AIM-9"), 6, {AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.GCICAP, AUFTRAG.Type.CAP}, 60)

	VFA55 = SQUADRON:New("E-3A Group", 2, "VFA-55@IFF:1953FR (Goldeneye)")
		:AddMissionCapability({AUFTRAG.Type.AWACS})
		:SetCallsign(CALLSIGN.AWACS.Darkstar, 1)
		:SetRadio(248.750)
	 airwingAndersen:AddSquadron(VFA55)
	 airwingAndersen:NewPayload(GROUP:FindByName("E-3A Payload"), 8, {AUFTRAG.Type.AWACS},100)


	VMGR152 = SQUADRON:New("KC-130 Group",6, "VMGR-152 (Sumos)")
		:AddMissionCapability({AUFTRAG.Type.TANKER})
	 airwingAndersen:AddSquadron(VMGR152)
	 airwingAndersen:NewPayload(GROUP:FindByName("KC-130 Payload"), 4, {AUFTRAG.Type.TANKER},100)

	ATKS138 = SQUADRON:New("MQ-9 Reaper",4,"138th Attack Squadron (The Boys from Syracuse)")
		:AddMissionCapability({AUFTRAG.Type.FACA, AUFTRAG.Type.RECON})
	 airwingAndersen:AddSquadron(ATKS138)
	 airwingAndersen:NewPayload(GROUP:FindByName("MQ-9 Reaper Unarmed"),4, {AUFTRAG.Type.FACA, AUFTRAG.Type.RECON},100)

	ATKS15 = SQUADRON:New("MQ-1A Predator",4,"15th Attack Squadron (Pigeons)")
		:AddMissionCapability({AUFTRAG.Type.FACA, AUFTRAG.Type.RECON})
	 airwingAndersen:AddSquadron(ATKS15)
	 airwingAndersen:NewPayload(GROUP:FindByName("MQ-1A Predator Unarmed"),4, {AUFTRAG.Type.FACA, AUFTRAG.Type.RECON},100)
	 
	 

	-- Missionen erstellen
	local ZoneNavyCAP = ZONE:New("navyCAP")
	local ZoneNavyCAPbase = ZONE:New("navyCAPbase")

	local navyCAP = AUFTRAG:NewCAP(ZoneNavyCAP, 30000, 350, ZoneNavyCAPbase:GetCoordinate(), 30, 100, {"Air"},10)
		:SetRepeat(900)
		:SetRequiredAssets(2,2)
		:SetMissionRange(250)
		:AssignSquadrons({VFA151})
	plotRaceway(ZoneNavyCAPbase:GetCoordinate(), 30000, 350, 30, 100, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)


	local ZoneNavyCAPnorth = ZONE:New("navyCAPnorth")
	local ZoneNavyCAPbaseNorth = ZONE:New("navyCAPbaseNorth")

	local navyCAPnorth = AUFTRAG:NewCAP(ZoneNavyCAPnorth, 26000, 330, ZoneNavyCAPbaseNorth:GetCoordinate(), 300, 30, {"Air"},10)
		:SetRepeat(900)
		:SetRequiredAssets(2,2)
		:SetMissionRange(500)
		:AssignSquadrons({VFA151})
	plotRaceway(ZoneNavyCAPbaseNorth:GetCoordinate(), 26000, 330, 300, 30, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)


	local ZoneAirforceCAP = ZONE:New("airforceCAP")
	local ZoneAirforceCAPbase = ZONE:New("airforceCAPbase")

	local airforceCAP = AUFTRAG:NewCAP(ZoneAirforceCAP, 26000, 330, ZoneAirforceCAPbase:GetCoordinate(), 35, 70, {"Air"},10)
		:SetRepeat(900)
		:SetRequiredAssets(2,2)
		:SetMissionRange(250)
		:AssignSquadrons({SQN390})
	plotRaceway(ZoneAirforceCAPbase:GetCoordinate(), 26000, 330, 35, 70, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)


	ZoneNFarUboatSearch = ZONE:New("FarUboatSearch")
	local UBoatSearchFarSet = SET_ZONE:New()
	 UBoatSearchFarSet:AddZone(ZoneNFarUboatSearch)
	local navyUBoatReccoonFar = AUFTRAG:NewRECON(UBoatSearchFarSet,UTILS.KnotsToAltKIAS(180,1000), 1000, true, false)
						:SetRequiredAssets(1,1)
						:SetMissionRange(500)
						:AssignSquadrons({VFA120})
						:SetTime(540)



	-- Penguin
	VFA124 = SQUADRON:New("P-3C Orion Group", 8, "VFA-132 (Penguin)")
	VFA124:AddMissionCapability({AUFTRAG.Type.RECON})
	VFA124:SetCallsign("Springfield", 1)
	airwingAndersen:AddSquadron(VFA124)

	airwingAndersen:NewPayload(GROUP:FindByName("P-3C Orion Payload Torpedo"), 8, {AUFTRAG.Type.RECON},100)

	ZoneOrionUBoatSeachA = ZONE:New("Orion UBoat Seach A")
	ZoneOrionUBoatSeachB = ZONE:New("Orion UBoat Seach B")
	ZoneOrionUBoatSeachC = ZONE:New("Orion UBoat Seach C")
	ZoneOrionUBoatSeachD = ZONE:New("Orion UBoat Seach D")
	ZoneOrionUBoatSeachE = ZONE:New("Orion UBoat Seach E")

	local UBoatSearchNearSet = SET_ZONE:New()
	UBoatSearchNearSet:AddZone(ZoneOrionUBoatSeachA)
	UBoatSearchNearSet:AddZone(ZoneOrionUBoatSeachB)
	UBoatSearchNearSet:AddZone(ZoneOrionUBoatSeachC)
	UBoatSearchNearSet:AddZone(ZoneOrionUBoatSeachD)
	UBoatSearchNearSet:AddZone(ZoneOrionUBoatSeachE)
	 
	local navyUBoatReccoonNear = AUFTRAG:NewRECON(UBoatSearchNearSet,UTILS.KnotsToAltKIAS(180,600), 600, true, true)
	navyUBoatReccoonNear:SetRequiredAssets(1,1)
	navyUBoatReccoonNear:SetMissionRange(500)
	navyUBoatReccoonNear:AssignSquadrons({VFA124})
						:SetTime(600)


	-- Auftrag AWACS

	-- Patrol zone.
	local zoneAlpha=ZONE:New("Zone Alpha")

	-- AWACS mission. Orbit at 15000 ft, 350 KIAS, heading 270 for 20 NM.
	local auftragAWACS=AUFTRAG:NewAWACS(zoneAlpha:GetCoordinate(), 35000, 300, 060, 20)
	plotRaceway(zoneAlpha:GetCoordinate(), 35000, 300, 60, 20, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)


	-- C-130 missions
	local zoneAARC130south = ZONE:New("AAR C130 South")
	local auftrag_AARC130south = AUFTRAG:NewTANKER(zoneAARC130south:GetCoordinate(), 17500, 240, 045, 20, 1)
		:SetRadio(287.725)
		:AssignSquadrons({VMGR152})
		plotRaceway(zoneAARC130south:GetCoordinate(), 1750, 240, 45, 20, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)

	local zoneAARC130north = ZONE:New("AAR C130 North")
	local auftrag_AARC130north = AUFTRAG:NewTANKER(zoneAARC130north:GetCoordinate(), 21500, 230, 90, 20, 1)
		:SetRadio(295.225)	
		:AssignSquadrons({VMGR152})
		:SetMissionRange(400)
		:SetTeleport()
		plotRaceway(zoneAARC130north:GetCoordinate(), 21500, 230, 90, 20, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)
	--auftrag_AARC130south:SetCallsign("Shell",1)
	--auftrag_AARC130north:SetCallsign("Shell",2)
	
	
		-- The target.
	local Gugan_Target=GROUP:FindByName("Gugan Target")

	-- Create a FACA mission. This uses the default settings: Datalink on, designation auto, radio 133 MHz AM.
	local mission_Gugan_Target=AUFTRAG:NewFACA(Gugan_Target)			
			:SetTeleport()
			:SetRadio(147.575, 0)
			:SetMissionRange(400)
			--:SetMissionAltitude(12000) -- not working for NewFACA
			--:SetMissionSpeed(140) -- not working for NewFACA
		--plotOrbitCircle(Gugan_Target:GetCoordinate(), 12000, 140, coalition.side.BLUE, getRGB("friendly"))--, Alpha, LineType, ReadOnly)
		Gugan_Target:GetCoordinate():CircleToAll(UTILS.NMToMeters(4.35), coalition.side.BLUE, getRGB("friendly"))--, alpha, nil, 0, lineType)--, ReadOnly, Text)
		
		
	--- Function called each time a flight of the airwing goes on a mission.
	function airwingAndersen:OnAfterFlightOnMission(From, Event, To, FlightGroup, Mission)
	  local flightgroup = FlightGroup --Ops.FlightGroup#FLIGHTGROUP
	  local mission=Mission         --Ops.Auftrag#AUFTRAG
	  if mission == auftrag_AARC130south then  
		flightgroup:SwitchCallsign(CALLSIGN.Tanker.Shell, 1)
		flightgroup:SwitchTACAN(23, "SMA", 1, "X")
	  elseif mission == auftrag_AARC130north then
		flightgroup:SwitchCallsign(CALLSIGN.Tanker.Shell, 2)
		flightgroup:SwitchTACAN(27, "SMB", 1, "X")
	  elseif mission == mission_Gugan_Target then
		flightgroup:SwitchCallsign(CALLSIGN.Aircraft.Ford, 2)
	  end
	end

	
	


	-- -- Missionen zuweisen zu Flightgroups
	-- airwingAndersen:AddMission(navyCAP)
	-- airwingAndersen:AddMission(airforceCAP)
	-- airwingAndersen:AddMission(navyUBoatReccoonFar)
	-- airwingAndersen:AddMission(navyUBoatReccoonNear)
	-- airwingAndersen:AddMission(auftragAWACS)
	-- airwingAndersen:AddMission(auftrag_AARC130south)
	-- airwingAndersen:AddMission(auftrag_AARC130north)
	-- airwingAndersen:AddMission(navyCAPnorth)
	
	airwingAndersen:AddMission(mission_Gugan_Target)
	airwingAndersen:AddMission(auftrag_AARC130north)

	missiontable = {
		navyCAP,
		airforceCAP,
		navyUBoatReccoonFar,
		navyUBoatReccoonNear,
		auftragAWACS,
		auftrag_AARC130south,
		navyCAPnorth}

	for i = 1,#missiontable do	
		airwingAndersen:AddMission(UTILS.GetRandomTableElement(missiontable, false))
	end

end

myAirwingAndersen()


local my_aicsar=AICSAR:New("Luftrettung",coalition.side.BLUE,"Downed Pilot","Rescue Helo",AIRBASE:FindByName("Andersen"),ZONE:New("MASH"))


MASH_unit = UNIT:FindByName( 'Beacon Hospital' )

-- Carrier NDB
local MashBeacon = MASH_unit:GetBeacon()
local frequency = 0.42  -- in MHz
local modulation = radio.modulation.AM
local power = 100 -- Standard for VOR
local file = 'morse.wav'  -- Dots and Dashes: - -.- .-.
MashBeacon:RadioBeacon( file, frequency, modulation, power )


function myCVN_Airwing()
local Airwing_CVN = AIRWING:New("CVN-74","CVN 74")
Airwing_CVN:Start()

--Squadrons
    local CVN_E2D = SQUADRON:New( "Blue_SQ_E2D" , 12 , "E2D@IFF:1852FR" )
        CVN_E2D:SetSkill(AI.Skill.EXCELLENT)
        CVN_E2D:SetTakeoffAir()
        CVN_E2D:SetGrouping(1)
        CVN_E2D:AddMissionCapability({AUFTRAG.Type.AWACS}, 100)
        CVN_E2D:SetFuelLowRefuel(true)
        CVN_E2D:SetFuelLowThreshold(0.3)
    Airwing_CVN:AddSquadron(CVN_E2D):NewPayload("Blue_SQ_E2D_1",-1,{AUFTRAG.Type.AWACS},100)

    local CVN_SHELL = SQUADRON:New( "Blue_SQ_SB3_SHELL" , 12 , "S3B@IFF:1953FR" )
        CVN_SHELL:SetSkill(AI.Skill.EXCELLENT)
        CVN_SHELL:SetTakeoffAir()
        CVN_SHELL:SetGrouping(1)
        CVN_SHELL:AddMissionCapability({AUFTRAG.Type.TANKER}, 100)
    Airwing_CVN:AddSquadron(CVN_SHELL):NewPayload("Blue_SQ_SB3_SHELL_1",-1,{AUFTRAG.Type.TANKER},100)

--Auftrag

    local CVN_ShellTanker = AUFTRAG:NewRECOVERYTANKER(UNIT:FindByName("CVN-74"), 9000, 300, 10, 45, 10, 90)
        --CVN_ShellTanker:SetName("ShellTanker")
        --CVN_ShellTanker:SetRequiredAssets(1)
        --CVN_ShellTanker:SetRepeat(5)
        CVN_ShellTanker:AssignSquadrons({Blue_SQ_SB3_SHELL})
    Airwing_CVN:AddMission(CVN_ShellTanker)

    CVN_ShellTankerA = AUFTRAG:NewTANKER(ZONE:FindByName("Zone_CVN_AWACS"):GetCoordinate(), 9000, UTILS.KnotsToAltKIAS(230,9000), 78, 25, 1)
        CVN_ShellTankerA:SetName("ShellTankerA")
        CVN_ShellTankerA:SetRequiredAssets(1)
        CVN_ShellTankerA:SetRepeat(5)
        CVN_ShellTankerA:AssignSquadrons({Blue_SQ_SB3_SHELL})
    Airwing_CVN:AddMission(CVN_ShellTankerA)

    CVN_Awacs = AUFTRAG:NewAWACS(ZONE:FindByName("Zone_CVN_AWACS"):GetCoordinate(), 30000, UTILS.KnotsToAltKIAS(250,30000), 78, 50)
        CVN_Awacs:SetName("AWACSCVN")
        CVN_Awacs:SetRequiredAssets(1)
        CVN_Awacs:SetRepeat(5)
        CVN_Awacs:AssignSquadrons({Blue_SQ_E2D})
    Airwing_CVN:AddMission(CVN_Awacs)

    -- CVN_Orbit = AUFTRAG:NewORBIT(ZONE:FindByName("Zone_CVN_AWACS"):GetCoordinate(), 4000, 250, 78, 20)
        -- CVN_Orbit:AssignSquadrons({Blue_SQ_SB3_SHELL})
    -- Airwing_CVN:AddMission(CVN_Orbit)
end