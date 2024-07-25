--CLASS_DISABLED = "You must choose a different race to be this class";
CLASS_DISABLED = _G["_CLASS_DISABLED"];
CUSTOMIZE = _G["_CUSTOMIZE"];
NEXT = _G["_NEXT"];
FINISH = _G["_FINISH"]; 
CLASS_ALMACENADA = 1; 
OKGETCLASSULTIMATE = 0;

CHARACTER_FACING_INCREMENT = 2;
MAX_RACES = 21;
MAX_CLASSES_PER_RACE = 11;
NUM_CHAR_CUSTOMIZATIONS = 5;
MIN_CHAR_NAME_LENGTH = 2;
CHARACTER_CREATE_ROTATION_START_X = nil;
CHARACTER_CREATE_INITIAL_FACING = nil;
NUM_PREVIEW_FRAMES = 14;
WORGEN_RACE_ID = 6;
TUSKARR_RACE_ID = 6;
local featureIndex = 1
local FeatureType = 1

PAID_CHARACTER_CUSTOMIZATION = 1;
PAID_RACE_CHANGE = 3;
PAID_FACTION_CHANGE = 2;
PAID_SERVICE_CHARACTER_ID = nil;
PAID_SERVICE_TYPE = nil;

PREVIEW_FRAME_HEIGHT = 130;
PREVIEW_FRAME_X_OFFSET = 19;
PREVIEW_FRAME_Y_OFFSET = -7;

GLOBAL_ZOOM_POS_22 = 1;

FACTION_BACKDROP_COLOR_TABLE = {
	["Alliance"] = {0.5, 0.5, 0.5, 0.09, 0.09, 0.19, 0, 0, 0.2, 0.29, 0.33, 0.91},
	["Horde"] = {0.5, 0.2, 0.2, 0.19, 0.05, 0.05, 0.2, 0, 0, 0.90, 0.05, 0.07},
	["Player"] = {0.2, 0.5, 0.2, 0.05, 0.2, 0.05, 0.05, 0.2, 0.05, 1, 1, 1},
};
FRAMES_TO_BACKDROP_COLOR = {
	"CharacterCreateCharacterRace",
	"CharacterCreateCharacterClass",
--	"CharacterCreateCharacterFaction",
	"CharacterCreateNameEdit",
};
RACE_ICON_TCOORDS = {
	["HUMAN_MALE"]		= {0, 0.125, 0, 0.25},
	["DWARF_MALE"]		= {0.125, 0.25, 0, 0.25},
	["GNOME_MALE"]		= {0.25, 0.375, 0, 0.25},
	["NIGHTELF_MALE"]	= {0.375, 0.5, 0, 0.25},

	["TAUREN_MALE"]		= {0, 0.125, 0.25, 0.5},
	["SCOURGE_MALE"]	= {0.125, 0.25, 0.25, 0.5},
	["TROLL_MALE"]		= {0.25, 0.375, 0.25, 0.5},
	["ORC_MALE"]		= {0.375, 0.5, 0.25, 0.5},

	["HUMAN_FEMALE"]	= {0, 0.125, 0.5, 0.75},
	["DWARF_FEMALE"]	= {0.125, 0.25, 0.5, 0.75},
	["GNOME_FEMALE"]	= {0.25, 0.375, 0.5, 0.75},
	["NIGHTELF_FEMALE"]	= {0.375, 0.5, 0.5, 0.75},

	["TAUREN_FEMALE"]	= {0, 0.125, 0.75, 1.0},
	["SCOURGE_FEMALE"]	= {0.125, 0.25, 0.75, 1.0},
	["TROLL_FEMALE"]	= {0.25, 0.375, 0.75, 1.0},
	["ORC_FEMALE"]		= {0.375, 0.5, 0.75, 1.0},

	["BLOODELF_MALE"]	= {0.5, 0.625, 0.25, 0.5},
	["BLOODELF_FEMALE"]	= {0.5, 0.625, 0.75, 1.0},

	["DRAENEI_MALE"]	= {0.5, 0.625, 0, 0.25},
	["DRAENEI_FEMALE"]	= {0.5, 0.625, 0.5, 0.75},

	-- ["WORGEN_MALE"]		= {0.625, 0.75, 0, 0.25},
	-- ["WORGEN_FEMALE"]	= {0.625, 0.75, 0.5, 0.75},
	--
	  ["GOBLIN_MALE"]		= {0.625, 0.75, 0.125, 0.25},
	  ["GOBLIN_FEMALE"]	= {0.625, 0.75, 0.375, 0.5},
};

RACE_ICON_TCOORDS = {
	["HUMAN_MALE"]		= {0, 0.125, 0, 0.125},
	["HUMAN_FEMALE"]	= {0, 0.125, 0.125, 0.25},
	
	["DWARF_MALE"]		= {0.25, 0.375, 0.5, 0.625},
	["DWARF_FEMALE"]	= {0.25, 0.375, 0.625, 0.75},
	
	["NIGHTELF_MALE"]	= {0.125, 0.25, 0.25, 0.375},
	["NIGHTELF_FEMALE"]	= {0.125, 0.25, 0.375, 0.5},
	
	["GNOME_MALE"]		= {0.5, 0.625, 0.5, 0.625},
	["GNOME_FEMALE"]	= {0.5, 0.625, 0.625, 0.75},
	
	["TAUREN_MALE"]		= {0.25, 0.375,0.25, 0.375},
	["TAUREN_FEMALE"]	= {0.25, 0.375, 0.375, 0.5},

	["SCOURGE_MALE"]	= {0.625, 0.75, 0, 0.125},
	["SCOURGE_FEMALE"]	= {0.625, 0.75, 0.125, 0.25},
	
	["TROLL_MALE"]		= {0, 0.125, 0.5, 0.625},
	["TROLL_FEMALE"]	= {0, 0.125, 0.625, 0.75},
	
	["ORC_MALE"]		= {0.875, 1.0, 0, 0.125},
	["ORC_FEMALE"]		= {0.875, 1.0, 0.125, 0.25},

	["BLOODELF_MALE"]	= {0.25, 0.375, 0, 0.125},
	["BLOODELF_FEMALE"]	= {0.25, 0.375, 0.125, 0.25},

	["DRAENEI_MALE"]	= {0.75, 0.875, 0.25, 0.375},
	["DRAENEI_FEMALE"]	= {0.75, 0.875, 0.375, 0.5},
	-- Goblin
	["GOBLIN_MALE"]		= {0.75, 0.875, 0, 0.125},
	["GOBLIN_FEMALE"]	= {0.75, 0.875, 0.125, 0.25},
	-- Worgen
	["WORGEN_MALE"]	    = {0.375, 0.5, 0, 0.125},
	["WORGEN_FEMALE"]	= {0.375, 0.5, 0.125, 0.25}, 
	-- Pandaren Horde (Eredar)
	["SKELETON_MALE"]	= {0.125, 0.25 , 0.75, 0.875},
	["SKELETON_FEMALE"]	= {0.125, 0.25 , 0.875, 1.0},
	-- Pandaren Alliance 
    ["TUSKARR_MALE"]	= {0.375, 0.5, 0.25, 0.375},
	["TUSKARR_FEMALE"]	= {0.375, 0.5, 0.375, 0.5},
	-- Void Elf
	["FELORC_MALE"]	= {0.125, 0.25 , 0, 0.125},
	["FELORC_FEMALE"]	= {0.125, 0.25 , 0.125, 0.25},
	-- Nightborne(High Elf)
	["BROKEN_MALE"]	    = {0.875, 1.0 , 0.5, 0.625},
	["BROKEN_FEMALE"]	= {0.875, 1.0 , 0.625, 0.75},
	-- Pandaren
	["FORESTTROLL_MALE"]	= {0.75, 0.875, 0.5, 0.625},
	["FORESTTROLL_FEMALE"]	= {0.75, 0.875, 0.625, 0.75},
	-- Lightforged
	["TAUNKA_MALE"]	= {0.375, 0.5, 0.5, 0.625},
	["TAUNKA_FEMALE"]	= {0.375, 0.5, 0.625, 0.75}, 
	-- Demon Hunter Blood Elf
	["ICETROLL_MALE"]	= {0.5, 0.625, 0.25, 0.375},
	["ICETROLL_FEMALE"]	= {0.5, 0.625, 0.375, 0.5},
	-- Vulpera
	["NAGA__MALE"]	= {0, 0.125, 0.25, 0.375},
	["NAGA__FEMALE"]	= {0, 0.125, 0.375, 0.5},
	-- Demon Hunter Night Elf	
	["NORTHRENDSKELETON_MALE"]	= {0.375, 0.5, 0.25, 0.375},
	["NORTHRENDSKELETON_FEMALE"]	= {0.375, 0.5, 0.375, 0.5},
	-- Eredar
	["EREDAR_MALE"]	    = {0.125, 0.25 , 0.75, 0.875},
	["EREDAR_FEMALE"]	= {0.125, 0.25 , 0.875, 1.0},
	-- Zandalari Troll (OLD)
	["ZANDALARITROLL_MALE"]	    = {0.75, 0.875, 0.5, 0.625},
	["ZANDALARITROLL_FEMALE"]	= {0.75, 0.875, 0.625, 0.75},
};

CLASS_ICON_TCOORDS = {
	["WARRIOR"]	= {0, 0.25, 0, 0.25},
	["MAGE"]	= {0.25, 0.49609375, 0, 0.25},
	["ROGUE"]	= {0.49609375, 0.7421875, 0, 0.25},
	["DRUID"]	= {0.7421875, 0.98828125, 0, 0.25},
	["HUNTER"]	= {0, 0.25, 0.25, 0.5},
	["SHAMAN"]	= {0.25, 0.49609375, 0.25, 0.5},
	["PRIEST"]	= {0.49609375, 0.7421875, 0.25, 0.5},
	["WARLOCK"]	= {0.7421875, 0.98828125, 0.25, 0.5},
	["PALADIN"]	= {0, 0.25, 0.5, 0.75},
	["DEATHKNIGHT"]	= {0.25, 0.49609375, 0.5, 0.75},
	["ENGINEER"] = {0.25, 0.49609375, 0.5, 0.75}
};

BANNER_DEFAULT_TEXTURE_COORDS = {0.109375, 0.890625, 0.201171875, 0.80078125};
BANNER_DEFAULT_SIZE = {200, 308};

