CHOISE_YOUR_DESTINITY_CUSTOM = "Escoge tu Destino";
DOOPELGANGER = "SI";
SHOW_ERRORS = true; 
BLIZLIKESERVER = false;
ADD_CUSTOM_CLASS_EXTRA = false;
REVELATIONSERVER = false;
CLANDESTINOSERVER = true;
LIKENUMBERRACES = false; 
Razas_Nuevas = "SI";
Razas_Nuevas2 = "NO";
Clases_GS1 = "SI";
Clases_GS2 = "NO";
DELII_GS2 = ":";
 
AUTH_NO_TIME_URL = "";
 
COMMUNITY_URL = "";
VR_PARCHE = "0.2b";
 
NEW_ELFOS = "";
NEW_VAREA = nil;
TEXTO_TITULO_SERVER = _G["_REALM"].."|n  " .. GetServerName();
  
function GetBlizlikeOkFresh()
local yes = 0; if(BLIZLIKESERVER == true)then yes = 1; end return BLIZLIKESERVER;
end

function GetRacesOkReFresh(s, delimiter)
local dimitri = delimiter 
	if(dimitri == " ")then dimitri = "" end local resultaques = {}; for match in (s..dimitri):gmatch("(.-)"..dimitri) do  table.insert(resultaques, match); end
		return resultaques;
end 
 
function GetRacesOkFresh()
local yes = 0; if(Razas_Nuevas == "SI")then yes = 1; end return yes;
end

function GetPackRaceExtra()
local yes = 0; if(Razas_Nuevas2 == "SI")then yes = 1; end return yes;
end

function GetElfOkFresh()
local yes = 0; if(NEW_ELFOS == "SI")then yes = 1; end return yes;
end

function GetDpgOkFresh()
local yes = 0; if(DOOPELGANGER == "SI")then yes = 1; end return yes;
end

function IgnorarSexoClase(class, race)
local clase, color;
	color = "";
	if(class == _G["_WARRIOR"] or class == 1)then
		color = "|cffc79c6e";
		clase = "Warrior";
	elseif(class == _G["_PALADIN"] or class == 2)then
		color = "|cfff58cba";
		clase = "Paladin";	
	elseif(class == _G["_HUNTER"] or class == 3)then
		color = "|cffabd473";
		clase = "Hunter";
	elseif(class == _G["_ROGUE"] or class == 4)then
		color = "|cfffff569";
		clase = "Rogue";
	elseif(class == _G["_PRIEST"] or class == 5)then
		color = "|cffffffff";
		clase = "Priest";
	elseif(class == _G["_DEATH_KNIGHT"] or class == 6)then
		color = "|cffc41f3b";
		clase = "Death Knight";
	elseif(class == _G["_SHAMAN"] or class == 7)then
		color = "|cff0070de";
		clase = "Shaman";
	elseif(class == _G["_MAGE"] or class == 8)then
		color = "|cff69ccf0";
		clase = "Mage";
	elseif(class == _G["_WARLOCK"] or class == 9)then
		color = "|cff9482c9";
		clase = "Warlock";
	elseif(class == _G["_DRUID"] or class == 11)then
		color = "|cffff7d0a";
		clase = "Druid";
	end
	
	return clase, color;
end

