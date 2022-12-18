-- FuBar_ActionBarProfilesFu: Simple FuBar plugin for Decursive.
-- Copyright (C):
--   * Zilver - 2008
--   * Qxcl - 2020
-- 
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local _G = getfenv(0);

local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")
local L = AceLibrary("AceLocale-2.2"):new("FuBar_ActionBarProfilesFu")

ActionBarProfilesFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceDB-2.0")

ActionBarProfilesFu:RegisterDB("ActionBarProfilesFuDB");


--Fubar plugin settings
ActionBarProfilesFu.hasIcon = "Interface\\AddOns\\FuBar_ActionBarProfilesFu\\icon"
ActionBarProfilesFu.canHideText = true
ActionBarProfilesFu.hasNoColor = true
ActionBarProfilesFu.clickableTooltip = false
ActionBarProfilesFu.cannotDetachTooltip = true
ActionBarProfilesFu.hideWithoutStandby = true
ActionBarProfilesFu.profileCode = true

ActionBarProfilesFu.defaultPosition = "LEFT";
ActionBarProfilesFu.defaultMinimapPosition = 317;


ActionBarProfilesFu.OnMenuRequest = {
	type = 'group',
	args = {},
}


function ActionBarProfilesFu:OnClick(self, button)
	ABP_OnClick()
end

function ActionBarProfilesFu:OnEnable()
	if not ActionBarProfiles_IconFrame then
		return
	end

	ActionBarProfiles_IconFrame:Hide()
end

function ActionBarProfilesFu:OnDisable()
	if not ActionBarProfiles_IconFrame then
		return
	end

	ActionBarProfiles_IconFrame:Show()
end

function ActionBarProfilesFu:OnTextUpdate()
	self:SetText("Action Bar Profiles")
end

function ActionBarProfilesFu:OnTooltipUpdate()
	local cat = tablet:AddCategory('columns', 1)

	tablet:SetTitle("ActionBarProfilesFu")

	tablet:SetHint("\n|cffeda55fLeft Click|r to open the list.")
end