CHAR_CUSTOMIZE_HAIR_COLOR = 4;
 
 
function CharacterCreate_OnLoad(self)
	self:RegisterEvent("RANDOM_CHARACTER_NAME_RESULT");
	self:RegisterEvent("GLUE_UPDATE_EXPANSION_LEVEL");

	self:SetSequence(0);
	self:SetCamera(0);

	CharacterCreate.numRaces = 0;
	CharacterCreate.selectedRace = 0;
	CharacterCreate.numClasses = 0;
	CharacterCreate.selectedClass = 0;
	CharacterCreate.selectedGender = 0;

	SetCharCustomizeFrame("CharacterCreate");

	for i=1, NUM_CHAR_CUSTOMIZATIONS, 1 do
		_G["CharCreateCustomizationButton"..i].text:SetText(_G["CHAR_CUSTOMIZATION"..i.."_DESC"]);
	end

	-- Color edit box backdrop
	local backdropColor = FACTION_BACKDROP_COLOR_TABLE["Alliance"];
	CharacterCreateNameEdit:SetBackdropBorderColor(backdropColor[1], backdropColor[2], backdropColor[3]);
	CharacterCreateNameEdit:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6]);
	--[[CharacterCreateNameEdit:SetParent(CharacterCreateFrame)
	CharacterCreateNameEdit:SetPoint("TOPLEFT", CharacterCreateFrame, 635, -30)]]--
	CharCreateCustomizationFrame:SetPoint("RIGHT", CharacterCreateFrame, -50, -10)

	CharacterCreateFrame.state = "CLASSRACE";

	CharCreatePreviewFrame.previews = { };

	CustomizationBG = CharacterCreateFrame:CreateTexture("CustomizationBG", "BACKGROUND")
	CustomizationBG:SetSize(-5, GlueParent:GetHeight())
    CustomizationBG:SetTexture("Interface\\Glues\\CharacterCreate\\Shadowv")
    CustomizationBG:SetPoint("RIGHT")
    CustomizationBG:Hide()

	CustomizationBG2 = CharacterCreateFrame:CreateTexture("CustomizationBG2", "BACKGROUND")
	CustomizationBG2:SetSize(-5, GlueParent:GetHeight())
    CustomizationBG2:SetTexture("Interface\\Glues\\CharacterCreate\\MainShadow")
    CustomizationBG2:SetPoint("CENTER")
    CustomizationBG2:SetAlpha(1)

	CustomizationLogoAlliance = CharacterCreateFrame:CreateTexture("CustomizationLogoAlliance", "ARTWORK")
	CustomizationLogoAlliance:SetSize(100, 100)
    CustomizationLogoAlliance:SetTexture("Interface\\Glues\\CharacterCreate\\AllianceLogo")
    CustomizationLogoAlliance:SetPoint("TOPLEFT", -16, 16)

	CustomizationTextAlliance = CharacterCreateFrame:CreateFontString("CustomizationTextAlliance", "OVERLAY")
    CustomizationTextAlliance:SetFontObject(GlueFontNormal)
    CustomizationTextAlliance:SetFont("Fonts\\FRIZQT__.TTF", 16)
    CustomizationTextAlliance:SetText(string.upper(ALLIANCE))
    CustomizationTextAlliance:SetPoint("LEFT", CustomizationLogoAlliance, "RIGHT", -24, 0)

	CustomizationLogoHorde = CharacterCreateFrame:CreateTexture("CustomizationLogoHorde", "ARTWORK")
	CustomizationLogoHorde:SetSize(100, 100)
    CustomizationLogoHorde:SetTexture("Interface\\Glues\\CharacterCreate\\HordeLogo")
    CustomizationLogoHorde:SetPoint("TOPRIGHT", 16, 16)

	CustomizationTextHorde = CharacterCreateFrame:CreateFontString("CustomizationTextHorde", "OVERLAY")
    CustomizationTextHorde:SetFontObject(GlueFontNormal)
    CustomizationTextHorde:SetFont("Fonts\\FRIZQT__.TTF", 16)
    CustomizationTextHorde:SetText(string.upper(HORDE))
    CustomizationTextHorde:SetPoint("RIGHT", CustomizationLogoHorde, "LEFT", 24, 0)


end

function CharCustomizeButtonClick(id, button)
	if (button == 'LeftButton') then
		for i = 1, math.random(1, 5) do
			CharacterCustomization_Left(id)
		end
	elseif (button == 'RightButton') then
		for i = 1, math.random(1, 5) do
			CharacterCustomization_Right(id)
		end
	end
	-- CycleCharCustomization(id, 1);
	--[[FeatureType = id
	for i=1,5 do
		_G["CharCreateCustomizationButton"..i]:SetChecked(0);
	end
	_G["CharCreateCustomizationButton"..id]:SetChecked(1);]]

end