function GetBGluSpecil(self, num)
local boton, id, faction, NoClass;
local Name = "";
local Name2 = nil;
local Disponible = true;
local retorn1, retorn2;
local clases = {};
	if(self == _G["_HUMAN"] or self == 1)then 
		boton = CharCreateRaceButton1; 
	--	id = 1;  
		faction = "Alliance";
		Name = "Human";
		NoClass = 8;  
		--clases = {1,2,4,5,6,8,9};
		clases = {1,2,3,4,5,6,8,9};
	end
	if(self == _G["_ORC"] or self == 12)then 
		boton = CharCreateRaceButton12; 
	--	id = 11;  
		faction = "Horde";
		Name = "Orc";
		NoClass = 7; 
		--clases = {1,3,4,6,7,9};
		clases = {1,3,4,6,7,8,9};
	end
	if(self == _G["_DWARF"] or self == 2)then 
		boton = CharCreateRaceButton2; 
		faction = "Alliance";
		Name = "Dwarf";
		NoClass = 9;
		--clases = {1,2,3,4,5,6};
		clases = {1,2,3,4,5,6,7,8,9};
	end
		if(self == _G["_NIGHT_ELF"] or self == 3)then 
		boton = CharCreateRaceButton3; 
		faction = "Alliance";
		Name = "Night Elf";
		NoClass = 7;
		--clases = {1,3,4,5,6,11};
		clases = {1,3,4,5,6,8,10};
	end
	if(self == _G["_UNDEAD"] or self == 13)then 
		boton = CharCreateRaceButton13; 
		faction = "Horde";
		Name = "Undead";
		NoClass = 8;
		--clases = {1,4,5,6,8,9};
		clases = {1,2,3,4,5,6,8,9};
	end
	if(self == _G["_TAUREN"] or self == 14)then 
		boton = CharCreateRaceButton14; 
		faction = "Horde";
		Name = "Tauren";
		NoClass = 7;
		--clases = {1,3,6,7,11};
		clases = {1,2,3,5,6,7,10};
	end
	if(self == _G["_GNOME"] or self == 4)then 
		boton = CharCreateRaceButton4; 
		faction = "Alliance";
		Name = "Gnome";
		NoClass = 7;
		--clases = {1,4,6,8,9};
		clases = {1,3,4,5,6,8,9};
	end
	if(self == _G["_TROLL"] or self == 15)then 
		boton = CharCreateRaceButton15; 
		faction = "Horde";
		Name = "Troll";
		NoClass = 9;
		--clases = {1,3,4,5,6,7,8};
		clases = {1,3,4,5,6,7,8,9,10};
	end
		if(self == _G["_GOBLIN"] or self == 16)then  
		boton = CharCreateRaceButton16; 
		faction = "Horde";
		Name = "Goblin";
		NoClass = 8;
	--	clases = {1,3,4,6,8,9,5};
		clases = {1,3,4,5,6,7,8,9};
	end
	if(self == _G["_BLOOD_ELF"] or self == 17)then 
		boton = CharCreateRaceButton17; 
		faction = "Horde";
		Name = "Blood Elf";
		NoClass = 8;
		--clases = {2,3,4,5,6,8,9};
		clases = {1,2,3,4,5,6,8,9};
	end
	if(self == _G["_DRAENEI"] or self == 5)then 
		boton = CharCreateRaceButton5; 
		faction = "Alliance";
		Name = "Draenei";
		NoClass = 7;
		--clases = {1,2,3,5,6,7,8};
		clases = {1,2,3,5,6,7,8};
	end
	if(self == _G["_VOID_ELF"] or self == 6)then 
		boton = CharCreateRaceButton6; 
		faction = "Alliance";
		Name = "Void Elf";
		NoClass = 6;
	--	clases = {1,3,4,5,6,8,9};
		clases = {1,3,4,5,6,8};
	end
	if(self == _G["_VULPERA"] or self == 18)then 
		boton = CharCreateRaceButton18; 
		faction = "Horde";
		Name = "Vulpera";
		NoClass = 8;
	--	clases = {1,3,4,5,6,7,8,9};
		clases = {1,3,4,5,6,7,8,9};
	end 
	if(self == _G["_HIGH_ELF"] or self == 7)then 
		boton = CharCreateRaceButton7; 
		faction = "Alliance";
		Name = "High Elf";
		NoClass = 9;
	---	clases = {1,3,4,5,6,8,9};
		clases = {1,2,3,4,5,6,7,8,10};
	end
	if(self == _G["_PANDAREN"].."|cffc41f3b|r" or self == 19)then 
	 	boton = CharCreateRaceButton19; 
		faction = "Horde";
		Name = "Pandaren";
		NoClass = 9;
	--	clases = {1,3,4,5,7,8,9};
		clases = {1,2,3,4,5,6,8,9,10};
	end 
	if(self == _G["_WORGEN"] or self == 8)then 
		boton = CharCreateRaceButton8; 
		faction = "Alliance";
		Name = "Worgen";
		NoClass = 8;
	--	clases = {1,3,4,5,6,8,9,10};
		clases = {1,3,4,5,6,8,9,10};
	end 
	if(self == _G["_EREDAR"] or self == "Eredar" or self == 20)then 
		boton = CharCreateRaceButton20; 
		faction = "Horde";
		Name = "Man'ari Eredar";
		NoClass = 6;
	--	clases = {1,3,4,5,7,8,9};
		clases = {1,3,4,6,8,9};
	end
	if(self == _G["_LIGHTFORGED"] or self == 10)then 
		boton = CharCreateRaceButton10; 
		faction = "Alliance";
		Name = "Lightforged";
		NoClass = 6;
	--	clases = {1,2,3,5,6,8};
		clases = {1,2,3,5,6,8};
	end
	if(self == _G["_DEMON_HUNTER"].."|cff0070de|r" or self == 11)then 
		boton = CharCreateRaceButton11; 
		faction = "Alliance";
		Name = "NightElf";
		NoClass = 6;
		--clases = {1,3,4,5,6,11};
		clases = {1,3,4,6,8,9};
	end
	if(self == _G["_DEMON_HUNTER"].."|cffc41f3b|r" or self == 21)then 
		boton = CharCreateRaceButton21; 
		faction = "Horde";
		Name = "BloodElf";
		NoClass = 6;
		--clases = {1,3,4,5,6,11};
		clases = {1,3,4,6,8,9};
	end

	if(boton ~= nil)then
		id = boton:GetID();
	end
	if(Name2 == nil)then
		Name2 = self;
	end
	if(num == nil)then
		retorn1 = boton
	elseif(num == 1)then 
		retorn1 = id;
	elseif(num == 2)then 
		retorn1 = boton;
		retorn2 = id;
	elseif(num == "faction2")then 
		retorn1 = faction;
	elseif(num == "faction")then 
		retorn1 = Name;
		retorn2 = faction; 
	elseif(num == "name")then 
		retorn1 = Name;
	elseif(num == "NoClass")then 
		retorn1 = NoClass;
	elseif(num == "Classes")then 
		retorn1 = {};
		retorn1 = clases;
	elseif(num == "Name2")then 
		retorn1 = Name2;
	elseif(num == "Disponible")then 
		retorn1 = Disponible;
	end
	return retorn1, retorn2;
