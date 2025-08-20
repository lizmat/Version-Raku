[![Actions Status](https://github.com/lizmat/Version-Raku/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Version-Raku/actions) [![Actions Status](https://github.com/lizmat/Version-Raku/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Version-Raku/actions) [![Actions Status](https://github.com/lizmat/Version-Raku/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Version-Raku/actions)

NAME
====

Version::Raku - Version with comparator methods

SYNOPSIS
========

```raku
use Version::Raku;

my $left  = Version::Raku.new("1.0");
my $right = Version::Raku.new("1.1");

# method interface
say $left.cmp($right);  # Less
say $left."<"($right);  # True
```

DESCRIPTION
===========

The `Version::Raku` distribution provides a `Version::Raku` class that is a sub-class of `Version`, but which provides a number of comparator methods, similar to the ones provided by the [`Version::Repology`](https://raku.land/zef:lizmat/Version::Repology) distribution.

INSTANTIATION
=============

```raku
use Version::Raku;

my $v = Version::Raku.new("1.0");
```

The basic instantion of a `Version::Raku` object is done with the `new` method, taking the version string as a positional argument.

COMPARATOR METHODS
==================

cmp
---

```raku
my $left  = Version::Raku.new("1.0");
my $right = Version::Raku.new("1.1");

say $left.cmp($left);   # Same
say $left.cmp($right);  # Less
say $right.cmp($left);  # More
```

The `cmp` method returns the `Order` of a comparison of the invocant and the positional argument, which is either `Less`, `Same`, or `More`.

eqv
---

```raku
my $left  = Version::Raku.new("1.0foo");
my $right = Version::Raku.new("1.0f");

say $left.eqv($right);  # True
```

The `eqv` method returns whether the internal state of two `Version::Raku` objects are identical.

== != < <= > >=
---------------

```raku
my $left  = Version::Raku.new("1.0");
my $right = Version::Raku.new("1.1");

say $left."=="($right);  # False
say $left."<"($right);   # True
```

These oddly named methods provide the same functionality as their infix counterparts. Please note that you **must** use the `"xx"()` syntax, because otherwise the Raku compiler will assume you've made a syntax error.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Version-Raku . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

