const std = @import("std");
const other_file = @import("01_other_file.zig");
const Print = std.debug.print;

pub fn main() void {
    Function();

    const hello: []const u8 = "Hello";
    const world: []const u8 = "World";

    Print("{s} {s}!\n", .{ hello, world });
}

fn Function() void {
    const number_1: u32 = 10;
    const number_2: u32 = 10;
    _ = number_1;
    _ = number_2;

    const letter: u8 = 'a';
    const word_array = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const word: []const u8 = "hello";

    _ = letter;
    _ = word_array;
    _ = word;

    const decimal_number: f32 = 1.1;
    const specific_number: i5 = 1;

    _ = decimal_number;
    _ = specific_number;

    const result = other_file.multiply(10, 10);
    Print("Multiply Result: {}\n", .{result});
}

fn Another_Function(number_1: i32) void {
    var number_1_mutable = number_1;
    number_1_mutable += 1;
}