function CharacterCreate_OnShow()
	for i=1, MAX_CLASSES_PER_RACE, 1 do
		local button = _G["CharCreateClassButton"..i];
		button:Enable();
		--button:SetScale(0.8)
		SetButtonDesaturated(button, false)
	end

	for i=1, MAX_RACES, 1 do
		local button = _G["CharCreateRaceButton"..i] or CreateFrame("CheckButton", "CharCreateRaceButton"..i, CharCreateRaceButtonsFrame, "CharCreateRaceButtonTemplate");
		button:Enable();
		--button:SetScale(0.8)
		SetButtonDesaturated(button, false)
	end

	if ( PAID_SERVICE_TYPE ) then
		CustomizeExistingCharacter( PAID_SERVICE_CHARACTER_ID );
		CharacterCreateNameEdit:SetText( PaidChange_GetName() );
	else
		--randomly selects a combination
		ResetCharCustomize();
		CharacterCreateNameEdit:SetText("");
		CharCreateRandomizeButton:Show();
	end

	CharacterCreateEnumerateRaces(GetAvailableRaces());
	SetCharacterRace(GetSelectedRace());

	CharacterCreateEnumerateClasses(GetAvailableClasses());
	local_,_,index = GetSelectedClass();
	SetCharacterClass(index);
 
	SetCharacterGender(GetSelectedSex()); 
	
	-- Hair customization stuff
	CharacterCreate_UpdateHairCustomization();

	SetCharacterCreateFacing(-15);
	
	if ( ALLOW_RANDOM_NAME_BUTTON ) then
		CharacterCreateRandomName:Hide();
	end
	
	-- setup customization
	CharacterChangeFixup();

	--SetFaceCustomizeCamera(false);
	if(BLIZLIKESERVER == true)then 
		for i=1, MAX_RACES - 1 do 
		local index = i
			if(index == 7 or index == 8 or index == 9 or index == 10 or index == 6 or index == 15 or index == 19 or index == 20 or index == 17 or index == 18)then 
			_G["CharCreateRaceButton"..index]:Hide(); 
			CustomCharCreateRaceButton1:Hide(); 
			CustomCharCreateRaceButton2:Hide(); 
			CustomCharCreateRaceButton3:Hide(); 
			CustomCharCreateRaceButton4:Hide(); 
			end
		end 
		CharCreateClassButton1:SetPoint("BOTTOM", -340, 17);
		CharCreateClassButton2:SetPoint("BOTTOM","CharCreateClassButton1","BOTTOMLEFT", 100, 0);
		CharCreateClassButton3:SetPoint("BOTTOM","CharCreateClassButton2","BOTTOMLEFT", 100, 0);
		CharCreateClassButton4:SetPoint("BOTTOM","CharCreateClassButton3","BOTTOMLEFT", 100, 0);
		CharCreateClassButton5:SetPoint("BOTTOM","CharCreateClassButton4","BOTTOMLEFT", 100, 0);
		CharCreateClassButton7:SetPoint("BOTTOM","CharCreateClassButton5","BOTTOMLEFT", 100, 0);
		CharCreateClassButton8:SetPoint("BOTTOM","CharCreateClassButton7","BOTTOMLEFT", 100, 0);
		CharCreateClassButton9:SetPoint("BOTTOM","CharCreateClassButton8","BOTTOMLEFT", 100, 0);
		CharCreateClassButton10:SetPoint("BOTTOM","CharCreateClassButton9","BOTTOMLEFT", 100, 0);
		CharCreateClassButton11:SetPoint("BOTTOM","CharCreateClassButton6","BOTTOMLEFT", 100, 0);
		CharCreateClassButton6:SetPoint("BOTTOM","CharCreateClassButton10","BOTTOMLEFT", 100, 0);
		
		CharCreateClassButtoHero:Hide();
	else 
		CharCreateClassButton1:SetPoint("BOTTOM", -385, 17);
		CharCreateClassButton2:SetPoint("BOTTOM","CharCreateClassButton1","BOTTOMLEFT", 100, 0);
		CharCreateClassButton3:SetPoint("BOTTOM","CharCreateClassButton2","BOTTOMLEFT", 100, 0);
		CharCreateClassButton4:SetPoint("BOTTOM","CharCreateClassButton3","BOTTOMLEFT", 100, 0);
		CharCreateClassButton5:SetPoint("BOTTOM","CharCreateClassButton4","BOTTOMLEFT", 100, 0);
		CharCreateClassButton7:SetPoint("BOTTOM","CharCreateClassButton5","BOTTOMLEFT", 180, 0);
		CharCreateClassButton8:SetPoint("BOTTOM","CharCreateClassButton7","BOTTOMLEFT", 100, 0);
		CharCreateClassButton9:SetPoint("BOTTOM","CharCreateClassButton8","BOTTOMLEFT", 100, 0);
		CharCreateClassButton10:SetPoint("BOTTOM","CharCreateClassButton9","BOTTOMLEFT", 100, 0);
		CharCreateClassButton11:SetPoint("BOTTOM","CharCreateClassButton6","BOTTOMLEFT", 100, 0);
		CharCreateClassButton6:SetPoint("BOTTOM","CharCreateClassButton10","BOTTOMLEFT", 100, 0);
		
		if(ADD_CUSTOM_CLASS_EXTRA == false)then
			CharCreateClassButton1:SetPoint("BOTTOM", -340, 17);
			CharCreateClassButton2:SetPoint("BOTTOM","CharCreateClassButton1","BOTTOMLEFT", 100, 0);
			CharCreateClassButton3:SetPoint("BOTTOM","CharCreateClassButton2","BOTTOMLEFT", 100, 0);
			CharCreateClassButton4:SetPoint("BOTTOM","CharCreateClassButton3","BOTTOMLEFT", 100, 0);
			CharCreateClassButton5:SetPoint("BOTTOM","CharCreateClassButton4","BOTTOMLEFT", 100, 0);
			CharCreateClassButton7:SetPoint("BOTTOM","CharCreateClassButton5","BOTTOMLEFT", 100, 0);
			CharCreateClassButton8:SetPoint("BOTTOM","CharCreateClassButton7","BOTTOMLEFT", 100, 0);
			CharCreateClassButton9:SetPoint("BOTTOM","CharCreateClassButton8","BOTTOMLEFT", 100, 0);
			CharCreateClassButton10:SetPoint("BOTTOM","CharCreateClassButton9","BOTTOMLEFT", 100, 0);
			CharCreateClassButton11:SetPoint("BOTTOM","CharCreateClassButton6","BOTTOMLEFT", 100, 0);
			CharCreateClassButton6:SetPoint("BOTTOM","CharCreateClassButton10","BOTTOMLEFT", 100, 0);
			
			CharCreateClassButtoHero:Hide();
		end
		if(CLANDESTINOSERVER == true)then
			
			CharCreateRaceButton8:SetPoint("TOPLEFT","CharCreateRaceButton1","BOTTOMLEFT", 86, 37);
		 	CharCreateRaceButton10:SetPoint("TOPLEFT","CharCreateRaceButton8","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton6:SetPoint("TOPLEFT","CharCreateRaceButton10","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton7:SetPoint("TOPLEFT","CharCreateRaceButton6","BOTTOMLEFT", 0, -20);
			
		 	CharCreateRaceButton12:SetPoint("TOPRIGHT","CharacterCreateFrame", -32, -75);
		 	CharCreateRaceButton13:SetPoint("TOPLEFT","CharCreateRaceButton12","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton14:SetPoint("TOPLEFT","CharCreateRaceButton13","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton15:SetPoint("TOPLEFT","CharCreateRaceButton14","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton17:SetPoint("TOPLEFT","CharCreateRaceButton15","BOTTOMLEFT", 0, -20);
			
		 	CharCreateRaceButton20:SetPoint("TOPLEFT","CharCreateRaceButton12","BOTTOMLEFT", -86, 37);
		 	CharCreateRaceButton18:SetPoint("TOPLEFT","CharCreateRaceButton20","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton19:SetPoint("TOPLEFT","CharCreateRaceButton18","BOTTOMLEFT", 0, -20);
		 	CharCreateRaceButton16:SetPoint("TOPLEFT","CharCreateRaceButton19","BOTTOMLEFT", 0, -20);
			
		 	CharCreateRaceButton11:SetPoint("TOPLEFT","CharCreateRaceButton10","BOTTOMLEFT", 83, 22);
		 	CharCreateRaceButton21:SetPoint("TOPLEFT","CharCreateRaceButton18","BOTTOMLEFT", -83, 22);
		-- 	CharCreateRaceButton9:SetPoint("TOPLEFT","CharCreateRaceButton9","BOTTOMLEFT", -83, 22);
			
			CharCreateRaceButton9:Hide(); 
			CustomCharCreateRaceButton1:Hide(); 
			CustomCharCreateRaceButton2:Hide(); 
			CustomCharCreateRaceButton3:Hide(); 
			CustomCharCreateRaceButton4:Hide(); 
		end
	end
end

function CharacterCreate_OnHide()
	PAID_SERVICE_CHARACTER_ID = nil;
	PAID_SERVICE_TYPE = nil;
	if ( CharacterCreateFrame.state == "CUSTOMIZATION" ) then
		CharacterCreate_Back();
	end
	-- character previews will need to be redone if coming back to character create. One reason is all the memory used for
	-- tracking the frames (on the c side) will get released if the user returns to the login screen
	CharCreatePreviewFrame.rebuildPreviews = true;
end

function CharacterCreate_OnEvent(event, arg1, arg2, arg3)
	if ( event == "RANDOM_CHARACTER_NAME_RESULT" ) then
		if ( arg1 == 0 ) then
			-- Failed.  Generate a random name locally.
			CharacterCreateNameEdit:SetText(GenerateRandomName());
		else
			-- Succeeded.  Use what the server sent.
			CharacterCreateNameEdit:SetText(arg2);
		end
		CharacterCreateRandomName:Enable();
		CharCreateOkayButton:Enable();
		PlaySound("gsCharacterCreationLook");
	elseif ( event == "GLUE_UPDATE_EXPANSION_LEVEL" ) then
		-- Expansion level changed while online, so enable buttons as needed
		if ( CharacterCreateFrame:IsShown() ) then
			CharacterCreateEnumerateRaces(GetAvailableRaces());
			CharacterCreateEnumerateClasses(GetAvailableClasses());
		end
	end
end

function CharacterCreateFrame_OnMouseDown(button)
	if ( button == "LeftButton" ) then
		CHARACTER_CREATE_ROTATION_START_X = GetCursorPosition();
		CHARACTER_CREATE_INITIAL_FACING = GetCharacterCreateFacing();
	end
end

function CharacterCreateFrame_OnMouseUp(button)
	if ( button == "LeftButton" ) then
		CHARACTER_CREATE_ROTATION_START_X = nil
	end
end

function CharacterCreateFrame_OnUpdate(self, elapsed)
	if ( CHARACTER_CREATE_ROTATION_START_X ) then
		local x = GetCursorPosition();
		local diff = (x - CHARACTER_CREATE_ROTATION_START_X) * CHARACTER_ROTATION_CONSTANT;
		CHARACTER_CREATE_ROTATION_START_X = GetCursorPosition();
		SetCharacterCreateFacing(GetCharacterCreateFacing() + diff);
		CharCreate_RotatePreviews();
	end
	CharacterCreateWhileMouseDown_Update(elapsed);
end

function CharacterCreateEnumerateRaces(...)
	CharacterCreate.numRaces = select("#", ...)/3;
	if ( CharacterCreate.numRaces > MAX_RACES ) then
		message("Too many races!  Update MAX_RACES");
		return;
	end
	local coords;
	local index = 1;
	local button;
	local gender;
	local selectedSex = GetSelectedSex();
	if ( selectedSex == SEX_MALE ) then
		gender = "MALE";
	else
		gender = "FEMALE";
	end
	for i=1, select("#", ...), 3 do
		local name = select(i, ...);
		
		local unlocalizedname = "DEFAULT";
		
		if(select(i+1, ...))then 
			unlocalizedname = strupper(select(i+1, ...))
		end 

		coords = RACE_ICON_TCOORDS[strupper(select(i+1, ...).."_"..gender)];
		if(coords == nil)then 	
			coords = RACE_ICON_TCOORDS["HUMAN_"..gender];
		end
		local faction = coords[5];
		if(_G["CharCreateRaceButton"..index.."NormalTexture"])then 
			_G["CharCreateRaceButton"..index.."NormalTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
			_G["CharCreateRaceButton"..index.."PushedTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		end
		
		CustomCharCreateRaceButton1NormalTexture:SetTexCoord(0.770, 0.895, 0.625, 0.75);
		CustomCharCreateRaceButton1PushedTexture:SetTexCoord(0.770, 0.895, 0.625, 0.75);
		CustomCharCreateRaceButton1.nameFrame.text:SetText("Drusera"); 
	 	CustomCharCreateRaceButton2NormalTexture:SetTexCoord(0.770, 0.895, 0.75, 0.875);
	 	CustomCharCreateRaceButton2PushedTexture:SetTexCoord(0.770, 0.895, 0.75, 0.875);
		CustomCharCreateRaceButton2.nameFrame.text:SetText("Drusera"); 
		 
		local NewDruseraAbility = ABILITY_INFO_FORESTTROLL1 .. "\n\n";
		NewDruseraAbility = NewDruseraAbility .. ABILITY_INFO_FORESTTROLL2 .. "\n\n";
		NewDruseraAbility = NewDruseraAbility .. ABILITY_INFO_FORESTTROLL3 .. "\n\n";
		CustomCharCreateRaceButton1.tooltip = "|cffFFFFFFDrusera|r\n\n" .. RACE_INFO_DRUSSERA .."\n\n|cffFFFFFF"..NewDruseraAbility;
		CustomCharCreateRaceButton2.tooltip = "|cffFFFFFFDrusera|r\n\n" .. RACE_INFO_DRUSSERA .."\n\n|cffFFFFFF"..NewDruseraAbility;

		CustomCharCreateRaceButton3.tooltip = "|cffFFFFFFDoppelgänger|r\n\n" .. RACE_INFO_DOOPELGANGER .."\n\n|cffFFFFFF"..NewDruseraAbility;
		CustomCharCreateRaceButton4.tooltip = "|cffFFFFFFDoppelgänger|r\n\n" .. RACE_INFO_DOOPELGANGER .."\n\n|cffFFFFFF"..NewDruseraAbility;
 
		CustomCharCreateRaceButton3NormalTexture:SetTexCoord(0.38, 0.505, 0.625, 0.75);
		CustomCharCreateRaceButton3PushedTexture:SetTexCoord(0.38, 0.505, 0.625, 0.75);
		CustomCharCreateRaceButton3.nameFrame.text:SetText("Doppelgänger"); 
	 	CustomCharCreateRaceButton4NormalTexture:SetTexCoord(0.38, 0.505, 0.498, 0.623);
	 	CustomCharCreateRaceButton4PushedTexture:SetTexCoord(0.38, 0.505, 0.498, 0.623);
		CustomCharCreateRaceButton4.nameFrame.text:SetText("Doppelgänger"); 
		
		CustomCharCreateRaceButton1:Enable(); 
		CustomCharCreateRaceButton2:Enable(); 
		CustomCharCreateRaceButton3:Enable(); 
		CustomCharCreateRaceButton4:Enable(); 							
		button = _G["CharCreateRaceButton"..index]; 
		if ( not button  ) then
			return;
		end
		 
	   if(faction)then
		   if(faction == "ALLIANCE")then
				button.borderfaction:SetTexture("Interface\\Glues\\CharacterCreate\\AlliRoundRaceOk");
			else 
				button.borderfaction:SetTexture("Interface\\Glues\\CharacterCreate\\HordeRoundRaceOk");
		   end
	   end
	 	button.borderfaction:Hide();
		
		local textito = string.gsub(button:GetName(), "CharCreateRaceButton", "");  
		if(LIKENUMBERRACES == true)then button.nameFrame.text:SetText(textito); else button.nameFrame.text:SetText(name); end 
			 
		if ( select(i+2, ...) == 1 ) then
			button.enable = true;
			SetButtonDesaturated(button);
		 	button.name = name;
			button.tooltip = name;
		else
			button:Disable();
			SetButtonDesaturated(button, 1);
		 	button.name = name;
			local disabledReason = _G[strupper(select(i+1, ...).."_".."DISABLED")];
			if ( disabledReason ) then
				button.tooltip = name.."|n"..disabledReason;
			else
				button.tooltip = nil;
			end
		end

		local abilityIndex = 1;
		local tempText = _G["ABILITY_INFO_"..unlocalizedname..abilityIndex];
		abilityText = "";
		while ( tempText ) do
			abilityText = abilityText..tempText.."\n\n";
			abilityIndex = abilityIndex + 1;
			tempText = _G["ABILITY_INFO_"..unlocalizedname..abilityIndex];
		end

		text = GetFlavorText("RACE_INFO_"..unlocalizedname, gender);
		
		if(text)then
			button.tooltip = "|r"..text
			button.tooltip = "|cffFFFFFF" .. button.nameFrame.text:GetText() .. "|r\n\n" .. button.tooltip.."\n\n|cffFFFFFF"..abilityText;
		end

		index = index + 1;
	end
	for i=CharacterCreate.numRaces + 1, MAX_RACES, 1 do
	local index = i;
		_G["CharCreateRaceButton"..i]:Hide(); 
	end
	
end

function CharacterCreateEnumerateClasses(...)
	CharacterCreate.numClasses = select("#", ...)/3;
	if ( CharacterCreate.numClasses > MAX_CLASSES_PER_RACE ) then
		message("Too many classes!  Update MAX_CLASSES_PER_RACE");
		return;
	end
	local coords;
	local index = 1;
	local button;
	for i=1, select("#", ...), 3 do
		local unlocalizedname = strupper(select(i+1, ...))

		coords = CLASS_ICON_TCOORDS[strupper(select(i+1, ...))];
		_G["CharCreateClassButton"..index.."NormalTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		_G["CharCreateClassButton"..index.."PushedTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		button = _G["CharCreateClassButton"..index];
		button:Show();
		button.nameFrame.text:SetText(select(i, ...));
		button.tooltip = ""
		button.tooltip2 = ""
		button.tooltip = button.nameFrame.text:GetText()
		
		local abilityIndex = 0;
		local tempText = _G["CLASS_INFO_"..unlocalizedname..abilityIndex];
		local tempText2 = _G["NEW_CLASS_INFO_"..unlocalizedname];
		abilityText = "";
		abilityText2 = "";
		while ( tempText ) do
			abilityText = abilityText..tempText.."\n\n";
			button.tooltip2 = abilityText 	
			abilityText2 = tempText2 .. "";
			abilityIndex = abilityIndex + 1;
			tempText = _G["CLASS_INFO_"..unlocalizedname..abilityIndex];
		end
		if(button.nameFrame.text:GetText() == "Caballero de la Muerte")then 
			button.nameFrame.text:SetText("|n|nCaballero|nde la Muerte");
			button.nameFrame.text:SetPoint("TOP", 2, -40);
		end 
		
		CharCreateClassButtoHeroNormalTexture:SetTexCoord(0.49609370, 0.7421870, 0.5, 0.75);
		CharCreateClassButtoHeroPushedTexture:SetTexCoord(0.49609370, 0.7421870, 0.5, 0.75);
	--	message(CharacterCreate.selectedRace)
		if(CharacterCreate.selectedRace == 900 or CharacterCreate.selectedRace == 2000)then 
			CharCreateClassButtoHero:Enable();
			SetButtonDesaturated(CharCreateClassButtoHero);
			CharCreateClassButtoHeroNormalTexture:SetAlpha(1);
		else
			CharCreateClassButtoHero:Disable();
			SetButtonDesaturated(CharCreateClassButtoHero, 1);
			CharCreateClassButtoHeroNormalTexture:SetAlpha(0.4);
		end
			CharCreateClassButtoHero.nameFrame.text:SetSize(100,0)
			CharCreateClassButtoHero.nameFrame.text:SetText("|n|nLuchador|nErrante");
			CharCreateClassButtoHero.nameFrame.text:SetPoint("TOP", 2, -40);
		
		if ( select(i+2, ...) == 1 ) then
			if (IsRaceClassValid(CharacterCreate.selectedRace, index)) then
			
				local race, _ = GetNameForRace();
				local DeleteClass = GetBGluSpecil(race,"Classes");
				local itsOK = false;
				
				for k, v in pairs(DeleteClass) do 
					if(v == index)then
						itsOK = true;
						break
					end
				end
				
				if(CharacterCreate.selectedRace == 900 or CharacterCreate.selectedRace == 2000)then
					CharCreateClassButtoHeroNormalTexture:SetAlpha(1);
					CharCreateClassButtoHero.nameFrame.text:SetText("|CFFDAA520" .. CharCreateClassButtoHero.nameFrame.text:GetText() .. "|r")
					CharCreateClassButtoHero:Enable();
					SetButtonDesaturated(CharCreateClassButtoHero);
					text = NEW_CLASS_HERO .. "|n|n" 
					CharCreateClassButtoHero.tooltip = "|r"..text
					CharCreateClassButtoHero.tooltip = CharCreateClassButtoHero.tooltip.."Functions: |cffFFFFFF"..NEW_CLASS_HAB.."|r"
				else
					CharCreateClassButtoHeroNormalTexture:SetAlpha(0.4);
					CharCreateClassButtoHero.nameFrame.text:SetText("|CFF696969" .. CharCreateClassButtoHero.nameFrame.text:GetText() .. "|r")
					CharCreateClassButtoHero:Disable();
					SetButtonDesaturated(CharCreateClassButtoHero, 1);
					CharCreateClassButtoHero.tooltip = "|cffFF0000" .. CLASS_DISABLED .."|r";
					text = NEW_CLASS_HERO .. "|n|n" 
					CharCreateClassButtoHero.tooltip = text .. "|cffFFFFFF"..CharCreateClassButtoHero.tooltip.."|r"
					_G["CharCreateClassButton"..index.."DisableTexture"]:Show();
				end
				
				if(itsOK == true)then
						_G["CharCreateClassButton"..index.."NormalTexture"]:SetAlpha(1);
						button.nameFrame.text:SetText("|CFFDAA520" .. button.nameFrame.text:GetText() .. "|r")
						button:Enable();
						SetButtonDesaturated(button);
						text = GetFlavorText("NEW_CLASS_"..strupper(unlocalizedname), "MALE").."|n|n" 
						button.tooltip = "|r"..text
						button.tooltip = button.tooltip.."|cffFFFFFF"..abilityText2.."|r"
						
				else
					_G["CharCreateClassButton"..index.."NormalTexture"]:SetAlpha(0.4);
					button.nameFrame.text:SetText("|CFF696969" .. button.nameFrame.text:GetText() .. "|r")
					button:Disable();
					SetButtonDesaturated(button, 1);
					button.tooltip = "|cffFF0000" .. CLASS_DISABLED .."|r";
					text = GetFlavorText("NEW_CLASS_"..strupper(unlocalizedname), "MALE").."|n|n" 
					button.tooltip = text .. "|cffFFFFFF"..button.tooltip.."|r"
					_G["CharCreateClassButton"..index.."DisableTexture"]:Show();
				end  
			else
				_G["CharCreateClassButton"..index.."NormalTexture"]:SetAlpha(0.4);
				button.nameFrame.text:SetText("|CFF696969" .. button.nameFrame.text:GetText() .. "|r")
				button:Disable();
				SetButtonDesaturated(button, 1);
				button.tooltip = "|cffFF0000" .. CLASS_DISABLED .."|r";
				text = GetFlavorText("NEW_CLASS_"..strupper(unlocalizedname), "MALE").."|n|n" 
				button.tooltip = text .. "|cffFFFFFF"..button.tooltip.."|r"
				_G["CharCreateClassButton"..index.."DisableTexture"]:Show();
			end
		else
			button:Disable();
			SetButtonDesaturated(button, 1);
			_G["CharCreateClassButton"..index.."DisableTexture"]:Show();
		end
				
		index = index + 1; 
	end
	for i=CharacterCreate.numClasses + 1, MAX_CLASSES_PER_RACE, 1 do
		_G["CharCreateClassButton"..i]:Hide();
	end
end

function SetCharacterRace(id)

	for i=1, 4  do
	local button2 = _G["CustomCharCreateRaceButton"..i]
		button2:SetChecked(0); 
	end 
	CharacterCreate.selectedRace = id;
	local selectedButton;
	for i=1, CharacterCreate.numRaces, 1 do
		local button = _G["CharCreateRaceButton"..i] or CreateFrame("CheckButton", "CharCreateRaceButton"..i, CharCreateRaceButtonsFrame, "CharCreateRaceButtonTemplate");
		if ( i == id ) then
			button:SetChecked(1);
		else
			button:SetChecked(0);
		end
	end

	-- Set Faction
	local name, faction = GetFactionForRace(CharacterCreate.selectedRace);

	if faction == nil then
		faction = "Alliance";
	end 
	local canProceed = true; 
	CharCreate_EnableNextButton(canProceed);

	-- Set background
	local backgroundFilename = GetCreateBackgroundModel(faction); 
	if (faction == "Alliance") then 
		SetBackgroundModel(CharacterCreate, "HUMAN",CharacterCreate.selectedRace,1);
	else
		SetBackgroundModel(CharacterCreate, "ORC",CharacterCreate.selectedRace,1);
	end

	if(CharacterCreate.selectedRace == 900 or CharacterCreate.selectedRace == 2000 )then  
		CharCreateMaleButton:Hide()
		CharCreateFemaleButton:Hide()
	else 
		CharCreateMaleButton:Show()
		CharCreateFemaleButton:Show()
		
	end
	-- Set backdrop colors based on faction
	local backdropColor = FACTION_BACKDROP_COLOR_TABLE[faction];
 	CharCreateCustomizationFrameBanner:SetVertexColor(backdropColor[10], backdropColor[11], backdropColor[12]);
	CharacterCreateNameEdit:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6]);
 
	-- race info
	local frame = CharCreateRaceInfoFrame;
	local race, fileString = GetNameForRace();
	frame.title:SetText(race);
	fileString = strupper(fileString);
	local gender;
	if ( GetSelectedSex() == SEX_MALE ) then
		gender = "MALE";
	else
		gender = "FEMALE";
	end
	local raceText = _G["RACE_INFO_"..fileString];
	local abilityIndex = 1;
	local tempText = _G["ABILITY_INFO_"..fileString..abilityIndex];
	abilityText = "";
	while ( tempText ) do
		abilityText = abilityText..tempText.."\n\n";
		abilityIndex = abilityIndex + 1;
		tempText = _G["ABILITY_INFO_"..fileString..abilityIndex];
	end
	CharCreateRaceInfoFrameScrollFrameScrollBar:SetValue(0);
	local text
	text = GetFlavorText("RACE_INFO_"..strupper(fileString), GetSelectedSex())
	if not text then
		text = "Not in GlueXML."
	end
	CharCreateRaceInfoFrame.scrollFrame.scrollChild.infoText:SetText(text.."|n|n");
	if ( abilityText and abilityText ~= "" ) then
		CharCreateRaceInfoFrame.scrollFrame.scrollChild.bulletText:SetText(abilityText);
	else
		CharCreateRaceInfoFrame.scrollFrame.scrollChild.bulletText:SetText("");
	end
 
end

function SetCharacterClass(id)
	if id == 11 then
		return
	end

	CharacterCreate.selectedClass = id;
	for i=1, CharacterCreate.numClasses, 1 do
		local button = _G["CharCreateClassButton"..i];
		if ( i == id ) then
			button:SetChecked(1);
		else
			button:SetChecked(0);
			button.selection:Hide();
		end
	end

	if(CharacterCreate.selectedRace == 900 and id == 10 or CharacterCreate.selectedRace == 2000 and id == 10)then
		CharCreateClassButtoHero:SetChecked(1);
		CharCreateClassButton10:SetChecked(0);
	else
		CharCreateClassButtoHero:SetChecked(0);
	end
	local name, faction = GetFactionForRace(CharacterCreate.selectedRace);

	if faction == nil then
		faction = "Alliance";
	end 
	local canProceed = true; 
	CharCreate_EnableNextButton(canProceed);

	-- Set background
	local backgroundFilename = GetCreateBackgroundModel(faction); 
	if (faction == "Alliance") then 
		SetBackgroundModel(CharacterCreate, "HUMAN",CharacterCreate.selectedRace,1);
	else
		SetBackgroundModel(CharacterCreate, "ORC",CharacterCreate.selectedRace,1);
	end

	-- class info
	local frame = CharCreateClassInfoFrame;
	local className, classFileName, _, tank, healer, damage = GetSelectedClass();
	local namenewclasglobal1 = "";
	local namenewclasglobal2 = "";
	
	--if(CLASS_ALMACENADA)then 
	--	namenewclasglobal1 = _G["CharCreateClassButton"..CLASS_ALMACENADA].nameFrame.text:GetText(); 
	--	namenewclasglobal2 = _G["CharCreateClassButton"..CLASS_ALMACENADA].tooltip2; 
	--end

	if(CharacterCreate.selectedRace == 900 or CharacterCreate.selectedRace == 2000 )then  
		CharCreateMaleButton:Hide();
		CharCreateFemaleButton:Hide();
		
		--if(CLASS_ALMACENADA == 10)then
		--	namenewclasglobal1 = "Luchador Errante";
		--	namenewclasglobal2 = NEW_CLASS_HAB .. "|r|n|n" .. NEW_CLASS_HAB1 .. "|n|n" .. NEW_CLASS_HAB2 .. "|n|n" .. NEW_CLASS_HAB3 .. "|n|n" .. NEW_CLASS_HAB4;  
		--end
	end

    NewHabilidadesText:SetFont("Fonts\\MORPHEUS.TTF", 32, "OUTLINE")
	NewHabilidadesText:SetText(namenewclasglobal1)
	NewHabilidadesText2:SetText("|CFFFFFFFF" .. namenewclasglobal2 .. "|r")
	
	local abilityIndex = 0;
	local abilityIndex2 = 0;
	if not classFileName then
		classFileName = "WARRIOR"
	end
	local tempText = _G["CLASS_INFO_"..classFileName..abilityIndex];
	abilityText = "";
	while ( tempText ) do
		abilityText = abilityText..tempText.."\n\n";
		abilityIndex = abilityIndex + 1;
		tempText = _G["CLASS_INFO_"..classFileName..abilityIndex];
	end 
	CharCreateClassInfoFrame.title:SetText(className);
	CharCreateClassInfoFrame.scrollFrame.scrollChild.bulletText:SetText(abilityText);
	CharCreateClassInfoFrame.scrollFrame.scrollChild.infoText:SetText(GetFlavorText("CLASS_"..strupper(classFileName), GetSelectedSex()).."|n|n");
	CharCreateClassInfoFrameScrollFrameScrollBar:SetValue(0);
	
	if ( CharacterCreateFrame.state == "CLASSRACE" ) then
		local race, _ = GetNameForRace();
		local DeleteClass = GetBGluSpecil(race,"Classes"); 
		
			if(#DeleteClass > 0)then 
				local r = math.random(1,#DeleteClass)
				local RandomClass = DeleteClass[r]
				local itsOK = false;
				for k, v in pairs(DeleteClass) do 
					if(v == id)then
						itsOK = true;
						break
					end
				end 
			end
		if(itsOK == false)then 
			SetSelectedClass(RandomClass)
			id = RandomClass;
		end 
		NewHabilidadesText:Hide()
		NewHabilidadesText2:Hide()
	else 
		NewHabilidadesText:Show()
		NewHabilidadesText2:Show()
	end
end

function CharacterCreate_OnChar()
end

function CharacterCreate_OnKeyDown(key)
	if ( key == "ESCAPE" ) then
		CharacterCreate_Back();
	elseif ( key == "ENTER" ) then
		CharacterCreate_Forward();
	elseif ( key == "PRINTSCREEN" ) then
		Screenshot();
	end
end

function CharacterCreate_UpdateModel(self)
	UpdateCustomizationScene();
	self:AdvanceTime();
end

function CharacterCreate_Finish()
	PlaySound("gsCharacterCreationCreateChar");

	-- If something disabled this button, ignore this message.
	-- This can happen if you press enter while it's disabled, for example.
	if ( not CharCreateOkayButton:IsEnabled() ) then
		return;
	end

	if ( PAID_SERVICE_TYPE ) then
		GlueDialog_Show("CONFIRM_PAID_SERVICE");
	else
		-- if using templates, pandaren must pick a faction
		local _, faction = GetFactionForRace(CharacterCreate.selectedRace);
		--if ( IsUsingCharacterTemplate() and ( faction ~= "Alliance" and faction ~= "Horde" ) ) then
		--	CharacterTemplateConfirmDialog:Show();
		--else  
 		SetSelectedClass(CLASS_ALMACENADA); 
 	--	SetCharacterClass(CLASS_ALMACENADA); 	
 	--	SetCharacterClass(CLASS_ALMACENADA);
		
			CreateCharacter(CharacterCreateNameEdit:GetText());
		--end
	end
end

function CharacterCreate_Back()
	if ( CharacterCreateFrame.state == "CUSTOMIZATION" ) then
		PlaySound("gsCharacterCreationCancel");
		CharacterCreateFrame.state = "CLASSRACE"
		CharCreateClassFrame:Show();
		CharCreateRaceFrame:Show();
		CharCreateMaleButton:Show()
		CharCreateFemaleButton:Show()
		-- CharCreateMoreInfoButton:Show();
		CharCreateCustomizationFrame:Hide();
		CharCreatePreviewFrame:Hide();
		CharCreateOkayButton:SetText(NEXT);
		CharacterCreateNameEdit:Hide();
		CharacterCreateRandomName:Hide();
		CustomizationBG:Hide()
		CharCreateRandomizeButton:Hide()
		CustomizationLogoAlliance:Show()
		CustomizationTextAlliance:Show()
		CustomizationLogoHorde:Show()
		CustomizationTextHorde:Show()

		--back to awesome gear
		--SetSelectedPreviewGearType(1);

		-- back to normal camera
		--SetFaceCustomizeCamera(false);
--		GLOBAL_ZOOM_POS_22 = 0;
		if(CLASS_ALMACENADA > 0 )then 
			SetSelectedClass(CLASS_ALMACENADA); 	
			SetCharacterClass(CLASS_ALMACENADA); 	
		else 
			CLASS_ALMACENADA = 1;
			SetSelectedClass(CLASS_ALMACENADA); 	
			SetCharacterClass(CLASS_ALMACENADA); 
		end
--	local _, faction = GetFactionForRace(CharacterCreate.selectedRace);
--	if (faction == "Alliance") then
--		SetBackgroundModel(CharacterCreate, "HUMAN");
--	else
--		SetBackgroundModel(CharacterCreate, "ORC");
--	end

		return;
	end

	PlaySound("gsCharacterCreationCancel");
	CHARACTER_SELECT_BACK_FROM_CREATE = true;
	SetGlueScreen("charselect"); 
	 
end

function CharacterCreate_UpdateFacialHairCustomization()
	if ( GetFacialHairCustomization() == "NONE" ) then
		CharacterCustomizationButtonFrame5:Hide();
		--CharCreateRandomizeButton:SetPoint("TOP", "CharacterCustomizationButtonFrame5", "BOTTOM", 0, -5);
	else
		CharacterCustomizationButtonFrame5Text:SetText(_G["FACIAL_HAIR_"..GetFacialHairCustomization()]);
		CharacterCustomizationButtonFrame5:Show();
		--CharCreateRandomizeButton:SetPoint("TOP", "CharacterCustomizationButtonFrame5", "BOTTOM", 0, -5);
	end
end

function CharacterCreate_UpdateHairCustomization() 
	CharCreateCustomizationButton1:SetAlpha(1)
	CharCreateCustomizationButton2:SetAlpha(1)
	CharCreateCustomizationButton3:SetAlpha(1)
	CharCreateCustomizationButton4:SetAlpha(1)
	CharCreateCustomizationButton5:SetAlpha(1)
	if not _G["HAIR_"..GetHairCustomization().."_STYLE"] or _G["HAIR_"..GetHairCustomization().."_STYLE"] == "" then
		CharCreateCustomizationButton3:Hide()
		CharCreateCustomizationButton4:SetPoint("TOP", CharCreateCustomizationButton2, "BOTTOM", 0, -20)
	else
		CharCreateCustomizationButton3:Show()
		CharCreateCustomizationButton3.text:SetText(_G["HAIR_"..GetHairCustomization().."_STYLE"])
		--CharCreateCustomizationButton4:SetPoint("TOP", CharCreateCustomizationButton3, "BOTTOM", 0, -20)
	end

	if not _G["HAIR_"..GetHairCustomization().."_COLOR"] or _G["HAIR_"..GetHairCustomization().."_COLOR"] == "" then
		CharCreateCustomizationButton4:Hide()
		if CharCreateCustomizationButton3:IsShown() then
			CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton4, "BOTTOM", 0, 0)
		else
			CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton3, "BOTTOM", 0, 0)
		end
	else
		CharCreateCustomizationButton4:Show()
		CharCreateCustomizationButton4.text:SetText(_G["HAIR_"..GetHairCustomization().."_COLOR"])
		CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton4, "BOTTOM", 0, 0)
	end

	if not _G["FACIAL_HAIR_"..GetFacialHairCustomization()] or _G["FACIAL_HAIR_"..GetFacialHairCustomization()] == "" then
		CharCreateCustomizationButton5:Hide()
	else
		CharCreateCustomizationButton5:Show()
		CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_"..GetFacialHairCustomization()])
	end
	
	
	if(CharacterCreate.selectedRace == 17)then
		if ( GetSelectedSex() == SEX_FEMALE ) then
			CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_EARRINGS"])
		end
		CharCreateCustomizationButton3.text:SetText(_G["HAIR_NORMAL_STYLE"])
		CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton4, "BOTTOM", 0, 0)
		CharCreateCustomizationButton4:Show()
		CharCreateCustomizationButton4.text:SetText(_G["HAIR_NORMAL_COLOR"])
	end
	
	if(CharacterCreate.selectedRace == 19)then 
		if ( GetSelectedSex() == SEX_MALE ) then
			CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton3, "BOTTOM", 0, 0)
			CharCreateCustomizationButton4:Hide()
		end
	end
	
	--if(CharacterCreate.selectedRace == 15)then 
		--CharCreateCustomizationButton5.text:SetText("Features")
	--end
	
	if(CharacterCreate.selectedRace == 18)then 
		CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_FEATURES"])
	end
	
	if(CharacterCreate.selectedRace == 11)then 
		CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_FEATURES"])
	end
	
	if(CharacterCreate.selectedRace == 21)then 
		CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_FEATURES"])
	end
	
	if(CharacterCreate.selectedRace == 6)then 
		CharCreateCustomizationButton5:Hide()
	end
	
	if(CharacterCreate.selectedRace == 7)then  
		if ( GetSelectedSex() == SEX_FEMALE ) then
			CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_EARRINGS"])
		end
		CharCreateCustomizationButton3.text:SetText(_G["HAIR_NORMAL_STYLE"])
		CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton4, "BOTTOM", 0, 0)
		CharCreateCustomizationButton4:Show()
		CharCreateCustomizationButton4.text:SetText(_G["HAIR_NORMAL_COLOR"])
	end
	
	if(CharacterCreate.selectedRace == 8)then  
		if ( GetSelectedSex() == SEX_FEMALE ) then
			CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_FEATURES"])
		end
		CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton3, "BOTTOM", 0, 0)
		CharCreateCustomizationButton4:Hide()
	end
	
	if(CharacterCreate.selectedRace == 900 or CharacterCreate.selectedRace == 2000)then   
		CharCreateCustomizationButton1:SetAlpha(0)
		CharCreateCustomizationButton2:SetAlpha(0)
		CharCreateCustomizationButton3:SetAlpha(0)
		CharCreateCustomizationButton4:SetAlpha(0)
		CharCreateCustomizationButton5:SetAlpha(0)
	end
	
	

