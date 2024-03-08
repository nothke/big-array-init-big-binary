const std = @import("std");

pub fn main() !void {
    const bigNum = 1024 * 1024;

    // This causes a binary to be 4MB in ReleaseSmall (5MB in debug):

    var arr = [_]i32{42} ** (bigNum);

    for (&arr, 0..) |*a, i| {
        a.* = @intCast(i);
    }

    // This doesn't:

    // var arr = [_]i32{42} ** (bigNum);
    // arr[0] = 13;

    // This doesn't either:

    // var arr: [bigNum]i32 = undefined;
    // @memset(&arr, 42);

    std.debug.print("First element: {}", .{arr[0]});
}
