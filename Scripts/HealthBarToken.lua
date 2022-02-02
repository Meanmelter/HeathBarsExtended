function onInit()
    TokenManager.addDefaultHealthFeatures = AddDefaultHealthFeatures;
    OriginalUpdateHealthHelpter = TokenManager.updateHealthHelper;
    TokenManager.updateHealthHelper = UpdateHealthHelper;
end
-- function AddDefaultHealthFeatures(f, aHealthFields)
-- 	if not f then
-- 		return;
-- 	end
-- 	bDisplayDefaultHealth = true;
-- 	fGetHealthInfo = f;
-- 	TokenManager.registerWidgetSet("health", {"healthbar", "healthdot"});
--
-- 	for _,sField in ipairs(aHealthFields) do
-- 		CombatManager.addCombatantFieldChangeHandler(sField, "onUpdate", updateHealth);
-- 	end
-- end
function UpdateHealthHelper(tokenCT, nodeCT)
	local sOptTH;
	if Session.IsHost then
		sOptTH = OptionsManager.getOption("TGMH");
	elseif DB.getValue(nodeCT, "friendfoe", "") == "friend" then
		sOptTH = OptionsManager.getOption("TPCH");
	else
		sOptTH = OptionsManager.getOption("TNPCH");
	end
	local aWidgets = TokenManager.getWidgetList(tokenCT, "health");

	if sOptTH == "off" then
		for _,vWidget in pairs(aWidgets) do
			vWidget.destroy();
		end
	else
		local nPercentWounded,sStatus,sColor = TokenManager2.getHealthInfo(nodeCT);

		if sOptTH == "bar" or sOptTH == "barhover" then
			local w, h = tokenCT.getSize();

			local bAddBar = false;
			if h > 0 then
				bAddBar = true;
			end

			if bAddBar then
				local widgetHealthBar = aWidgets["healthbar"];
				if not widgetHealthBar then
					widgetHealthBar = tokenCT.addBitmapWidget("healthbar");
					widgetHealthBar.sendToBack();
					widgetHealthBar.setName("healthbar");
				end
				if widgetHealthBar then
					widgetHealthBar.sendToBack();
					widgetHealthBar.setColor(sColor);
					widgetHealthBar.setTooltipText(sStatus);
					widgetHealthBar.setVisible(sOptTH == "bar");
					TokenManager.updateHealthBarScale(tokenCT, nodeCT, nPercentWounded);
				end
			end

			if aWidgets["healthdot"] then
				aWidgets["healthdot"].destroy();
			end
		elseif sOptTH == "dot" or sOptTH == "dothover" then
			local widgetHealthDot = aWidgets["healthdot"];
			if not widgetHealthDot then
				widgetHealthDot = tokenCT.addBitmapWidget("healthdot");
				widgetHealthDot.setPosition("bottomright", TOKEN_HEALTHDOT_HOFFSET, TOKEN_HEALTHDOT_VOFFSET);
				widgetHealthDot.setName("healthdot");

				local nDU = GameSystem.getDistanceUnitsPerGrid();
				local nSpace = math.ceil(DB.getValue(nodeCT, "space", nDU) / nDU);
				widgetHealthDot.setSize(TOKEN_HEALTHDOT_SIZE * nSpace, TOKEN_HEALTHDOT_SIZE * nSpace);
			end
			if widgetHealthDot then
				widgetHealthDot.setColor(sColor);
				widgetHealthDot.setTooltipText(sStatus);
				widgetHealthDot.setVisible(sOptTH == "dot");
			end

			if aWidgets["healthbar"] then
				aWidgets["healthbar"].destroy();
			end
		end
	end
end
