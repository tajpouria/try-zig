const std = @import("std");

const expect = std.testing.expect;

fn sum(comptime Type: type, a: Type, b: Type) Type {
    return a + b;
}

fn printType(comptime Type: type, input: Type) void {
    std.debug.print("The type of input is {}\n", .{@TypeOf(input)});
}

pub fn main() !void {
    const i8res = sum(i8, 1, 1);
    try expect(i8res == 2);
    try expect(@TypeOf(i8res) == i8);

    printType(@TypeOf(1), 1);
    printType(@TypeOf(1.1), 1.1);

    const STARTING_LETTER: u8 = 'a';

    comptime var array_size = 1;
    var char_array: [array_size]u8 = undefined;

    inline for (0..array_size) |i| {
        char_array[i] = STARTING_LETTER + i;
    }

    array_size += 1;
    var char_array2: [array_size]u8 = undefined;
    inline for (0..array_size) |i| {
        char_array2[i] = STARTING_LETTER + i;
    }

    std.debug.print("chart array 1: {s}\n", .{char_array});
    std.debug.print("chart array 2: {s}\n", .{char_array2});
}
