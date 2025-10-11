const std = @import("std");

pub fn shell(command: []const []const u8, output: bool) !void {
    var child = std.process.Child.init(command, std.heap.page_allocator);

    if (!output) {
        child.stdout_behavior = .Ignore;
        child.stderr_behavior = .Ignore;
    }

    try child.spawn();

    const term = try child.wait();

    switch (term) {
        .Exited => |exit_code| {
            if (exit_code != 0) {
                std.debug.print("Command failed with exit code {d}\n", .{exit_code});
            }
        },
        else => {
            std.debug.print("Command terminated unexpectedly\n", .{});
        },
    }
}
