const std = @import("std");

const Print = std.debug.print;

pub fn main() void {
    const char_1: u8 = 'a';
    Print("single character (): {}\n", .{char_1});
    Print("single character (c): {c}\n", .{char_1});

    const char_array = [5]u8{ 'H', 'e', 'l', 'l', 'o' };
    const char_slice: []const u8 = "Hello";
    const inferred_array_slice = char_array[0..];
    const char_slice2: []const u8 = char_array[0..3];
    const inferred_slice = "hello";

    Print("char array: {s}\n", .{char_array});
    Print("chart slice: {s}\n", .{char_slice});
    Print("inferred array slice: {s}\n", .{inferred_array_slice});
    Print("char slice 2: {s}\n", .{char_slice2});
    Print("inferred slice: {s}\n", .{inferred_slice});

    const a_number: i32 = 10;
    const number_array = [3]i32{ 1, 2, 3 };
    const number_slice = number_array[0..];

    Print("{}\n", .{a_number});
    Print("{}, {}, {}\n", .{ number_array[0], number_array[1], number_array[2] });

    for (number_array) |n| {
        Print("{}", .{n});
    }
    Print("{c}", .{'\n'});

    for (number_slice) |n| {
        Print("{}", .{n});
    }
    Print("{c}", .{'\n'});

    for (char_array) |c| {
        Print("{c}", .{c});
    }
    Print("{c}", .{'\n'});

    if_statement();

    more_for_loops();
}

fn if_statement() void {
    const a: u32 = 1;
    const b: u32 = 2;
    const a_times_b: u32 = a * b;

    if (a_times_b % 2 == 0) {
        Print("Even\n", .{});
    } else {
        Print("Odd\n", .{});
    }

    if (true and true and 0 == 1) {
        Print("true and true\n", .{});
    } else if (false or true and 2 == 1) {
        Print("false or true", .{});
    } else {
        Print("Neither", .{});
    }

    Print("{c}", .{'\n'});
}

fn more_for_loops() void {
    for (0..5) |i| {
        Print("{}", .{i});
    }
    Print("{c}", .{'\n'});

    const ch_array = [_]u8{ 'W', 'O', 'L', 'F' };
    var ch_j: u8 = ch_array.len - 1;
    for (0..ch_array.len) |_| {
        const ch: u8 = ch_array[ch_j];
        Print("{c} ", .{ch});
        if (ch_j == 0) break;
        ch_j -= 1;
    }
    Print("{c}", .{'\n'});

    outer: for (0..3) |i| {
        for (0..1) |j| {
            Print("i: {}, j: {} ", .{ i, j });
            if (i >= 1) {
                break :outer;
            }
        }
    }
    Print("{c}", .{'\n'});

    const multi_dim_array = [2][2]i32{
        [_]i32{ 1, 0 },
        [_]i32{ 0, 1 },
    };
    for (0..2) |i| {
        for (0..2) |j| {
            const number: i32 = multi_dim_array[i][j];
            Print("{} x {} = {}  ", .{ i, j, number });
        }
    }
    Print("{c}", .{'\n'});

    var loop_idx: i32 = 0;
    while (loop_idx <= 10) : (loop_idx += 1) {
        Print("Hello {}\n", .{loop_idx});
    }
}