end

SERVER_ALERT_URL = "https://www.patreon.com/Dinklepack5";
FACEBOOK_ALERT_URL = "https://discord.gg/G37U4fPYeN";

RACE_INFO_DOOPELGANGER = "Un Doppelgänger es un ente que copia formas y atributos, incluso puede copiar recuerdos de la vida pasada de esta persona, los Doppelgängers son inbuidos con el anima de las tierras de las sombras para obedecer una orden absoluta desde que el Rey Exánime tomo control de la Rasganorte... Eliminar a el Portador de la Corona de Dominancia. Asi que tomando la forma de algun heroe caido los Doppelgänger no se detendran hasta que el portador de la corona sea destruido y no les importa a que faccion pertenescan para conseguirlo.";
RACE_INFO_DRUSSERA = "Drusera es la creación definitiva del Eldan y el objetivo del Proyecto Nexus. Apodado 'Génesis Prime' por Eldan, Drusera fue creada combinando los cuatro elementos de la materia primaria - tierra, aire, fuego y agua, además de las dos fuerzas primarias - lógica y vida. Además, Drusera estaba imbuida de seis mentes notables de Eldan, todo esto ocurre en una dimension diferente pero tras el colapso temporal Drusera se vio atrapada entre este y su mundo, antes una casi diosa ahora drusera se limita a ser una Doppelgänger, copiando los poderes de los muertos para mantenerse en este nuevo universo.";


