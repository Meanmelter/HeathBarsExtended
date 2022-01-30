function onInit()
    AddHealthBarOptions();
end

function AddHealthBarOptions()
    OptionsManager.registerOption2("TGMH", false, "option_header_token", "option_label_TGMH", "option_entry_cycler", { labels = "option_val_MBar1|option_val_MBar2", values="MBar1|Mbar2"});
end