end

function CharacterCreate_Forward()
	 
	if ( CharacterCreateFrame.state == "CLASSRACE" ) then
	
		CLASS_ALMACENADA = CharacterCreate.selectedClass;
		
		CharacterCreateFrame.state = "CUSTOMIZATION"
		PlaySound("gsCharacterSelectionCreateNew");
		CharCreateClassFrame:Hide();
		CharCreateRaceFrame:Hide(); 
		CharCreateCustomizationFrame:Show();
		CharacterCreate_UpdateHairCustomization() 
		CharacterTemplateConfirmDialog:Hide();

		CharCreate_PrepPreviewModels();
		
		if ( CharacterCreateFrame.customizationType ) then
			CharCreate_ResetFeaturesDisplay();
		else
			CharCreateSelectCustomizationType(1);
		end
		
		CharCreateOkayButton:SetText(FINISH);
		CharacterCreateNameEdit:Show();
		if ( ALLOW_RANDOM_NAME_BUTTON ) then
			CharacterCreateRandomName:Show();
		end

		CharCreateMaleButton:Hide()
		CharCreateFemaleButton:Hide()
		CustomizationBG:Show()
		CharCreateRandomizeButton:Show()
		CustomizationLogoAlliance:Hide()
		CustomizationTextAlliance:Hide()
		CustomizationLogoHorde:Hide()
		CustomizationTextHorde:Hide()

 	local race, _ = GetNameForRace();
 	if(CLASS_ALMACENADA ~= 6)then 
		SetSelectedClass(CLASS_ALMACENADA);
 		SetCharacterClass(CLASS_ALMACENADA);
		
	--	SetSelectedClass(GetBGluSpecil(race,"NoClass"));
 	--	SetCharacterClass(GetBGluSpecil(race,"NoClass"));
	else
	
		--local namenewclasglobal1 = _G["CharCreateClassButton"..CLASS_ALMACENADA].nameFrame.text:GetText(); 
		--local namenewclasglobal2 = _G["CharCreateClassButton"..CLASS_ALMACENADA].tooltip2; 
		-- 
		--NewHabilidadesText:SetFont("Fonts\\MORPHEUS.TTF", 32, "OUTLINE")
		--NewHabilidadesText:SetText("Caballero de la muerte")
		--NewHabilidadesText2:SetText("|CFFFFFFFF" .. namenewclasglobal2 .. "|r")
		--
		--NewHabilidadesText:Show();
		--NewHabilidadesText2:Show();
	
 	end 
