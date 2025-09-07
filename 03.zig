const std = @import("std");

const Print = std.debug.print;

const MAX_U8: u8 = std.math.maxInt(u8);
const MIN_U8: u8 = std.math.minInt(u8);

pub fn main() void {
    const signed_number: i32 = 20;
    // const unsigned_number: u32 = signed_number;
    const unsigned_number = convert_singed_to_unsigned(signed_number);

    Print("{}\n", .{unsigned_number});

    const num_one: u32 = 256;
    const num_two: u64 = num_one;
    Print("{}\n", .{@TypeOf(num_two)});

    find_index(3);

    var num_16: u16 = 65535;
    num_16 = num_16 +% 1;
    Print("number 16: {}\n", .{num_16});

    const a_num_16: u16 = 65535;
    const a_num_8: u8 = @truncate(a_num_16);
    Print("a number 8: {}\n", .{a_num_8});
}

fn convert_singed_to_unsigned(n: i8) u8 {
    if (fits_in_u8(n)) {
        return @intCast(n);
    }
    Print("Error: Number {} does fit u8: {} <= n >= {}\n", .{ n, MIN_U8, MAX_U8 });
    return 0;
}

fn fits_in_u8(n: i8) bool {
    return MAX_U8 >= n and MIN_U8 <= n;
}

fn find_index(tn: u8) void {
    var idx: u8 = 0;
    const arr = [_]u8{ 1, 2, 3, 4, 5, 6 };
    for (arr) |_| {
        const t = arr[idx];
        if (t == tn) {
            Print("Found number idx: {}, number: {}\n", .{ idx, tn });
            return;
        }
        idx += 1;
    }
    Print("Error: Couldn't find the target number in the array\n", .{});
}