RACE_INFO_FORESTTROLL = _G["_RACE_INFO_PANDAREN"];
RACE_INFO_FORESTTROLL_FEMALE = _G["_RACE_INFO_PANDAREN"];
RACE_INFO_ICETROLL = _G["_RACE_INFO_DEMON_HUNTER1"];
RACE_INFO_ICETROLL_FEMALE = _G["_RACE_INFO_DEMON_HUNTER1"];
RACE_INFO_FELORC = _G["_RACE_INFO_VOID_ELF"];
RACE_INFO_FELORC_FEMALE = _G["_RACE_INFO_VOID_ELF"];
RACE_INFO_TAUNKA = _G["_RACE_INFO_LIGHTFORGED"];
RACE_INFO_TAUNKA_FEMALE = _G["_RACE_INFO_LIGHTFORGED"];
RACE_INFO_NAGA_ = _G["_RACE_INFO_VULPERA"];
RACE_INFO_NAGA__FEMALE = _G["_RACE_INFO_VULPERA"];
RACE_INFO_BROKEN = _G["_RACE_INFO_HIGH_ELF"];
RACE_INFO_BROKEN_FEMALE = _G["_RACE_INFO_HIGH_ELF"];
RACE_INFO_NORTHRENDSKELETON = _G["_RACE_INFO_DEMON_HUNTER0"];
RACE_INFO_NORTHRENDSKELETON_FEMALE = _G["_RACE_INFO_DEMON_HUNTER0"];


NAGA__DISABLED = ADDON_BANNED;
FORESTTROLL_DISABLED = ADDON_BANNED;
BROKEN_DISABLED = ADDON_BANNED;
TAUNKA_DISABLED = ADDON_BANNED;
ICETROLL_DISABLED = ADDON_BANNED;
FELORC_DISABLED = ADDON_BANNED;

--
ABILITY_INFO_DEFAULT = " ";
ABILITY_INFO_DEFAULT1 = " ";
ABILITY_INFO_DEFAULT2 = " ";
ABILITY_INFO_DEFAULT3 = " ";
ABILITY_INFO_DEFAULT4 = " ";
ABILITY_INFO_DEFAULT_MALE = " ";
ABILITY_INFO_DEFAULT_FEMALE = " ";
ABILITY_INFO_TAUNKA1 = _G["_ABILITY_INFO_LIGHTFORGED1"];
ABILITY_INFO_TAUNKA2 = _G["_ABILITY_INFO_LIGHTFORGED2"];
ABILITY_INFO_TAUNKA3 = _G["_ABILITY_INFO_LIGHTFORGED3"];
ABILITY_INFO_TAUNKA4 = _G["_ABILITY_INFO_LIGHTFORGED4"];
ABILITY_INFO_BROKEN1 = _G["_ABILITY_INFO_HIGH_ELF1"];
ABILITY_INFO_BROKEN2 = _G["_ABILITY_INFO_HIGH_ELF2"];
ABILITY_INFO_BROKEN3 = _G["_ABILITY_INFO_HIGH_ELF3"];
ABILITY_INFO_BROKEN4 = _G["_ABILITY_INFO_HIGH_ELF4"];
ABILITY_INFO_BROKEN5 = _G["_ABILITY_INFO_HIGH_ELF5"];
ABILITY_INFO_FELORC1 = _G["_ABILITY_INFO_VOID_ELF1"];
ABILITY_INFO_FELORC2 = _G["_ABILITY_INFO_VOID_ELF2"];
ABILITY_INFO_FELORC3 = _G["_ABILITY_INFO_VOID_ELF3"];
ABILITY_INFO_FELORC4 = _G["_ABILITY_INFO_VOID_ELF4"];
ABILITY_INFO_FORESTTROLL1 = _G["_ABILITY_INFO_PANDAREN1"];
ABILITY_INFO_FORESTTROLL2 = _G["_ABILITY_INFO_PANDAREN2"];
ABILITY_INFO_FORESTTROLL3 = _G["_ABILITY_INFO_PANDAREN3"];
ABILITY_INFO_FORESTTROLL_FEMALE1 = ABILITY_INFO_FORESTTROLL1;
ABILITY_INFO_FORESTTROLL_FEMALE2 = ABILITY_INFO_FORESTTROLL2;
ABILITY_INFO_FORESTTROLL_FEMALE3 = ABILITY_INFO_FORESTTROLL3;