--	local backgroundFilenamS = GetBGluSpecil(race, "name");
--	OnUpdateStats();
--	SetBackgroundModel2(CharacterCreate, backgroundFilenamS);  

	else
		CharacterCreate_Finish();
	end

--				SetCharCustomizeBackground("Interface\\Glues\\Models\\UI_Alliance_zoom_humano\\UI_Alliance_zoom_humanob.m2");	
end

function CharCreateCustomizationFrame_OnShow ()
	-- reset size/tex coord to default to facilitate switching between genders for Pandaren
	CharCreateCustomizationFrameBanner:SetSize(BANNER_DEFAULT_SIZE[1], BANNER_DEFAULT_SIZE[2]);
	CharCreateCustomizationFrameBanner:SetTexCoord(BANNER_DEFAULT_TEXTURE_COORDS[1], BANNER_DEFAULT_TEXTURE_COORDS[2], BANNER_DEFAULT_TEXTURE_COORDS[3], BANNER_DEFAULT_TEXTURE_COORDS[4]);

	-- check each button and hide it if there are no values select
	local resize = 0;
	local lastGood = 0;
	local isSkinVariantHair = false --GetSkinVariationIsHairColor(CharacterCreate.selectedRace);
	local isDefaultSet = 0;
	local checkedButton = 1;

	-- check if this was set, if not, default to 1
	if ( CharacterCreateFrame.customizationType == 0 or CharacterCreateFrame.customizationType == nil ) then
		CharacterCreateFrame.customizationType = 1;
	end
	for i=1, NUM_CHAR_CUSTOMIZATIONS, 1 do
		if ( ( --[[GetNumFeatureVariationsForType(i)]]5 <= 1 ) or ( isSkinVariantHair and i == CHAR_CUSTOMIZE_HAIR_COLOR ) ) then
			resize = resize + 1;
			_G["CharCreateCustomizationButton"..i]:Hide();
		else
			_G["CharCreateCustomizationButton"..i]:Show();
			--_G["CharCreateCustomizationButton"..i]:SetChecked(0); -- we will handle default selection
			-- this must be done since a selected button can 'disappear' when swapping genders
			if ( isDefaultSet == 0 and CharacterCreateFrame.customizationType == i) then
				isDefaultSet = 1;
				checkedButton = i;
			end
			-- set your anchor to be the last good, this currently means button 1 HAS to be shown
			if (i > 1) then
				_G["CharCreateCustomizationButton"..i]:SetPoint( "TOP",_G["CharCreateCustomizationButton"..lastGood]:GetName() , "BOTTOM");
			end
			lastGood = i;
		end
	end

	if (isDefaultSet == 0) then
		CharacterCreateFrame.customizationType = lastGood;
		checkedButton = lastGood;
	end
	--_G["CharCreateCustomizationButton"..checkedButton]:SetChecked(1);

	if (resize > 0) then
	-- we need to resize and remap the banner texture
		local buttonx, buttony = CharCreateCustomizationButton1:GetSize()
		local screenamount = resize*buttony;
		print(screenamount);
		local frameX, frameY = CharCreateCustomizationFrameBanner:GetSize();
		local pctShrink = .2*resize;
		local uvXDefaultSize = BANNER_DEFAULT_TEXTURE_COORDS[2] - BANNER_DEFAULT_TEXTURE_COORDS[1];
		local uvYDefaultSize = BANNER_DEFAULT_TEXTURE_COORDS[4] - BANNER_DEFAULT_TEXTURE_COORDS[3];
		local newYUV = pctShrink*uvYDefaultSize + BANNER_DEFAULT_TEXTURE_COORDS[3];
		-- end coord stay the same
		CharCreateCustomizationFrameBanner:SetTexCoord(BANNER_DEFAULT_TEXTURE_COORDS[1], BANNER_DEFAULT_TEXTURE_COORDS[2], newYUV, BANNER_DEFAULT_TEXTURE_COORDS[4]);
		print(pctShrink);
		CharCreateCustomizationFrameBanner:SetSize(frameX, frameY - screenamount);
		print(CharCreateCustomizationFrameBanner:GetTexCoord());
	end

	--CharCreateRandomizeButton:SetPoint("TOP", _G["CharCreateCustomizationButton"..lastGood]:GetName(), "BOTTOM", 0, 0);
