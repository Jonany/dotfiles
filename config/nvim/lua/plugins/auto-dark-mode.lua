--2025-07-28, disabling for now because it keeps switching back and forth between light and dark.
--I think it's an issue with dbus being slow or broken or something. WezTerm is also having issues and it also uses dbus.
--I can probably customize this plugin to wait a lot longer for the dbus call to return. Or change it to not change if it doesn't get a response.
--I'm testing setting fallback to nil to see if that prevents the switching.
--Seems to be working. WezTerm is still messed up.
--Nope... still switching back and forth when it shouldn't be...
--2025-12-11: Turned back on and seems to working...
return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 5000,
      fallback = nil,
    }
  }
}