ABILITY_INFO_NORTHRENDSKELETON1 = _G["_ABILITY_INFO_DEMON_HUNTER1"];
ABILITY_INFO_NORTHRENDSKELETON2 = _G["_ABILITY_INFO_DEMON_HUNTER2"];
ABILITY_INFO_NORTHRENDSKELETON3 = _G["_ABILITY_INFO_DEMON_HUNTER3"];
ABILITY_INFO_NORTHRENDSKELETON4 = _G["_ABILITY_INFO_DEMON_HUNTER4"];
ABILITY_INFO_NORTHRENDSKELETON5 = _G["_ABILITY_INFO_DEMON_HUNTER5"];
ABILITY_INFO_ICETROLL1 = _G["_ABILITY_INFO_DEMON_HUNTER1"];
ABILITY_INFO_ICETROLL2 = _G["_ABILITY_INFO_DEMON_HUNTER2"];
ABILITY_INFO_ICETROLL3 = _G["_ABILITY_INFO_DEMON_HUNTER3"];
ABILITY_INFO_ICETROLL4 = _G["_ABILITY_INFO_DEMON_HUNTER4"];
ABILITY_INFO_ICETROLL5 = _G["_ABILITY_INFO_DEMON_HUNTER5"];


ABILITY_INFO_NAGA_1 = _G["_ABILITY_INFO_VULPERA1"];
ABILITY_INFO_NAGA_2 = _G["_ABILITY_INFO_VULPERA2"];
ABILITY_INFO_NAGA_3 = _G["_ABILITY_INFO_VULPERA3"];
ABILITY_INFO_NAGA_4 = _G["_ABILITY_INFO_VULPERA4"];
ABILITY_INFO_NAGA_5 = _G["_ABILITY_INFO_VULPERA5"];

ABILITY_INFO_GOBLIN1 = _G["_ABILITY_INFO_GOBLIN1"];
ABILITY_INFO_GOBLIN2 = _G["_ABILITY_INFO_GOBLIN2"];
ABILITY_INFO_GOBLIN3 = _G["_ABILITY_INFO_GOBLIN3"];
ABILITY_INFO_GOBLIN4 = _G["_ABILITY_INFO_GOBLIN4"];
ABILITY_INFO_GOBLIN5 = _G["_ABILITY_INFO_GOBLIN5"];
ABILITY_INFO_GOBLIN6 = _G["_ABILITY_INFO_GOBLIN6"];
ABILITY_INFO_TUSKARR1 = ABILITY_INFO_HUMAN1;
ABILITY_INFO_TUSKARR2 = ABILITY_INFO_HUMAN2;
ABILITY_INFO_TUSKARR3 = ABILITY_INFO_HUMAN3;
ABILITY_INFO_TUSKARR4 = ABILITY_INFO_HUMAN4;
ABILITY_INFO_TUSKARR5 = ABILITY_INFO_HUMAN5;
ABILITY_INFO_VRYKUL1 = ABILITY_INFO_ORC1;
ABILITY_INFO_VRYKUL2 = ABILITY_INFO_ORC2;
ABILITY_INFO_VRYKUL3 = ABILITY_INFO_ORC3;
ABILITY_INFO_VRYKUL4 = ABILITY_INFO_ORC4;
ABILITY_INFO_SKELETON1 = _G["_ABILITY_INFO_EREDAR1"];
ABILITY_INFO_SKELETON2 = _G["_ABILITY_INFO_EREDAR2"];
ABILITY_INFO_SKELETON3 = _G["_ABILITY_INFO_EREDAR3"];
ABILITY_INFO_SKELETON4 = _G["_ABILITY_INFO_EREDAR4"];
ABILITY_INFO_SKELETON5 = _G["_ABILITY_INFO_EREDAR5"];
ABILITY_INFO_WORGEN1 = _G["_ABILITY_INFO_WORGEN1"];
ABILITY_INFO_WORGEN2 = _G["_ABILITY_INFO_WORGEN2"];
ABILITY_INFO_WORGEN3 = _G["_ABILITY_INFO_WORGEN3"];
ABILITY_INFO_WORGEN4 = _G["_ABILITY_INFO_WORGEN4"];
ABILITY_INFO_WORGEN5 = _G["_ABILITY_INFO_WORGEN5"];
ABILITY_INFO_WORGEN6 = _G["_ABILITY_INFO_WORGEN6"];
ABILITY_INFO_ZANDALARITROLL1 = ABILITY_INFO_ORC1;
ABILITY_INFO_ZANDALARITROLL2 = ABILITY_INFO_ORC2;
ABILITY_INFO_ZANDALARITROLL3 = ABILITY_INFO_ORC3;
ABILITY_INFO_ZANDALARITROLL4 = ABILITY_INFO_ORC4;
ABILITY_INFO_EREDAR1 = ABILITY_INFO_HUMAN1;
ABILITY_INFO_EREDAR2 = ABILITY_INFO_HUMAN2;
ABILITY_INFO_EREDAR3 = ABILITY_INFO_HUMAN3;
ABILITY_INFO_EREDAR4 = ABILITY_INFO_HUMAN4;
ABILITY_INFO_EREDAR5 = ABILITY_INFO_HUMAN5;