end

function CharacterClass_OnClick(self, id)
	if( self:IsEnabled() ) then
		PlaySound("gsCharacterCreationClass");
		local _,_,currClass = GetSelectedClass();
		if ( currClass ~= id ) then
			SetSelectedClass(id);
			SetCharacterClass(id);
			SetCharacterRace(GetSelectedRace());
			CharacterChangeFixup();
		else
			self:SetChecked(1); 
		end
				if(CharacterCreate.selectedRace == 900 and id == 10 or CharacterCreate.selectedRace == 2000 and id == 10)then
				  	CharCreateClassButtoHero:SetChecked(1);
					CharCreateClassButton10:SetChecked(0);
				else
					CharCreateClassButtoHero:SetChecked(0);
				end
				
	else
		self:SetChecked(0);
	end
end

function CharacterRace_OnClick(self, id, forceSelect)
	if( self:IsEnabled() ) then
		PlaySound("gsCharacterCreationClass");
		if ( GetSelectedRace() ~= id or forceSelect ) then
			SetSelectedRace(id);
			SetCharacterRace(id);
			--[[if ( id == TUSKARR_RACE_ID ) then
				SetCharacterGender(SEX_MALE);
			else]]
				SetCharacterGender(GetSelectedSex());
			--end
			SetCharacterCreateFacing(-15);
			CharacterCreateEnumerateClasses(GetAvailableClasses());
			local _,_,classIndex = GetSelectedClass();
			if ( PAID_SERVICE_TYPE ) then
				classIndex = PaidChange_GetCurrentClassIndex();
				SetSelectedClass(classIndex);	-- selecting a race would have changed class to default
			end
			SetCharacterClass(classIndex);

			-- Hair customization stuff
			CharacterCreate_UpdateHairCustomization();

			CharacterChangeFixup();
		else
			self:SetChecked(1);
		end
	else
		self:SetChecked(0);
	end
end

function SetCharacterGender(sex)
	local gender;

	if ( sex == SEX_MALE ) then
		CharCreateMaleButton:SetChecked(1);
		CharCreateFemaleButton:SetChecked(0);
	else
		CharCreateMaleButton:SetChecked(0);
		CharCreateFemaleButton:SetChecked(1);
	end
	SetSelectedSex(sex);

	-- Update race images to reflect gender
	CharacterCreateEnumerateRaces(GetAvailableRaces());
	CharacterCreateEnumerateClasses(GetAvailableClasses());
 	SetCharacterRace(GetSelectedRace());

	local _,_,classIndex = GetSelectedClass();
	if ( PAID_SERVICE_TYPE ) then
		classIndex = PaidChange_GetCurrentClassIndex();
		-- PandarenFactionButtons_SetTextures();
	end
	SetCharacterClass(classIndex);

	CharacterCreate_UpdateHairCustomization();
	CharacterChangeFixup();

	-- Update preview models if on customization step
	if ( CharCreatePreviewFrame:IsShown() ) then
		CharCreateCustomizationFrame_OnShow(); -- buttons may need to reset for dirty Pandarens
		CharCreate_PrepPreviewModels();
		CharCreate_ResetFeaturesDisplay();
	end
end

function CharacterCustomization_Left(id)
	PlaySound("gsCharacterCreationLook");
	CycleCharCustomization(id, -1);
end

function CharacterCustomization_Right(id)
	PlaySound("gsCharacterCreationLook");
	CycleCharCustomization(id, 1);
end

function CharacterCreate_GenerateRandomName(button)
	CharacterCreateNameEdit:SetText(GetRandomName());
end

function CharacterCreate_Randomize()
	PlaySound("gsCharacterCreationLook");
	RandomizeCharCustomization();
	CharCreate_ResetFeaturesDisplay();
end

function CharacterCreateRotateRight_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterCreateFacing(GetCharacterCreateFacing() + CHARACTER_FACING_INCREMENT);
		CharCreate_RotatePreviews();
	end
