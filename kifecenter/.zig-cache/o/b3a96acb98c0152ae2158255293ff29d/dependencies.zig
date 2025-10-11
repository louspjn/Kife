pub const packages = struct {
    pub const @"N-V-__8AABdRQgCigs7KLUb8QxQk1Pi15kpIDYtYvMoXpMGb" = struct {
        pub const build_root = "/home/lousp/.cache/zig/p/N-V-__8AABdRQgCigs7KLUb8QxQk1Pi15kpIDYtYvMoXpMGb";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"luajit-2.1.0-nMGF0kPDAwCHuZVz5A5rFIuxewhLyhCBaar1YJbtICyi" = struct {
        pub const build_root = "/home/lousp/.cache/zig/p/luajit-2.1.0-nMGF0kPDAwCHuZVz5A5rFIuxewhLyhCBaar1YJbtICyi";
        pub const build_zig = @import("luajit-2.1.0-nMGF0kPDAwCHuZVz5A5rFIuxewhLyhCBaar1YJbtICyi");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "luajit_build", "luajit_build-1.1.6-HFjoU9xAAAANlxEGfin2P8D_sVc-AHtqKC6Fg8WWztZN" },
        };
    };
    pub const @"luajit_build-1.1.6-HFjoU9xAAAANlxEGfin2P8D_sVc-AHtqKC6Fg8WWztZN" = struct {
        pub const build_root = "/home/lousp/.cache/zig/p/luajit_build-1.1.6-HFjoU9xAAAANlxEGfin2P8D_sVc-AHtqKC6Fg8WWztZN";
        pub const build_zig = @import("luajit_build-1.1.6-HFjoU9xAAAANlxEGfin2P8D_sVc-AHtqKC6Fg8WWztZN");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "upstream", "N-V-__8AABdRQgCigs7KLUb8QxQk1Pi15kpIDYtYvMoXpMGb" },
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "luajit", "luajit-2.1.0-nMGF0kPDAwCHuZVz5A5rFIuxewhLyhCBaar1YJbtICyi" },
};
