#!/usr/bin/env rdmd
//Written in the D programming language
/**
    run.d - driver script for the codegen of std.uni table files.
    just run with ./run.d or rdmd ./run.d
*/
module run;

import std.algorithm, std.conv, std.file, std.path, std.process, std.range, std.system;
import std.stdio : stderr;

int main(string[] args) {
    auto rdmd = "rdmd";
    auto dfmt = environment.get("DFMT", "dfmt");
    auto r32 = execute([rdmd, "-m32", "gen.d"]);
    stderr.writeln(r32.output);
    if(r32.status != 0) {
        return r32.status;     
    }
    auto r64 = execute([rdmd, "-m64", "gen.d", "--min"]);
    stderr.writeln(r64.output);
    if(r64.status != 0) {
        return r64.status;     
    }
    auto files = dirEntries(".", "unicode_*.d", SpanMode.shallow).map!(e => e.name).array;
    execute([dfmt, "--inplace", "--max_line_length=80"] ~ files);
    return 0;
}