RACE_INFO_GOBLIN = RACE_INFO_GNOME;
RACE_INFO_GOBLIN_FEMALE = RACE_INFO_GNOME_FEMALE;
RACE_INFO_WORGEN = _G["_RACE_INFO_WORGEN"];
RACE_INFO_WORGEN_FEMALE = _G["_RACE_INFO_WORGEN"];
RACE_INFO_GOBLIN = _G["_RACE_INFO_GOBLIN"];
RACE_INFO_GOBLIN_FEMALE = _G["_RACE_INFO_GOBLIN"];
RACE_INFO_PANDAREN = "Rumors have been spreading across Azeroth about the mysterious kingdom of Gilneas, now that the Greymane Wall has finally been opened. Adventurers are curious about the secretive nation, and many are eager to explore its lands and potentially form alliances. The Gilneans, having dealt with the Worgen infection, are also seeking allies to help them secure their kingdom and face future threats.";
RACE_INFO_PANDAREN_FEMALE = "Rumors have been spreading across Azeroth about the mysterious kingdom of Gilneas, now that the Greymane Wall has finally been opened. Adventurers are curious about the secretive nation, and many are eager to explore its lands and potentially form alliances. The Gilneans, having dealt with the Worgen infection, are also seeking allies to help them secure their kingdom and face future threats.";
RACE_INFO_TUSKARR = "Rumors have been spreading across Azeroth about the mysterious kingdom of Gilneas, now that the Greymane Wall has finally been opened. Adventurers are curious about the secretive nation, and many are eager to explore its lands and potentially form alliances. The Gilneans, having dealt with the Worgen infection, are also seeking allies to help them secure their kingdom and face future threats.";
RACE_INFO_TUSKARR_FEMALE = "Rumors have been spreading across Azeroth about the mysterious kingdom of Gilneas, now that the Greymane Wall has finally been opened. Adventurers are curious about the secretive nation, and many are eager to explore its lands and potentially form alliances. The Gilneans, having dealt with the Worgen infection, are also seeking allies to help them secure their kingdom and face future threats.";
RACE_INFO_SKELETON = _G["_RACE_INFO_EREDAR"];
RACE_INFO_SKELETON_FEMALE = _G["_RACE_INFO_EREDAR"];
RACE_INFO_EREDAR = "In the aftermath of the Shattering, a group of Draenei known as the Lightforged began to emerge. Infused with the holy power of the Naaru, they sought to join the Alliance and bring their unique abilities to bear against the enemies of Azeroth. This story follows their journey of integration into the Alliance during the Wotlk era. Deep within the Exodar, a group of Draenei led by Lady Aesreth underwent a transformative ritual with the blessing of the Naaru. They emerged as Lightforged, their bodies glowing with the power of the Light. Filled with a newfound purpose, they sought to forge alliances and fight alongside the Alliance in their struggle against the Scourge. Lady Aesreth and her companions embarked on a diplomatic mission to Stormwind. They sought an audience with King Varian Wrynn, hoping to convince the Alliance leaders of their worthiness to fight alongside them. The Alliance was initially hesitant, as they had little knowledge of the Lightforged and their true intentions. To prove themselves, the Lightforged volunteered to aid the Alliance in reclaiming lost territories from the Scourge. They fought with unyielding valor and demonstrated their ability to channel the Light to heal and smite their enemies. Through their unwavering dedication and selfless acts, they began to earn the trust and respect of the Alliance commanders. Recognizing the value the Lightforged could bring, King Varian Wrynn officially accepted them into the Alliance. The Lightforged Draenei were granted a home within the city of Stormwind, where they established a bastion of Light and served as beacons of hope to all who sought solace and guidance. They shared their knowledge of the Light with the Alliance, strengthening their forces against the Scourge. As the Lightforged Draenei became an integral part of the Alliance, they proved themselves as fierce warriors, priests, and paladins. Their unique abilities and unwavering devotion to the Light helped turn the tide against the Scourge. The Alliance embraced them as allies, recognizing their invaluable contributions to the fight against the Lich King. The Lightforged Draenei, infused with the power of the Naaru, became powerful champions of the Light within the ranks of the Alliance. With their integration into the city of Stormwind, they brought a renewed sense of hope and faith to all who fought under the Alliance banner. Together, the Lightforged Draenei and the Alliance stood as a beacon of hope against the darkness that threatened Azeroth. Smooth implementation of the Lightforged Draenei to the 3.3.5a version of the game would involve creating new character models, racial abilities, and starting zones, while also integrating them into existing Alliance storylines and quests";
RACE_INFO_EREDAR_FEMALE = "In the aftermath of the Shattering, a group of Draenei known as the Lightforged began to emerge. Infused with the holy power of the Naaru, they sought to join the Alliance and bring their unique abilities to bear against the enemies of Azeroth. This story follows their journey of integration into the Alliance during the Wotlk era. Deep within the Exodar, a group of Draenei led by Lady Aesreth underwent a transformative ritual with the blessing of the Naaru. They emerged as Lightforged, their bodies glowing with the power of the Light. Filled with a newfound purpose, they sought to forge alliances and fight alongside the Alliance in their struggle against the Scourge. Lady Aesreth and her companions embarked on a diplomatic mission to Stormwind. They sought an audience with King Varian Wrynn, hoping to convince the Alliance leaders of their worthiness to fight alongside them. The Alliance was initially hesitant, as they had little knowledge of the Lightforged and their true intentions. To prove themselves, the Lightforged volunteered to aid the Alliance in reclaiming lost territories from the Scourge. They fought with unyielding valor and demonstrated their ability to channel the Light to heal and smite their enemies. Through their unwavering dedication and selfless acts, they began to earn the trust and respect of the Alliance commanders. Recognizing the value the Lightforged could bring, King Varian Wrynn officially accepted them into the Alliance. The Lightforged Draenei were granted a home within the city of Stormwind, where they established a bastion of Light and served as beacons of hope to all who sought solace and guidance. They shared their knowledge of the Light with the Alliance, strengthening their forces against the Scourge. As the Lightforged Draenei became an integral part of the Alliance, they proved themselves as fierce warriors, priests, and paladins. Their unique abilities and unwavering devotion to the Light helped turn the tide against the Scourge. The Alliance embraced them as allies, recognizing their invaluable contributions to the fight against the Lich King. The Lightforged Draenei, infused with the power of the Naaru, became powerful champions of the Light within the ranks of the Alliance. With their integration into the city of Stormwind, they brought a renewed sense of hope and faith to all who fought under the Alliance banner. Together, the Lightforged Draenei and the Alliance stood as a beacon of hope against the darkness that threatened Azeroth. Smooth implementation of the Lightforged Draenei to the 3.3.5a version of the game would involve creating new character models, racial abilities, and starting zones, while also integrating them into existing Alliance storylines and quests"; 
RACE_INFO_ZANDALARITROLL = RACE_INFO_TROLL;
RACE_INFO_ZANDALARITROLL_FEMALE = RACE_INFO_TROLL_FEMALE;

