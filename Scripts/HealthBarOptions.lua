function onInit()
    AddHealthBarOptions();
end

function AddHealthBarOptions()
    OptionsManager.registerOption2("TGMH", false, "option_header_token", "option_label_TGMH", "option_entry_cycler", { labels = "option_val_MBar1|option_val_MBar2|option_val_bar|option_val_barhover|option_val_dot|option_val_dothover", values="baralt|baralt2|bar|barhover|dot|dothover", baselabel = "option_val_off", baseval = "off", default = "bar"});
end

