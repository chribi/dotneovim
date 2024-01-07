local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
-- local l = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

return {
    s(
        "class",
        fmta([[
        <> class <>
        {
            <>
        }
        ]],
        { i(1, "public sealed"), i(2), i(0) })
    ),

    s(
        "prop",
        fmta([[
            public <> <> { get; set; }
        ]],
        {
            i(1, "int"),
            i(2, "PropName"),
        })
    ),

    s(
        "propGet",
        fmta([[
            public <> <> { get; private set; }
        ]],
        {
            i(1, "int"),
            i(2, "PropName"),
        })
    ),

    s(
        'propNotify',
        fmta([[
            private <> <>;

            public <> <>
            {
                get =>> <>;
                set
                {
                    if (<> != value)
                    {
                        <> = value;
                        NotifyPropertyChanged();
                    }
                }
            }
        ]],
        {
            i(1, "int"),
            i(2, "_backingField"),
            rep(1),
            i(3, "PropName"),
            rep(2),
            rep(2),
            rep(2),
        })
    ),

    s(
        'notifypropertychangedimpl',
        fmta([[
            public event PropertyChangedEventHandler PropertyChanged;

            private void NotifyPropertyChanged([CallerMemberName] string propertyName = "")
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        ]], { })
    ),
}