CLASS_GUARDIAN = "La Inquisicion de la luz entrenaba luchadores para combatir la plaga y la corrupción de la legión combinando diversos tipos de poderes magicos, habilidades de asesinato, y manejo de la energia de las sombras con el fin de crear el Arma perfecta, sin embargo todo era implantado artificialmente por medio de rituales especiales extrayendo la esencia y las habildades de sus dueños hasta matarlos, el espiritu se colocaba a la fuerza en los cuerpos lo que provocaba la perdida de la conciencia completamente, conviertiendolos en titeres que nunca se negaban a las ordenes de sus superiores, ganandose el nombre de Guardianes espirituales, estos poderosos guerreros conservan el espiritu y las habilidades de sus dueños originales para conseguir la maxima eficacia entre magia oscura destreza con armas y curacion sagrada.";
CLASS_GUARDIAN_FEMALE = CLASS_GUARDIAN;
CLASS_INFO_GUARDIAN0 = "- Función: Daño, sanador";
CLASS_INFO_GUARDIAN1 = "- Armadura media (cuero)";
CLASS_INFO_GUARDIAN2 = "- Usa maná o energía como recurso dependiendo de la forma.";
CLASS_INFO_GUARDIAN3 = "- Versátil: puede realizar la función de sanador, cuerpo a cuerpo o taumaturgo.";
GUARDIAN_DISABLED = "Guardián Espiritual\nNo Disponible\nPor el momento";

