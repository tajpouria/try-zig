const std = @import("std");

const MIN_INT32: i32 = std.math.minInt(i32);
const MAX_INT32: i32 = std.math.maxInt(i32);

const AddI32Err = error{
    IntOverflowLow,
    IntOverflowHigh,
};

fn add_i32(a: i32, b: i32) AddI32Err!i32 {
    var tmp: i64 = a;
    tmp += b;
    if (tmp < MIN_INT32) {
        return AddI32Err.IntOverflowLow;
    } else if (tmp > MAX_INT32) {
        return AddI32Err.IntOverflowHigh;
    }
    return @intCast(tmp);
}

fn try_err(a: i32, b: i32) !i32 {
    const res: i32 = try add_i32(a, b);
    return res;
}

pub fn main() void {
    if (add_i32(MIN_INT32, -1)) |res| {
        std.debug.print("{}\n", .{res});
    } else |err| {
        std.debug.print("There was an error: {}\n", .{err});
    }
    if (add_i32(MAX_INT32, 1)) |res| {
        std.debug.print("{}\n", .{res});
    } else |err| {
        std.log.debug("There was an error: {}", .{err});
    }
    if (add_i32(10, 10)) |res| {
        std.debug.print("{}\n", .{res});
    } else |err| {
        std.log.debug("There was an error: {}\n", .{err});
    }

    const catch_res: i32 = add_i32(MIN_INT32, -1) catch MIN_INT32;
    std.debug.print("catch result: {}\n", .{catch_res});

    if (try_err(MAX_INT32, 1)) |_| {} else |err| {
        std.log.debug("Try err {}\n", .{err});
    }

    
}
