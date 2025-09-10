const std = @import("std");
const expect = std.testing.expect;

pub fn main() !void {
    try fixedBufferAllocator();
    try arenaAllocator();
    try generalPurposeAllocator();
}

fn fixedBufferAllocator() !void {
    var buffer: [1000]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();
    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);

    try expect(memory.len == 100);
    try expect(@TypeOf(memory) == []u8);
}

fn arenaAllocator() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    _ = try allocator.alloc(u8, 1);
    _ = try allocator.alloc(u8, 10);
    _ = try allocator.alloc(u8, 100);
}

fn generalPurposeAllocator() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}).init;
    const allocator = gpa.allocator();

    defer {
        const deinit_status = gpa.deinit();
        if (deinit_status == .leak) expect(false) catch unreachable;
    }
    const bytes = try allocator.alloc(u8, 100);
    defer allocator.free(bytes);
}