TEXTO_UPDATES_1 = "";
TEXTO_UPDATES_2 = "";
TEXTO_UPDATES_3 = "";
TEXTO_UPDATES_4 = "";
TEXTO_UPDATES_5 = "";
TEXTO_UPDATES_6 = "";
TEXTO_UPDATES_7 = "";
TEXTO_UPDATES_8 = "";
TEXTO_UPDATES_9 = "";
TEXTO_UPDATES_10 = "";
TEXTO_UPDATES_11 = "";
TEXTO_UPDATES_12 = "";
TEXTO_UPDATES_13 = "";
TEXTO_UPDATES_14 = "";
TEXTO_UPDATES_15 = "";
TEXTO_UPDATES_16 = "";
TEXTO_UPDATES_17 = "";
TEXTO_UPDATES_18 = "";
TEXTO_UPDATES_19 = "";
TEXTO_UPDATES_20 = "";
TEXTO_UPDATES_21 = "";
TEXTO_UPDATES_22 = "";
TEXTO_UPDATES_23 = "";
TEXTO_UPDATES_24 = "";
TEXTO_UPDATES_25 = "";
TEXTO_UPDATES_26 = "";

NEW_CLASS_HAB = "las funciones, habilidades y talentos dependen de su lexicón de poder, si el Luchador errante no es imbuido no podrá realizar ningun ataque especial.";
NEW_CLASS_HAB1 = "- Se puede Imbuir con el lexicón de un |CFF9FD8CCGuardían espiritual|r";
NEW_CLASS_HAB2 = "- Se puede Imbuir con el lexicón de un |CFF8E0047Cazador de demonios|r";
NEW_CLASS_HAB3 = "- Se puede Imbuir con el lexicón de un |CFF58EC90Monje|r";
NEW_CLASS_HAB4 = "- Solo puede escoger 1 lexicón.";
NEW_CLASS_HERO = "Los luchadores errantes nacieron con una afinidad enorme por toda las artes magicas y de lucha, sin embargo dependen del lexicón de poder desarrollar sus verdaderos talentos.";

NEW_CLASS_WARRIOR = CLASS_WARRIOR;
NEW_CLASS_PALADIN = CLASS_PALADIN;
NEW_CLASS_HUNTER = CLASS_HUNTER;
NEW_CLASS_ROGUE = CLASS_ROGUE;
NEW_CLASS_PRIEST = CLASS_PRIEST;
NEW_CLASS_DEATHKNIGHT = CLASS_DEATHKNIGHT;
NEW_CLASS_SHAMAN = CLASS_SHAMAN;
NEW_CLASS_MAGE = CLASS_MAGE;
NEW_CLASS_WARLOCK = CLASS_WARLOCK;
NEW_CLASS_DRUID = CLASS_DRUID;


NEW_CLASS_INFO_WARRIOR = CLASS_INFO_WARRIOR0;
NEW_CLASS_INFO_PALADIN = CLASS_INFO_PALADIN0;
NEW_CLASS_INFO_HUNTER = CLASS_INFO_HUNTER0;
NEW_CLASS_INFO_ROGUE = CLASS_INFO_ROGUE0;
NEW_CLASS_INFO_PRIEST = CLASS_INFO_PRIEST0;
NEW_CLASS_INFO_DEATHKNIGHT = CLASS_INFO_DEATHKNIGHT0;
NEW_CLASS_INFO_SHAMAN = CLASS_INFO_SHAMAN0;
NEW_CLASS_INFO_MAGE = CLASS_INFO_MAGE0;
NEW_CLASS_INFO_WARLOCK = CLASS_INFO_WARLOCK0;
NEW_CLASS_INFO_DRUID = CLASS_INFO_DRUID0;