end

function CharacterCreateRotateLeft_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterCreateFacing(GetCharacterCreateFacing() - CHARACTER_FACING_INCREMENT);
		CharCreate_RotatePreviews();
	end
end

function SetButtonDesaturated(button, desaturated)
	if ( not button ) then
		return;
	end
	local icon = button:GetNormalTexture();
	if ( not icon ) then
		return;
	end

	icon:SetDesaturated(desaturated);
end

function GetFlavorText(tagname, sex)
	local primary, secondary;
	if ( sex == SEX_MALE ) then
		primary = "";
		secondary = "_FEMALE";
	else
		primary = "_FEMALE";
		secondary = "";
	end
	local text = _G[tagname..primary];
	if ( (text == nil) or (text == "") ) then
		text = _G[tagname..secondary];
	end
	return text;
end

function CharacterChangeFixup()
	if ( PAID_SERVICE_TYPE ) then
		-- no class changing as a paid service
		if(CLANDESTINOSERVER == false)then 
			CustomCharCreateRaceButton1:Disable(); -- Drusera Alianza
			SetButtonDesaturated(CustomCharCreateRaceButton1, 1); -- Drusera Alianza
			CustomCharCreateRaceButton1.nameFrame.text:SetAlpha(0.3); -- Drusera Alianza
			CustomCharCreateRaceButton2:Disable(); -- Drusera Horda
			SetButtonDesaturated(CustomCharCreateRaceButton2, 1); -- Drusera Horda
			CustomCharCreateRaceButton2.nameFrame.text:SetAlpha(0.3); -- Drusera Horda
			CustomCharCreateRaceButton3:Disable(); -- Doopel Alianza
			SetButtonDesaturated(CustomCharCreateRaceButton3, 1); -- Drusera Alianza
			CustomCharCreateRaceButton3.nameFrame.text:SetAlpha(0.3); -- Drusera Alianza
			CustomCharCreateRaceButton4:Disable(); -- Doopel Horda
			SetButtonDesaturated(CustomCharCreateRaceButton4, 1); -- Drusera Horda
			CustomCharCreateRaceButton4.nameFrame.text:SetAlpha(0.3); -- Drusera Horda 
			
			CustomCharCreateRaceButton1.tooltip = "|cffFF0000Incompatible|r\n\n|cffFFFFFFYou cannot change to this race.";
			CustomCharCreateRaceButton2.tooltip = "|cffFF0000Incompatible|r\n\n|cffFFFFFFYou cannot change to this race.";
			CustomCharCreateRaceButton3.tooltip = "|cffFF0000Incompatible|r\n\n|cffFFFFFFYou cannot change to this race.";
			CustomCharCreateRaceButton4.tooltip = "|cffFF0000Incompatible|r\n\n|cffFFFFFFYou cannot change to this race.";
			
		end
		for i=1, MAX_CLASSES_PER_RACE, 1 do
			if (CharacterCreate.selectedClass ~= i) then 
				local button = _G["CharCreateClassButton"..i];  
				_G["CharCreateClassButton"..i.."NormalTexture"]:SetAlpha(0.4);
				if(i == 1)then button.nameFrame.text:SetText("|CFF696969".._G["_WARRIOR"].."|r")
				elseif(i == 2)then button.nameFrame.text:SetText("|CFF696969".._G["_PALADIN"].."|r")
				elseif(i == 3)then button.nameFrame.text:SetText("|CFF696969".._G["_HUNTER"].."|r")
				elseif(i == 4)then button.nameFrame.text:SetText("|CFF696969".._G["_ROGUE"].."|r")
				elseif(i == 5)then button.nameFrame.text:SetText("|CFF696969".._G["_PRIEST"].."|r")
				elseif(i == 6)then button.nameFrame.text:SetText("|CFF696969".._G["_DEATH_KNIGHT"].."|r")
				elseif(i == 7)then button.nameFrame.text:SetText("|CFF696969".._G["_SHAMAN"].."|r")
				elseif(i == 8)then button.nameFrame.text:SetText("|CFF696969".._G["_MAGE"].."|r")
				elseif(i == 9)then button.nameFrame.text:SetText("|CFF696969".._G["_WARLOCK"].."|r")
				elseif(i == 10)then button.nameFrame.text:SetText("|CFF696969".._G["_DRUID"].."|r")
				end
				button:Disable();
				SetButtonDesaturated(button, 1); 
				_G["CharCreateClassButton"..index.."DisableTexture"]:Show();  
			end
		end

			local fact = CharacterCreate.selectedRace;
			if(GLOBAL_RACE_CHANGE == 0)then 
				GLOBAL_RACE_CHANGE = CharacterCreate.selectedRace;  
			end 
			
			if ( PAID_SERVICE_TYPE == PAID_FACTION_CHANGE ) then
				local factionGlobalX = GetBGluSpecil(GLOBAL_RACE_CHANGE,"faction2");
				
				for i=1,MAX_RACES do
					local buttonrace = _G["CharCreateRaceButton"..i];
					if (GLOBAL_RACE_CHANGE ~= i) then 
						buttonrace.nameFrame.text:SetAlpha(0.3);
						buttonrace:Disable(); 
						buttonrace.tooltip = _G["_CHANGE_RACE_NOT_ALLOWED"];
						SetButtonDesaturated(buttonrace, 1); 
						local clases = GetBGluSpecil(i,"Classes"); 
						local facto = GetBGluSpecil(i,"faction2"); 
							for k, v in pairs(clases) do
								if(v == CharacterCreate.selectedClass)then  
									if(factionGlobalX ~= facto)then
										buttonrace.nameFrame.text:SetAlpha(1);
										buttonrace:Enable(); 
										SetButtonDesaturated(buttonrace);
										buttonrace.tooltip = _G["_COMPATIBLE_RACE"];
										
										if(CLANDESTINOSERVER == false)then 
											if(i == 900)then 
												CustomCharCreateRaceButton1:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton1);
												CustomCharCreateRaceButton1.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton3:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton3); 
												CustomCharCreateRaceButton3.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton1.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
												CustomCharCreateRaceButton3.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
											end
											if(i == 2000)then 
												CustomCharCreateRaceButton2:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton2);
												CustomCharCreateRaceButton2.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton4:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton4);
												CustomCharCreateRaceButton4.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton2.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
												CustomCharCreateRaceButton4.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
											end
										end
									end 
								end
							end 
					else
						buttonrace.nameFrame.text:SetAlpha(1);
					end
				end 
			
			elseif ( PAID_SERVICE_TYPE == PAID_RACE_CHANGE ) then
				
				local factionGlobalX = GetBGluSpecil(GLOBAL_RACE_CHANGE,"faction2");
				
				for i=1,MAX_RACES do
					local buttonrace = _G["CharCreateRaceButton"..i];
					if (GLOBAL_RACE_CHANGE ~= i) then 
						buttonrace.nameFrame.text:SetAlpha(0.3);
						buttonrace:Disable();
						buttonrace.tooltip = _G["_CHANGE_RACE_NOT_ALLOWED"];
						SetButtonDesaturated(buttonrace, 1);
						local clases = GetBGluSpecil(i,"Classes"); 
						local facto = GetBGluSpecil(i,"faction2"); 
							for k, v in pairs(clases) do
								if(v == CharacterCreate.selectedClass)then  
									if(factionGlobalX == facto)then
										buttonrace.nameFrame.text:SetAlpha(1);
										buttonrace:Enable(); 
										SetButtonDesaturated(buttonrace);
										buttonrace.tooltip = _G["_COMPATIBLE_RACE"];
										
										if(CLANDESTINOSERVER == false)then 
											if(i == 900)then 
												CustomCharCreateRaceButton1:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton1);
												CustomCharCreateRaceButton1.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton3:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton3); 
												CustomCharCreateRaceButton3.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton1.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
												CustomCharCreateRaceButton3.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
											end
											if(i == 2000)then 
												CustomCharCreateRaceButton2:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton2);
												CustomCharCreateRaceButton2.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton4:Enable(); 
												SetButtonDesaturated(CustomCharCreateRaceButton4);
												CustomCharCreateRaceButton4.nameFrame.text:SetAlpha(1); 
												CustomCharCreateRaceButton2.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
												CustomCharCreateRaceButton4.tooltip = "|cffFFFFFFCompatible race:|n|nYou can change to this race";
											end
										end
									end 
								end
							end 
					else 
						buttonrace.nameFrame.text:SetAlpha(1);
					end
				end 
			
			
			elseif ( PAID_SERVICE_TYPE == PAID_CHARACTER_CUSTOMIZATION ) then
			
				for i=1,MAX_RACES do
					local buttonrace = _G["CharCreateRaceButton"..i];
					if (GLOBAL_RACE_CHANGE ~= i) then 
						buttonrace.tooltip = _G["_EDIT_RACE_NOT_ALLOWED"];
						buttonrace:Disable();
						SetButtonDesaturated(buttonrace, 1); 
						buttonrace.nameFrame.text:SetAlpha(0.2);
					else 
						buttonrace.nameFrame.text:SetAlpha(1);
					end 
				end 
			
			end
			CharacterCreateTooltip:Hide();
	else
		SetButtonDesaturated(CustomCharCreateRaceButton1);
		SetButtonDesaturated(CustomCharCreateRaceButton2);
		SetButtonDesaturated(CustomCharCreateRaceButton3);
		SetButtonDesaturated(CustomCharCreateRaceButton4);
		 
		CustomCharCreateRaceButton1.nameFrame.text:SetAlpha(1);  
		CustomCharCreateRaceButton3.nameFrame.text:SetAlpha(1);  
		CustomCharCreateRaceButton2.nameFrame.text:SetAlpha(1);  
		CustomCharCreateRaceButton4.nameFrame.text:SetAlpha(1); 
			
		for i=1,MAX_RACES do 
			local buttonrace = _G["CharCreateRaceButton"..i];
			buttonrace.nameFrame.text:SetAlpha(1);
			buttonrace:Enable(); 
			SetButtonDesaturated(buttonrace);
		end 
		
		CharCreateRaceButtonsFrame:SetAlpha(1);
		CharCreateClassFrame:SetAlpha(1);
	end
end

function CharCreateSelectCustomizationType(newType)
	-- deselect previous type selection
	if ( CharacterCreateFrame.customizationType and CharacterCreateFrame.customizationType ~= newType ) then
		--_G["CharCreateCustomizationButton"..CharacterCreateFrame.customizationType]:SetChecked(0);
	end
	--_G["CharCreateCustomizationButton"..newType]:SetChecked(1);
	CharacterCreateFrame.customizationType = newType;
	CharCreate_ResetFeaturesDisplay();

	--[[if (newType > 1) then
		SetFaceCustomizeCamera(true);
	else
		SetFaceCustomizeCamera(false);
	end]]
