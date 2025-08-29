class Version::Raku:ver<0.0.1>:auth<zef:lizmat> is Version {
    proto method as-generic-range(|) {*}
    multi method as-generic-range(Version::Raku:D:) {
        self.WHAT.as-generic-range(self)
    }
    multi method as-generic-range(Version::Raku:U: Version:D $version) {
        $version.plus || $version.whatever
          ?? self.as-generic-range($version.Str)
          !! ("==", $version).Slip
    }

    multi method as-generic-range(Version::Raku:U: Str:D $spec --> Slip:D) {
        if $spec {
            my @parts = $spec.split(".");
            with @parts.first(*.starts-with('*'), :k) -> $index {
                # 1.3.* -> >=1.3  <1.4
                if $index {
                    my $from := @parts.head($index).join('.');
                    $_ = .Int + 1 with @parts[$index - 1];
                    ('>=', Version::Raku.new($from),
                     '<',  Version::Raku.new(@parts.head($index).join('.'))
                    ).Slip
                }
                else {
                    Empty
                }
            }
            orwith @parts.first(*.ends-with('+'), :k) -> $index {
                ('>=', Version::Raku.new(
                  @parts.head($index + 1).join('.').chop
                )).Slip
            }
            else {
                ('==', Version::Raku.new($spec)).Slip
            }
        }
        else {
            Empty
        }
    }
}

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
