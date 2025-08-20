class Version::Raku:ver<0.0.1>:auth<zef:lizmat> is Version { }

#- other infix methods ---------------------------------------------------------
# Note that this is a bit icky, but it allows for a direct mapping of the
# infix op name to a method for comparison with the $a."=="($b) syntax,
# without having to have the above infixes to be imported
BEGIN {
    Version::Raku.^add_method: "cmp", &[cmp];  # UNCOVERABLE
    Version::Raku.^add_method: "eqv", &[eqv];  # UNCOVERABLE
    Version::Raku.^add_method: "==",  &[==];   # UNCOVERABLE
    Version::Raku.^add_method: "!=",  &[!=];   # UNCOVERABLE
    Version::Raku.^add_method: "<",   &[<];    # UNCOVERABLE
    Version::Raku.^add_method: "<=",  &[<=];   # UNCOVERABLE
    Version::Raku.^add_method: ">",   &[>];    # UNCOVERABLE
    Version::Raku.^add_method: ">=",  &[>=];   # UNCOVERABLE

    Version::Raku.^add_method: "~~", { $^b.ACCEPTS($^a) }  # UNCOVERABLE
}

# vim: expandtab shiftwidth=4