end
function CharCreate_ResetFeaturesDisplay()
	--SetPreviewFramesFeature(CharacterCreateFrame.customizationType);
	-- set the previews scrollframe container height
	-- since the first and the last previews need to be in the center position when scrolled all the way
	-- to the top or to the bottom, there will be gaps of height equal to 2 previews on each side
	local numTotalButtons = 4--GetNumFeatureVariations() + 4;
	CharCreatePreviewFrame.scrollFrame.container:SetHeight(numTotalButtons * PREVIEW_FRAME_HEIGHT - PREVIEW_FRAME_Y_OFFSET);

	for _, previewFrame in pairs(CharCreatePreviewFrame.previews) do
		previewFrame.featureType = 0;
	end

	CharCreate_DisplayPreviewModels();
end

function CharCreate_PrepPreviewModels(reloadModels)
	local displayFrame = CharCreatePreviewFrame;

	-- clear models if rebuildPreviews got flagged
	local rebuildPreviews = displayFrame.rebuildPreviews;
	displayFrame.rebuildPreviews = nil;

	-- need to reload models class was swapped to or from DK
	local classSwap = false;
	local _, class = GetSelectedClass();
	--[[if ( class == "DEATHKNIGHT" or displayFrame.lastClass == "DEATHKNIGHT" ) and ( class ~= displayFrame.lastClass ) then
		classSwap = true;
	end]]

	-- always clear the featureType
	for index, previewFrame in pairs(displayFrame.previews) do
		previewFrame.featureType = 0;
		-- force model reload if class changed
		if ( classSwap ) then
			previewFrame.race = nil;
			previewFrame.gender = nil;
		end
		if ( rebuildPreviews ) then
			--SetPreviewFrame(previewFrame.model:GetName(), index);
		end
	end
end

function CharCreate_DisplayPreviewModels(selectionIndex)
	if ( not selectionIndex ) then
		selectionIndex = featureIndex--GetSelectedFeatureVariation();
	end

	local displayFrame = CharCreatePreviewFrame;
	local previews = displayFrame.previews;
	local numVariations = 8--GetNumFeatureVariations();
	local currentFeatureType = CharacterCreateFrame.customizationType;

	local race = GetSelectedRace();
	local gender = GetSelectedSex();

	-- selection index is the center preview
	-- there are 2 previews above and 2 below, and will pad it out to 1 more on each side, for a total of 7 previews to set up
	for index = selectionIndex - 3, selectionIndex + 3 do
		-- there is empty space both at the beginning and at end of the list, each gap the height of 2 previews
		if ( index > 0 and index <= numVariations ) then
			local previewFrame = previews[index];
			-- create button if we don't have it yet
			if ( not previewFrame ) then
				previewFrame = CreateFrame("BUTTON", "PreviewFrame"..index, displayFrame.scrollFrame.container, "CharCreatePreviewFrameTemplate");
				-- index + 1 because of 2 gaps at the top and -1 for the current preview
				previewFrame:SetPoint("TOPLEFT", PREVIEW_FRAME_X_OFFSET, (index + 1) * -PREVIEW_FRAME_HEIGHT + PREVIEW_FRAME_Y_OFFSET);
				previewFrame.button.index = index;
				previews[index] = previewFrame;
				--SetPreviewFrame(previewFrame.model:GetName(), index);
				-- no texture as of yet
				--previewFrame:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
			end
			-- load model if needed, may have been cleared by different race/gender selection
			if ( previewFrame.race ~= race or previewFrame.gender ~= gender ) then
				--SetPreviewFrameModel(index);
				previewFrame.race = race;
				previewFrame.gender = gender;
				-- apply settings
				local model = previewFrame.model;
				--model:SetCustomCamera(cameraID);
				local scale = 1--model:GetWorldScale();
				--model:SetCameraTarget(config.tx * scale, config.ty * scale, config.tz * scale);
				--model:SetCameraDistance(config.distance * scale);
				local cx, cy, cz = model:GetPosition();
				-- model:SetPosition(cx-15, cy, cz)
				--model:SetCameraPosition(cx, cy, config.cz * scale);
				previewFrame.model:SetLight(1, 0, 0, 0, 0, 1, 1.0, 1.0, 1.0);
			end
			-- need to reset the model if it was last used to preview a different feature
			if ( previewFrame.featureType ~= currentFeatureType ) then
				--ResetPreviewFrameModel(index);
				--ShowPreviewFrameVariation(index);
				previewFrame.featureType = currentFeatureType;
			end
			previewFrame:Show();
		else
			-- need to hide tail previews when going to features with fewer styles
			if ( previews[index] ) then
				previews[index]:Hide();
			end
		end
	end
	displayFrame.border.number:SetText("Option "..selectionIndex.."                     ");
	displayFrame.selectionIndex = selectionIndex;
	CharCreate_RotatePreviews();
	CharCreatePreviewFrame_UpdateStyleButtons();
	-- scroll to center the selection
	if ( not displayFrame.animating ) then
		displayFrame.scrollFrame:SetVerticalScroll((selectionIndex - 1) * PREVIEW_FRAME_HEIGHT);
	end
end


function CharCreate_RotatePreviews()
	if ( CharCreatePreviewFrame:IsShown() ) then
		local facing = ((GetCharacterCreateFacing())/ -180) * math.pi;
		local previews = CharCreatePreviewFrame.previews;
		--CharCreatePreviewFrame.selectionIndex = 0;
		for index = CharCreatePreviewFrame.selectionIndex - 3, CharCreatePreviewFrame.selectionIndex + 3 do
			local previewFrame = previews[index];
			if ( previewFrame ) then -- and previewFrame.model:HasCustomCamera()
				--previewFrame.model:SetCameraFacing(facing);
			end
		end
	end
end

function CharCreate_ChangeFeatureVariation(delta)
	local numVariations = 8--GetNumFeatureVariations();
	local startIndex = featureIndex--GetSelectedFeatureVariation();
	local endIndex = startIndex + delta;
	if ( endIndex < 1 or endIndex > numVariations ) then
		return;
	end
	PlaySound("gsCharacterCreationClass");
	featureIndex = endIndex
	CharCreatePreviewFrame_SelectFeatureVariation(endIndex);
end

function CharCreatePreviewFrameButton_OnClick(self)
	PlaySound("gsCharacterCreationClass");
	CharCreatePreviewFrame_SelectFeatureVariation(self.index);
end

function CharCreatePreviewFrame_SelectFeatureVariation(endIndex)
	local self = CharCreatePreviewFrame;
	if ( self.animating ) then
		if ( not self.queuedIndex ) then
			self.queuedIndex = endIndex;
		end
	else
		local startIndex = featureIndex--GetSelectedFeatureVariation();
		--SelectFeatureVariation(endIndex);
		for i=1,endIndex do
			CycleCharCustomization(FeatureType, 1);
		end
		CharCreatePreviewFrame_UpdateStyleButtons();
		featureIndex = endIndex
		CharCreatePreviewFrame_StartAnimating(startIndex, endIndex);
	end
end

function CharCreatePreviewFrame_StartAnimating(startIndex, endIndex)
	local self = CharCreatePreviewFrame;
	if ( self.animating ) then
		return;
	else
		self.startIndex = startIndex;
		self.currentIndex = startIndex;
		self.endIndex = endIndex;
		self.queuedIndex = nil;
		self.direction = 1;
		if ( self.startIndex > self.endIndex ) then
			self.direction = -1;
		end
		self.movedTotal = 0;
		self.moveUntilUpdate = PREVIEW_FRAME_HEIGHT;
		self.animating = true;
	end
end

function CharCreatePreviewFrame_StopAnimating()
	local self = CharCreatePreviewFrame;
	if ( self.animating ) then
		self.animating = false;
	end
end

local ANIMATION_SPEED = 5;
function CharCreatePreviewFrame_OnUpdate(self, elapsed)
	if ( self.animating ) then
		local moveIncrement = PREVIEW_FRAME_HEIGHT * elapsed * ANIMATION_SPEED;
		self.movedTotal = self.movedTotal + moveIncrement;
		self.scrollFrame:SetVerticalScroll((self.startIndex - 1) * PREVIEW_FRAME_HEIGHT + self.movedTotal * self.direction);
		self.moveUntilUpdate = self.moveUntilUpdate - moveIncrement;
		if ( self.moveUntilUpdate <= 0 ) then
			self.currentIndex = self.currentIndex + self.direction;
			self.moveUntilUpdate = PREVIEW_FRAME_HEIGHT;
			-- reset movedTotal to account for rounding errors
			self.movedTotal = abs(self.startIndex - self.currentIndex) * PREVIEW_FRAME_HEIGHT;
			CharCreate_DisplayPreviewModels(self.currentIndex);
		end
		if ( self.currentIndex == self.endIndex ) then
			self.animating = false;
			CharCreate_DisplayPreviewModels();
			if ( self.queuedIndex ) then
				local newIndex = self.queuedIndex;
				self.queuedIndex = nil;
				--SelectFeatureVariation(newIndex);
				featureIndex = newIndex
				CycleCharCustomization(FeatureType, featureIndex);
				CharCreatePreviewFrame_UpdateStyleButtons();
				CharCreatePreviewFrame_StartAnimating(self.endIndex, newIndex);
			end
		end
	end
end

function CharCreatePreviewFrame_UpdateStyleButtons()
	local selectionIndex = math.random(1,5)--GetSelectedFeatureVariation();
	local numVariations = 8--GetNumFeatureVariations();
	if ( selectionIndex == 1 ) then
		CharCreateStyleUpButton:Enable();
		CharCreateStyleUpButton.arrow:SetDesaturated(true);
	else
		CharCreateStyleUpButton:Enable();
		CharCreateStyleUpButton.arrow:SetDesaturated(false);
	end
	if ( selectionIndex == numVariations ) then
		CharCreateStyleDownButton:Disable();
		CharCreateStyleDownButton.arrow:SetDesaturated(true);
	else
		CharCreateStyleDownButton:Disable(true);
		CharCreateStyleDownButton.arrow:SetDesaturated(false);
	end
end

local TotalTime = 0;
local KeepScrolling = nil;
local TIME_TO_SCROLL = 0.5;
function CharacterCreateWhileMouseDown_OnMouseDown(direction)
	TIME_TO_SCROLL = 0.5;
	TotalTime = 0;
	KeepScrolling = direction;
end
function CharacterCreateWhileMouseDown_OnMouseUp()
	KeepScrolling = nil;
end
function CharacterCreateWhileMouseDown_Update(elapsed)
	if ( KeepScrolling ) then
		TotalTime = TotalTime + elapsed;
		if ( TotalTime >= TIME_TO_SCROLL ) then
			CharCreate_ChangeFeatureVariation(KeepScrolling);
			TIME_TO_SCROLL = 0.25;
			TotalTime = 0;
		end
	end
end

-- pandaren stuff related to faction change
function CharCreate_EnableNextButton(enabled)
	local button = CharCreateOkayButton;
	if enabled then
		button:Enable();
	else
		button:Disable();
	end
	button.Arrow:SetDesaturated(not enabled);
	if enabled then
		button.TopGlow:Hide();
		button.BottomGlow:Hide();
	else
		button.TopGlow:Show();
		button.BottomGlow:Show();
	end
end
 