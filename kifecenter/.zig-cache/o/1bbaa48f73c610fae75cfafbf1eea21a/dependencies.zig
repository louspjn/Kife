pub const packages = struct {
    pub const @"N-V-__8AABdRQgCigs7KLUb8QxQk1Pi15kpIDYtYvMoXpMGb" = struct {
        pub const build_root = "/home/lousp/.cache/zig/p/N-V-__8AABdRQgCigs7KLUb8QxQk1Pi15kpIDYtYvMoXpMGb";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"luajit_build-1.1.6-HFjoU9dAAABQaKy7RNczxnX6V3-m_Mv36aw7Iz8v65n0" = struct {
        pub const build_root = "/home/lousp/.cache/zig/p/luajit_build-1.1.6-HFjoU9dAAABQaKy7RNczxnX6V3-m_Mv36aw7Iz8v65n0";
        pub const build_zig = @import("luajit_build-1.1.6-HFjoU9dAAABQaKy7RNczxnX6V3-m_Mv36aw7Iz8v65n0");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "upstream", "N-V-__8AABdRQgCigs7KLUb8QxQk1Pi15kpIDYtYvMoXpMGb" },
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "luajit_build", "luajit_build-1.1.6-HFjoU9dAAABQaKy7RNczxnX6V3-m_Mv36aw7Iz8v65n0" },
};
