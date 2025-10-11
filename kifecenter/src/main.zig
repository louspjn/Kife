const std = @import("std");
const shell = @import("kifecenter").shell;
const c = @cImport({
    @cInclude("gtk-4.0/gtk/gtk.h");
    @cInclude("gtk4-layer-shell/gtk4-layer-shell.h");
});

const Config = struct {
    cmd: ?[]const []const u8 = &.{"true"},
    cmds: ?[]const []const []const u8 = &.{&.{"true"}},
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const data = try std.fs.cwd().readFileAlloc(allocator, "./src/config.json", 4096);
    defer allocator.free(data);

    var parsed = try std.json.parseFromSlice(Config, allocator, data, .{});
    defer parsed.deinit();

    const config = parsed.value;

    try shell(config.cmd.?, true);
    for (config.cmds.?) |cmd| {
        try shell(cmd, true);
    }
}
