const std = @import("std");
const LibExeObjStep = std.build.LibExeObjStep;
const Package = std.build.Pkg;

pub fn Pkg(comptime zva_path: []const u8, comptime vk_path: []const u8) type {
    return struct {
        pub const pkg = Package{
            .name = "zva",
            .path = .{ .path = zva_path ++ "/src/lib.zig" },
            .dependencies = &[_]Package{Package{
                .name = "vk",
                .path = .{ .path = vk_path },
            }},
        };

        pub fn add(step: *LibExeObjStep) void {
            step.addPackage(pkg);
        }
    };
}
