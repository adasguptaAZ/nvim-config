return {
  -- A snippet that expands the trigger "hi" into a string
  require("luasnip").snippet(
    { trig = "hi" },
    {t ("hello, world!")}
    ),

    require("luasnip").snippet(
      { trig = "foo" },
      { t("Another snippet.")}
      ),
    }
