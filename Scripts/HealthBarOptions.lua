function onInit()
    AddHealthBarOptions();
end

function AddHealthBarOptions()
OptionsManager.registerOption2("TGMH", false, "option_header_token", "option_label_TGMH", "option_entry_cycler",
    { labels = "option_val_MBar1|option_val_MBar2|option_val_bar|option_val_barhover|option_val_dot|option_val_dothover", values = "baralt|baralt2|bar|barhover|dot|dothover", baselabel = "option_val_off", baseval = "off", default = "dot" });
OptionsManager.registerOption2("TNPCH", false, "option_header_token", "option_label_TNPCH", "option_entry_cycler",
    { labels = "option_val_MBar1|option_val_MBar2|option_val_bar|option_val_barhover|option_val_dot|option_val_dothover", values = "baralt|baralt2|bar|barhover|dot|dothover", baselabel = "option_val_off", baseval = "off", default = "dot" });
OptionsManager.registerOption2("TPCH", false, "option_header_token", "option_label_TPCH", "option_entry_cycler",
    { labels = "option_val_MBar1|option_val_MBar2|option_val_bar|option_val_barhover|option_val_dot|option_val_dothover", values = "baralt|baralt2|bar|barhover|dot|dothover", baselabel = "option_val_off", baseval = "off", default = "dot" });
OptionsManager.registerOption2("WNDC", false, "option_header_combat", "option_label_WNDC", "option_entry_cycler",
    { labels = "option_val_detailed", values = "detailed", baselabel = "option_val_simple", baseval = "off", default = "off" });

DB.addHandler("options.TGMH", "onUpdate", TokenManager.onOptionChanged);
DB.addHandler("options.TNPCH", "onUpdate", TokenManager.onOptionChanged);
DB.addHandler("options.TPCH", "onUpdate", TokenManager.onOptionChanged);
DB.addHandler("options.WNDC", "onUpdate", TokenManager.onOptionChanged);
end

